module Mock1_tb;

reg Ai;
reg Bi;
reg Ci;
reg S1;
reg S0;
reg M;
wire Cout;
wire Fi;
reg ECout;      //Expected Cout
reg EFi;        //Expected Fi
logic [7: 0] testVector[0 : 100];
logic [31 : 0] i;
logic clk;

Mock1 mock1(.Ai(Ai),
            .Bi(Bi),
            .Ci(Ci),
            .S1(S1),
            .S0(S0),
            .M(M),
            .Cout(Cout),
            .Fi(Fi));

initial begin
    i = 0;
    clk = 1'b1;
    $readmemb("Mock1_tb_vector.txt", testVector);
end

always @ (posedge clk) begin
    {Ai, Bi, Ci, S1, S0, M, ECout, EFi} = testVector[i];
end

always @(negedge clk) begin
    if(ECout != Cout || EFi != Fi) begin
        $display("[time =%0t]Wrong Value: Instruction:%b", $time, {Ai, Bi, Ci, S1, S0, M});
    end
    i = i + 1;
end

always begin
    #25;
    clk = !clk;
end

endmodule
