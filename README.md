# Ansible Docker Lab

This lab sets up a simple environment with Docker to help you learn Ansible. It includes:
- One Ansible control node
- Two Ubuntu managed nodes with SSH enabled

## Getting Started

1. **Build and run the lab:**

```bash
docker-compose build --no-cache
docker-compose up -d
```

or just

```bash
docker-compose up --build -d
```

2. **Access the Ansible control node:**

```bash
docker exec -it ansible-control bash
# Then, in the shell, verify ansible is installed 
ansible --version
```

3. **Create an inventory file (`inventory.ini`) inside the `/ansible` directory:**

```ini
[node_servers]
node1 ansible_host=node1 ansible_user=root ansible_password=root ansible_ssh_common_args='-o StrictHostKeyChecking=no'
node2 ansible_host=node2 ansible_user=root ansible_password=root ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

4. **Run the sample playbook:**

```bash
ansible-playbook -i inventory.ini playbooks/ping-nodes.yml
ansible -i inventory.ini node_servers -m ping
```

---

## Sample Playbook: `ping-nodes.yml`

This playbook simply pings all managed nodes.

```yaml
- name: Ping all managed nodes
  hosts: node_servers
  gather_facts: no

  tasks:
    - name: Ping the node
      ping:
```

## Clean up

To stop and remove containers:

```bash
docker-compose down
```
