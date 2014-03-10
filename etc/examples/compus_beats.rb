def loopr
  sample :loop_compus, :rate, [0.5, 1, 1, 1, 1, 2].choose if rand < 0.9
  sleep sample_duration(:loop_compus)
end

def bass
  sample :bass_voxy_c, :amp, rrand(0.1, 0.2), :rate, [0.5, 0.5, 1, 1,2,4].choose if rand < 0.25
  with_synth "mod_pulse"
  play :C1, :mod_range, 12, :amp, rrand(0.5, 1), :mod_rate, [8, 16, 32].choose / sample_duration(:loop_compus), :release, 1, :cutoff, rrand(50, 90)
  play :C2, :mod_range, [24, 36, 34].choose, :amp, 0.35, :mod_rate, 16 / sample_duration(:loop_compus), :release, 2, :cutoff, 60, :pulse_width, rand
  sleep sample_duration(:loop_compus) / 4
end

in_thread{loop{loopr}}
in_thread{loop{bass}}