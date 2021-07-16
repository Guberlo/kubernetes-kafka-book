# Strimzi

Strimzi is an Open Source project, part of the Cloud Native Computing Foundation (**CNCF**), which provides a way to easily run and deploy a Kafka cluster on Kubernetes.  
A key feature of Strimzi is represented by the '**Strimzi Operators**'.

## Strimzi Operators

In Kubernetes, operators are a method of packaging, deploying and managing applications. Strimzi Operators automate common and complex tasks related to Kafka deployment, making our life easier.  
In particular Strimzi operators simplify the process of:
- Deploying and running Kafka components
- Configuring and securing access to Kafka
- Managing brokers
- Creating and managing topics and users

Operators:
- **Cluster Operator**: Deploys and manages the whole kafka cluster and it's components, including the Entity Operator.
- **Entity Operator**: Deploys and manages the Topic and User Operator.
- **Topic Operator**: Manages Kafka topics.
- **User Operator**: Manages Kafka users.

