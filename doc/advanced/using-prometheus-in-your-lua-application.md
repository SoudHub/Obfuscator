# Using Blus in your Lua Application

Blus can also be used as a library for your custom Lua Applications instead of using its cli tool.&#x20;

In order to do that you'll first need to clone the github repo:

```batch
git clone "https://github.com/levno-710/Blus.git"
```

After that, you'll need to copy everything within the src folder to your project. Let's say you created a folder named `blus`, where all the Blus files are located. You can the use the following code to obfuscate a string:

{% code title="use_blus.lua" %}
```lua
local Blus = require("blus.blus")

-- If you don't want console output
Blus.Logger.logLevel = Blus.Logger.LogLevel.Error

-- Your code
local code = 'print("Hello, World!")'

-- Create a Pipeline using the Strong preset
local pipeline = Blus.Pipeline:fromConfig(Blus.Presets.Strong)

-- Apply the obfuscation and print the result
print(pipeline:apply(code));
```
{% endcode %}

Instead of passing the Strong preset you could also pass a custom [Config Object](../getting-started/the-config-object.md).
