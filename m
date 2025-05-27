Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16AF248886
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357905; cv=none; b=hWX+V2K2XwMQor9hoFr7ZIUQw4afvHlR27PEs4glhpJUd9MMN3K+sJGy+XyC97MY+2tlbYyIvV3TF3UYxHbA2pjn1MDcAS4ZMPD9uSUujQLXT626dz3xNVRjD6whD74aQZ9LOfgCpkXUAckxdrr0k5qYZX1WzCTJCxv+KOcXZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357905; c=relaxed/simple;
	bh=5KZ01cXmZZIAaYImWDvgsbkwoDslnM3yMqZ9dLsYJ4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUGxfYzcDciujYNjVbBZ4UrvKOlFfdBCL0pFM/rS1fc5Xc0ZesiRuilrOIPCnCWrczQ3TjSv5Sz5X4LqRkNX8k2+3o67UT9+9rXN354dUtDtVy7OVEGsShi5XUuIGJ7fDslY4Es8aXd0AcYjirLr95ABXwGXBQI96hnCDUcvmr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=J+OchjSh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="J+OchjSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1748357895;
	bh=5KZ01cXmZZIAaYImWDvgsbkwoDslnM3yMqZ9dLsYJ4U=;
	h=Date:From:To:Cc:Subject:From;
	b=J+OchjSh/1mTBga4GEWVfpMgQ7Pmfix2AqVk8soXlGp4RVmIL2Bljzswm9BFzlZC9
	 XHseSji9MH2pnVUP8tJ44HKAFQ3+Vsn+ncgCsDFAM8xRu0XXi7nr8uKmlykG5/bDhJ
	 X3sFCgyHPOhwOeMhuBQM7ZCe8O2zleY2FP/zjsWM=
Date: Tue, 27 May 2025 16:58:14 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] nolibc updates for v6.16-rc1
Message-ID: <3d0f7e83-7d64-41cb-9909-9d84406d8f2e@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/ tags/nolibc-20250526-for-6.16-1

for you to fetch changes up to 869c788909b93a78ead1ca28c42b95eeb0779215:

  selftests: harness: Stop using setjmp()/longjmp() (2025-05-21 15:32:37 +0200)

This is the first pull coming directly from the nolibc maintainers.
Previous pulls where prepared by Shuah and Paul, many thanks to them.

----------------------------------------------------------------
nolibc changes for v6.16

Highlights:

* New supported architectures: m68k, SPARC (32 and 64 bit)
* Compatibility with kselftest_harness.h
* A more robust mechanism to include all of nolibc from each header
* Split existing features into new headers to simplify adoption
* Compatibility with UBSAN and it is used in the testsuite
* Many small new features focussing on usage in kselftests

----------------------------------------------------------------
Daniel Palmer (1):
      tools/nolibc: Add m68k support

Jemmy Wong (1):
      tools/nolibc/types.h: fix mismatched parenthesis in minor()

