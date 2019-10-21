# Verse and bridge from
# https://www.secretsofsongwriting.com/2010/05/01/5-chord-progressions-for-a-song-bridge/

# Added an automatic bass player
# TODO: ring the chords to shorten

define :chord_player do |root, type, repeats|
  repeats.times do
    play chord(root, type), release: 0.3
    sleep 0.5
  end
end

define :bass_player do |root, repeats|
  repeats.times do
    play root-12, attack: 0.05, release: 0.4, decay: 0.05, amp: 0.1
    sleep 0.5
  end
end


use_synth :prophet
live_loop :verse do
  1.times do
    chord_player :C3, :major, 4
    chord_player :Bb3, :major, 4
    chord_player :F3, :major, 2
    chord_player :G3, :major, 2
    chord_player :C3, :major, 4
  end
  
  1.times do
    chord_player :A3, :minor, 2
    chord_player :F3, :major, 2
    chord_player :G3, :major, 2
    chord_player :A3, :minor, 2
    chord_player :Bb3, :major, 2
    chord_player :G3, :sus4, 2
    chord_player :G3, :major, 2
  end
end

live_loop :bass do
  use_synth :tb303
  1.times do
    bass_player :C3, 4
    bass_player :Bb3, 4
    bass_player :F3, 2
    bass_player :G3, 2
    bass_player :C3, 4
  end
  1.times do
    bass_player :A3, 2
    bass_player :F3, 2
    bass_player :G3, 2
    bass_player :A3, 2
    bass_player :Bb3, 2
    bass_player :G3, 2
    bass_player :G3, 2
  end
end

