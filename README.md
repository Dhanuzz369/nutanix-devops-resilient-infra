# Nutanix DevOps Resilient Infrastructure

## Overview
This project demonstrates a DevOps pipeline aligned with Nutanix-style infrastructure concepts. It integrates Infrastructure as Code, configuration management, containerized deployment, CI/CD, and a self-healing mechanism.

The objective is to simulate how modern platforms like Nutanix AHV manage workloads with automation and resilience.

---

## Architecture
Developer Commit
│
▼
GitHub Actions (CI/CD)
│
▼
Terraform (Infrastructure as Code)
│
▼
Ansible (Configuration Management)
│
▼
Docker (Application Deployment)
│
▼
Health Check Script (Self-Healing)

## Tech Stack

- Terraform — Infrastructure provisioning  
- Ansible — Configuration automation  
- Docker — Containerized application deployment  
- GitHub Actions — Continuous Integration / Continuous Deployment  
- Bash — Health monitoring and recovery  

---

## Features

- Infrastructure provisioning using Terraform  
- Automated deployment using Ansible  
- Containerized application using Docker  
- CI/CD pipeline using GitHub Actions  
- Self-healing system with automatic container recovery  

---

## Project Structure
nutanix-devops-resilient-infra/
├── terraform/        # Infrastructure provisioning
├── ansible/          # Configuration and deployment
├── app/              # Application code (Flask)
├── scripts/          # Health check script
├── .github/workflows # CI/CD pipeline
├── run.sh            # One-command deployment
└── README.md

---

## How to Run

### Clone the repository
git clone <your-repo-url>
cd nutanix-devops-resilient-infra

### Run deployment
./run.sh

### Access the application
http://localhost:5001
---

## CI/CD Pipeline

The pipeline is triggered on every push to the main branch.

Steps:
1. Checkout repository  
2. Build Docker image  
3. Run container  
4. Perform health check  

This ensures automated build and validation of application changes.

---

## Resilience Design

The system includes a health check script that continuously monitors the application.

If the container stops or becomes unhealthy:
- The system automatically restarts the container  
- If the container is missing, it is recreated  

This simulates high-availability behavior in production systems.

---

## Nutanix Concept Mapping

| Nutanix Concept | Project Implementation |
|----------------|----------------------|
| AHV Virtual Machine | Docker container |
| Prism Central | Terraform orchestration |
| NGT (Guest Tools) | Ansible automation |
| High Availability | Self-healing script |

---

## Key Learnings

- Designing infrastructure automation without direct VM access  
- Handling container lifecycle and dependency conflicts  
- Implementing self-healing mechanisms  
- Building CI/CD pipelines with validation steps  
- Debugging real-world issues such as port conflicts and process locks  

---

## Limitations

Due to constraints in the Nutanix Test Drive environment (restricted VM access and NGT requirements), guest-level automation could not be implemented directly.

Instead, equivalent DevOps tooling was used to simulate infrastructure and automation workflows.

---

## Future Improvements

- Integrate container registry (Docker Hub)  
- Add monitoring (Prometheus, Grafana)  
- Extend to Kubernetes-based deployment  
- Implement full auto-deployment from CI/CD to runtime environment  
