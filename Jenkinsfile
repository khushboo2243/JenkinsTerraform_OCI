pipeline {

 agent any

 environment {
   SVC_ACCOUNT_KEY = credentials('terraform-auth')
 }

 stages {

   stage('Checkout') {
     steps {
       sh 'echo $PWD'
       sh 'echo $SVC_ACCOUNT_KEY | base64 -d > terraform.tfvars'
       sh '${WORKSPACE}. /var/lib/jenkins/workspace/TerraformDemo/env-vars'

     }
   }

   stage('TF Plan') {
     steps {

         sh 'terraform init'
         sh 'terraform plan -out myplan'
     }
   }
stage('Approval') {
     steps {
       script {
         def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
       }
     }
   }

   stage('TF Apply') {
     steps {
         sh 'terraform apply -input=false myplan'
     }
   }

}

 }
