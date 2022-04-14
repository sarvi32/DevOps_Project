pipeline {
  agent any
  tools {
    maven 'maven-3.6.3' 
  }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage ('Deploy') {
      steps {
        script {
          deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://13.59.208.230:8080')], contextPath: '', onFailure: false, war: 'webapp/target/*.war' 
        }
      }
    }
  }
}
