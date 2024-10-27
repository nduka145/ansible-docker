pipeline {
    agent { dockerfile true }

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
                    playbook: 'freestyle.yaml', 
                    become: true, 
                    becomeUser: 'root'
                )
            }
        }
    }
}
