module Logic(
    Ai,
    Bi,
    S1,
    S0,
    H
);
    input Ai;
    input Bi;
    input S1;
    input S0;
    output reg H;
    always @(*) begin
        case ({S1,S0})
            2'b00: H = Ai & Bi;
            2'b01: H = Ai | Bi;
            2'b10: H = Ai ^ Bi;
            2'b11: H = ! (Ai ^ Bi);
            default: H = 2'b0;
        endcase
    end
endmodule
