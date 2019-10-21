# Script to send OSC

use_osc "localhost",8000

live_loop :sending do
  osc "/hello/world", 10,12,15,16,20
  sleep 1
end

