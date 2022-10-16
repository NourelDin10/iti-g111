pipeline {
    agent any

    tools {
        maven "maven"
    }

    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/NourelDin10/iti-g111.git'

            }

        }
        stage('build package'){
            steps {
                sh'mvn clean package'

                 }
           }


        stage('jtest'){
            steps {
                 junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                 }
           }
        stage('build iamge'){
            steps {
                sh'docker build -t noureldinessa/jenkins-iti'

                 }
           }
        stage('push iamge'){
            steps {
                withCredentials([usernamePassword(credentialsId:'dockerhub', passwordVariable: 'pass', usernameVariabl:'username')]){
                sh'docker login -u $(usermame) -p $(pass)'
                sh'docker push noureldinessa/jenkins-iti'
                }

                 }
           }

    }
}
