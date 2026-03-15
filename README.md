<h1 align="center">🚀 Azure Enterprise Platform Foundation</h1>

<p align="center">
  <strong>Modular Terraform • Production-Grade Landing Zone • DevSecOps First</strong><br>
  Enterprise-ready Azure infrastructure that I use for real-world hybrid cloud platforms.
</p>

---

### 📌 Overview

This repository contains my **production-ready modular Terraform codebase** for building secure, scalable and fully isolated Azure Landing Zones.  

It follows real enterprise patterns I’ve implemented for large-scale clients (telecom, banking, regulated industries) — complete with environment isolation, security scanning, approval gates and Kubernetes-ready foundations.

**Why this exists**  
I got tired of copy-pasting the same boilerplate across projects. So I built this once — clean, reusable, and battle-tested.

---

### 🏆 Key Highlights

- Fully modular monorepo architecture  
- Complete environment isolation (Dev / UAT / Prod) with separate state files  
- Secure-by-default networking & identity  
- AKS + ACR ready for microservices  
- Integrated DevSecOps scanning pipeline  
- Approval-based deployments with zero manual intervention  
- Ready for hybrid cloud (on-prem ↔ Azure) connectivity  

---

### 🏗️ High-Level Architecture

**Design Principles I Follow**
- Modular & reusable components (every resource is its own module)  
- Environment-level isolation & remote state locking  
- Secure-by-default (private endpoints, no public IPs by default, RBAC everywhere)  
- GitOps + CI/CD ready  
- Cost-optimised & observable from day one  

---

### ☁️ Core Azure Resources Provisioned

- Resource Groups  
- Virtual Networks & Subnets (hub-and-spoke ready)  
- Network Interfaces, Public IPs & Load Balancers  
- Azure Bastion (secure RDP/SSH)  
- Azure Key Vault + Secrets  
- Azure SQL Server & Databases (PaaS)  
- Linux Virtual Machines (for legacy workloads)  
- Azure Kubernetes Service (AKS) cluster  
- Azure Container Registry (ACR)  

---

### 📁 Repository Structure

Terraform_Generic_Infra_Modules/
├── Generic_Infra_Modules/
│   ├── Resource_Group/
│   ├── Virtual_Network/
│   ├── Subnet/
│   ├── Public_IP/
│   ├── Network_Interface_Card/
│   ├── Azure_Bastion/
│   ├── Key_Vault/
│   ├── Azure_SQL_Server/
│   ├── Azure_SQL_Database/
│   ├── Linux_Virtual_Machine/
│   ├── Azure_Kubernetes_Cluster/
│   └── Azure_Container_Registry/
├── Workspace/
│   ├── Env_Dev/
│   ├── Env_UAT/
│   └── Env_Prod/
├── .github/workflows/          # CI/CD pipelines


---

### 🌍 Multi-Environment Strategy

Every environment is **completely isolated**:
- Separate Terraform state (remote backend with locking)  
- Independent backend configuration  
- Environment-specific variables & pipelines  
- Safe promotion from Dev → UAT → Prod with approval gates  

Blast radius = zero. Compliance = built-in.

---

### 🔐 Security & DevSecOps (Built-in)

All changes go through automatic security scanning:
- **Checkov** – IaC policy enforcement  
- **tfsec** – Security misconfigurations  
- **TFLint** – Best practices  
- **Trivy** – Container & IaC scanning  
- **TruffleHog** – Secret detection  
- **KICS** – Compliance as code  

Scans run on every PR. Non-compliant code never reaches main.

---

### 🔄 CI/CD Pipeline (Azure DevOps + GitHub Actions ready)

Enterprise-grade pipeline included:
- Terraform fmt → validate → plan  
- Parallel security scanning stage  
- Manual approval gate before apply  
- Remote state handling  
- Path-based triggers for environment isolation  

Just connect your Azure DevOps or GitHub repo and you’re live.

---

### ☸️ Kubernetes & Container Platform Ready

This landing zone is **AKS-first**:
- Private AKS cluster with Azure CNI  
- VMSS node pools  
- ACR integration + workload identity  
- Private networking & ingress ready  
- Perfect foundation for my 5G Telecom project (Germany) and other production workloads  

---

### 📊 Observability Built-in

Designed to integrate seamlessly with:
- Azure Monitor + Log Analytics  
- Application Insights  
- Prometheus + Grafana  

All VMs, AKS pods and platform services are observable out of the box.

---

### 👤 Author

**Skand**  
Senior DevOps & Platform Engineer  
Specialised in Azure Landing Zones, Terraform, Kubernetes, DevSecOps & Hybrid Cloud Architectures  

This repo is part of my pinned collection. Feel free to fork, customise or reach out if you’re building something similar!

---

**⭐ Star this repo if you found it useful**  
Looking for the full CI/CD templates or the 5G Telecom project architecture? Check my other pinned repositories.

---

└── README.md
