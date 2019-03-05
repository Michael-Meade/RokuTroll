require_relative 'lib/troll'

# IP of the Roku
ip = "192.168.1.17"

# Creates  Control Objects
a = Control.new(ip)
# Control panel
a.ControlMenu2

# Creates Troll Object
a = Troll.new(ip)
#puts a.InstantReplay
#puts Control.new(ip).ControlMenu
#puts Control.new(ip).KeyPress("4")