module Logic_tb;

logic Ai;
logic Bi;
logic S1;
logic S0;
wire H;

Logic logic1(.Ai(Ai),
             .Bi(Bi),
             .S1(S1),
             .S0(S0),
             .H(H));

initial begin
    #0
    {Ai, Bi} = 2'b10;
    {S1, S0} = 2'b00;
    #20
    {Ai, Bi} = 2'b11;
    #20
    {Ai, Bi} = 2'b10;
    {S1, S0} = 2'b01;
    #20
    {Ai, Bi} = 2'b00;
    #20
    {Ai, Bi} = 2'b00;
    {S1, S0} = 2'b10;
    #20
    {Ai, Bi} = 2'b10;
    #20
    {Ai, Bi} = 2'b10;
    {S1, S0} = 2'b11;
    #20
    {Ai, Bi} = 2'b11;
end

endmodule
