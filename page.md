# Kafka on kubernetes using 'Strimzi'

## Requirements:
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
- Install Strimzi on kubernetes:
    ```sh
    $ kubectl create -f https://strimzi.io/install/latest?namespace=kafka -n kafka
    ```
- Set a persistent (JBOD) Kafka cluster:
    ```sh
    # Three nodes each for Kafka and Zookeeper  
    $ kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka
    ```
- Wait for Kubernetes to run all the pods:
    ```sh
    kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka
    ```
- Create topics:
    ```sh
    kubectl apply -f {folder with all .yml topic files} -n kafka
    ```
- Check the existing topics:
    ```sh
    # Create a new pod which will execute the kafka-topic.sh script
    kubectl -n kafka run kafka-topics -it --image=quay.io/strimzi/kafka:0.24.0-kafka-2.8.0 --rm=true --restart=Never -- bin/kafka-topics.sh --list --bootstrap-server my-cluster-kafka-bootstrap:9092
    ```

Here is a [reference to the intro](intro.md). Here is a reference to [](section-label).