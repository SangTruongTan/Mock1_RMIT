module Arithmetic_tb;

reg Ai;
reg Bi;
reg Ci;
reg S1;
reg S0;

wire H;
wire Co;

logic EH;
logic ECo;
logic [6: 0] testVector[0 : 100];
logic [31 : 0] i;
logic clk;

Arithmetic ari1(.Ai(Ai),
                .Bi(Bi),
                .Ci(Ci),
                .S1(S1),
                .S0(S0),
                .H(H),
                .Co(Co));

initial begin
    i = 0;
    clk = 1'b1;
    $readmemb("Arithmetic_tb_vector.txt", testVector);
end

always @ (posedge clk) begin
    {Ai, Bi, Ci, S1, S0, ECo, EH} = testVector[i];
end

always @(negedge clk) begin
    if(ECo != Co || EH != H) begin
        $display("[time =%0t]Wrong Value: Instruction:%b", $time, {Ai, Bi, Ci, S1, S0});
    end
    i = i + 1;
end

always begin
    #25;
    clk = !clk;
end

endmodule
