pipeline{
agent any
environment {
DOCKERHUB_CREDENTIALS=credentials('sai')
}
stages {
stage('clone') {
    steps{
        git 'https://github.com/venkatasai1497/sai'
    }
}
stage('Build') {
steps {
sh 'docker build -t sai1497/install1 .'
}
}
stage('Login') {
steps {
sh ' docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
}
}
stage('Push') {
steps {
sh 'docker push sai1497/install1'
}
}
}
post {
always {
sh 'docker logout'
}
}
}
