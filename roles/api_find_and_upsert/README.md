`andreygubarev.routeros.api_find_and_upsert`
============================================

Role for idempotently finding and upserting Mikrotik RouterOS configurations using the RouterOS API.

Requirements
------------

This role requires `librouteros` version `3.0.0` to `4.0.0` python package to be installed, but only version `3.2.1` has been tested.

Example Playbook
----------------

```yaml
# requirements.yml
---
collections:
  - name: andreygubarev.routeros

# inventory/group_vars/routeros.yml
---
ansible_connection: ansible.netcommon.network_cli
ansible_network_os: community.network.routeros

# inventory/host_vars/mikrotik.yml
---
routeros_defaults:
  hostname:
  username:
  password:
  tls: false

# playboook.yml
---
- name: RouterOS
  hosts: mikrotik
  gather_facts: false
  module_defaults:
    community.routeros.api: "{{ routeros_defaults }}"
    community.routeros.api_find_and_modify: "{{ routeros_defaults }}"
  tasks:
    - name: Upsert IP pool
      ansible.builtin.include_role: { name: andreygubarev.routeros.api_find_and_upsert }
      vars:
        path: ip pool
        find:
          name: dhcp
        values:
          name: dhcp
          ranges: 10.10.0.2-10.10.0.254
```

License
-------

[MIT](LICENSE)
