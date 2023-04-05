# Decoders

## Decoder 2x4

### Behavioral style
    decoder_2x4.v
    
### Gate level style
    module dec2_4 (a,b,en,y0,y1,y2,y3)
    input a, b, en;
    output y0,y1,y2,y3;
    
    assign y0= (~a) & (~b) & en;
    assign y1= (~a) & b & en;
    assign y2= a & (~ b) & en;
    assign y3= a & b & en;
    
    end module
