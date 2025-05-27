Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBD6BA38
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316332; cv=none; b=nMYRK3QnrT6+Rqi0Excwii/Eh1VMwGy/KgKbJHFj3+C+lvWvzY75nWTAjNjgd6NjCWyE5/ImIWEcl+Gm46F/xriW7bRUhD3XzbUONV9ECoNyAot6LXAcQQqireWRVwkKtTTH3WsCCTi76ElOCtRuYhlymMWeKUmLKSrB54iU2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316332; c=relaxed/simple;
	bh=cLLpe3vDmcLqVqDKuTUWdXtdgFKHKU2FDg38BtlCZhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bue2vTTLT7wE5z60XrWoEE5v2KTkmBMEUvgBdSMP22N4xZQsD8aw9ujFshqUlWSi3z4as9DW3eBFWQyQJwWC+WE6SAGj48ahIIVYr1oF/qJeOwZWwmxXSTV88MKP3nwCcdPCwvV+FMj3c0R0f1AwcRG6XJA4I/igj2aAGD/P4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPoipsA5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPoipsA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9373DC4CEE7;
	Tue, 27 May 2025 03:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748316331;
	bh=cLLpe3vDmcLqVqDKuTUWdXtdgFKHKU2FDg38BtlCZhU=;
	h=Date:From:To:Cc:Subject:From;
	b=iPoipsA5q65FYxEbK8HXToTAhppPL/f8G+VbAhe9YPBNAqaCUue9i5mOju1LDKqxC
	 SOpo+C2qZdQhpoV27kGcW/xbjuXFQgl4NMZrEPgHdpzQyMZLOuYMyq4D6WSkk329rw
	 5Xbll14HBUIC2yz1vDnmvjbRRvtIqmtU2az66ISkoMBVGPIvuvw/ipLf026aV8Bobp
	 JeQNx/vfB+TgsGcZNA1PIFVwwK2roBdxMYlYPp4cWh3WQmvNEjrUNLB/7mpPrV8ulA
	 DA291aj/W1Qd2zczh8styU232tcO2YIbNLqIMEfjD8TTpvq9mlTkXRPEed7KKJeFlU
	 wcl40hSr4xXNw==
Date: Mon, 26 May 2025 20:25:28 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>, Coly Li <colyli@kernel.org>,
	David Gow <davidgow@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Harry Yoo <harry.yoo@oracle.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <n.schier@avm.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	WangYuli <wangyuli@uniontech.com>
Subject: [GIT PULL] hardening updates for v6.16-rc1
Message-ID: <202505262001.561C185@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these hardening updates for v6.16-rc1.

The randstruct GCC plugin was fixed but it uncovered a missed
randomization opportunity (that was similarly missed in Clang but has
also now been fixed there too).

There are two patches in this pull that are duplicated in other trees: 1
in netdev and 1 in watchdog. They were needed to build the hardening tree
(due to the randstruct fixes), but they were taken into their respective
trees kind of later in the dev cycle. I debated splitting up this tree
and ripping out the patches, but they're both small, and it seemed like
more trouble for both of us (2 pulls). If you'd rather have it split up,
let me know and I can resend it that way.

