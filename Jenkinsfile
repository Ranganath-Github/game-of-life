node {
    
    def buildNumber = BUILD_NUMBER
    stage('Clone') {
        git 'https://github.com/wakaleo/game-of-life.git'
    }
    
    stage('Build') {
        sh 'mvn clean install'
    }
    
    stage('Build Docker Image') {
      sh 'docker image build -t gameoflife:${buildNumber} .'
    }
}
