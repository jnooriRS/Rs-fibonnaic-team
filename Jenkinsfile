pipeline {
    agent {
        docker { image 'python:latest' }
   }
   environment {
      dockerImage =''
      registry = 'jnooririversafe/janda'
      registryCredential ='d34d387c-0abe-4e39-9260-588e5ad529aa'
   }
  stages {
    stage("Set Up") {
      echo 'Set up'
      steps {
        git branch: 'main', url: 'https://github.com/jnooriRS/rs-fibonnaic-team'
      }
    }
    stage("Build") {
      steps {
        echo 'Build Steps'
        sh '''
            python -m venv .venv
            . .venv/bin/activate
            pip install -r requirements.txt
        '''
        script {
          docker.build("jnooririversafe")
        }
      }
    }
    stage("Test") {
      steps {
        echo 'Test Steps'
        sh '''
            python -m venv .venv
            . .venv/bin/activate
            pytest tests/ -vv --cov=. --cov-branch --cov-report=term-missing --cov-report html:reports/coverage/cov_html --cov-report=xml:reports/coverage/coverage.xml --junitxml=reports/xunit/test-results.xml -o junit_family=xunit1
        '''
      }
    }
    stage('Publish Tests') {
      steps {
        junit skipPublishingChecks: true, testResults: 'reports/xunit/test-results.xml'
        cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'reports/coverage/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
      }
    }
    stage("Deploy/Push Image") {
      steps {
        echo 'Placeholder Deploy Steps'
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'git') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
        }
      }
    }
  }
}