Another item of note is the kbuild change that will induce a full kernel
rebuild when other dependencies of the compile change (randstruct seed,
GCC plugins are rebuilt, or the Clang sanitizer .scl file content
changes). Several variations were attempted by myself and kbuild
maintainers was the version ultimately agreed to (and I carried in my
tree since it's all due to hardening features anyway).

Thanks!

-Kees

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.16-rc1

for you to fetch changes up to f0cd6012c40da99b45f8f63052b97ec89d5f307b:

  Revert "hardening: Disable GCC randstruct for COMPILE_TEST" (2025-05-08 09:42:40 -0700)

----------------------------------------------------------------
hardening updates for v6.16-rc1

- Update overflow helpers to ease refactoring of on-stack flex array
  instances (Gustavo A. R. Silva, Kees Cook)

- lkdtm: Use SLAB_NO_MERGE instead of constructors (Harry Yoo)

- Simplify CONFIG_CC_HAS_COUNTED_BY (Jan Hendrik Farr)

- Disable u64 usercopy KUnit test on 32-bit SPARC (Thomas Weiﬂschuh)

- Add missed designated initializers now exposed by fixed randstruct
  (Nathan Chancellor, Kees Cook)

- Document compilers versions for __builtin_dynamic_object_size

- Remove ARM_SSP_PER_TASK GCC plugin

- Fix GCC plugin randstruct, add selftests, and restore COMPILE_TEST
  builds

- Kbuild: induce full rebuilds when dependencies change with GCC plugins,
  the Clang sanitizer .scl file, or the randstruct seed.

- Kbuild: Switch from -Wvla to -Wvla-larger-than=1

- Correct several __nonstring uses for -Wunterminated-string-initialization

----------------------------------------------------------------
Gustavo A. R. Silva (3):
      overflow: Add STACK_FLEX_ARRAY_SIZE() helper
      kunit/overflow: Add tests for STACK_FLEX_ARRAY_SIZE() helper
      overflow: Fix direct struct member initialization in _DEFINE_FLEX()

Harry Yoo (1):
      lkdtm: use SLAB_NO_MERGE instead of an empty constructor

Jan Hendrik Farr (1):
      hardening: simplify CONFIG_CC_HAS_COUNTED_BY

Kees Cook (16):
      gcc-plugins: Remove ARM_SSP_PER_TASK plugin
      compiler_types: Identify compiler versions for __builtin_dynamic_object_size
      overflow: Clarify expectations for getting DEFINE_FLEX variable sizes
      mod_devicetable: Enlarge the maximum platform_device_id name length
      watchdog: exar: Shorten identity name to fit correctly
      input/joystick: magellan: Mark __nonstring look-up table const
      kbuild: Switch from -Wvla to -Wvla-larger-than=1
      gcc-plugins: Force full rebuild when plugins change
      randstruct: Force full rebuild when seed changes
      integer-wrap: Force full rebuild when .scl file changes
      md/bcache: Mark __nonstring look-up table
      scsi: qedf: Use designated initializer for struct qed_fcoe_cb_ops
      randstruct: gcc-plugin: Remove bogus void member
      lib/tests: Add randstruct KUnit test
      lib/tests: randstruct: Add deep function pointer layout test
      Revert "hardening: Disable GCC randstruct for COMPILE_TEST"

Nathan Chancellor (1):
      net: qede: Initialize qede_ll_ops with designated initializer

Thomas Weiﬂschuh (1):
      kunit/usercopy: Disable u64 test on 32-bit SPARC

 arch/arm/Kconfig                              |   3 +-
 init/Kconfig                                  |   9 +-
 scripts/gcc-plugins/Kconfig                   |   4 -
 lib/Kconfig.debug                             |   8 +
 security/Kconfig.hardening                    |   2 +-
 arch/arm/boot/compressed/Makefile             |   2 +-
 lib/Makefile                                  |   1 -
 lib/tests/Makefile                            |   1 +
 mm/kasan/Makefile                             |   3 +-
 scripts/basic/Makefile                        |   5 +
 scripts/gcc-plugins/Makefile                  |   4 +
 scripts/Makefile.extrawarn                    |   9 +-
 scripts/Makefile.gcc-plugins                  |   8 +-
 scripts/Makefile.lib                          |  18 ++
 scripts/Makefile.ubsan                        |   1 +
 scripts/gcc-plugins/arm_ssp_per_task_plugin.c | 107 ---------
 scripts/gcc-plugins/randomize_layout_plugin.c |  18 +-
 include/linux/compiler-version.h              |  30 +++
 include/linux/compiler_types.h                |   5 +
 include/linux/mod_devicetable.h               |   2 +-
 include/linux/overflow.h                      |  23 +-
 include/linux/vermagic.h                      |   1 -
 drivers/input/joystick/magellan.c             |   2 +-
 drivers/md/bcache/super.c                     |   3 +-
 drivers/misc/lkdtm/heap.c                     |  17 +-
 drivers/net/ethernet/qlogic/qede/qede_main.c  |   2 +-
 drivers/scsi/qedf/qedf_main.c                 |   2 +-
 drivers/watchdog/exar_wdt.c                   |   2 +-
 lib/tests/overflow_kunit.c                    |   4 +
 lib/tests/randstruct_kunit.c                  | 334 ++++++++++++++++++++++++++
 lib/tests/usercopy_kunit.c                    |   1 +
 MAINTAINERS                                   |   1 +
 32 files changed, 461 insertions(+), 171 deletions(-)
 delete mode 100644 scripts/gcc-plugins/arm_ssp_per_task_plugin.c
 create mode 100644 lib/tests/randstruct_kunit.c

-- 
Kees Cook
