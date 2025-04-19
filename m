Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422B1C07C3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102161; cv=none; b=WzmA1z+n+sfQgTWNILU08RrSFq2d6WEY+Fd3t0bnxQPTX4DT+LsxFeafUPIJsR1XSdqsiqeKdtbWOR6Y0Mf/D7ISuqD/gdmK4QtImYKg+69juca9LqZIxQMlyS0HSm7KkG3xQKndAvTZ4foVvagcv+r/NAVeKYkNSW821zFGbWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102161; c=relaxed/simple;
	bh=eXDL9PZQWhM21hZ7ZE30GNYVBtlyUuo3VYbYzWzEris=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VSci6c8OF9Gba5sMlkxjbADWJwHsMWUClRl8Ik/HbrwXDYwJwcu1sX/X2c5sdBDCXbpomq1kSYhC2boGyki5vuLujOVH9Pr2zTtLSQUOIqYBU7mp4m2gM51S94a5AAFHyf6nizMVBX6XNPCeA5dctlFOVx88PHa/jNbJsvF+Nuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjydpKh2; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjydpKh2"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549967c72bcso3176039e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102157; x=1745706957; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4F5NqirVzWNgGL0YS5h3K2vY8ebnnKfieN+4fWEzoQ=;
        b=OjydpKh2PapCvIDPN5Yc1jGKFORMwDFyc0E5rJ1tPF0ktQOirEenD6TMdOXcp8Ae9e
         khde/e8w2JRid6RBQooqUEMJ5F1i6yCJFqiG4Fx6uV6gCyZgCRgwb9btbocnwfxX2XfQ
         7ARGfq4MO5i5tNZIfxmGdcvOI3S+oVMURJ9SxpFxMffn1umX/CjZBHztA4Nwk9X1aSrD
         FVTRC6+Vq2zUDVjHTVm9xjI5UwFnuk7jLw2a+Zhkz0f8st9X8kim5LNJCqf6KtJD8WIV
         IAUr1DfSbNf2/mybN7q0cDOmHfQ5w8jf/DFtJ2wnImlawTVT/fgEVQNcz0uIvA8sJK08
         gk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102157; x=1745706957;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4F5NqirVzWNgGL0YS5h3K2vY8ebnnKfieN+4fWEzoQ=;
        b=NSiAhq4joDKMO5WqKKrRgFdDHTFvB/16BfTldoZefPx4btk0Bt8nHYb7mANncW1p9T
         p5Kp2fSPnbc9A2QK0cah0+bgztpFO1yXSH1g4zSxS0rZAZt2FgtPsAtaEVchQdYTtev3
         dyeKUsixKJBtFP5caFPvl/uSSCV9YGBNPEnUG8d54dwi7C9wPjRDXOVRxSRD+sFfR4+O
         2L/euC0jYieNB1H6WkNgYJJcwQAojS4IsAOy7Mlz5rIKN9lGkYk/5dOURShhb8UJdQ8R
         wlILCS8bhVrK+1sopd0HGZH/W23eYIRlYHweYe/B2I6UiqMBBi2loj8hMO6ZNnTwvk6y
         CGOg==
X-Forwarded-Encrypted: i=1; AJvYcCWjQk+azKLulq/c17IDcthWQbC4Bjdq1dzdshhhy5p8h97I823JYcoQVfBEUh8pp1iT7QF5uPbJoyDhFKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbQV3G4cXVOM+lgZletBqtlEbpk4t8+9guNPMIjFRPphk9d0o
	vsa5kjHK8tJacRxP2GLWm9SJheQtfNfmDWPZpIpK1JnhnahFdJBdF92qElqFgI4=
X-Gm-Gg: ASbGncujPonUlPQzMSs1psJnaoxQov5vc9z8SD+Qy/HG3Yq6JJ3KNfHLULIr6fzOWvW
	Ij5TkulzLjPiQ9u8gO/OqhPqtukBBKAiO0T/FTIilaaBJRe1vRWQ7orwdGnoS1ayb0co/I6l16J
	qJRTyBivd5/4BA07OTfDdhy1NcHQoPw3W+a1bPPfKQEV3VX/BC1ssBesOPX2LEVfAHrRSfzRPQJ
	zIlwdf1ogELDPfPqtwEJ7moOQ+DHV8ZJN27YF1td0L9hl5pXmayatcDaiZX7VwWTbiU90lh5xxJ
	QvY+7OP+FuO0Rxabm5wgWeptyPA/fZ1Us8Lc/F55qaPvQ6sdXfI=
