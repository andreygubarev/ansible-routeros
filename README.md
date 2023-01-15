# `andreygubarev.routeros`

Collection for idempotent management of MikroTik RouterOS devices, including upsert of configs.

## Installation

To install this collection use the `ansible-galaxy` command-line tool:

```sh
ansible-galaxy collection install andreygubarev.routeros
```

## `andreygubarev.routeros.api_find_and_upsert`

Role for idempotently finding and upserting Mikrotik RouterOS configurations using the RouterOS API.

```yaml
---
- hosts: routeros
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

For full documentation and usage instructions, please refer to the [role documentation](https://github.com/andreygubarev/ansible-routeros/blob/main/roles/api_find_and_upsert/README.md).
