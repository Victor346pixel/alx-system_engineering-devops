#!/usr/bin/env ruby
# Function to parse the log file and extract required information
# def parse_log_file(file_path)
#   result = []
#     
#       File.open(file_path, "r") do |file|
#           file.each_line do |line|
#                 sender, receiver, flags = line.strip.split(',')
#                       result << [sender, receiver, flags]
#                           end
#                             end
#
#                               result
#                               end
#
#                               # Log file path
#                               log_file_path = "textme_log.txt"
#
#                               # Process the log file
#                               data = parse_log_file(log_file_path)
#
#                               # Output the result
#                               puts "Sender,Receiver,Flags"
#                               data.each do |entry|
#                                 puts entry.join(',')
#                                 end
#
