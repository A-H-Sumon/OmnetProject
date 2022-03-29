#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class pc30_l3 : public cSimpleModule
{
  protected:
    // The following redefined virtual function holds the algorithm.
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

// The module class needs to be registered with OMNeT++
Define_Module(pc30_l3);

void pc30_l3::initialize()
{
    // Initialize is called at the beginning of the simulation.
    // To bootstrap the pc30_l3_1-toc-pc30_l3_1-toc process, one of the modules needs
    // to send the first message. Let this be `pc30_l3_1'.

    // Am I pc30_l3_1 or Toc?
    if (strcmp("pc30_l3_1", getName()) == 0) {
        // create and send first message on gate "out". "pc30_l3_1tocMsg" is an
        // arbitrary string which will be the name of the message object.
        cMessage *msg = new cMessage("Msg30");
        send(msg, "out");
    }
}

void pc30_l3::handleMessage(cMessage *msg)
{
    // The handleMessage() method is called whenever a message arrives
    // at the module. Here, we just send it to the other module, through
    // gate out'. Because both pc30_l3_1' and `toc' does the same, the message
    // will bounce between the two.
    send(msg, "out"); // send out the message
}
