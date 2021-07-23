# Setup a Kafka Cluster on Kubernetes

This is a simple book which illustrates how to easily set up a development Kafka cluster on Kubernetes.

## Why Kafka?

<img src="images/kafka.png" alt="kafka" width="500" align="right"/>

Apache Kafka is an open source, distributed streaming platform developed by LinkedIn in order to manage the huge amount of messages per day.  
Its architecture and capabilities can deliver:
* **Microservices** architecture and extremely **high throughput** data sharing
* **Message ordering guarantees**
* Message **rewind/replay** from data storage to reconstruct an **application state**
* **Horizontal scalability** in a cluster configuration


If we find ourselves in one of the following use cases, then we might consider to start using Kafka:
* **Event-driven architectures**
* Event sourcing to capture changes to the state of an application as a **log of events**
* **Message brokering**
* **Website activity tracking**
* Operational **monitoring** through metrics
* **Log collection and aggregation**
* Commit logs for **distributed systems**
* **Stream processing** so that applications can respond to data in **real time**

## Why Kubernetes?

We are currently living in the  '**container era**': almost every application is being isolated inside a lightweight container, which can then be run in **any type of system**.  
In a production environment, **_manually managing_** the containers that run the applications, ensuring that there is no downtime etc. is very **_tedious and time consuming_**.  
That's how Kubernetes comes to the rescue! Kubernetes provides a framework to **run distributed systems resiliently**. It takes care of scaling and failover for your application, provides deployment patterns, and more.  
  
```{image} images/kubernetes.svg
:alt: kubernetes
:width: 400px
:align: left
```

A key benefit for operations teams of running Apache Kafka on Kubernetes is __*infrastructure abstraction*__:  
<u>it can be configured once and run everywhere</u>.  

The inherent scalability of Kubernetes is a natural complement to Apache Kafka: it allows applications to **scale resources up and down with a simple command** or **scale automatically** based on usage.  
  

Kubernetes also offers Apache Kafka the portability to **span across** on-premises and public, private, or hybrid clouds, and use **different operating systems**.

