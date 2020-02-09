# Cyberwar Simulator 9000

For research of defensive security techniques it is vital to have realistic and up-to-date adversarial data/behavior.

The goal is to manage several pods in a sandboxed environment (i.e. Kubernetes cluster) with an adversary and a target application.
The adversary should be capable of performing several different adversarial techniques either from a single point or by spawning several other helper pods on a target system. 
The main focus is not on the types of attack, but managing the two parties in the environment by monitoring the environment and allowing simple interaction with the parties.
Depending on the used adversary (research necessary; either use existing tools or 'simple' replays of previously captured raw network traffic) can it be controlled either via a dedicated web interface or via a general dashboard of the sandboxed environment.


## Tasks

### Environment

- [ ] Setup Kubernetes environment 
- [ ] Put tooling for observation of the _battlefield_ in place (Istio + Kiali?)


### Adversary

- [x] Setup adversary (e.g. Caldera, Infection Monkey, Atomic Red Team, custom application, ...)
- [ ] Configure attack pattern(s)
- [ ] add _scaling_ mechanism to spawn additional attacking pods


### Victim

- [ ] Setup target application (OWASP Juice Shop)


## Prequesits 

* Install istioctl https://istio.io/docs/setup/getting-started/#download


## Setup


1. Checkout repository
2. Start cluster (or use a local minikube cluster)
 > ./start_minik.sh
3. Install istio on the cluster  
 > ./kiali_init_setup.sh

4. !!!Prep/Install Kiali [Kiali Setup](./kiali_setup.md). You need to add the Kiali Credentials!

5. Start Services / configure Network

 > ./setup.sh

## Usage

As soon as the environment is set up the clients (i.e. _frigates_) will connect to the CnC server using a RAT they come equipped with.
Once the clients are connected, an operation can be started using the Caldera webinterface. which can be reached at 
For this:
 1. navigate to the Caldera webinterface (`minikube ip` and port 32700)
 2. open the _Operations_ view under the _Campaign_ tab
 3. plan a new operation by clicking on `VIEW` to switch to `Add` mode
 4. `Start` operation


