Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4062356A3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570552; cv=none; b=msB8lQVeCRExwZqvL7gSJHmfO/RxHgwAlgDaO/9QJMJJBxD7KqCPkaTq2kmZgzqC4d1qnGMg1cALNs6RH7/3O48SiRYj+TwvZ80AwmEZSZ7/lUne76zUq405/BmAKyDuiTJ94l9dfAUPfQLOoApoALiqFio0XYMIx6GsHLfDwF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570552; c=relaxed/simple;
	bh=qv1rNrWI9V00ewa0NTYtN0VHyhXDZIDLF7kN1LWqXrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIPgcVYuC4PL+xAePVsYxNk2Jq8u6FLDxZRgd5QFB8tAbQxcUWlXXPFcs6GcUwynYp29Boe4mVSn314wUiBhFIv0lblAUte8dVULi4QccRufgmRJn/kPFVH7Nxn7TmXEFiNGeT/Q7ws5gNY0B3Oo17N60jy0CCFsr4D3reShamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3G+WgJF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3G+WgJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21778C4CEEB;
	Fri, 25 Apr 2025 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570551;
	bh=qv1rNrWI9V00ewa0NTYtN0VHyhXDZIDLF7kN1LWqXrE=;
	h=From:To:Cc:Subject:Date:From;
	b=L3G+WgJFkhYwNwsUQ7yLBveSw1nSnS05fY85U07tF2kCusswQ1iAHdMiPRlYiqllt
	 6LSfEq6jXgGiPJI7PG9Kt4CFuqlaL/0kCfQJcUehqYRvXNZWIn9PXd7YtUE4Q1n6K1
	 n0ZE3bHOitNJpXSiRGEe78NEBbcFL74aVm1jxysFxByVPFvh6J41ODENAy/EcAVVUs
	 3jY64to0/maZ2E+q6DMa3d13wMbZHYNVgd8Xg3jl3tcNTkhsLQnM5qsP3nnZUJ8kht
	 rhqzihyo2KeWrriNY3s8LuUuQYLqsNkJWwl882CHJsvDloudh3JPXgXVL62cofGgvU
	 H1w6klMT0u16A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
Date: Fri, 25 Apr 2025 10:41:57 +0200
Message-ID: <20250425084216.3913608-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the x86 architecture we have various complicated hardware emulation
facilities on x86-32 to support ancient 32-bit CPUs that very very few
people are using with modern kernels. This compatibility glue is sometimes
even causing problems that people spend time to resolve, which time could
be spent on other things.

As Linus recently remarked:

 > I really get the feeling that it's time to leave i486 support behind.
 > There's zero real reason for anybody to waste one second of
 > development effort on this kind of issue.

This series increases minimum kernel support features to include TSC and
CX8 (CMPXCHG8B) hardware support, which removes 486 (and derivatives) support
and early-586 (and derivatives) support.

Doing this allows the removal of a fair amount of code:

 80 files changed, 38 insertions(+), 14104 deletions(-)

Much of which is the math-emu/ library - but even without math-emu,
the simplification is substantial:

 33 files changed, 38 insertions(+), 1081 deletions(-)

This series has 5 main parts:

1) Removal of the main CPU options and their dependencies in the Kconfig space:

     x86/cpu: Remove M486/M486SX/ELAN support
     x86/cpu: Remove CONFIG_MWINCHIP3D/MWINCHIPC6
     x86/cpu: Remove CPU_SUP_UMC_32 support
     x86/cpu: Remove TSC-less CONFIG_M586 support

2) Remove platform support for chips that weren't carried forward
   after these CPUs:

     x86/cpu, x86/platform, watchdog: Remove CONFIG_X86_RDC321X support
     x86/cpu: Remove the CONFIG_X86_INVD_BUG quirk
     x86/cpu, cpufreq: Remove AMD ELAN support

3) Remove math-emu/ support:

     x86/fpu: Remove MATH_EMULATION and related glue code
     x86/fpu: Remove the 'no387' boot option
     x86/fpu: Remove the math-emu/ FPU emulation library

