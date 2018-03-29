Kozalo's Dotfiles
=================

![Screenshot](http://kozalo.ru/images/posts/103661863.png)

A bundle of my configuration files (built based on several configs from the Internet) on such the system:

<table>
    <tr>
        <td>GNU/Linux distribution</td>
        <td><b>Debian 9</b></td>
    </tr>
    <tr>
        <td>Window manager</td>
        <td><b>i3</b></td>
    </tr>
    <tr>
        <td>Theme</td>
        <td><b>Arc-Dark</b> [GTK2/3]</td>
    </tr>
    <tr>
        <td>Icons</td>
        <td><b>Moka</b> [GTK2/3]</td>
    </tr>
    <tr>
        <td>Text editor</td>
        <td><b>vim</b></td>
    </tr>
    <tr>
        <td>Shell</td>
        <td><b>zsh</b> (oh-my-zsh)</td>
    </tr>
</table>

There are additional configuration files for:

- _tmux_;
- _Sublime Text 3_.

See also a [configuration file](https://gist.github.com/kozalosev/b56ec01bd5eb2564994c31f5d7f958f1) for
[cVim](https://chrome.google.com/webstore/detail/cvim/ihlenndgcmojhcghmfjfneahoeklbjjh).


How to apply the configuration
------------------------------

You can use the [KozConfigurator](https://bitbucket.org/Kozalo/kozconfigurator/) script to install all essential
software and apply basic tweaks.

Unfortunately, _git_ doesn't allow us to clone the repository into a non-empty directory. There are at least 2 options
how to circumvent this.

The first one is to initialize a new empty repository, pull all files from the remote repo, and clone submodules then:

```zsh
git init
# We have to delete some files to avoid conflicts
rm .bashrc .zshrc .gtkrc-2.0 .config/gtk-3.0/settings.ini
git pull https://github.com/kozalosev/dotfiles
git submodule update --init
```

The second option is to create a temporary directory, clone the remote repo there, and move all the files to the home
directory:

```zsh
mkdir ~/tmp
git clone --recursive https://github.com/kozalosev/dotfiles ~/tmp
mv ~/tmp/.git ~/
# Note that this command may overwrite your files!
git reset --hard
rm -rf ~/tmp
```

The last thing you need to do is to execute the `:PluginInstall` command in Vim.

> If you don't need the whole content of the repository, you're able to take only some of the configuration files and
> install only software by your choice.


#### Notes

- If you're going to use this configuration on a laptop, install the _xbacklight_ package to manage the backlight
  pressing special keys on the keyboard.
- The avatar and background images are owned by _NEKO WORKs_.
