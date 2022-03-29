/*
 * pc30_l4.cc
 *
 *  Created on: Aug 18, 2021
 *      Author: User
 */
#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

/**
 * Derive the pc30_l4 class from cSimpleModule. In the Tictoc1 network,
 * both the `tic' and `toc' modules are pc30_l4 objects, created by OMNeT++
 * at the beginning of the simulation.
 */
class pc30_l4 : public cSimpleModule
{
  private:
    int counter;
  protected:
    // The following redefined virtual function holds the algorithm.
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

// The module class needs to be registered with OMNeT++
Define_Module(pc30_l4);

void pc30_l4::initialize()
{
    // Initialize is called at the beginning of the simulation.
    // To bootstrap the tic-toc-tic-toc process, one of the modules needs
    // to send the first message. Let this be `tic'.
    counter=5;

    // Am I Tic or Toc?
    if (strcmp("pc30_l4_1", getName()) == 0) {
        // create and send first message on gate "out". "tictocMsg" is an
        // arbitrary string which will be the name of the message object.
        cMessage *msg = new cMessage("Hi");
        int n = gateSize("out");
        int k = intuniform(0, n-1);
        EV << "Forwarding message " << msg << " on port out[" << k << "]\n";
        send(msg, "out", k);
        counter--;
    }
}

void pc30_l4::handleMessage(cMessage *msg)
{
    // The handleMessage() method is called whenever a message arrives
    // at the module. Here, we just send it to the other module, through
    // gate `out'. Because both `tic' and `toc' does the same, the message
    // will bounce between the two.
    if(counter<=0){
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
