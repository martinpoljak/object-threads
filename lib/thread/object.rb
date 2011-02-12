# encoding: utf-8
# (c) 2010-2011 Martin Kozák (martinkozak@martinkozak.net)

require "thread"

##
# Standard Ruby's +Thread+ class.
#

class Thread

    ##
    # Represents Python-style class interfacing thread.
    #
    
    module Object

        ##
        # Holds Ruby native thread instance.
        # @return [Thread] Ruby native thread object
        #

        attr_accessor :native_thread
        @native_thread
        
        ##
        # Runs the thread code.
        # @abstract
        # 
        
        def run
            raise Exception::new("Method #run must be overriden. It should contain body of the thread.")
        end

        ##
        # Starts the thread by calling the +#run+ method as in Python.
        # It's non-blocking, of sure.
        #
        # Uncacthed rxceptions raised by thread are written out to 
        # +STDERR+ by default. This feature can be turned of by the 
        # +silent+ argument.
        #
        # @param [nil, :silent] silent indicates, it shouln't write 
        #   exceptions out
        # @return [Thread] native Ruby thread
        # @see #run
        #
        
        def start!(silent = nil)
            @native_thread = Thread::new do
                begin
                    self.run()
                rescue ::Exception => e
                    if silent != :silent
                        self.log "THREAD EXCEPTION! " << e.class.to_s << ": " << e.message
                        e.backtrace.each { |i| self.log i }
                    end
                end
            end
            
            return @native_thread
        end

        ##
        # Shutdowns the thread.
        #

        def shutdown!
            @native_thread.terminate()
        end
        
        ##
        # Logs an message.
        # By overriding this, you can change the format.
        #
        # @param [String] message message for writing out
        #

        def log(message)
            STDERR.write "[" << Time.now.strftime("%Y-%m-%d %H:%M:%S") << "] " << self.class.name << ": " << message.to_s << "\n"
        end    

    end
end
