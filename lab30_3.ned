simple pc30_l3
{
    gates:
        input in;
        output out;
}

//
// Two instances (tic and toc) of Txc1 connected both ways.
// Tic and toc will pass messages to one another.
//
network lab30_3_network
{
        @display("bgb=682,323");
    submodules:
        pc30_l3_1: pc30_l3 {
            @display("p=50,139;is=s;i=device/pc4");
        }
        pc30_l3_2: pc30_l3 {
            @display("p=432,118;is=s;i=device/laptop");
        }
        pc30_l3_3: pc30_l3 {
            @display("p=141,34;is=s;i=device/pc4");
        }
        pc30_l3_4: pc30_l3 {
            @display("p=422,189;is=s;i=device/laptop");
        }
        pc30_l3_5: pc30_l3 {
            @display("p=263,260;is=s;i=device/laptop");
        }
    connections:
        pc30_l3_5.out --> {  delay = 100ms; } --> pc30_l3_4.in;
        pc30_l3_3.in <-- {  delay = 100ms; } <-- pc30_l3_4.out;
        pc30_l3_3.out --> {  delay = 100ms; } --> pc30_l3_2.in;
        pc30_l3_1.in <-- {  delay = 100ms; } <-- pc30_l3_2.out;
        pc30_l3_1.out --> {  delay = 100ms; } --> pc30_l3_5.in;
}