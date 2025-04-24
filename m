Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A528E60C;
	Thu, 24 Apr 2025 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517249; cv=none; b=QNU/DXQk7Gp4/C3sQ/Lx2TcpLvba+3pL/7ebWIMRnn3Mkpbznd973i4UBOPnhSpc26FLnIt84Nf2ux8VnmGjwirZYi1IxtvQkFX8pITPjEX0I09QbRY29csG3kf9F/W5HXlFYN5OgzOQrBu8h+ab/9OhKnpMNoO2hk9RSirCbvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517249; c=relaxed/simple;
	bh=1kn9najvnV8gdb1NXZM+ASr0mMAJoT09AB4GZcvfjGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvdFJfw/jV7uLTbCkQd/2Uv8vvfyvXzx1yyywzIhb9/VLnHqHVLw0p3Ij8BdcL8jVMLuga2k8ll5236aon1dPLJrbnu5MZJ8PB5ShUlHQbSu1RdZgx3S9hezSIYOUBXe09J42I8MMABOQ7/Bg8YFAShAauyiCRGBLr0szP3ctJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoyHsVa+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoyHsVa+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02FBC4CEEA;
	Thu, 24 Apr 2025 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745517248;
	bh=1kn9najvnV8gdb1NXZM+ASr0mMAJoT09AB4GZcvfjGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoyHsVa+SRVHpA13JEdsTo9HIsoQERWOLDc+n+d9PwwQv7WcGs20nfvuCzSJ2gMvP
	 o/2AHmPkg/DbRVHJHuXW/X7paqrKMzlpmncUMnUylxQFrS3ew510WVBYXyJ0yxKdZ+
	 sUpyxAU6OOHr723CtjCml748hJukFd1GnIrih4i2mE8GQi9L0vaaZgmA3k7O/HYIxc
	 /tMu1h2Mw2eSI3x/8VRKCUyMssoXzAysMLfeIGfPyDbslgU+YyXgVNIEqmXrTpMNtR
	 S1LXeRtumexnGf2l0VMKa/Bjb8zpn2JyxCPv9TUDwlltwOOV6BXBWG5IEWcKZnEKRT
	 ip6x7hvVCRfQA==
Date: Thu, 24 Apr 2025 19:54:03 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
Message-ID: <aAp6u9ylKCpvMJRF@gmail.com>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
 <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I really get the feeling that it's time to leave i486 support behind. 
> There's zero real reason for anybody to waste one second of 
> development effort on this kind of issue.

Fully agreed!

And to turn this idea into code, here's a very raw RFC series that 
starts removing non-TSC 586 and 486 code and related support code from 
the x86 architecture, with the goal to make TSC and CX8 (CMPXCHG8B) 
support unconditionally available:

   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/cpu

The full diffstat is nice, primarily due to the removal of the math-emu 
library:

   83 files changed, 30 insertions(+), 14683 deletions(-)

But even without the math-emu/ removal and the drivers/ pruning it's a 
substantial simplification:

   20 files changed, 29 insertions(+), 629 deletions(-)

The patches most relevant to this discussion should be:

      x86/cpu: Remove M486/M486SX/ELAN support
      ...
      x86/cpu: Remove TSC-less CONFIG_M586 support
      x86/cpu: Make CONFIG_X86_TSC unconditional
      x86/cpu: Make CONFIG_X86_CX8 unconditional
      x86/percpu: Remove !CONFIG_X86_CX8 methods
      x86/atomics: Remove !CONFIG_X86_CX8 methods

If there's no big objections about the scope of removal I'll finish it 
by removing the non-TSC complications as well, and send out the series 
to lkml for further review.

( Note that some of the patches in there are still WIP, as the branch 
  name suggests. )

Thanks,

	Ingo

================>

