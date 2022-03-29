simple pc30_l7
{
    parameters:
        int Snode = default(3);
        int Dnode = default(2);
    gates:
        inout gate[];
}

network lab30_7_network
{
    @display("bgb=775,315");
    submodules:
       node30[10] : pc30_l7;
       
    connections:

        node30[0].gate++ <--> {  delay = 100ms; } <--> node30[1].gate++;
        node30[0].gate++ <--> {  delay = 100ms; } <--> node30[3].gate++;
        node30[1].gate++ <--> {  delay = 100ms; } <--> node30[2].gate++;
        node30[2].gate++ <--> {  delay = 100ms; } <--> node30[4].gate++;
        node30[3].gate++ <--> {  delay = 100ms; } <--> node30[5].gate++;
        node30[6].gate++ <--> {  delay = 100ms; } <--> node30[8].gate++;
        node30[6].gate++ <--> {  delay = 100ms; } <--> node30[0].gate++;
        node30[5].gate++ <--> {  delay = 100ms; } <--> node30[9].gate++;
        node30[3].gate++ <--> {  delay = 100ms; } <--> node30[8].gate++;
        node30[9].gate++ <--> {  delay = 100ms; } <--> node30[2].gate++;
        node30[7].gate++ <--> {  delay = 100ms; } <--> node30[2].gate++;
        node30[9].gate++ <--> {  delay = 100ms; } <--> node30[7].gate++;
        node30[5].gate++ <--> {  delay = 100ms; } <--> node30[1].gate++;

}