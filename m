Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653027CB1B;
	Tue, 27 May 2025 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748361711; cv=none; b=dYp2ihAJUR6hsnwkDbJZRAZtzqvJ/P4l4sWexV5Rw+X9YPhqeYMN3AVB5Am8wU7F3+spxyMayheBt1jDHnloVPOIBOqwArk5ic4dONZ4nnfaaOxSyUU10x29nFck+7LkPFFwqCbEF0ppj+Fl5i4NdpmUrEtvwJkiJWbkZ5dMwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748361711; c=relaxed/simple;
	bh=YH9Fkz19mxcXaLduAFWSntweDCd8oWNMPNq36I/C72A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l/SkV0Y1aCptLojiDfiXCHXpmjm5Dyb5HbM4G6pvrWomvhWJlPJXDXSiOVtUpIzO8LRn88peoSM+Mka4FlRiYJyPdZHbSAz0FZtPNCPKf4gyg8F+g+x4UegI7UjD6gDHhO1315h9L/f2NmvK7Nv3/REcOrQMDqnT4nCXDUAemVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Kfzm+LhA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Kfzm+LhA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8353041ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748361702; bh=fs603I8L+okV6LYmoErK+A++No19E2z15aG40G7A/oU=;
	h=From:To:Cc:Subject:Date:From;
	b=Kfzm+LhAsyqy1ImjHltioMhRebqw8J2L7THI49rO8h0GBkTfhOL+5ZIOrzZZfg5uJ
	 hnjA4F/+TnOccqX3XGnlT3em+WRn719xSSJRy9j/TKPivlpDlI0tOzYtOwdF4/wBtD
	 ANjN1cqqh11uJQWdbQZLG3Til6rHj/x+QHGlC+JXZuyE5cJ8SZFYTTol2RzYQbQSay
	 1nW3rA8QpELY+sEidl7RO5pV0UVN81Q59pMLDzCV74firgI0ctlZ+ApzFEZXY6tqec
	 i9WDuvUBokl4LQuSPrEDnmd+rmB34+bt2DIWAVviiU6P3/jO33vyUFSEtgKcmuXZri
	 haEs5Lx8MPAQw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8353041ED2;
	Tue, 27 May 2025 16:01:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation for 6.16
Date: Tue, 27 May 2025 10:01:41 -0600
Message-ID: <87bjrekpp6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-6.16

for you to fetch changes up to d6d886005d32e4380cee3d1095908875505ac2c6:

  Docs: doc-guide: update sphinx.rst Sphinx version number (2025-05-21 04:2=
8:29 -0600)

----------------------------------------------------------------
A moderately busy cycle for documentation this time around:

- The most significant change is the replacement of the old kernel-doc
  script (a monstrous collection of Perl regexes that predates the Git era)
  with a Python reimplementation.  That, too, is a horrifying collection of
  regexes, but in a much cleaner and more maintainable structure that
  integrates far better with the Sphinx build system.

  This change has been in linux-next for the full 6.15 cycle; the small
  number of problems that turned up have been addressed, seemingly to
  everybody's satisfaction.  The Perl kernel-doc script remains in tree (as
  scripts/kernel-doc.pl) and can be used with a command-line option if need
  be.  Unless some reason to keep it around materializes, it will probably
  go away in 6.17.

  Credit goes to Mauro Carvalho Chehab for doing all this work.

- Some RTLA documentation updates

- A handful of Chinese translations

- The usual collection of typo fixes, general updates, etc.

----------------------------------------------------------------
Adrian B=C3=BCtler (1):
      Documentation: x86: Fix a typo in fsgs.rst

Akira Yokosawa (1):
      docs: Makefile: Inherit PYTHONPYCACHEPREFIX setting as env variable

Alexander Shatalin (1):
      docs: fix typo in firmware-related section

Ammar Askar (1):
      docs: Fix conflicting contributor identity info

Andres Urian Florez (1):
      docs/sp_SP: fix links to mailing list services

Anish Dabhane (1):
      Fix spelling error for 'parallel'

Bagas Sanjaya (2):
      Documentation: ioctl-number: Update outdated submission info
      Documentation: ioctl-number: Update table intro

Chih Yun Lin (1):
      docs: hid: Fix typo in intel-thc-hid.rst

Cui Wei (1):
      Documentation: fix speculation.rst chapter

Hendrik Hamerlinck (1):
      docs: fix "incase" typo in coresight/panic.rst

James Addison (1):
      docs: Disambiguate a pair of rST labels

Jean-Michel Hautbois (1):
      Documentation: leds: improve readibility of multicolor doc

Jesung Yang (1):
      docs: align with scripts/syscall.tbl migration

Joel Savitz (1):
      docs: namespace: Tweak and reword resource control doc

