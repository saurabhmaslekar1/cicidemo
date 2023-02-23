pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                // git 'https://github.com/jglick/simple-maven-project-with-tests.git'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/saurabhmaslekar1/cicidemo']])

                // Run Maven on a Unix agent.
                sh "mvn clean install"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

        }
        stage("docker build image"){
            steps {
                script{
                    sh "docker build -t saurabhmaslekar/cicddemo ."
                }
            }
        }
        stage("push image to hub"){
            steps {
                    withCredentials([string(credentialsId: 'SaurabhMaslekar', variable: 'dockerhubpwd')]) {
                    sh "docker login -u saurabhmaslekar -p ${dockerhubpwd}"
                    }
                    sh "docker push saurabhmaslekar/cicddemo"
                }

            }
        }
    }