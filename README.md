duo-unix Cookbook
============
This cookbook installs [Duo](https://www.duosecurity.com/) 2-factor
authentication and configures ssh to use it.

Requirements
------------

This cookbook should work on either Debian/Ubuntu or Redhat families
of Linux distros.

Attributes
----------

TODO

Usage
-----
#### duo-unix

Include `duo-unix` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[duo-unix]"
  ]
}
```

Setup chef-vault with something like:

```
bin/knife vault create duo config '{"ikey":"FOO","skey":"BAR","host":"api-BAZ.duosecurity.com"}' --search "role:attacker" --admin my_key
```

If you really don't want to use chef-vault

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[duo-unix]"
  ],
  "default_attributes": {
    "duo-unix":{
      "api":{
        "ikey":"some_key",
        "skey":"some_secret_key",
        "host":"api-something.duosecurity.com"
      },
      "conf":{
        "group":"users"
      }
    }
  }
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Jason Rohwedder <jro@risk.io>