X-Google-Smtp-Source: AGHT+IH7JZnEuuFCZqGPbAcX/BsjXVlOFDCexWqqUFAUko8nxqoL1CBgVAmOlK+Zf1xkZVblhZa4CA==
X-Received: by 2002:a05:6512:3d0d:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-54d6e66d873mr1824747e87.48.1745102156556;
        Sat, 19 Apr 2025 15:35:56 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v6 00/31] ARM: Switch to generic entry
Date: Sun, 20 Apr 2025 00:35:47 +0200
Message-Id: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMlBGgC/23O0WrEIBAF0F9ZfK7FGZ2Y9Kn/UfqgccwKrSlmC
 V2W/HvdQOmW+HgH7rlzEwuXxIt4Od1E4TUtac41dE8nMZ5dnlimULNAhUYNSktXPuXEubZGyfl
 SrtIFB4a07b1nUXtfhWP63s2395rPabnM5bpPrHC/7hooUA1tBamkH0w0BEH11r9+pOzK/DyXS
 dy5FR8IHFoEVoKsJhic56j7A6F/CapP2BahK2GYoh6BgsdwIMwfgYAtwlTCGbIxKtdB6A4EPRB
 ILYIqgVGhBt2RZvpHbNv2A80qCNC/AQAA
X-Change-ID: 20240903-arm-generic-entry-ada145378bbe
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2

This patch series converts a slew of ARM assembly into the
corresponding C code, step by step moving the codebase
closer to the expectations of the generic entry code,
then switches ARM over to the generic entry code.

This was inspired by Jinjie Ruans similar work for ARM64.

The low-level assembly calls into arch/arm/kernel/syscall.c
to invoke syscalls from userspace, and to the functions listed
in arch/arm/kernel/entry.c for any other transitions to
and from userspace. Looking at these functions and the
call sites in the assembly on the final result should give
a pretty good idea about how this works, and what the
generic entry expects from an architecture.

This was successfully booted on ARMv7m as well: the v7m
avoids the interrupt path in the generic entry, because it
never called the context tracker to begin with. It uses
the common path for syscalls however and this works just
fine. Adding proper context tracking to the ARMv7m IRQs is
probably a good idea but a separate issue altogether.

There is a git branch you can pull in and test (v6.15-rc1
based):
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=b4/arm-generic-entry-v6.15-rc1

Upsides:

- Same code paths as x86, S390, RISCV, Loongarch and probably
  soon ARM64 is used for the ARM systems. This includes some
  instrumentation stubs helping out with things we haven't
  even started to look at such as kmsan and live patching (!).

- By introducing the new callbacks to C, we can move away
  from the deprecated (and I think partly unmaintained) context
  tracking mechanism for RCU (user_exit_callable(),
  user_enter_callable()) in favor of what everyone else
  is using, i.e. calling rcu_irq_enter_check_tick() on
  IRQ entry. If we do not go with this patch set we can
  perhaps look into a separate patch just switching ARM32
  to the new context tracking, as tests show the performance
  impact appears negligible for this.

- I think also lockdep is now behaving more according to
  expectations (the lockdep calls in ARM64 and generic entry
  seems different and more fine-granular from the ARM32 code)
  and the three warnings I see on Vexpress boots with mainline
  goes away after this patch set, but I am no expert in lockdep
  so I cannot really tell if this is a real improvement.
  The patches does make ARM lockdep clean.

Downsides:

- The "superfast return to userspace" using just very
  small assembly snippets to get back to userspace on
  e.g. IRQs if and only if no instrumentation was compiled
  in, is no longer possible, since we unconditionally
  call into code written in C. I *think* this accounts
  for the majority of the ~6% performance impact (see
  measurements below).

This more or less an unavoidable side effect if we just
want to use the non-deprecated context tracking,
as that involves calling into C from every exception,
without exceptions.

Testing:

