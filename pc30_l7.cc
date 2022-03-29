#include <omnetpp.h>
#include "packet30_m.h"

using namespace omnetpp;

class pc30_l7 : public cSimpleModule
{
  private:
    int snode;
  protected:
    // The following redefined virtual function holds the algorithm.
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void forwardMessage(packet30 *msg);
    virtual packet30 *generateMessage();
};

// The module class needs to be registered with OMNeT++
Define_Module(pc30_l7);

void pc30_l7::initialize()
{
    snode = par("Snode");

    if (getIndex() == snode) {
        packet30 *msg = generateMessage();
        forwardMessage(msg);

    }
}

void pc30_l7::handleMessage(cMessage *msg)
{
    packet30 *tmsg=check_and_cast<packet30 *>(msg);
    if(getIndex()==tmsg->getDest()){
        EV<<"Message "<<tmsg<<"arrived after "<<tmsg->getHop()<<" hops.\n";
        bubble("Arrived!!");
        delete msg;
    }

    else
    {
        forwardMessage(tmsg);
    }
}

packet30 *pc30_l7 :: generateMessage (){
    int dnode = par("Dnode");
    packet30 *msg = new packet30("Anower");
    msg->setSrc(snode);
    msg->setDest(dnode);
    return msg;
}

void pc30_l7 :: forwardMessage (packet30 *msg){
    int ag_index;
    cGate *ag = msg->getArrivalGate();

    int n = gateSize("gate");
    int k = intuniform(0, n-1);
    if(ag!=NULL && n>1){
        ag_index = ag->getIndex();
        while(ag_index == k)
            k = intuniform(0, n-1);
    }
    else{

    }

    EV << "Forwarding message " << msg << " on port out[" << k << "]\n";
    send(msg, "gate$o", k);
    msg->setHop(msg->getHop()+1);

}



