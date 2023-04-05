# Encoders

## Priority encoder 4x2
### Behavioral Style
    Code is added in this folder encoder_4x2.v
    
### Data flow style
    module priority_encoder_datafloe(A0,A1,Y0,Y1,Y2,Y3);
    input Y0,Y1,Y2,Y3;
    output A0,A1;

    assign A1 = Y3 + Y2;
    assign A0 = Y3 + ((~Y2)&Y1);

    endmodule
    
### Structural Style
    module or_gate(c,a,b);
    input a,b;
    output c;
    assign c = a|b;
    endmodule

    module not_gate(f,e);
    input e;
    output f;
    assign f = ~e;
    endmodule

    module and_gate(z,x,y);
    input x,y;
    output z;
    assign z = x&y;
    endmodule 

    module priority_encoder_struct(A0,A1,Y0,Y1,Y2,Y3);
    input Y0, Y1, Y2, Y3;
    output A0,A1;

    not_gate u1(.f(y2bar), .e(y2));
    and_gate u2(.z(w1), .x(y2bar), .y(y1));
    or_gate(.c(A1), .a(Y3), .b(Y2));
    or_gate(.c(A0), .a(Y1), .b(w1));

    endmodoule
    
