pipeline {
  agent any
  environment {
    IMAGE_NAME = 'Kzeoooo/simple-app'
    REGISTRY_CREDENTIALS = 'dockerhub-credentials'
  }
  stages {
    stage('Checkout SCM') {  
      steps {  
        checkout scm  
      }  
    }
    
    stage('Validate App & Database') {  
      steps {  
        bat 'echo "Memeriksa file aplikasi Flask dan skema database SQLite..."'  
      }  
    }
    
    stage('Build Docker Image') {
      steps {  
        bat "docker build -t %IMAGE_NAME%:%BUILD_NUMBER% -t %IMAGE_NAME%:latest ."  
      }
    }
    
    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: REGISTRY_CREDENTIALS,
            usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          
          // Gunakan satu metode login yang bersih dengan --password-stdin
          bat 'echo %PASS%| docker login -u %USER% --password-stdin'
          
          // Push image berdasarkan nomor build
          bat "docker push %IMAGE_NAME%:%BUILD_NUMBER%"
          
          // Push image dengan tag latest
          bat "docker push %IMAGE_NAME%:latest"
        }
      }
    }
  }
  post {
    always {
      echo 'Pipeline CI/CD Flask + SQLite selesai dieksekusi.'
    }
  }
}
