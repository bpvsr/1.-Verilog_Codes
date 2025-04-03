##create_clock -name {clk}    -period 10.000 -waveform { 5.000 10.000 } [get_ports {clk}]
create_clock -name {clk_vi} -period 10.000 -waveform { 5.000 10.000 }
create_clock -name {clk_vo} -period 10.000 -waveform { 5.000 10.000 }

set_input_delay -add_delay -max -clock [get_clocks {clk_vi}]  1.200 [get_ports {a}]
set_input_delay -add_delay -min -clock [get_clocks {clk_vi}]  1.000 [get_ports {a}]
set_input_delay -add_delay -max -clock [get_clocks {clk_vi}]  1.200 [get_ports {b}]
set_input_delay -add_delay -min -clock [get_clocks {clk_vi}]  1.000 [get_ports {b}]
set_input_delay -add_delay -max -clock [get_clocks {clk_vi}]  1.200 [get_ports {c}]
set_input_delay -add_delay -min -clock [get_clocks {clk_vi}]  1.000 [get_ports {c}]

set_output_delay -add_delay -max -clock [get_clocks {clk_vo}]  0.500 [get_ports {carry}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vo}]  0.100 [get_ports {carry}]
set_output_delay -add_delay -max -clock [get_clocks {clk_vo}]  0.500 [get_ports {sum}]
set_output_delay -add_delay -min -clock [get_clocks {clk_vo}]  0.100 [get_ports {sum}]
