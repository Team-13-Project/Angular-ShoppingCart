pipeline {
  environment {
    registry = "subhashc27/Angular-ShoppingCart"
    registryCredential = 'docker_hub_subhashc27'
    dockerImage = ''
  }
  agent any
  stages{
    stage ('Build') {
      steps{
        echo "Building Project"
        sh "npm install"
        sh "npm run ng --build  --prod"
      }
    }
    stage ('Archive') {
      steps{
        echo "Archiving Project"
        archiveArtifacts artifacts: '**/*.json', followSymlinks: false
      }
    }
    stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {
          docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              dockerImage.push('latest')
          }
        }
      }
    }
    stage ('Deploy to Dev') {
      steps{
        echo "Deploying to Dev Environment"
        sh "docker rm -f Angular-ShoppingCart || true"
        sh "docker run -d --name=Angular-ShoppingCart -p 8081:8080 subhashc27/Angular-ShoppingCart"
      }
    }
  }
}
