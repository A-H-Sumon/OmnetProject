#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class pc30_l5 : public cSimpleModule
{
  private:
    int counter;
    int dest;
  protected:
    // The following redefined virtual function holds the algorithm.
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

// The module class needs to be registered with OMNeT++
Define_Module(pc30_l5);

void pc30_l5::initialize()
{
    counter = par("limit");
    dest = par("destination");

    if (strcmp("pc30_l5_1", getName()) == 0)
    {
        cMessage *msg = new cMessage("Hi");
        int n = gateSize("out");
        int k = intuniform(0, n-1);

        EV << "Forwarding message " << msg << " on port out[" << k << "]\n";
        send(msg, "out", k);
        counter--;
    }
}

void pc30_l5::handleMessage(cMessage *msg)
{
    if(counter <= 0 || getId() == dest)
    {
        EV << getId() << dest << "\n"; // SH
        delete msg;
    }
    else
    {
        int n = gateSize("out");
        int k = intuniform(0, n-1);

        EV << "Forwarding message " << msg << " on port out[" << k << "]\n";
        send(msg, "out", k);
        counter--;
    }
}
