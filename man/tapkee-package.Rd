\name{tapkee-package}
\alias{tapkee-package}
\docType{package}

\title{'tapkee' command line utility installation}

\description{
  Here is the description of how to install 'tapkee' utility on different
  operation systems.
}

\section{General instructions}{
  \describe{
    \item{Download}{Executablle files for macOS, Windows and Linux are available here:
    https://github.com/lisitsyn/tapkee/releases/tag/1.2}
    }}

\section{Specific instructions for Linux}{
  \describe{
    \item{Downloaded binary}{This is a 64 bit version, works on Ubuntu 16.04 LTS and likely will work on other systems.
    Depends on `ldd tapkee`, install dependencies (you might need to install at least "libarpack2").
    Copy 'tapkee' binary to where system will find it (`echo $PATH`).}
    }}

\section{Specific instructions for macOS}{
  \describe{
    \item{1)}{In Terminal.app, run:

    $ echo $PATH

    }

    \item{2)}{Copy 'tapkee' into one of mentioned directories, e.g.:

    $ cp tapkee /usr/local/bin

    }

    \item{3)}{Run:

    $ tapkee -h

    If you see the list of 'tapkee' options, everything is OK.
    If not, you need to check (4) and (5).
    }

    \item{4)}{If you have the message similar to:

    $ dyld: Library not loaded: ...

    install eigen and arpack with Homebrew (install Homebrew first, google how to do it):

    $ brew install arpack && brew install eigen

    then run

    $ tapkee -h

    again.
    }

    \item{5)}{You might also run:

    $ echo \$DYLD_LIBRARY_PATH

    to see where insdtalled libraries should be located.
    }}}

\section{Specific instructions for Windows}{
  \describe{
    \item{1)}{The executable supplied works under Windows 10.
    Install Microsoft Visual C++ Redistributable 32-bit (google the link) to get required DLLs.
    }

    \item{2)}{Find the place where to install 'tapkee.exe' and DLLs.
    Best is to start the command prompt window and run:

    > path

    Install into one of folders which are in the list.
    You might also try to install everything in the current folder
    (to find it, run in R 'getwd()') but this is less usable.
    }

    \item{3)}{Now open command prompt window in some other place, and run:

    > tapkee.exe -h

    If you see the list of 'tapkee' options, everything is OK.
    If not, you need to check (1) and (2) again.
    }}}
