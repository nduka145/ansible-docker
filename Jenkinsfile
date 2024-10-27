pipeline {
    agent { dockerfile true }
    tools {
        ansible 'ansible'
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
                    becomeUser: 'root',
                    executable: '/root/.local/bin/ansible-playbook' // Full path to ansible-playbook
                )
            }
        }
    }
}
