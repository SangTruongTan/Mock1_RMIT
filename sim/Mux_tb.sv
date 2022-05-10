module Mux_tb;

logic G;
logic H;
logic M;
wire F;

Mux mux1(.G(G),
         .H(H),
         .M(M),
         .F(F));

initial begin
    #0
    G = 1'b1;
    H = 1'b0;
    M = 1'b0;
    #20
    M = 1'b1;
    #20
    G = 1'b0;
    H = 1'b1;
    M = 1'b1;
    #20
    M = 1'b0;
end

endmodule
