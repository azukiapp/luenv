# Simple Lua Version Management: luenv

luenv lets you easily switch between multiple versions of Lua. It's
simple, unobtrusive, and follows the UNIX tradition of single-purpose
tools that do one thing well.

This project is based on project [luenv](http://github.com/azukiapp/luenv).

### luenv _does…_

* Let you **change the global Lua version** on a per-user basis.
* Provide support for **per-project Lua versions**.
* Allow you to **override the Lua version** with an environment
  variable.

## How It Works

luenv operates on the per-user directory `~/.luenv`. Version names in
luenv correspond to subdirectories of `~/.luenv/versions`. For
example, you might have `~/.luenv/versions/lua-5.2.1` and
`~/.luenv/versions/luvit-0.5.0`.

Each version is a working tree with its own binaries, like
`~/.luenv/versions/lua-5.2.1/bin/lua` and
`~/.luenv/versions/luvit-0.5.0/bin/luvit`. luenv makes _shim binaries_
for every such binary across all installed versions of Lua.

These shims are simple wrapper scripts that live in `~/.luenv/shims`
and detect which Lua version you want to use. They insert the
directory for the selected version at the beginning of your `$PATH`
and then execute the corresponding binary.

Because of the simplicity of the shim approach, all you need to use
luenv is `~/.luenv/shims` in your `$PATH`.

# Installation

## Basic GitHub Checkout

This will get you going with the latest version of luenv and make it
easy to fork and contribute any changes back upstream.

1. Check out luenv into `~/.luenv`.

        $ cd
        $ git clone git://github.com/azukiapp/luenv.git .luenv

2. Add `~/.luenv/bin` to your `$PATH` for access to the `luenv`
   command-line utility.

        $ echo 'export PATH="$HOME/.luenv/bin:$PATH"' >> ~/.bash_profile

    **Zsh note**: Modify your `~/.zshenv` file instead of `~/.bash_profile`.

3. Add luenv init to your shell to enable shims and autocompletion.

        $ echo 'eval "$(luenv init -)"' >> ~/.bash_profile

    **Zsh note**: Modify your `~/.zshenv` file instead of `~/.bash_profile`.

4. Restart your shell so the path changes take effect. You can now
   begin using luenv.

        $ exec $SHELL

5. Install Lua versions into `~/.luenv/versions`. For example, to
   install Lua lua-5.2.1, download and unpack the source, then run:

        $ ./configure --prefix=$HOME/.luenv/versions/lua-5.2.1
        $ make
        $ make install

    Or using simple command:

        $ luenv install lua-5.2.1

6. Rebuild the shim binaries. You should do this any time you install
   a new Lua binary (for example, when installing a new Lua version,
   or when installing a gem that provides a binary).

        $ luenv rehash
