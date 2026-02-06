# Docker images with JFrog

Using the following registry;

docker login -u <username> -p <token> trialrl5xsk.jfrog.io

docker tag <myimage> trialrl5xsk.jfrog.io/dcimages-docker/<myimage>

docker push trialrl5xsk.jfrog.io/dcimages-docker/<myimage>

docker pull trialrl5xsk.jfrog.io/dcimages-docker/<myimage>