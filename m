Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA883594F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537455; cv=none; b=UruuJ9ZGLYxP/imHmutgR0jCO1Su57aNsjidtN/RRvA8ApKtJzG/I3+wa67r/6giq35niDKnOuhb9DBLBoEetCN8R4B7Q4VQvWlaEyZaapI9m6BKBBJnlBXREH/jtf6mGi4BYhBQEojioH55YgKy2ujOZBQZ8Ia6esuGzG0n3VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537455; c=relaxed/simple;
	bh=NPHqjUK4I8TSG+iJyt5MsH0oXaEzwN8CszIZjsDcS0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulAg/bIkbg2cQV1d2wAVpWSaRvIKrJR7IdRJ/qBzWNTGxledQUMeAokg/E0d9hZlXgYsfGIkuLl3BOnX8RLMsYA8Q1HG2pK7DT//mqHxAdNa1PhvsusMzcHFYiov4tMusdJrnQdV1ptz0+DkI/HCElF0/D2cvIznf+2P9tug+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgsPb5xk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgsPb5xk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D4FC4CEE4;
	Tue,  1 Apr 2025 19:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743537454;
	bh=NPHqjUK4I8TSG+iJyt5MsH0oXaEzwN8CszIZjsDcS0Y=;
	h=Date:From:To:Cc:Subject:From;
	b=KgsPb5xkU/0d69jjTF5r57J47NuYEBJ37DOB/T9Vsn54hUv4DJR4dvfRPgsdBQzkJ
	 OvmPQcnFU3rPi/FrcMrPXHOh8+QzTXAByx3OfFnjDGOzHu8WB+MRoz64w9KIyYOgEW
	 72rRtzSMllklnSlXROl4/v1BrOB4pEhCdEIgEJe6YZqNzaOcWe6OOIro8jx8yGkBt+
	 1NprHlBguCBpyNgRYRE/lWbGUDqTk3mSAJxkCAeBTYD2e1FtvY83Itl4zboJv0tr3n
	 0SSohsUjtucTCl/EdvJJ2i6+o7M/vqmGigeg8yzaGSFLuDQN3bdsrgU4xzfuOdHO2Z
	 rUS3IwFndfLcA==
Date: Tue, 1 Apr 2025 21:57:29 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] objtool fixes
Message-ID: <Z-xFKa5hiQ5urVwS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest objtool/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-04-01

   # HEAD: 7c977393b8277ed319e92e4b598b26598c9d30c0 objtool/loongarch: Add unwind hints in prepare_frametrace()

These are objtool fixes and updates by Josh Poimboeuf, centered
around the fallout from the new CONFIG_OBJTOOL_WERROR=y feature,
which, despite its default-off nature, increased the profile/impact
of objtool warnings:

 - Improve error handling and the presentation of warnings/errors.

 - Revert the new summary warning line that some test-bot tools
   interpreted as new regressions.

 - Fix a number of objtool warnings in various drivers, core kernel
   code and architecture code. About half of them are potential
   problems related to out-of-bounds accesses or potential undefined
   behavior, the other half are additional objtool annotations.

 - Update objtool to latest (known) compiler quirks and
   objtool bugs triggered by compiler code generation

 - Misc fixes

 Thanks,

	Ingo

------------------>
David Laight (1):
      objtool: Fix verbose disassembly if CROSS_COMPILE isn't set

