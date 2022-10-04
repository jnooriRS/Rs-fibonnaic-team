pipeline {
    agent {
        docker { image 'ubuntu:latest' }
   }
   environment {
       dockerImage =''
       registry = 'https://github.com/jnooriRS/rs-fibonnaic-team'
       registryCredential ='d34d387c-0abe-4e39-9260-588e5ad529aa'
   }
  stages {
    stage("Set Up") {
      steps {
        git branch: 'main', url: 'https://github.com/jnooriRS/rs-fibonnaic-team'
      }
    }
    stage("Build docker image") {
      steps {
        script {
            dockerImage = docker.build registry
        }
      }
    }
    stage('Push image') {
     steps {
        script {
            docker.withRegistry('https://registry.hub.docker.com', 'git') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            }
        }
      }
    }
     stage ('Push to Docker') {
        steps {
            script {
               docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
               }
            }
        }
    }
}}`