4) Make CONFIG_X86_TSC unconditional and simplify the build-time TSC variances:

     x86/cpu: Make CONFIG_X86_TSC unconditional
     x86: Remove !CONFIG_X86_TSC code

   Note that runtime TSC disabling is still kept in its various forms.

   Also note that I kept CONFIG_X86_TSC itself, which is a proxy for
   a few drivers for 'sane x86', and which might be used in changes
   still in-flight. There's very little cost to keep this Kconfig option
   going forward, even though it's always-enabled.

5) Make CONFIG_X86_CX8 unconditional and remove build-time complications:

     x86/cpu: Make CONFIG_X86_CX8 unconditional
     x86/percpu: Remove !CONFIG_X86_CX8 methods
     x86/atomics: Remove !CONFIG_X86_CX8 methods

   Note that CONFIG_X86_CX8 is still kept, but not used by anything
   anymore. We can probably remove it entirely and there's no expectation
   of pending/outside code having dependency on this.

Note that there's still some stray references to removed platforms in
the main x86 Kconfig and Kconfig.x86, and the entire vector of CPU
options is probably overly complicated and should probably be replaced
with a single option - I'll clean that all up once there's rough
agreement about the scope of this RFC series.

The tree can also be found in my tree:

   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/cpu

Lightly tested.

Thanks,

    Ingo

================>
Ingo Molnar (15):
  x86/cpu: Remove M486/M486SX/ELAN support
  x86/cpu: Remove CONFIG_MWINCHIP3D/MWINCHIPC6
  x86/cpu: Remove CPU_SUP_UMC_32 support
  x86/cpu: Remove TSC-less CONFIG_M586 support
  x86/cpu, x86/platform, watchdog: Remove CONFIG_X86_RDC321X support
  x86/cpu: Remove the CONFIG_X86_INVD_BUG quirk
  x86/cpu, cpufreq: Remove AMD ELAN support
  x86/fpu: Remove MATH_EMULATION and related glue code
  x86/fpu: Remove the 'no387' boot option
  x86/fpu: Remove the math-emu/ FPU emulation library
  x86/cpu: Make CONFIG_X86_TSC unconditional
  x86: Remove !CONFIG_X86_TSC code
  x86/cpu: Make CONFIG_X86_CX8 unconditional
  x86/percpu: Remove !CONFIG_X86_CX8 methods
  x86/atomics: Remove !CONFIG_X86_CX8 methods

 Documentation/admin-guide/kernel-parameters.txt |    4 -
 arch/x86/Kconfig                                |   71 +-
 arch/x86/Kconfig.cpu                            |   95 +-
 arch/x86/Kconfig.cpufeatures                    |    2 -
 arch/x86/Makefile                               |    1 -
 arch/x86/Makefile_32.cpu                        |    8 -
 arch/x86/include/asm/asm-prototypes.h           |    4 -
 arch/x86/include/asm/atomic64_32.h              |   17 +-
 arch/x86/include/asm/cmpxchg_32.h               |   86 +-
 arch/x86/include/asm/fpu/api.h                  |    6 -
 arch/x86/include/asm/percpu.h                   |    6 +-
 arch/x86/include/asm/timex.h                    |    3 +-
 arch/x86/include/asm/trace_clock.h              |    8 -
 arch/x86/include/asm/tsc.h                      |   13 +-
 arch/x86/include/asm/vermagic.h                 |   12 -
 arch/x86/kernel/Makefile                        |    4 +-
 arch/x86/kernel/cpu/common.c                    |    7 -
 arch/x86/kernel/cpu/umc.c                       |   26 -
 arch/x86/kernel/fpu/core.c                      |    5 -
 arch/x86/kernel/fpu/init.c                      |    9 +-
 arch/x86/kernel/i8253.c                         |    2 +-
 arch/x86/kernel/traps.c                         |   21 -
 arch/x86/kernel/tsc.c                           |   13 -
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
 arch/x86/xen/Kconfig                            |    2 +-
 drivers/cpufreq/Kconfig.x86                     |   26 -
 drivers/cpufreq/Makefile                        |    2 -
 drivers/cpufreq/elanfreq.c                      |  227 ----
 drivers/cpufreq/sc520_freq.c                    |  137 --
 drivers/watchdog/Kconfig                        |    2 +-
 lib/atomic64_test.c                             |    4 +-
 80 files changed, 38 insertions(+), 14104 deletions(-)
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

-- 
2.45.2