Jonathan Corbet (2):
      Merge branch 'mauro' into docs-mw
      Merge tag 'Chinese-doc-6.16-rc1' of gitolite.kernel.org:pub/scm/linux=
/kernel/git/alexs/linux into docs-mw

Kendra Moore (1):
      docs: dmaengine: add explanation for DMA_ASYNC_TX capability

Kevin Paul Reddy Janagari (1):
      Added usb_string function to a namespace

Madadi Vineeth Reddy (1):
      Documentation/scheduler: Fix typo in sched-stats domain field descrip=
tion

Mauro Carvalho Chehab (48):
      scripts/kernel-doc: rename it to scripts/kernel-doc.pl
      scripts/kernel-doc: add a symlink to the Perl version of kernel-doc
      scripts/kernel-doc.py: add a Python parser
      scripts/kernel-doc.py: output warnings the same way as kerneldoc
      scripts/kernel-doc.py: better handle empty sections
      scripts/kernel-doc.py: properly handle struct_group macros
      scripts/kernel-doc.py: move regex methods to a separate file
      scripts/kernel-doc.py: move KernelDoc class to a separate file
      scripts/kernel-doc.py: move KernelFiles class to a separate file
      scripts/kernel-doc.py: move output classes to a separate file
      scripts/kernel-doc.py: convert message output to an interactor
      scripts/kernel-doc.py: move file lists to the parser function
      scripts/kernel-doc.py: implement support for -no-doc-sections
      scripts/kernel-doc.py: fix line number output
      scripts/kernel-doc.py: fix handling of doc output check
      scripts/kernel-doc.py: properly handle out_section for ReST
      scripts/kernel-doc.py: postpone warnings to the output plugin
      docs: add a .pylintrc file with sys path for docs scripts
      docs: sphinx: kerneldoc: verbose kernel-doc command if V=3D1
      docs: sphinx: kerneldoc: ignore "\" characters from options
      docs: sphinx: kerneldoc: use kernel-doc.py script
      scripts/kernel-doc.py: Set an output format for --none
      scripts/kernel-doc.py: adjust some coding style issues
      scripts/lib/kdoc/kdoc_parser.py: fix Python compat with < v3.13
      scripts/kernel-doc.py: move modulename to man class
      scripts/kernel-doc.py: properly handle KBUILD_BUILD_TIMESTAMP
      scripts/lib/kdoc/kdoc_parser.py: remove a python 3.9 dependency
      scripts/kernel-doc.py: Properly handle Werror and exit codes
      scripts/kernel-doc: switch to use kernel-doc.py
      scripts/lib/kdoc/kdoc_files.py: allow filtering output per fname
      scripts/kernel_doc.py: better handle exported symbols
      scripts/kernel-doc.py: Rename the kernel doc Re class to KernRe
      scripts/lib/kdoc/kdoc_files.py: don't try to join None
      scripts/lib/kdoc/kdoc_parser.py: move states to a separate class
      scripts:kdoc_files.py: use glob for export_file seek
      docs: sphinx: kerneldoc: Use python class if available
      docs: Makefile: get rid of KERNELDOC_CONF env variable
      Makefile: move KERNELDOC macro to the main Makefile
      scripts/kernel-doc.py: don't create *.pyc files
      .gitignore: ignore Python compiled bytecode
      docs: Sphinx: kerneldoc: only initialize kernel-doc classes once
      scripts/lib/kdoc: change mode to 0644
      scripts/lib/kdoc/kdoc_parser.py: move kernel entry to a class
      docs: Makefile: store __pycache__ at the output directory
      docs: conf.py: drop backward support for old Sphinx versions
      MAINTAINERS: update linux-doc entry to cover new Python scripts
      docs: kerneldoc.py: simplify exception handling logic
      scripts: kernel-doc: prevent a KeyError when checking output

N=C3=ADcolas F. R. A. Prado (1):
      docs: automarkup: Move common logic to add and resolve xref to helper

Purva Yeshi (2):
      Documentation: trace: Reduce toctree depth
      Documentation: trace: Refactor toctree

Randy Dunlap (5):
      cpufreq: editing corrections to cpufreq.rst
      Docs: relay: editing cleanups
      Docs: driver-api/basics: add kobject_event interfaces
      docs: doc-guide: clarify latest theme usage
      Docs: doc-guide: update sphinx.rst Sphinx version number

Sean Anderson (1):
      scripts: kernel-doc: fix parsing function-like typedefs (again)

Shivam Sharma (1):
      docs: admin-guide: fix typos in reporting-issues.rst

Tomas Glozar (4):
      Documentation/rtla: Fix duplicate text about timerlat tracer
      Documentation/rtla: Fix typo in rtla-timerlat.rst
      Documentation/rtla: Fix typo in common_timerlat_description.rst
      Documentation/rtla: Include BPF sample collection

