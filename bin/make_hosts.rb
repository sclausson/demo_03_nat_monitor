#!/usr/bin/env ruby
require 'aws-cfn-resources'

cfn = AWS::CloudFormation.new
stack = cfn.stacks["#{ARGV[1]}"]

az1_nat_instance = stack.instance 'Az1NatInstance'
az2_nat_instance = stack.instance 'Az2NatInstance'
az1_private_route_table = stack.route_table 'Az1PrivateRouteTable'
az2_private_route_table = stack.route_table 'Az2PrivateRouteTable'

puts "[nat_instances]"
puts "#{az1_nat_instance.public_dns_name}\tnat_id=#{az2_nat_instance.id}\tnat_rt_id=#{az2_private_route_table.id}\tmy_rt_id=#{az1_private_route_table.id}"
puts "#{az2_nat_instance.public_dns_name}\tnat_id=#{az1_nat_instance.id}\tnat_rt_id=#{az1_private_route_table.id}\tmy_rt_id=#{az2_private_route_table.id}"
puts ""
puts "[nat_instances:vars]"
puts "ec2_url=https://ec2.#{ARGV[0]}.amazonaws.com"