- Booted into Versatile Express QEMU (ARMv7), Ux500 full
  graphic UI (PostmarketOS Phosh, ARMv7 on hardware,
  Gemini ARMv4 on hardware. No special issues.

- Tested some ptrace/strace obviously, such as issuing
  several instances of "ptrace find /" and let this scroll
  by in the terminal over some 10 minutes or so. Then
  I ran the strace test suite and the results are the same
  before and after the patch set.

- Ran the strace test suite (and that was a good thing
  because it found regressions).

- Turned on RCU torture tests and ran for a while. Seems
  stable and the test outputs look normal.

- Ran stress-ng, works fine.

- Booted with "lockdep" (CONFIG_PROVE_LOCKING). The ARM32
  mainline produce 3 warnings at boot and those go away
  after these patches. I haven't looked closer at what
  it was that I inadvertedly fixed here, but I suspect the
  current context tracking has issues with interrupts being
  interrupted by paging exceptions, and these are solved
  in this patch series.

Performance impact:

The changes were tested using the standard syscall overhead
testing oneliner:

  perf bench syscall all

This executes 10,000,000 getppid() in sequence and measures
the time taken for this to complete. The numbers vary a bit
but they are consistent.

In QEMU I tested with Vexpress and two CPU cores (-M vexpress-a15
-m 2G -smp cpus=2). DRM graphics and framebuffer was activated to
give a bit of background IRQ activity (vsync interrupts).

I ran the perf command three times on each configuration, and
picked the one iteration where the original code performed the
best, and the one where the patches kernel performed the worst, to
get a worst-case comparison.

v6.14-rc1 vexpress_defconfig, best invocation:

     Total time: 146.546 [sec]
      14.654698 usecs/op
         68,237 ops/sec

v6.14-rc1 vexpress_defconfig, and this patch set, worst invocation:

     Total time: 156.263 [sec]
      15.626398 usecs/op
         63,994 ops/sec

Here we see a performance degradation of around 6-7% operations/sec
for a vexpress dualcore defconfig in the best vs worst case. (This
isn't statistically correct, the effect is likely smaller.)

Debians stock kernel was noticably faster, so I investigated what
causes this. It turns out that the big performance hog for syscalls
is actually PAN which cause an order of magnitude syscall performance
decrease, and I think Debian armhf simply turns this off. Consistent
tests with PAN disabled also see around 6-7% on that performance
figure.

To conclude if any of this was due to the new context tracking,
at one point I tested to patch back the old context tracking on top
of generic entry. This is hardly something that can be recommended,
and anyway showed no noticeable overhead difference.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v6:
- Rebased on v6.15-rc1
- Link to v5: https://lore.kernel.org/r/20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org

Changes in v5:
- Reimplement local syscall restart after the strace test
  suite showed me that this is strictly required. The strace
  test suite results are now the same before and after the
  patch set.
- Tested on an OABI rootfs (Footbridge RedHat!) it works
  fine after dropping the last patch, which was just an
  optimization anyway. That can wait for later.
- Link to v4: https://lore.kernel.org/r/20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org

Changes in v4:
- Rebased on v6.14-rc1, marked non-RFC.
- Tested on ARMv7m, it works.
- Fixed a bug where I missed to handle syscall "-1" which
  when tracing means "skip syscall". This took some time to
  find, taking up much of my debug time despite being so
  obvious :/
- Added stubs for PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP.
- No feedback on the "fast syscall restart" so I conclude
  that this is some ARM oddity, if it is needed for
  performance (i.e. a workload constantly restarting syscalls)
  we should look at recreating it inside the generic entry
  code.
- After discussing with Ard about the IRQ stacks, altered
  the irqstack handling to just assume IRQ stack or overflow
  stack is in use if we are not on the main thread stack.
- Unmark the patch to block IRQs in early IRQ context as
  "RFC": when doing proper context tracking this is likely
  plain necessary. Block IRQs in the early assembly entry
  directly in CPSR instead of later in the exception handler.
- New cleanup patch in the tail of the patch series.
- Link to v3: https://lore.kernel.org/r/20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org

Changes in v3:
- Rewrote the code in entry.c so the IRQ handler saves pt_regs
  calls IRQ handler (including switching to IRQ stack!) and
  restores pt_regs in one function instead of one entry and
  one exit function. This is what every other arch using
  generic entry is doing, and we should do it too.
- The rewrite solved the caveat warnings from the previous patch
  set which was blatantly not SMP safe :/
- Rewrite the data abort and prefetch abort handlers in a
  separate patch which we may squash in the end, but this makes
  the patch set easier to review.
- Drop a pointless patch rewriting the NMI handlers in C, it's
  better to just patch into the end result in the last patch,
  as we're replacing handle_fiq_as_nmi().
- Syscall C invocations have to be tagged __ADDRESSABLE() in order
  not to upset KCFI: the file is only referenced in both ends by
  assembly so we need to point this out to the compiler.
- Link to v2: https://lore.kernel.org/r/20241029-arm-generic-entry-v2-0-573519abef38@linaro.org

Changes in v2:
- Performance impact measurements have been provided.
- Link to v1: https://lore.kernel.org/r/20241010-arm-generic-entry-v1-0-b94f451d087b@linaro.org

---
Linus Walleij (31):
      ARM: Prepare includes for generic entry
      ARM: ptrace: Split report_syscall()
      ARM: entry: Skip ret_slow_syscall label
      ARM: process: Rewrite ret_from_fork i C
      ARM: process: Remove local restart
      ARM: entry: Invoke syscalls using C
      ARM: entry: Rewrite two asm calls in C
      ARM: entry: Move trace entry to C function
      ARM: entry: save the syscall sp in thread_info
      ARM: entry: move all tracing invocation to C
      ARM: entry: Merge the common and trace entry code
      ARM: entry: Rename syscall invocation
      ARM: entry: Create user_mode_enter/exit
      ARM: entry: Drop trace argument from usr_entry macro
      ARM: entry: Separate call path for syscall SWI entry
      ARM: entry: Drop argument to asm_irqentry macros
      ARM: entry: Implement syscall_exit_to_user_mode()
      ARM: entry: Drop the superfast ret_fast_syscall
      ARM: entry: Remove fast and offset register restore
      ARM: entry: Untangle ret_fast_syscall/to_user
      ARM: entry: Do not double-call exit functions
      ARM: entry: Move work processing to C
      ARM: entry: Stop exiting syscalls like IRQs
      ARM: entry: Complete syscall and IRQ transition to C
      ARM: entry: Create irqentry calls from kernel mode
      ARM: entry: Move in-kernel hardirq tracing to C
      ARM: irq: Add irqstack helper
      ARM: entry: Convert to generic entry
      ARM: entry: Handle dabt, pabt, and und as interrupts
      ARM: entry: Block IRQs in early IRQ context
      ARM: entry: Reimplement local restart in C

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  66 ++++++++++++
 arch/arm/include/asm/entry.h        |  14 +++
 arch/arm/include/asm/ptrace.h       |   8 +-
 arch/arm/include/asm/signal.h       |   4 -
 arch/arm/include/asm/stacktrace.h   |   2 +-
 arch/arm/include/asm/switch_to.h    |   4 +
 arch/arm/include/asm/syscall.h      |   7 ++
 arch/arm/include/asm/thread_info.h  |  22 ++--
 arch/arm/include/asm/traps.h        |   5 +-
 arch/arm/include/uapi/asm/ptrace.h  |   2 +
 arch/arm/kernel/Makefile            |   5 +-
 arch/arm/kernel/asm-offsets.c       |   1 +
 arch/arm/kernel/entry-armv.S        |  82 ++++-----------
 arch/arm/kernel/entry-common.S      | 198 +++++++++++++-----------------------
 arch/arm/kernel/entry-header.S      | 100 ++----------------
 arch/arm/kernel/entry.c             | 120 ++++++++++++++++++++++
 arch/arm/kernel/irq.c               |   6 ++
 arch/arm/kernel/irq.h               |   2 +
 arch/arm/kernel/process.c           |  25 ++++-
 arch/arm/kernel/ptrace.c            |  81 +--------------
 arch/arm/kernel/signal.c            |  68 +++----------
 arch/arm/kernel/syscall.c           |  59 +++++++++++
 arch/arm/kernel/traps.c             |  30 +-----
 arch/arm/mm/abort-ev4.S             |   2 +-
 arch/arm/mm/abort-ev4t.S            |   2 +-
 arch/arm/mm/abort-ev5t.S            |   4 +-
 arch/arm/mm/abort-ev5tj.S           |   6 +-
 arch/arm/mm/abort-ev6.S             |   2 +-
 arch/arm/mm/abort-ev7.S             |   2 +-
 arch/arm/mm/abort-lv4t.S            |  36 +++----
 arch/arm/mm/abort-macro.S           |   2 +-
 arch/arm/mm/abort-nommu.S           |   2 +-
 arch/arm/mm/fault.c                 |   4 +-
 arch/arm/mm/fault.h                 |   8 +-
 arch/arm/mm/pabort-legacy.S         |   2 +-
 arch/arm/mm/pabort-v6.S             |   2 +-
 arch/arm/mm/pabort-v7.S             |   2 +-
 38 files changed, 484 insertions(+), 504 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20240903-arm-generic-entry-ada145378bbe

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

