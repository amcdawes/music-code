# pentatonic amen break
use_bpm 70
in_thread do
  notes = (scale :e3, :minor_pentatonic)
  sn = synth :tb303, note: :e1, sustain: 11.9, release: 0.1, cutoff: 130, cutoff_slide: 12, amp: 0.25
  control sn, cutoff: 0
  48.times do
    control sn, note: notes.tick
    sleep 0.125
  end
  control sn, cutoff: 130
  48.times do
    control sn, note: notes.tick
    sleep 0.125
  end
end

in_thread do
  6.times do
    sample :loop_amen, beat_stretch: 2, amp: 2
    sleep 2
  end
end