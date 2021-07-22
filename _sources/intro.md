# Setup a Kafka Cluster on Kubernetes

This is a simple book which illustrates how to easily set up a development Kafka cluster on Kubernetes.

## Why Kafka?

Apache Kafka is an open source, distributed streaming platform developed by LinkedIn to manage​
the huge amount of messages per day. Its architecture and capabilities can deliver:
* Microservices architecture and extremely high throughput data sharing
* Message ordering guarantees
* Message rewind/replay from data storage to reconstruct an application state
* Horizontal scalability in a cluster configuration


If we find ourselves in one of the following use cases, then we might consider to start using Kafka:
* Event-driven architectures
* Event sourcing to capture changes to the state of an application as a log of events
* Message brokering
* Website activity tracking
* Operational monitoring through metrics
* Log collection and aggregation
* Commit logs for distributed systems
* Stream processing so that applications can respond to data in real time