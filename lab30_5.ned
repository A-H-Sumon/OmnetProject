simple pc30_l5
{
    parameters:
        int limit = default(10);
    	int destination = default(8);
    gates:
        input in[];
        output out[];
}

network lab30_5_network

{
    @display("bgb=628.84,399.74");

    submodules:
        pc30_l5_1: pc30_l5 {
            @display("p=33.18,42.66;i=device/laptop");
        }
        pc30_l5_2: pc30_l5 {
            @display("p=335,103;i=device/pc");
        }

        pc30_l5_3: pc30_l5 {
            @display("p=425,32;i=device/pc");
        }
        pc30_l5_4: pc30_l5 {
            @display("p=33,218;i=device/pc");
        }
        pc30_l5_5: pc30_l5 {
            @display("p=187,273;i=device/pc");
        }
        pc30_l5_6: pc30_l5 {
            @display("p=450,118;i=device/pc");
        }
        pc30_l5_7: pc30_l5 {
            @display("p=247,157;i=device/pc");
        }

    connections:
        pc30_l5_1.out++ --> {  delay = 100ms; } --> pc30_l5_2.in++;
        pc30_l5_1.in++ <-- {  delay = 100ms; } <-- pc30_l5_2.out++;


        pc30_l5_1.out++ --> {  delay = 100ms; } --> pc30_l5_3.in++;
        pc30_l5_1.in++ <-- {  delay = 100ms; } <-- pc30_l5_3.out++;


        pc30_l5_1.out++ --> {  delay = 100ms; } --> pc30_l5_4.in++;
        pc30_l5_1.in++ <-- {  delay = 100ms; } <-- pc30_l5_4.out++;



        pc30_l5_1.out++ --> {  delay = 100ms; } --> pc30_l5_5.in++;
        pc30_l5_1.in++ <-- {  delay = 100ms; } <-- pc30_l5_5.out++;

        pc30_l5_5.out++ --> {  delay = 100ms; } --> pc30_l5_6.in++;
        pc30_l5_5.in++ <-- {  delay = 100ms; } <-- pc30_l5_6.out++;

        pc30_l5_5.out++ --> {  delay = 100ms; } --> pc30_l5_7.in++;
        pc30_l5_5.in++ <-- {  delay = 100ms; } <-- pc30_l5_7.out++;

}