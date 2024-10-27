pipeline {
    agent { dockerfile true }
    tools {
        ansible 'ansible'
    }

    environment {
        PATH = "/root/.local/bin:$PATH" // Ensure ansible-playbook is in PATH
    }

    stages {
        stage('Check Git Installation') {
            steps {
                sh 'git --version'
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
