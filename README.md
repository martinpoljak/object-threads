FIFO Cache
==========

**Object Threads** emulates Python threading API paradigm. Creating
threads by giving some block to constructor is sometime slightly 
unpractical way of running threads. This library allows encapsulating 
threads to classes, so class can define itself as thread which can be 
run by plain method call. 

For example:

    require "thread/object"

    class Foo
        include Thread::Object
        
        def run
            sleep 10
            puts "Something in thread."
        end
    end
    
    Foo::new.start!
    sleep 5
    
    puts "Something in main."
    
Will print out `"Something in main."` and then `"Something in thread."`.
    
    
Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][1] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.


Copyright
---------

Copyright &copy; 2010-2011 [Martin Kozák][2]. See `LICENSE.txt` for
further details.

[1]: http://github.com/martinkozak/qrpc/issues
[2]: http://www.martinkozak.net/
