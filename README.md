# dotfiles

To use, clone this repo into the directory of your choice. Supposing that you've cloned it into `~/dotfiles`, back up and delete your existing dotfiles, and then:

```
cd && ln -s dotfiles/.bashrc && ln -s dotfiles/.inputrc-linux .inputrc && ...
```

As seen above, some files in this repo may be OS-specific, in which case you should choose the appropriate one, and link it to the more ordinary, non-OS-specific name in your homedir (eg `~/dotfiles/.inputrc-linux` should be linked as `~/.inputrc`).

Have fun! Feedback always welcomed.

