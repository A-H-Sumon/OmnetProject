simple pc30
{
    gates:
        input in;
        output out;
}

network lab30_1_network
{
    @display("bgb=929, 346");
    submodules:
        pc30_1: pc30 {
            @display("i=device/pc2;p=40,38");
        }
        pc30_2: pc30 {
            @display("p=572,75;i=device/laptop");
        }
        pc30_3: pc30 {
            @display("p=284,257;i=device/pocketpc");

        }
    connections:
        pc30_1.out --> {  delay = 100ms; } --> pc30_2.in;
        pc30_3.in <-- {  delay = 100ms; } <-- pc30_2.out;
        pc30_3.out --> {  delay = 100ms; } --> pc30_1.in;
}
