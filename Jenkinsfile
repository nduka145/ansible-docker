pipeline {
    agent { dockerfile true }
    tools {
        ansible 'ansible'
    }

    environment {
        PATH = "/tmp/.local/bin:$PATH" // Updated to match /tmp directory
    }

    stages {
        stage('Check Git Installation') {
            steps {
                sh 'pwd'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook myplaybook.yml -i inventory'
            }
        }
    }
}
