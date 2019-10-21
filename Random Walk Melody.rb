# Random walk melody maker
# Based on one chord at a time
set :pv, 0.5
set :cv, 0.5
use_synth :tb303
i = 0
live_loop :randchord do
  use_real_time
  pval = get(:pv)
  cval = get(:cv)
  c = chord(:D3, :minor)
  if rand() < pval  # random walker, parameterize this with slider
    r = +1
  else
    r= -1
  end
  i += r
  play c[i], release: 0.3, cutoff: 130*cval, amp: 0.25
  sleep 0.2
end

live_loop :readOSC do
  use_real_time
  pv = sync "/osc/1/fader1"
  set :pv, pv[0] #store slider value
end

live_loop :read2 do
  use_real_time
  cv = sync "/osc/1/fader2"
  set :cv, cv[0] #store slider value
end


