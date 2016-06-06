require_relative "dependencies"

begin
  Solution.run
rescue Exception => e
  p e.message
end

 
