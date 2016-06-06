require "pry"
class Solution

  class << self

    attr_accessor :command, :file


    #Function to print basic info
    def print_basic_info
      puts WELCOME_MSG
      rows = STATUS_HEADER
    end

    #Function to give welcome
    def give_welcome
      rows = print_basic_info
      SYSTEM_COMMANDS.collect{ |cmd| rows << [cmd[:command]]} 

      table = Terminal::Table.new :rows => rows
    end

    # #Function to receive input
    def receive_input
      @command = STDIN.gets.strip
    end


    # #Function to execute command
    def execute_command system_command_selected
      output = ParkingLot.send(system_command_selected.to_sym, @command)    
      output
    end

    # #function to ask for inout again
    def print_output output
      puts output
    end

    # #Function to select command
    def select_command
      selected_item = SYSTEM_COMMANDS.select{ |sys_command| @command.match(sys_command[:regex]) }[0]
      if selected_item
        selected_item[:command]
      else
        false
      end
    end

    # #Function to parse input command
    def parse_input_command
      if system_command_selected = select_command
        output = execute_command system_command_selected
      else
        output = INVALID_MSG
      end

      output
    end

    #Function to initiate user input mode
    def init_interactive_mode
      puts give_welcome

      while receive_input
        output = parse_input_command 
        print_output output
      end
    end

    #Function to start the program
    def run 
    	params = ARGV.first
      init_interactive_mode
    end

  end
end