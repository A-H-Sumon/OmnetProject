/*
 * pc30.cc
 *
 *  Created on: Aug 13, 2021
 *      Author: User
 */


#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

/**
 * Derive the pc30 class from cSimpleModule. In the Tictoc1 network,
 * both the `tic' and `toc' modules are pc30 objects, created by OMNeT++
 * at the beginning of the simulation.
 */
class pc30 : public cSimpleModule
{
  protected:
    // The following redefined virtual function holds the algorithm.
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

// The module class needs to be registered with OMNeT++
Define_Module(pc30);

void pc30::initialize()
{
    // Initialize is called at the beginning of the simulation.
    // To bootstrap the tic-toc-tic-toc process, one of the modules needs
    // to send the first message. Let this be `tic'.

    // Am I Tic or Toc?
    if (strcmp("pc30_1", getName()) == 0) {
        // create and send first message on gate "out". "tictocMsg" is an
        // arbitrary string which will be the name of the message object.
        cMessage *msg = new cMessage("Hi");
        send(msg, "out");
    }
}

void pc30::handleMessage(cMessage *msg)
{
    // The handleMessage() method is called whenever a message arrives
    // at the module. Here, we just send it to the other module, through
    // gate `out'. Because both `tic' and `toc' does the same, the message
    // will bounce between the two.
    send(msg, "out"); // send out the message
}

