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

    \item{Download}{

    Executablle files for macOS, Windows and Linux are available here:
    https://github.com/lisitsyn/tapkee/releases/tag/1.2

    }}}

\section{Specific instructions for Linux}{
  \describe{

    \item{Downloaded binary: }{

    Linux binary is a 64 bit version which works on Ubuntu 16.04 LTS and
    likely will work on other systems. Depends on `ldd tapkee`, install
    dependencies (you might need to install at least "libarpack2"). Copy
    'tapkee' binary to where system will find it (`echo $PATH`).

    }}}

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

    If you see the list of 'tapkee' options, everything is OK. If not,
    you need to check (4) and (5).

    }

    \item{4)}{If you have the message similar to:

    $ dyld: Library not loaded: ...

    install eigen and arpack with Homebrew (install Homebrew first,
    google how to do it):

    $ brew install arpack && brew install eigen

    then run

    $ tapkee -h

    again.

    }

    \item{5)}{You might also run:

    $ echo $DYLD_LIBRARY_PATH

    to see where installed libraries should be located.

    }}}

\section{Specific instructions for Windows}{

  \describe{

    \item{1)}{Download the 'tapkee-win.exe' executable which works under
    Windows 10. Please also make sure that you installed "Microsoft
    Visual C++ Redistributable 32-bit" (google the name to obtain link)
    to get required DLLs.

    }

    \item{2)}{Find where did you place the executable file. Open command
    prompt and direct it to this folder, for example (if the
    'tapkee-win.exe' is in "C:\\Users\\Me\\Downloads" directory):

    > c:
    > cd "C:\\Users\\Me\\Downloads"

    Then check is the executable works. Type

    > tapkee-win.exe -h

    Long message with options should appear. If not, you are either not
    in the proper place (double check where is executable file and then
    "cd" to there), or there are some other problems (e.g., required DLLs
    are not installed properly).

    Next, find the place where to install 'tapkee-win.exe'. Best is to
    start the command prompt window and run there:

    > echo %PATH%

    Install the executable (and change its name to just 'tapkee.exe')
    into one of folders which are in the list. For example, if "C:\\Some
    dir" is in the list (entries there are separated with semicolon),
    run:

    > copy tapkee-win.exe "C:\\Some dir\\tapkee.exe"

    You might also try to install everything in the R working folder (to
    find it, run 'getwd()' inside R) but this is less usable.

    }

    \item{3)}{Now open new command prompt window and run:

    > tapkee -h

    If you see the list of 'tapkee' options, everything is OK. If not,
    you need to check (1) and (2) again.

    }}}
