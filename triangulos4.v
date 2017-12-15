module sign(
    input [10:0] x1, y1, x2, y2, x3, y3,
    output sign
    );

assign sign = (x1 - x3) * (y2 - y3) - (x2 - x3) * (y1 - y3);

endmodule

module Triangle(
    input [10:0] x1, y1, x2, y2, x3, y3, p_x, p_y,
    output s1
    );

wire b1, b2, b3;
reg out_reg;
assign out = out_reg;

sign a(p_x, p_y, x1, y1, x2, y2, b1);
sign b(p_x, p_y, x2, y2, x3, y3, b2);
sign c(p_x, p_y, x3, y3, x1, y1, b3);

always @(*) begin
    if(b1 == b2 && b2 == b3)begin
        out_reg <= 1;
    end     
    else begin
        out_reg <= 0;
    end
end
endmodule
module test;
    reg [10:0] x1, y1, x2, y2, x3, y3, p_x, p_y;
    
    wire r;
    Triangle test(x1, y1, x2, y2, x3, y3, p_x, p_y, r);
    integer Inp, Out, aux;
    reg clk;
    always # 2 clk = !clk;
    initial begin
        clk = 0;
        Inp = $fopen("Inp.txt", "r");
        Out = $fopen("Out.txt", "w");
        while(!$feof(Inp)) begin
            @(posedge clk);
            aux = $fscanf(Inp, "%d %d %d %d %d %d %d %d\n", x1, y1, x2, y2, x3, y3, p_x, p_y);
            @(posedge clk);
            if(r == 1) begin
                $fwrite(Out, "Ok\n");
            end 
            else begin
            $fwrite(Out, "Nop\n");
            end
        end
        $fclose(Inp);
        $fclose(Out);
        #100 $finish;
    end
endmodule
