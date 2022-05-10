module Mux(
    G,
    H,
    F,
    M
);
    input G;
    input H;
    input M;
    output reg F;
    always @(*) begin
        if(M == 1'b1) begin
            F = G;
        end else begin
            F = H;
        end
    end
endmodule
