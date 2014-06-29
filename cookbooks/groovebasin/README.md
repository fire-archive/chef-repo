groovebasin Cookbook
====================

This cookbook installs groovebasin to your home directory.

Requirements
------------

#### packages
- `groove` - groovebasin needs groove installed.
- `nodejs` - groovebasin is built in nodejs.

Attributes
----------

Usage
-----
#### groovebasin::default

Just include `groovebasin` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[groovebasin]"
  ]
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
Authors: K. Ernest "iFire" Lee and authors of Groovebasin.
