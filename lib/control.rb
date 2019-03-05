require 'httparty'
require 'tty-table'
class Control
    def initialize(ip)
        @ip = ip
    end 
    def ControlMenu
        i = 0
        rows = TTY::Table.new 
        f = [
             "Volume Up",
             "Volume Down",
             "Instant Replay",
             "Rev",
             "Stop",
             "Play"
         ]
         f.each do |a|
            rows << [i, f[i]]
            i+=1
        end
        puts rows.render(:unicode, alignment: [:center])
    end
    def ControlMenu2
        # Creates a control menu
        i = 0
        f = [
             "Volume Up",
             "Volume Down",
             "Instant Replay",
             "Rev",
             "Stop",
             "Play"
         ]
        f.each do |a|
            puts "[ #{i} ]  " + f[i].to_s
            i+=1
        end
    end
    def TrollMenu
        # Creates a 'Troll' menu table
        rows = TTY::Table.new 
        i = 0
        f = ["Vol Up Troll", 
             "Vol Down Troll",
             "Random Vol Troll",
             "Instant Replay and Rev troll"]
        # Loops thru the 'f' array to create a new array 
        # that includes a number. Used new array to create a table
        f.each do  |a|
            rows << [i, f[i]] 
            i+=1
        end
        puts rows.render(:unicode, alignment: [:center])
    end
    def KeyPress(keypress)
        # The key press Options
        case keypress
        when "1"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/home")
        when "2"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/left")
        when "3"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/right")
        when "4"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/VolumeMute")
        when "5"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/home")
        when "6"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/play")
        when "7"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/home")
        when "8"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/Rev")
        when "9"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/up")
        when "10"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/InstantReplay")
        when "11"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/Fwd")
        when "12"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/Backspace")
        when "13"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/VolumeDown")
        when "14"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/VolumeUp")
        when "15"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/Enter")
        when "16"
            response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/")
        end
    end
    def getUrl(args)
        response = HTTParty.get("http://#{@ip.to_s}:8060/#{args}")
        return response.body
    end
     # these are used for the Troll class thought it would be easier to read what
     # they did  if I used their own functions instead of using 'keypress' function
    def VolumeDown
        # Used for the Troll class
        response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/VolumeDown")
    end
    def VolumeUp
        response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/VolumeUp")
    end
    def InstantReplay 
        response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/InstantReplay")
    end
    def Rev
        response = HTTParty.post("http://#{@ip.to_s}:8060/keypress/Rev")
    end
end