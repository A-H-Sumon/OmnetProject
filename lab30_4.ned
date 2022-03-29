simple pc30_l4
{
    gates:
        input in[];
        output out[];
}

//
// Two instances (tic and toc) of pc30_l4 connected both ways.
// Tic and toc will pass messages to one another.
//

network lab30_4_network

{
    @display("bgb=628.84,399.74");

    submodules:
        pc30_l4_1: pc30_l4 {
            @display("p=33.18,42.66;i=device/laptop");
        }
        pc30_l4_2: pc30_l4 {
            @display("p=148,111;i=device/pc");
        }

        pc30_l4_3: pc30_l4 {
            @display("p=317.58002,52.93;i=device/pc");
        }
        pc30_l4_4: pc30_l4 {
            @display("p=33.18,150.89;i=device/pc");
        }
        pc30_l4_5: pc30_l4 {
            @display("p=93.22,209.35;i=device/pc");
        }
        pc30_l4_6: pc30_l4 {
            @display("p=378.41,167.48;i=device/pc");
        }
        pc30_l4_7: pc30_l4 {
            @display("p=255.17,218.83;i=device/pc");
        }

    connections:
        pc30_l4_1.out++ --> {  delay = 100ms; } --> pc30_l4_2.in++;
        pc30_l4_1.in++ <-- {  delay = 100ms; } <-- pc30_l4_2.out++;


        pc30_l4_1.out++ --> {  delay = 100ms; } --> pc30_l4_3.in++;
        pc30_l4_1.in++ <-- {  delay = 100ms; } <-- pc30_l4_3.out++;


        pc30_l4_1.out++ --> {  delay = 100ms; } --> pc30_l4_4.in++;
        pc30_l4_1.in++ <-- {  delay = 100ms; } <-- pc30_l4_4.out++;



        pc30_l4_1.out++ --> {  delay = 100ms; } --> pc30_l4_5.in++;
        pc30_l4_1.in++ <-- {  delay = 100ms; } <-- pc30_l4_5.out++;

        pc30_l4_5.out++ --> {  delay = 100ms; } --> pc30_l4_6.in++;
        pc30_l4_5.in++ <-- {  delay = 100ms; } <-- pc30_l4_6.out++;

        pc30_l4_5.out++ --> {  delay = 100ms; } --> pc30_l4_7.in++;
        pc30_l4_5.in++ <-- {  delay = 100ms; } <-- pc30_l4_7.out++;

}