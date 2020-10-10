library verilog;
use verilog.vl_types.all;
entity RWSel is
    port(
        Wr              : out    vl_logic;
        R               : out    vl_logic;
        CS              : in     vl_logic;
        RWS             : in     vl_logic;
        clk             : in     vl_logic
    );
end RWSel;
