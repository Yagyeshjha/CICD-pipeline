pipeline {
    agent any
    
    tools {
        terraform 'jenkins-terraform'
        git 'DefaultGit'
    }
    stages {
        stage('Terraform Init') {
          steps {
            withCredentials([usernamePassword(credentialsId: 'aws-credential', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
              sh '''
                terraform init
              '''
            }
          }
        } 
        stage ("terraform fmt") {
            steps {
                sh 'terraform fmt'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage ("terrafrom plan") {
           steps {
             withCredentials([usernamePassword(credentialsId: 'aws-credential', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
              sh '''
                terraform plan
              '''
            }
          }
        }
        stage ("terraform apply") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-credential', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                 sh '''
                  terraform apply --auto-approve
                 '''
               }
            }
        }
        stage('Terraform Destroy') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'aws-credential',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]) {
                    sh '''
                        terraform destroy -auto-approve
                    '''
                }
            }
        }
    }
    }
