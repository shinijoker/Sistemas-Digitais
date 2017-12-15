module sign (
    input [11:0] Px1, Py1, Px2, Py2, Px, Py,
    output sign
);

    wire signed [11:0] Sub1, Sub2, Sub3, Sub4;

    wire signed [22:0] Mult1, Mult2, Sub5;

    assign Sub1 = Px - Py2;
    assign Sub2 = Py1 - Py2;
    assign Sub3 = Py1 - Px2;
    assign Sub4 = Py - Py2;

    assign Mult1 = Sub1 * Sub2;
    assign Mult2 = Sub3 * Sub4;

    assign Sub5 = Mult1 - Mult2;

    assign sign = (Sub5 >= 0) ? 1 : 0; 

endmodule


module TestTriangle (
    input [11:0] Px1, Py1, Px2, Py2, Px3, Py3, Px, Py,
    output inside
);

    wire sign1, sign2, sign3;

    assign inside = (sign1 == 1 && sign2 == 1 && sign3 == 1) ? 1:0;

    sign out1(Px1, Py1, Px2, Py2, Px, Py, sign1);
    sign out2(Px2, Py2, Px3, Py3, Px, Py, sign2);
    sign out3(Px3, Py3, Px1, Py1, Px, Py, sign3);

endmodule

module Test;
    reg [11:0] Px1, Py1, Px2, Py2, Px3, Py3, Px, Py;
    
    wire inside;

    TestTriangle A(Px1, Py1, Px2, Py2, Px3, Py3, Px, Py, inside);

    initial
        begin
           $dumpvars(0,A);
           #1

           Px1 <= 10;
           Py1 <= 10;
           Px2 <= 30;
           Py2 <= 10;
           Px3 <= 20;
           Py3 <= 30;
           Px <= 15;
           Py <= 15;

           #1
           Px <= 15;
           Py <= 15;
           #1
           Px <= 9;
           Py <= 15;
           #1
           Px <= 10;
           Py <= 11;
           #1
           Px <= 30;
           Py <= 11;
           #40
           $finish;
        end
endmodule
