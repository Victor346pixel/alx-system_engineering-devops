# Postmortem: A Thrilling Debugging Odyssey in Kenya!

Embarking on the release of ALX's System Engineering & DevOps project 0x19, around 06:00 East Africa Time (EAT) in the vibrant setting of Kenya, an unexpected outage cast its shadow over an isolated Ubuntu 14.04 container running an Apache web server. GET requests on the server triggered unsettling `500 Internal Server Error` responses instead of the anticipated HTML file, defining a sleek Holberton WordPress site.

## Debugging Adventure

Meet Brennan, our Bug Debugger Extraordinaire (BDE, as we like to call him). The challenge revealed itself around 19:20 Pacific Standard Time (PST), igniting his debugging instincts.

1. **Process Expedition**: Brennan kicked off the mission by inspecting running processes with `ps aux`. Two majestic `apache2` processes - `root` and `www-data` - were spotted in their glory.

2. **Directory Dive**: A journey into the `/etc/apache2/sites-available` folder unfolded, revealing the server's dedication to serving content from the sacred grounds of `/var/www/html/`.

3. **Strace Sorcery**: Armed with the mystical `strace` command, Brennan summoned its powers on the `root` Apache process. Alas, disappointment loomed. However, a second attempt on the `www-data` process unveiled the elusive `-1 ENOENT (No such file or directory)` error, pointing fingers at `/var/www/html/wp-includes/class-wp-locale.phpp`.

4. **Vim Vigilance**: Armed with Vim, Brennan scoured through files in the `/var/www/html/` realm. Through pattern matching prowess, the erroneous `.phpp` file extension was unmasked in the `wp-settings.php` file (Line 137). Victory was at hand!

5. **The Fix**: With surgical precision, the unnecessary `p` from the file name was excised.

6. **Triumphant Test**: A triumphant `curl` dance on the server returned a resounding 200 - all systems go!

7. **Puppet Power**: To immortalize the victory, a Puppet manifest was crafted to automate the obliteration of such errors in the future.

## Summation of the Epic

In the grand tapestry of debugging, the culprit was a mere typo. The WordPress app stumbled over a critical error in `wp-settings.php`, yearning for a file named `class-wp-locale.phpp`. The reality was a file, `class-wp-locale.php`, elegantly residing in the `wp-content` directory.

The fix? A humble removal of the trailing `p`.

## Prevention Chronicles

This outage wasn't a web server hiccup; it was an application misstep. To ward off such mishaps in the future:

* **Test with Gusto**: Test the application fervently before unleashing it into the wild. Early detection is the superhero of system stability.

* **Guardian of Uptime**: Enlist the services of vigilant uptime monitors like [UptimeRobot](https://uptimerobot.com/) to instantly sound the alarm in case of a website siesta.

In response to this saga, a Puppet manifesto named [0-strace_is_your_friend.pp](https://github.com/bdbaraban/holberton-system_engineering-devops/blob/master/0x17-web_stack_debugging_3/0-strace_is_your_friend.pp) was born. Its solemn duty: to replace any `phpp` extensions in `/var/www/html/wp-settings.php` with the noble `php`.

And in the spirit of eternal optimism, remember, we're programmers - we never make errors! :wink:
