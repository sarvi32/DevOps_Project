pipeline {
  agent any
  tools {
    maven 'maven' 
  }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
   stage('Nexus upload'){
        steps {
           echo 'Nexus Uploader....'
           nexusArtifactUploader artifacts: [[artifactId: 'mavenapp', classifier: '', file: 'target/mavenapp-1.0.0.4.war', type: 'war']], credentialsId: 'nexus3', groupId: 'com.myapp', nexusUrl: '18.222.106.110:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'http://18.222.106.110:8081/repository/jenkins/', version: '1.0.0.4'

     }  
   }
    stage ('Deploy') {
      steps {
        script {
          deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://3.16.222.2:8080')], onFailure: false, war: '**/*.war' 
        }
      }
    }
  }
}
