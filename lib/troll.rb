#192.168.1.17
require_relative 'control'
require 'httparty'
class Troll
	def initialize(ip)
		@ip = ip
		@control = Control.new(ip)
	end 
    def numeric?
        Float(self) != nil rescue false
    end
    def getUrl(args)
    	response = HTTParty.get("http://#{@ip}:8060/#{args}")
    	return response.body
    end
    def VolumeUpTroll(amount)
        # Turns up the volume as many
        # times that its inputed
    	for i in 0..amount.to_i
    		@control.VolumeUp
    	end
    end
    def VolumeDownTroll(amount)
        # Turns down the volume as many times 
        # a inputed
    	for i in 0..amount.to_i
    		@control.VolumeDown
    	end
    end
    def InstantReplayAndRevTroll(amount)
        # Picks randomly from the 'sample' array
        # will either replay or reverse depending on
        # what Number
    	sample = [0,1,0,1,0,1,0,1,0,1,0,1,0].sample
    	for i in 0..amount.to_i
    		if sample == 0
    			@control.InstantReplay
    			i+=1
    		elsif sample == 1
    			@control.Rev
    			i+=1
    		end
    	end
    end
    def MuteTroll(amount)
        # mutes and unmutes randomly
        for i in 0..amount.to_i
            a = rand(1..50)
            if a.even?
                # 4 => Mute
                @control.KeyPress("4")
            else
                # 14 => volume up
                @control.KeyPress("14")
            end
        end
    end
    def VolumeTroll(amount)
        # Depening on what value is picked from the 'sample'
        # array, turns up volume or turns down volume
    	for i in 0..amount.to_i
	    	sample = [0, 1, 0, 1, 0, 1].sample
	    	if sample == 0
	    		@control.VolumeUp
	    		i+=1
	    	else
	    		@control.VolumeDown
	    		i+=1
	    	end
	    end
    end
end
