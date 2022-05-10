module Mock1(
    Ai,
    Bi,
    Ci,
    S1,
    S0,
    M,
    Cout,
    Fi
);
    input Ai;
    input Bi;
    input Ci;
    input S1;
    input S0;
    input M;
    output reg Cout;
    output reg Fi;
    wire G;
    wire H;
    //Arithmetic unit
    Arithmetic Ar1(.Ai(Ai),
                   .Bi(Bi),
                   .Ci(Ci),
                   .S1(S1),
                   .S0(S0),
                   .H(G),
                   .Co(Cout));
    //Logic Unit
    Logic log1(.Ai(Ai),
               .Bi(Bi),
               .S1(S1),
               .S0(S0),
               .H(H));
    //Mux
    Mux mux1(.G(G),
             .H(H),
             .F(Fi),
             .M(M));
endmodule