Utkarsh Tiwari (1):
      Documentation: NTB: Fix typo

Wang Yaxin (2):
      Docs/zh_CN: Translate index.rst to Simplified Chinese
      Docs/zh_CN: Translate msg_zerocopy.rst to Simplified Chinese

Yanteng Si (2):
      docs/zh_CN: Add how-to of Chinese translation
      MAINTAINERS: Change Yanteng's email address

 .gitignore                                         |    1 +
 .pylintrc                                          |    2 +
 Documentation/Makefile                             |    9 +-
 .../admin-guide/namespaces/resource-control.rst    |   24 +-
 Documentation/admin-guide/pm/cpufreq.rst           |    8 +-
 .../admin-guide/quickly-build-trimmed-linux.rst    |    4 +-
 Documentation/admin-guide/reporting-issues.rst     |    6 +-
 .../verify-bugs-and-bisect-regressions.rst         |    4 +-
 Documentation/arch/x86/x86_64/fsgs.rst             |    2 +-
 Documentation/conf.py                              |  164 +-
 Documentation/doc-guide/sphinx.rst                 |   14 +-
 Documentation/driver-api/basics.rst                |    3 +
 Documentation/driver-api/dmaengine/provider.rst    |    8 +-
 Documentation/driver-api/ntb.rst                   |    2 +-
 Documentation/driver-api/usb/usb.rst               |    1 +
 Documentation/filesystems/relay.rst                |   26 +-
 Documentation/gpu/rfc/i915_scheduler.rst           |    2 +-
 Documentation/hid/intel-thc-hid.rst                |    8 +-
 Documentation/index.rst                            |    2 +-
 Documentation/leds/leds-class-multicolor.rst       |   82 +-
 Documentation/process/1.Intro.rst                  |   12 +-
 Documentation/process/adding-syscalls.rst          |   84 +
 Documentation/scheduler/sched-stats.rst            |    2 +-
 Documentation/sphinx/automarkup.py                 |   97 +-
 Documentation/sphinx/kerneldoc.py                  |  219 +-
 Documentation/staging/speculation.rst              |    1 -
 .../tools/rtla/common_timerlat_description.rst     |   10 +-
 Documentation/tools/rtla/rtla-timerlat.rst         |    9 +-
 Documentation/trace/coresight/panic.rst            |    4 +-
 Documentation/trace/index.rst                      |   98 +-
 .../translations/sp_SP/process/2.Process.rst       |   11 +-
 Documentation/translations/sp_SP/process/howto.rst |   10 +-
 .../translations/sp_SP/process/kernel-docs.rst     |    5 +-
 .../sp_SP/process/submitting-patches.rst           |   13 +-
 Documentation/translations/zh_CN/how-to.rst        |  459 ++++
 Documentation/translations/zh_CN/index.rst         |   24 +-
 .../translations/zh_CN/networking/index.rst        |  160 ++
 .../translations/zh_CN/networking/msg_zerocopy.rst |  223 ++
 Documentation/userspace-api/ioctl/ioctl-number.rst |   13 +-
 MAINTAINERS                                        |    7 +-
 Makefile                                           |    5 +
 drivers/gpu/drm/Makefile                           |    2 +-
 drivers/gpu/drm/i915/Makefile                      |    2 +-
 include/drm/Makefile                               |    2 +-
 scripts/Makefile.build                             |    2 +-
 scripts/find-unused-docs.sh                        |    2 +-
 scripts/kernel-doc                                 | 2440 +---------------=
----
 scripts/kernel-doc.pl                              | 2439 ++++++++++++++++=
+++
 scripts/kernel-doc.py                              |  315 +++
 scripts/lib/kdoc/kdoc_files.py                     |  291 +++
 scripts/lib/kdoc/kdoc_output.py                    |  793 +++++++
 scripts/lib/kdoc/kdoc_parser.py                    | 1745 ++++++++++++++
 scripts/lib/kdoc/kdoc_re.py                        |  273 +++
 tools/tracing/rtla/README.txt                      |    7 +
 54 files changed, 7336 insertions(+), 2815 deletions(-)
 create mode 100644 .pylintrc
 create mode 100644 Documentation/translations/zh_CN/how-to.rst
 create mode 100644 Documentation/translations/zh_CN/networking/index.rst
 create mode 100644 Documentation/translations/zh_CN/networking/msg_zerocop=
y.rst
 mode change 100755 =3D> 120000 scripts/kernel-doc
 create mode 100755 scripts/kernel-doc.pl
 create mode 100755 scripts/kernel-doc.py
 create mode 100644 scripts/lib/kdoc/kdoc_files.py
 create mode 100644 scripts/lib/kdoc/kdoc_output.py
 create mode 100644 scripts/lib/kdoc/kdoc_parser.py
 create mode 100644 scripts/lib/kdoc/kdoc_re.py
