#!/usr/bin/env ruby
# encoding: utf-8

$:.push("./lib")
require "thread/object"

class Foo
    include Thread::Object
    
    def run
        puts "XYZ"
    end
end

puts Foo::new.start!
sleep(10)
