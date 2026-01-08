
pipeline {
    agent any 
    tools { 
        jdk 'jdk11'  // Make sure JDK is configured in Jenkins 
    }
    stages { 
        stage('Checkout') { 
            steps { 
                git branch: 'main', 
                    url:'https://github.com/Pravalika7-V/pipeline-git-repo.git'

                echo 'Repository cloned successfully' 
            } 
        } 
        stage('Build') { 
            steps { 
                echo 'Building application...'
                 sh 'chmod +x build.sh'
                sh './build.sh' 
            } 
        } 
        stage('Debug Files') {
    steps {
        echo 'Listing workspace files...'
        sh 'ls -la'
        sh 'pwd'
    }
}

        stage('Test') { 
            steps { 
                echo 'Running tests...' 
                sh 'java -cp src/main/java com.example.HelloDevOpsTest' 
            } 
        } 
        stage('Archive') { 
            steps { 
                echo 'Archiving artifacts...' 
                archiveArtifacts artifacts: 'app.jar', fingerprint: true 
                archiveArtifacts artifacts: 'build.sh', fingerprint: true 
            } 
        } 
    }
    post {
        always { 
            echo 'Pipeline completed' 
            cleanWs()  // Clean workspace 
        } 
    }
} 
