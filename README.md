# MagModSkel
## Magento Module Skeleton generator.

Generates a basic skeleton for jumpstarting a new Magento Module.

### Installation:
Copy magModSkel.sh to some folder in your PATH. Or don't, but always use the
full path when running it. See if I care.

### Usage:
    magModSkel <Namespace> <ModuleName>
Generates the folders and a couple common files (config.xml, Data.php,
Namespace_ModuleName.xml) in the current folder. Run it in an empty folder
(recommended), or within the root of a Magento webtree (*with caution*).

I like to use a separate folder, then just symlink everything over to my magento
dev webtree. That way I don't have to juggle git and gitignore crap when I
should be writing code.


Enjoy, and feel free to fork and pull to add your own improvements!
