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

- [ ] Setup adversary (e.g. Caldera, Infection Monkey, Atomic Red Team, custom application, ...)
- [ ] Configure attack pattern(s)
- [ ] add _scaling_ mechanism to spawn additional attacking pods


### Victim

- [ ] Setup target application (OWASP Juice Shop)
