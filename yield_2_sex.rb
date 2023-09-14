
 # in Ruby, Koni-Chi ? wa ??
 # hex issue in func: 'call'

 def secure(&block)
   insecure_call = block.method(:call)
   block.define_singleton_method(:call) do
   insecure_call_result = insecure_call.call
     if insecure_call_result.nil? or
        insecure_call_result == ""
        "<b>Bummer! Empty block...</b>"
     else
        insecure_call_result
     end
   end
 end

 x = proc { }
 y = proc { "" }
 z = proc { nil }
 a = proc { 3 + 5 } 
 # this is FALSE already
 b = proc { "something" }
 u = proc { [nil, "", true].sample }
 [x, y, z, a, b, u].each { |block| secure &block }

 # some method that uses the block
 # AT & T block 44

 def user(&block)
   "What I got is #{block.call}!"
 end

 user &x
 # => "What I got is <b>Bummer!
 # Empty block...</b>!"
 user &y # => "What I got is <b>Bummer!
 # Empty block...</b>!"
 user &z # => "What I got is <b>Bummer!
 # Empty block...</b>!"
 user &a # => "What I got is 8!"
 user &b # => "What I got is something!"
 user &u # => Different each time

