# Tetris

This project is a port of [S1M0N38's Tetris C++ Project](https://github.com/S1M0N38/tetris/blob/master/src/main.cpp).
It was originally written in C++ and I ported it to CPP2/cppfront.

The original project is MIT licensed, and so is this one.

## A cautionary tale

This project, currently, does not compile.
cppfront is still in development, and it is not yet ready for production, and it ***shows***.
But until the diagnostic messages gets better, I can't really go further.

Things that are broken:

- `for..do` loops can't have a `return` statement. So no early returns. Sigh.
- Most errors are reported as `ill-formed initializer (at '{')`. Absolutely atrocious.
- No traditional `for` loops. Either `while` loops (with an ugly syntax) or `for..do` loops (with the `return` issue).
- btw, `for..do` loops are actually range-based for loops, I hope you like `std::views::iota`.
- btw again, `std::views::iota` only works on increasing ranges in steps of 1. No descending ranges, no custom steps. (Admittedly, this is a C++20 issue, but still)

What I like, or what I'm hopeful about:

- UFCS is a *great*. Working with C APIs (like ncurses) is so much easier. So much more readable.
- Use of C++20 modules. It's the future of C++, and it's better that way
- It's not *pretty* but at least it's *consistent*: The fact that `x: y = z` always means `X is of type Y and is equal to Z`. And the fact that methods follow a similar way of thinking make it easy to *reason* around the code.
- Source compatibility with C++ code. Using C++ code inside CPP2 code is relatively painless.
- Sane default (?). Haven't hit it yet, but working with the heap is (supposedly) easy, by defaulting to make_unique.

## How to build

You will need the cppfront compiler, available on [Herb Sutter's GitHub repository](https://github.com/hsutter/cppfront/).
You will also need a C++20 compliant (as required by cppfront) compiler, and GNU Make.

You can `make` the project in the `src` directory.

If you are a fancy [Nix](https://nixos.org/) user and you have flakes enabled, you can just `nix build`

## Why?

Two reasons:

1. I wanted to learn how to use cppfront
2. I wanted to learn how to use the C++20 modules

### cppfront

No better way to learn a new language to actually use it.
This project was simple enough to be a good learning experience.
Also, the fact that cppfront is source compatible with C++20 made it easy to do incremental changes.

### C++20 modules

Even if cppfront doesn't catch on, C++20 modules are here to stay.
So might as well learn how to use them.
