# Server toolkit

This is a low-tech orchestration toolkit for plopping on top of Alpine
instances that are meant to act a HTTP frontends. The stack for that is
Varnish with Nginx used for TLS termination.

## Usage

Run `./transfer.py` to copy over all of the files. After doing so, it is
strongly recommended to run `permiss` at least once to fix permissions.

Run `./setup.sh` to install the cronjobs via symlink. Once this is done,
`permiss`, `sentry` and `varnish-prop` will get run automatically.

## Licencing

The server toolkit is licenced under the following terms:

-----

Artisan Software Licence, version 1.1.

Copyright &copy; 2025 Aquefir Consulting LLC. All rights reserved.

Redistribution and use in source and binary forms are permitted,
provided that ***all*** of the following conditions are met:

1. Derivative works of the source code cannot be distributed unless
   either:
	1. express written consent has been given by the copyright
	   holder(s) to
	   do so, ***or***
	2. all modifications are given solely in the form of
	   &ldquo;patch&rdquo;
	   files that modify the original source code to produce the
	   derivative work;
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
&ldquo;AS IS&rdquo; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