Josh Poimboeuf (35):
      objtool: Fix detection of consecutive jump tables on Clang 20
      objtool: Warn when disabling unreachable warnings
      objtool: Ignore entire functions rather than instructions
      objtool: Fix X86_FEATURE_SMAP alternative handling
      objtool: Fix CONFIG_OBJTOOL_WERROR for vmlinux.o
      objtool: Fix init_module() handling
      objtool: Silence more KCOV warnings
      objtool: Properly disable uaccess validation
      objtool: Improve error handling
      objtool: Reduce CONFIG_OBJTOOL_WERROR verbosity
      objtool: Fix up some outdated references to ENTRY/ENDPROC
      objtool: Remove --no-unreachable for noinstr-only vmlinux.o runs
      objtool: Remove redundant opts.noinstr dependency
      objtool, spi: amd: Fix out-of-bounds stack access in amd_set_spi_freq()
      objtool, nvmet: Fix out-of-bounds stack access in nvmet_ctrl_state_show()
      objtool, media: dib8000: Prevent divide-by-zero in dib8000_set_dds()
      objtool, panic: Disable SMAP in __stack_chk_fail()
      objtool, Input: cyapa - Remove undefined behavior in cyapa_update_fw_store()
      objtool, ASoC: codecs: wcd934x: Remove potential undefined behavior in wcd934x_slim_irq_handler()
      objtool, regulator: rk808: Remove potential undefined behavior in rk806_set_mode_dcdc()
      objtool, lkdtm: Obfuscate the do_nothing() pointer
      objtool: Fix NULL printf() '%s' argument in builtin-check.c:save_argv()
      objtool: Fix segfault in ignore_unreachable_insn()
      objtool: Fix STACK_FRAME_NON_STANDARD for cold subfunctions
      objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC
      objtool: Silence more KCOV warnings, part 2
      objtool: Ignore end-of-section jumps for KCOV/GCOV
      objtool: Append "()" to function name in "unexpected end of section" warning
      Revert "objtool: Increase per-function WARN_FUNC() rate limit"
      objtool: Always fail on fatal errors
      objtool: Change "warning:" to "error: " for fatal errors
      sched/smt: Always inline sched_smt_active()
      context_tracking: Always inline ct_{nmi,irq}_{enter,exit}()
      rcu-tasks: Always inline rcu_irq_work_resched()
      objtool/loongarch: Add unwind hints in prepare_frametrace()


 arch/loongarch/include/asm/stacktrace.h   |   3 +
 arch/loongarch/include/asm/unwind_hints.h |  10 +-
 arch/x86/include/asm/arch_hweight.h       |   6 +-
 arch/x86/include/asm/smap.h               |  23 +-
 arch/x86/include/asm/xen/hypercall.h      |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       |   2 +-
 drivers/input/mouse/cyapa.c               |   4 +-
 drivers/media/dvb-frontends/dib8000.c     |   5 +-
 drivers/misc/lkdtm/perms.c                |  14 +-
 drivers/nvme/target/debugfs.c             |   2 +-
 drivers/regulator/rk808-regulator.c       |   4 +-
 drivers/spi/spi-amd.c                     |   2 +-
 include/linux/context_tracking_irq.h      |   8 +-
 include/linux/linkage.h                   |   4 -
 include/linux/objtool.h                   |   2 +-
 include/linux/rcupdate.h                  |   2 +-
 include/linux/sched/smt.h                 |   2 +-
 kernel/panic.c                            |   6 +
 scripts/Makefile.lib                      |   4 +-
 scripts/Makefile.vmlinux_o                |  15 +-
 sound/soc/codecs/wcd934x.c                |   2 +-
 tools/objtool/Documentation/objtool.txt   |  10 +-
 tools/objtool/arch/loongarch/decode.c     |  14 +-
 tools/objtool/arch/loongarch/orc.c        |   8 +-
 tools/objtool/arch/x86/decode.c           |  15 +-
 tools/objtool/arch/x86/orc.c              |   6 +-
 tools/objtool/arch/x86/special.c          |  38 +-
 tools/objtool/builtin-check.c             | 132 +++---
 tools/objtool/check.c                     | 647 +++++++++++++++---------------
 tools/objtool/elf.c                       | 156 ++++---
 tools/objtool/include/objtool/builtin.h   |   6 +-
 tools/objtool/include/objtool/check.h     |   3 +-
 tools/objtool/include/objtool/elf.h       |  30 +-
 tools/objtool/include/objtool/objtool.h   |   2 +-
 tools/objtool/include/objtool/special.h   |   4 +-
 tools/objtool/include/objtool/warn.h      |  62 +--
 tools/objtool/objtool.c                   |  15 +-
 tools/objtool/orc_dump.c                  |  30 +-
 tools/objtool/special.c                   |  25 +-
 39 files changed, 679 insertions(+), 650 deletions(-)
