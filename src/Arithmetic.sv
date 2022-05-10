module Arithmetic(
    Ai,
    Bi,
    Ci,
    S1,
    S0,
    H,
    Co
);
    input Ai;
    input Bi;
    input Ci;
    input S1;
    input S0;
    output reg H;
    output reg Co;
    reg Ain;
    reg Bin;
    reg Cin;
    wire [2: 0] Sel;
    assign Sel = {S1, S0, Ci};
    full_adder FA(.a(Ain),
                  .b(Bin),
                  .cin(Cin),
                  .sum(H),
                  .cout(Co));
    always @(*) begin
        case (Sel)
            3'd0: {Ain, Bin, Cin} = {Ai, 1'b0, 1'b0};
            3'd1: {Ain, Bin, Cin} = {Ai, 1'b0, 1'b1};
            3'd2: {Ain, Bin, Cin} = {Ai, Bi, 1'b0};
            3'd3: {Ain, Bin, Cin} = {Ai, Bi, 1'b1};
            3'd4: {Ain, Bin, Cin} = {Ai, !Bi, 1'b0};
            3'd5: {Ain, Bin, Cin} = {Ai, !Bi, 1'b1};
            3'd6: {Ain, Bin, Cin} = {!Ai, Bi, 1'b0};
            3'd7: {Ain, Bin, Cin} = {Bi, !Ai, 1'b1};
            default: {Ain, Bin, Cin} = 3'b000;
        endcase
    end
endmodule

/////////////////////
//1bit Full Adder
/////////////////////
module full_adder(a,b,cin,sum, cout);
input a,b,cin;
output sum, cout;
wire x,y,z;
half_adder h1(.a(a), .b(b), .sum(x), .cout(y));
half_adder h2(.a(x), .b(cin), .sum(sum), .cout(z));
or or_1(cout,z,y);
endmodule

//////////////////////
// 1 bit Half Adder
//////////////////////
module half_adder( a,b, sum, cout );
input a,b;
output sum, cout;
xor xor_1 (sum,a,b);
and and_1 (cout,a,b);
endmodule