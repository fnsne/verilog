module traffic_light(red, yellow, green, count, clk);
    input clk;
    output red, yellow, green, count;
 
    wire clk;
    reg red, yellow, green;
    reg [1:0]current_state;
    reg [4:0]count;

    parameter state0 = 2¡¦b00, state1 = 2¡¦b01, state2 = 2¡¦b10; //red, yellow, green
    initial
    begin
        current_state = 2¡¦b00; red = 1; yellow = 0; green = 0; count = 5¡¦b11110;
    end

    always@(posedge clk)
    begin
    ¡K¡K
    end
    ¡K¡K

endmodule

