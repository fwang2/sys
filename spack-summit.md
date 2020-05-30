# Spack Notes

- [Spack Notes](#spack-notes)
  - [Preparation](#preparation)
  - [Set default compiler](#set-default-compiler)
  - [Using a different install tree](#using-a-different-install-tree)
  - [Specify Dependencies](#specify-dependencies)
  - [Check what compilers are available](#check-what-compilers-are-available)
  - [Create packages that are not in spack repo](#create-packages-that-are-not-in-spack-repo)
  - [Leverage existing packages](#leverage-existing-packages)
  - [Make the Spack module loadable](#make-the-spack-module-loadable)

The following note is more relevant to Summit for using `spack` to manage 3rd party packages.

## Preparation

Download a Spack release and unzip to home

    ln -sf spack-0.14.2 spack
    export PATH=$HOME/spack/bin:$PATH
  
Now we have `spack` command.


## Set default compiler

The first thing we want to do is compiler configuration. This can be done by:

    spack compiler add

The list can be fine tuned by:

    spack config edit compilers    

```
$ cat .spack/packages.yaml
packages:
    all:
        compiler: [gcc@6.4.0]
```

## Using a different install tree

This is done by putting `config.yaml` to `.spack`:

    cat .spack/config.yaml
    config:
        install_tree: /sw/exp9
        module_roots:
            tcl:    /sw/exp9/spack/modules
            lmod:   /sw/exp9/spack/lmod

Check  what compilers you are using manually

    cat .spack/linux/compilers.yaml

## Specify Dependencies

I want protobuf to use existing setup of cmake, gcc;

    spack install protobuf ^cmake@3.9.2 %gcc@6.4.0

## Check what compilers are available

    spack compilers

Assume you have loaded new modules (gcc)
will auto detect new compilers in the path

    spack compiler add

To check details on the compilers configured:

    spack config edit compilers

To install a package with particular compiler

    spack install protobuf %gcc@6.3.1

This is to install protobuf using gcc 6.3.1

## Create packages that are not in spack repo

There is a [discussion](https://spack.readthedocs.io/en/latest/repositories.html) on maintaining separate repo for Spack.

For the packages I am maintaining:
    
    git clone git@github.com:fwang2/olcf-spack

The repo must have `repo.yaml` and a directory named `packages`:

    repo:
        namespace: 'fwang2'

Now you can add this repo to spack:

    spack repo add $HOME/olcf-spack/myrepo

Once this is done, you can create a package by:

    spack create https://github.com/fwang2/pi/archive/v0.1-alpha.tar.gz

And this package will be created under `olcf-spack/myrepo/packages` directory instead of the default place.

After some fix, we can now install by:

    spack install pi

or clean up by:

    spack clean -a pi

or uninstall by:

    spack uninstall -ay pi

## Leverage existing packages

This is accomplished through `packages.yaml`. For example:


    packages:
    # Core externals
    cmake:
        buildable: false
        modules:
        cmake@3.9.2: cmake/3.9.2
        cmake@3.6.1: cmake/3.6.1

    go:
        buildable: false
        modules:
        go@1.11: go/1.11

## Make the Spack module loadable

The [module](https://spack-tutorial.readthedocs.io/en/latest/tutorial_modules.html) discussion can be found here:

Add to the module search:

    module use /sw/exp9/spack/modules/[linux-rhel7-sandybridge]

You can be more specific about the target:

    module load pi-0.1-alpha3-gcc-4.8.5-dfenpn7

This is a bit verbose.

I have put in the following in the `.spack/modules.yaml` file:

    modules:
    tcl:
        hash_length: 0
        naming_scheme: '{name}/{version}'

in for a shorter and more readable name.




