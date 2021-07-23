# Kafka on kubernetes using 'Strimzi'

```{image} images/kafka-kubernetes.png
:alt: kubernetes
:width: 400px
:align: center
```  


## Requirements:
- Install [docker](https://docs.docker.com/engine/install/)
- Install [kubectl](https://kubernetes.io/docs/tasks/tools/)
- Install [minikube](https://minikube.sigs.k8s.io/docs/start/)

(section-label)=
## Steps
- Enable kubernetes on Docker Desktop (if you are using it)
- Start minikube to setup a local kubernetes cluster:
    ```sh
    $ minikube start --memory=4096 # 2GB default memory isn't always enough
    ```
- Create a new kubernetes namespace:
    ```sh
    $ kubectl create namespace kafka # Created for a good practice
    ```
- Create a Kafka cluster on Kubernetes using strimzi image:
    ```sh
    $ kubectl create -f https://strimzi.io/install/latest?namespace=kafka -n kafka
    ```
- Set up a Kafka cluster with ephemeral storage (in production we'd like to have persistent):
    ```sh
    # One node for Kafka and one for Zookeeper  
    $ kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-ephemeral-single.yaml -n kafka
    ```
- Wait for Kubernetes to start all the pods:
    ```sh
    kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka
    ```
- Create topics:
    ```sh
    kubectl apply -f kafka/kafka-topics.yml -n kafka
    ```
- Check the existing topics:
    ```sh
    # Create a new pod which will execute the kafka-topic.sh script
    kubectl -n kafka run kafka-topics -it --image=quay.io/strimzi/kafka:0.24.0-kafka-2.8.0 --rm=true --restart=Never -- bin/kafka-topics.sh --list --bootstrap-server my-cluster-kafka-bootstrap:9092
    ```
- Let's test everything running a producer and a consumer:
    ```sh
    # Create a new pod running a Kafka producer, which sends messages to the 'advertisers' topic
    kubectl -n kafka run kafka-producer -it --image=quay.io/strimzi/kafka:0.24.0-kafka-2.8.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list my-cluster-kafka-bootstrap:9092 --topic advertisers
    ```  
      
    ```sh
    # Create a new pod running a Kafka consumer, which consumes messages from the 'advertisers' topic
    kubectl -n kafka run kafka-consumer -it --image=quay.io/strimzi/kafka:0.24.0-kafka-2.8.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic advertisers --from-beginning
    ```
    