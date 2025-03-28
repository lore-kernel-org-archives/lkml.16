Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3E1DEFCD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196743; cv=none; b=Vpj4torbSjfN45EqcRkRp7OxiSonxI855SzJmuJVPeOi2tmoWvkwtWHZdW5nvAq3EMXYrf/njNQ5cJb5qHArpoXPEzMFAWmm+JPd2QZ5WK5afJ/u+1e7m4HQDusFO+0/e7F4ETph2akRCvU7XU6wVUf0p6mpuqDZ/45tLdGw5Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196743; c=relaxed/simple;
	bh=MaBqe6eVVmdbDZdiR1OmmkRoYtCYSihblDwYVJtzer8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeKWXEB65U+480ujTdfh0n5EQswBazf/E3X/6ROxvvinkYDuaBEB/WHlTfwPy3ylehdml6rzBeqvGndsHqAMhR+2Fu8XSbMUqNPRX/t9JNNwyq5FbupAld/CTRHiuAuLG5TLhh2hc5cLEsv9YAKODV9ArH54d3pIMQe7p56ssXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuGuFzMo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuGuFzMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF64C4CEE4;
	Fri, 28 Mar 2025 21:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743196742;
	bh=MaBqe6eVVmdbDZdiR1OmmkRoYtCYSihblDwYVJtzer8=;
	h=Date:From:To:Cc:Subject:From;
	b=nuGuFzModhAXQz+MwR+PIJ4dQHfUKWYNvrJGpRSfeM5u9HVzjsNTh/gBqnGXJXFeP
	 LabDgJXQFU4XQWqG4BjRuk6uJ+cRuTi0uVNH31pAn/6wi9q1c/Ph2rxIqYrxMfQTvk
	 7THMQuKjTiJvOaLW/vLvARtJCF4i964oSO+Qp0ydjaGu+b3zcZT2IeSbTC4Ee+TXXP
	 QJ4BJIU6Me/XMr7L5OnrSoGPnj0OwBuTku++gMItWKU5BJPF2wGqzRDl3IUmZQgcVa
	 7Wm1/hAjd/TOplhQmLth8VAhgxcX3G0ei+RfESTwuH8OWQHzJ7m3t6HcCyrsifKUMl
	 0bSp/AQuZMghA==
Date: Fri, 28 Mar 2025 22:18:57 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] objtool fixes and updates
Message-ID: <Z-cSQXJKMyBSfAAc@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-03-28

   # HEAD: ae958b12940bcd4ffa32c44684e4f2878bc5e140 objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC

[ Merge note: not all driver fixes below have maintainer acks. ]

These are objtool fixes and updates centered around the fallout
from the new CONFIG_OBJTOOL_WERROR=y feature, which, despite its
default-off nature, increased the profile/impact of objtool warnings:

 - Improve error handling and the presentation of warnings/errors.

 - In particular reduce the verbosity of objtool warnings if a
   function triggers a check already - it's unlikely that followup
   warnings are useful after the first warning is triggered.

 - Fix a number of objtool warnings in various drivers, core kernel
   code and architecture code. About half of them are potential
   problems related to out-of-bounds accesses or potential undefined
   behavior, the other half are additional objtool annotations.

 - Update objtool to latest (known) compiler quirks and
   objtool bugs triggered by compiler code generation

 Thanks,

	Ingo

------------------>
Josh Poimboeuf (25):
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


 arch/x86/include/asm/arch_hweight.h     |   6 +-
 arch/x86/include/asm/smap.h             |  23 +-
 arch/x86/include/asm/xen/hypercall.h    |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c     |   2 +-
 drivers/input/mouse/cyapa.c             |   4 +-
 drivers/media/dvb-frontends/dib8000.c   |   5 +-
 drivers/misc/lkdtm/perms.c              |  14 +-
 drivers/nvme/target/debugfs.c           |   2 +-
 drivers/regulator/rk808-regulator.c     |   4 +-
 drivers/spi/spi-amd.c                   |   2 +-
 include/linux/linkage.h                 |   4 -
 include/linux/objtool.h                 |   2 +-
 kernel/panic.c                          |   6 +
 scripts/Makefile.lib                    |   2 +-
 scripts/Makefile.vmlinux_o              |  15 +-
 sound/soc/codecs/wcd934x.c              |   2 +-
 tools/objtool/Documentation/objtool.txt |  10 +-
 tools/objtool/arch/x86/special.c        |  38 +--
 tools/objtool/builtin-check.c           | 146 +++++----
 tools/objtool/check.c                   | 527 ++++++++++++++++----------------
 tools/objtool/elf.c                     |  28 +-
 tools/objtool/include/objtool/builtin.h |   6 +-
 tools/objtool/include/objtool/check.h   |   3 +-
 tools/objtool/include/objtool/elf.h     |  28 +-
 tools/objtool/include/objtool/objtool.h |   2 +-
 tools/objtool/include/objtool/special.h |   4 +-
 tools/objtool/include/objtool/warn.h    |  13 +-
 tools/objtool/objtool.c                 |  11 +-
 tools/objtool/special.c                 |  12 +-
 29 files changed, 472 insertions(+), 455 deletions(-)
