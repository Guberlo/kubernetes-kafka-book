# Expose Kafka cluster on the net! (Cloud Provider needed?)

At the moment, our cluster is reachable just from the inside (our own network). In order to be able to reach it form the outside, we need to follow some steps:  
1. Add an external listener to our Kafka cluster configuration
2. Add an encryption layer for security  

In order to do this, we just have to add a few lines to our kafka-cluster configuration file as follows:
```yaml
    listeners:
    - name: external
        type: loadbalancer
        tls: true
```  
Let's now create the new cluster:
```sh
$ kubectl apply -f kafka/kafka-cluster-external.yml -n kafka
```  
**NOTE: minikube, unlike many cloud providers, has no integrated LoadBalancer! You need to run this command in order to make it work**
```sh
$ minikube tunnel
```  