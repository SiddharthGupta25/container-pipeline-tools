pipeline {

    agent any

    stages {

        stage('Preparting Build') {

            steps {
                sh "echo [+] Preparing Build"

                script{
                    commitHash = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
                    def version = commitHash.take(9)
                    currentBuild.displayName = "DC-#${BUILD_NUMBER}-${version}"                        
                }
            }
        } // stage ends 

        stage('Deploying Node') {

            steps {
                sh "echo [+] Adding ${params.NAME} to Selenium Hub"

                dir('build/scripts'){
                    sh "chmod +x ./deployment-manager.sh ${params.NAME}"
                }
            }
        }
    }
}