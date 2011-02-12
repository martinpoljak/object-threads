# encoding: utf-8

require "thread"
puts
class Thread

    ##
    # Represents Python-style class interfacing thread.
    #
    
    module Object

        ##
        # Holds thread instance.
        #

        @thread
        
        ##
        # Runs the thread code.
        # @abstract
        # 
        
        def run
        end

        ##
        # Starts the thread by calling the run() method
        # as in Python.
        #
        
        def start!
            @thread = Thread::new do
                begin
                    self.run()
                rescue ::Exception => e
                    self.log "THREAD EXCEPTION! " << e.class.to_s << ": " << e.message
                    e.backtrace.each { |i| self.log i }
                end
            end
            
            return @thread
        end

        ##
        # Shutdowns the thread.
        #

        def shutdown!
            @thread.terminate()
        end
        
        ##
        # Logs an message.
        #

        def log(message)
            STDERR.write "[" << Time.now.strftime("%Y-%m-%d %H:%M:%S") << "] " << self.class.name << ": " << message.to_s << "\n"
        end    

    end
end
