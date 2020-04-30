node {
    
    def buildNumber = BUILD_NUMBER
    stage('Docker login') {
        sh "docker login -u dockerranganath -p Docker@123"
    }
    
    stage('Docker pull image') {
        sh "docker pull nginx"
    }
    
    stage('build container and deploy the container') {
        sshagent(['Docker_Hub_SSH']) {
          sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.33.140 docker rm -f nginx${buildNumber} || true"
          sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.33.140 docker container run -d --name nginx${buildNumber} -p 8084:80 nginx"
    }
  }
}
