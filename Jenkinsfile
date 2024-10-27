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
                sh 'whoami'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'ssh-user', 
                    inventory: 'inventory', 
                    playbook: 'myplaybook.yml', 
                    become: true, 
                    becomeUser: 'root'
                )
            }
        }
    }
}
