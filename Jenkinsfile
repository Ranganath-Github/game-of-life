node {

    def buildNumber = BUILD_NUMBER
    stage('Clone') {
        git 'https://github.com/Ranganath-Github/game-of-life.git'
    }
    
    stage('Build') {
        sh 'mvn clean install'
    }
    
    stage('Build Docker Image') {
      sh "docker image build -t dockerranganath/gameoflife:${buildNumber} ."
    }
    
    stage('Docker Login') {
      sh "docker login -u $$$$$ -p #####"
    }
    
    stage('Docker push image') {
      sh "docker push dockerranganath/gameoflife:${buildNumber}"
    }
    
    stage('Docker container creation') {
      sshagent(['Docker_dev_SSH']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.37.78 docker rm -f javawebappcontainer || true"
       sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.37.78 docker container run -d --name javawebappcontainer -p 8089:8080 dockerranganath/gameoflife:${buildNumber}"
    }
  }
}