Thomas Weißschuh (81):
      selftests/nolibc: drop unnecessary sys/io.h include
      selftests/nolibc: drop dependency from sysroot to defconfig
      selftests/nolibc: only consider XARCH for CFLAGS when requested
      tools/nolibc: Add support for SPARC
      tools/nolibc: drop manual stack pointer alignment
      tools/nolibc: add __nolibc_has_feature()
      tools/nolibc: add __nolibc_aligned() and __nolibc_aligned_as()
      tools/nolibc: disable function sanitizer for _start_c()
      tools/nolibc: properly align dirent buffer
      tools/nolibc: fix integer overflow in i{64,}toa_r() and
      selftests/nolibc: disable ubsan for smash_stack()
      selftests/nolibc: enable UBSAN if available
      tools/nolibc: prepare for headers in subdirectories
      tools/nolibc: add elf.h
      tools/nolibc: move open() and friends to fcntl.h
      tools/nolibc: move getauxval() to sys/auxv.h
      tools/nolibc: move mmap() and friends to sys/mman.h
      tools/nolibc: move stat() and friends to sys/stat.h
      tools/nolibc: move syscall() to sys/syscall.h
      tools/nolibc: move gettimeofday() to sys/time.h
      tools/nolibc: add sys/types.h shim
      tools/nolibc: move wait() and friends to sys/wait.h
      tools/nolibc: handle intmax_t/uintmax_t in printf
      tools/nolibc: use intmax definitions from compiler
      tools/nolibc: use pselect6_time64 if available
      tools/nolibc: use ppoll_time64 if available
      tools/nolibc: add tolower() and toupper()
      tools/nolibc: add _exit()
      tools/nolibc: add setpgrp()
      tools/nolibc: implement waitpid() in terms of waitid()
      Revert "selftests/nolibc: use waitid() over waitpid()"
      tools/nolibc: add dprintf() and vdprintf()
      tools/nolibc: add getopt()
      tools/nolibc: allow different write callbacks in printf
      tools/nolibc: allow limiting of printf destination size
      tools/nolibc: add snprintf() and friends
      selftests/nolibc: use snprintf() for printf tests
      selftests/nolibc: rename vfprintf test suite
      selftests/nolibc: add test for snprintf() truncation
      tools/nolibc: implement width padding in printf()
      tools/nolibc: add target to check header usability
      tools/nolibc: include nolibc.h early from all header files
      selftests/nolibc: always run nolibc header check
      tools/nolibc: move poll() to poll.h
      tools/nolibc: use poll-related definitions from UAPI headers
      tools/nolibc: add strstr()
      tools/nolibc: add %m printf format
      tools/nolibc: add more stat() variants
      tools/nolibc: add mremap()
      tools/nolibc: add getrandom()
      tools/nolibc: add abs() and friends
      tools/nolibc: add support for access() and faccessat()
      tools/nolibc: add clock_getres(), clock_gettime() and clock_settime()
      tools/nolibc: add timer functions
      tools/nolibc: add timerfd functionality
      tools/nolibc: add difftime()
      tools/nolibc: add namespace functionality
      tools/nolibc: add fopen()
      tools/nolibc: fall back to sys_clock_gettime() in gettimeofday()
      tools/nolibc: implement wait() in terms of waitpid()
      tools/nolibc: move ioctl() to sys/ioctl.h
      tools/nolibc: move mount() to sys/mount.h
      tools/nolibc: move prctl() to sys/prctl.h
      tools/nolibc: move reboot() to sys/reboot.h
      tools/nolibc: move getrlimit() and friends to sys/resource.h
      tools/nolibc: move makedev() and friends to sys/sysmacros.h
      tools/nolibc: move uname() and friends to sys/utsname.h
      tools/nolibc: move NULL and offsetof() to sys/stddef.h
      selftests/nolibc: drop include guards around standard headers
      selftests: harness: Add kselftest harness selftest
      selftests: harness: Use C89 comment style
      selftests: harness: Ignore unused variant argument warning
      selftests: harness: Mark functions without prototypes static
      selftests: harness: Remove inline qualifier for wrappers
      selftests: harness: Remove dependency on libatomic
      selftests: harness: Implement test timeouts through pidfd
      selftests: harness: Don't set setup_completed for fixtureless tests
      selftests: harness: Move teardown conditional into test metadata
      selftests: harness: Add teardown callback to test metadata
      selftests: harness: Add "variant" and "self" to test metadata
      selftests: harness: Stop using setjmp()/longjmp()

 MAINTAINERS                                        |   1 +
 tools/include/nolibc/Makefile                      |  34 +-
 tools/include/nolibc/arch-aarch64.h                |   1 -
 tools/include/nolibc/arch-arm.h                    |   2 -
 tools/include/nolibc/arch-i386.h                   |   2 -
 tools/include/nolibc/arch-loongarch.h              |   7 -
 tools/include/nolibc/arch-m68k.h                   | 141 +++++++
 tools/include/nolibc/arch-powerpc.h                |   2 -
 tools/include/nolibc/arch-riscv.h                  |   1 -
 tools/include/nolibc/arch-sparc.h                  | 191 ++++++++++
 tools/include/nolibc/arch-x86_64.h                 |   1 -
 tools/include/nolibc/arch.h                        |   4 +
 tools/include/nolibc/compiler.h                    |   9 +
 tools/include/nolibc/crt.h                         |   5 +
 tools/include/nolibc/ctype.h                       |   6 +-
 tools/include/nolibc/dirent.h                      |  10 +-
 tools/include/nolibc/elf.h                         |  15 +
 tools/include/nolibc/errno.h                       |   6 +-
 tools/include/nolibc/fcntl.h                       |  69 ++++
 tools/include/nolibc/getopt.h                      | 101 +++++
 tools/include/nolibc/math.h                        |  31 ++
 tools/include/nolibc/nolibc.h                      |  21 +
 tools/include/nolibc/poll.h                        |  55 +++
 tools/include/nolibc/sched.h                       |  50 +++
 tools/include/nolibc/signal.h                      |   6 +-
 tools/include/nolibc/std.h                         |   6 +-
 tools/include/nolibc/stddef.h                      |  24 ++
 tools/include/nolibc/stdint.h                      |   4 +-
 tools/include/nolibc/stdio.h                       | 167 +++++++-
 tools/include/nolibc/stdlib.h                      |  54 ++-
 tools/include/nolibc/string.h                      |  40 +-
 tools/include/nolibc/sys.h                         | 423 ++-------------------
 tools/include/nolibc/sys/auxv.h                    |  41 ++
 tools/include/nolibc/sys/ioctl.h                   |  29 ++
 tools/include/nolibc/sys/mman.h                    |  82 ++++
 tools/include/nolibc/sys/mount.h                   |  37 ++
 tools/include/nolibc/sys/prctl.h                   |  36 ++
 tools/include/nolibc/sys/random.h                  |  34 ++
 tools/include/nolibc/sys/reboot.h                  |  34 ++
 tools/include/nolibc/sys/resource.h                |  53 +++
 tools/include/nolibc/sys/stat.h                    |  94 +++++
 tools/include/nolibc/sys/syscall.h                 |  19 +
 tools/include/nolibc/sys/sysmacros.h               |  20 +
 tools/include/nolibc/sys/time.h                    |  49 +++
 tools/include/nolibc/sys/timerfd.h                 |  87 +++++
 tools/include/nolibc/sys/types.h                   |   7 +
 tools/include/nolibc/sys/utsname.h                 |  42 ++
 tools/include/nolibc/sys/wait.h                    | 116 ++++++
 tools/include/nolibc/time.h                        | 189 ++++++++-
 tools/include/nolibc/types.h                       |  32 +-
 tools/include/nolibc/unistd.h                      |  40 +-
 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/kselftest_harness.h        | 170 ++++-----
 .../testing/selftests/kselftest_harness/.gitignore |   2 +
 tools/testing/selftests/kselftest_harness/Makefile |   7 +
 .../selftests/kselftest_harness/harness-selftest.c | 136 +++++++
 .../kselftest_harness/harness-selftest.expected    |  64 ++++
 .../kselftest_harness/harness-selftest.sh          |  13 +
 tools/testing/selftests/nolibc/Makefile            |  28 +-
 .../testing/selftests/nolibc/nolibc-test-linkage.c |   2 -
 tools/testing/selftests/nolibc/nolibc-test.c       | 331 +++++++++++++---
 tools/testing/selftests/nolibc/run-tests.sh        |   7 +
 62 files changed, 2629 insertions(+), 662 deletions(-)
 create mode 100644 tools/include/nolibc/arch-m68k.h
 create mode 100644 tools/include/nolibc/arch-sparc.h
 create mode 100644 tools/include/nolibc/elf.h
 create mode 100644 tools/include/nolibc/fcntl.h
 create mode 100644 tools/include/nolibc/getopt.h
 create mode 100644 tools/include/nolibc/math.h
 create mode 100644 tools/include/nolibc/poll.h
 create mode 100644 tools/include/nolibc/sched.h
 create mode 100644 tools/include/nolibc/stddef.h
 create mode 100644 tools/include/nolibc/sys/auxv.h
 create mode 100644 tools/include/nolibc/sys/ioctl.h
 create mode 100644 tools/include/nolibc/sys/mman.h
 create mode 100644 tools/include/nolibc/sys/mount.h
 create mode 100644 tools/include/nolibc/sys/prctl.h
 create mode 100644 tools/include/nolibc/sys/random.h
 create mode 100644 tools/include/nolibc/sys/reboot.h
 create mode 100644 tools/include/nolibc/sys/resource.h
 create mode 100644 tools/include/nolibc/sys/stat.h
 create mode 100644 tools/include/nolibc/sys/syscall.h
 create mode 100644 tools/include/nolibc/sys/sysmacros.h
 create mode 100644 tools/include/nolibc/sys/time.h
 create mode 100644 tools/include/nolibc/sys/timerfd.h
 create mode 100644 tools/include/nolibc/sys/types.h
 create mode 100644 tools/include/nolibc/sys/utsname.h
 create mode 100644 tools/include/nolibc/sys/wait.h
 create mode 100644 tools/testing/selftests/kselftest_harness/.gitignore
 create mode 100644 tools/testing/selftests/kselftest_harness/Makefile
 create mode 100644 tools/testing/selftests/kselftest_harness/harness-selftest.c
 create mode 100644 tools/testing/selftests/kselftest_harness/harness-selftest.expected
 create mode 100755 tools/testing/selftests/kselftest_harness/harness-selftest.sh