Ingo Molnar (17):
      x86/cpu: Remove M486/M486SX/ELAN support
      x86/cpu: Remove the CONFIG_X86_INVD_BUG quirk
      x86/cpu, cpufreq: Remove AMD ELAN support
      x86/fpu: Remove MATH_EMULATION and related glue code
      x86/fpu: Remove the 'no387' boot option
      x86/fpu: Remove the math-emu/ FPU emulation library
      x86/platform: Remove CONFIG_X86_RDC321X support
      arch/x86, gpio: Remove GPIO_RDC321X support
      arch/x86, watchdog: Remove the RDC321X_WDT watchdog driver
      arch/x86, mfd: Remove MFD_RDC321X support
      x86/reboot: Remove the RDC321X reboot quirk
      x86/cpu: Remove CPU_SUP_UMC_32 support
      x86/cpu: Remove TSC-less CONFIG_M586 support
      x86/cpu: Make CONFIG_X86_TSC unconditional
      x86/cpu: Make CONFIG_X86_CX8 unconditional
      x86/percpu: Remove !X86_CX8 methods
      x86/atomics: Remove !CONFIG_X86_CX8 methods

 Documentation/admin-guide/kernel-parameters.txt |    4 -
 arch/x86/Kconfig                                |   71 +-
 arch/x86/Kconfig.cpu                            |   73 +-
 arch/x86/Kconfig.cpufeatures                    |    2 -
 arch/x86/Makefile                               |    1 -
 arch/x86/Makefile_32.cpu                        |    6 -
 arch/x86/include/asm/asm-prototypes.h           |    4 -
 arch/x86/include/asm/atomic64_32.h              |   17 +-
 arch/x86/include/asm/cmpxchg_32.h               |   86 +-
 arch/x86/include/asm/fpu/api.h                  |    6 -
 arch/x86/include/asm/percpu.h                   |    6 +-
 arch/x86/include/asm/vermagic.h                 |    8 -
 arch/x86/kernel/cpu/common.c                    |    7 -
 arch/x86/kernel/cpu/umc.c                       |   26 -
 arch/x86/kernel/fpu/core.c                      |    5 -
 arch/x86/kernel/fpu/init.c                      |    9 +-
 arch/x86/kernel/reboot_fixups_32.c              |   14 -
 arch/x86/kernel/traps.c                         |   21 -
 arch/x86/lib/Makefile                           |    4 -
 arch/x86/lib/atomic64_386_32.S                  |  195 ---
 arch/x86/lib/cmpxchg8b_emu.S                    |   97 --
 arch/x86/math-emu/Makefile                      |   30 -
 arch/x86/math-emu/README                        |  427 ------
 arch/x86/math-emu/control_w.h                   |   46 -
 arch/x86/math-emu/div_Xsig.S                    |  367 -----
 arch/x86/math-emu/div_small.S                   |   48 -
 arch/x86/math-emu/errors.c                      |  686 ----------
 arch/x86/math-emu/exception.h                   |   51 -
 arch/x86/math-emu/fpu_arith.c                   |  153 ---
 arch/x86/math-emu/fpu_asm.h                     |   32 -
 arch/x86/math-emu/fpu_aux.c                     |  267 ----
 arch/x86/math-emu/fpu_emu.h                     |  218 ---
 arch/x86/math-emu/fpu_entry.c                   |  718 ----------
 arch/x86/math-emu/fpu_etc.c                     |  136 --
 arch/x86/math-emu/fpu_proto.h                   |  157 ---
 arch/x86/math-emu/fpu_system.h                  |  130 --
 arch/x86/math-emu/fpu_tags.c                    |  116 --
 arch/x86/math-emu/fpu_trig.c                    | 1649 -----------------------
 arch/x86/math-emu/get_address.c                 |  401 ------
 arch/x86/math-emu/load_store.c                  |  322 -----
 arch/x86/math-emu/mul_Xsig.S                    |  179 ---
 arch/x86/math-emu/poly.h                        |  115 --
 arch/x86/math-emu/poly_2xm1.c                   |  146 --
 arch/x86/math-emu/poly_atan.c                   |  209 ---
 arch/x86/math-emu/poly_l2.c                     |  245 ----
 arch/x86/math-emu/poly_sin.c                    |  379 ------
 arch/x86/math-emu/poly_tan.c                    |  213 ---
 arch/x86/math-emu/polynom_Xsig.S                |  137 --
 arch/x86/math-emu/reg_add_sub.c                 |  334 -----
 arch/x86/math-emu/reg_compare.c                 |  479 -------
 arch/x86/math-emu/reg_constant.c                |  123 --
 arch/x86/math-emu/reg_constant.h                |   26 -
 arch/x86/math-emu/reg_convert.c                 |   47 -
 arch/x86/math-emu/reg_divide.c                  |  183 ---
 arch/x86/math-emu/reg_ld_str.c                  | 1220 -----------------
 arch/x86/math-emu/reg_mul.c                     |  116 --
 arch/x86/math-emu/reg_norm.S                    |  150 ---
 arch/x86/math-emu/reg_round.S                   |  711 ----------
 arch/x86/math-emu/reg_u_add.S                   |  169 ---
 arch/x86/math-emu/reg_u_div.S                   |  474 -------
 arch/x86/math-emu/reg_u_mul.S                   |  150 ---
 arch/x86/math-emu/reg_u_sub.S                   |  274 ----
 arch/x86/math-emu/round_Xsig.S                  |  142 --
 arch/x86/math-emu/shr_Xsig.S                    |   89 --
 arch/x86/math-emu/status_w.h                    |   68 -
 arch/x86/math-emu/version.h                     |   12 -
 arch/x86/math-emu/wm_shrx.S                     |  207 ---
 arch/x86/math-emu/wm_sqrt.S                     |  472 -------
 drivers/cpufreq/Kconfig.x86                     |   26 -
 drivers/cpufreq/Makefile                        |    2 -
 drivers/cpufreq/elanfreq.c                      |  227 ----
 drivers/cpufreq/sc520_freq.c                    |  137 --
 drivers/gpio/Kconfig                            |    8 -
 drivers/gpio/Makefile                           |    1 -
 drivers/gpio/gpio-rdc321x.c                     |  197 ---
 drivers/mfd/Kconfig                             |    9 -
 drivers/mfd/Makefile                            |    1 -
 drivers/mfd/rdc321x-southbridge.c               |   96 --
 drivers/watchdog/Kconfig                        |   11 -
 drivers/watchdog/Makefile                       |    1 -
 drivers/watchdog/rdc321x_wdt.c                  |  281 ----
 include/linux/mfd/rdc321x.h                     |   27 -
 lib/atomic64_test.c                             |    4 +-
 83 files changed, 30 insertions(+), 14683 deletions(-)
 delete mode 100644 arch/x86/kernel/cpu/umc.c
 delete mode 100644 arch/x86/lib/atomic64_386_32.S
 delete mode 100644 arch/x86/lib/cmpxchg8b_emu.S
 delete mode 100644 arch/x86/math-emu/Makefile
 delete mode 100644 arch/x86/math-emu/README
 delete mode 100644 arch/x86/math-emu/control_w.h
 delete mode 100644 arch/x86/math-emu/div_Xsig.S
 delete mode 100644 arch/x86/math-emu/div_small.S
 delete mode 100644 arch/x86/math-emu/errors.c
 delete mode 100644 arch/x86/math-emu/exception.h
 delete mode 100644 arch/x86/math-emu/fpu_arith.c
 delete mode 100644 arch/x86/math-emu/fpu_asm.h
 delete mode 100644 arch/x86/math-emu/fpu_aux.c
 delete mode 100644 arch/x86/math-emu/fpu_emu.h
 delete mode 100644 arch/x86/math-emu/fpu_entry.c
 delete mode 100644 arch/x86/math-emu/fpu_etc.c
 delete mode 100644 arch/x86/math-emu/fpu_proto.h
 delete mode 100644 arch/x86/math-emu/fpu_system.h
 delete mode 100644 arch/x86/math-emu/fpu_tags.c
 delete mode 100644 arch/x86/math-emu/fpu_trig.c
 delete mode 100644 arch/x86/math-emu/get_address.c
 delete mode 100644 arch/x86/math-emu/load_store.c
 delete mode 100644 arch/x86/math-emu/mul_Xsig.S
 delete mode 100644 arch/x86/math-emu/poly.h
 delete mode 100644 arch/x86/math-emu/poly_2xm1.c
 delete mode 100644 arch/x86/math-emu/poly_atan.c
 delete mode 100644 arch/x86/math-emu/poly_l2.c
 delete mode 100644 arch/x86/math-emu/poly_sin.c
 delete mode 100644 arch/x86/math-emu/poly_tan.c
 delete mode 100644 arch/x86/math-emu/polynom_Xsig.S
 delete mode 100644 arch/x86/math-emu/reg_add_sub.c
 delete mode 100644 arch/x86/math-emu/reg_compare.c
 delete mode 100644 arch/x86/math-emu/reg_constant.c
 delete mode 100644 arch/x86/math-emu/reg_constant.h
 delete mode 100644 arch/x86/math-emu/reg_convert.c
 delete mode 100644 arch/x86/math-emu/reg_divide.c
 delete mode 100644 arch/x86/math-emu/reg_ld_str.c
 delete mode 100644 arch/x86/math-emu/reg_mul.c
 delete mode 100644 arch/x86/math-emu/reg_norm.S
 delete mode 100644 arch/x86/math-emu/reg_round.S
 delete mode 100644 arch/x86/math-emu/reg_u_add.S
 delete mode 100644 arch/x86/math-emu/reg_u_div.S
 delete mode 100644 arch/x86/math-emu/reg_u_mul.S
 delete mode 100644 arch/x86/math-emu/reg_u_sub.S
 delete mode 100644 arch/x86/math-emu/round_Xsig.S
 delete mode 100644 arch/x86/math-emu/shr_Xsig.S
 delete mode 100644 arch/x86/math-emu/status_w.h
 delete mode 100644 arch/x86/math-emu/version.h
 delete mode 100644 arch/x86/math-emu/wm_shrx.S
 delete mode 100644 arch/x86/math-emu/wm_sqrt.S
 delete mode 100644 drivers/cpufreq/elanfreq.c
 delete mode 100644 drivers/cpufreq/sc520_freq.c
 delete mode 100644 drivers/gpio/gpio-rdc321x.c
 delete mode 100644 drivers/mfd/rdc321x-southbridge.c
 delete mode 100644 drivers/watchdog/rdc321x_wdt.c
 delete mode 100644 include/linux/mfd/rdc321x.h
