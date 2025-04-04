Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB21FECBA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782290; cv=none; b=e58VOTkrarthsgR9iCgqpUXUlp/U1c9Mct/oSLU5eHr+UO0xhn/2Oa+cfZ6501RdyVsTUz3st4T91DrRrwEV2h49O62P79wYUee9ao8JwnvBuQIppZ5LpUuYTycFcGImmq7IYv8+k5Qudi6OcO9n0LoZxGuT5TFHslSsR3ObSys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782290; c=relaxed/simple;
	bh=jkNDISDGiHlj5micVfqCOXWYN5Ysbb/c5q0bVFhjy/4=;
	h=Date:Subject:CC:From:To:Message-ID; b=MAVULmvfkORiME7D6Nx3/b4CTRiYR2O+YE6b55h1YRQpnL21IcZocmv42zUeV5WeaGxxnCyGppqcPS313G4VL+JtsexFFbtpVChuRZbSKqFHcNwWW/ePvz+n7VMeMtgysUPl5UP6h/TphWn7/Crq+B/5Jgteq+vtBE1RdjlGnb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vS393JZ5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vS393JZ5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227b650504fso22092205ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743782287; x=1744387087; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a93qrZwK32tWAKqaUVMn2Zj8PMNCzPIKT0Jeo46weyc=;
        b=vS393JZ5BNQG9n6Z1a2K4wYTjJZHaIVMBsIcwIHLRkcJYvKILYJ7PdZPUdloKT98ju
         SgJwag3rRfDsgr4hr2mCZTArua+Lz5l0bG1G36avOuFcIbP6kNSUn47ns54hXYQkm2Kh
         n0iapulv8VTrALv0Vfgabuq8giAy8lyjo0FhhP6gXkcyQiMUA65s70ObXPvF1m19+vJx
         Mrgfix0w3kjC1Hte6fzwnGuxnRfQFUMGY0ea/ii2coIyhVo1HMD/A+4LSYrKOPhww39M
         uYFAW/HWOMQQNLP84LzcEX7Yg7AoRS6TNqKc7BWDxQ4+zqpcfMtW57h9aYUrr4exc4vv
         sVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743782287; x=1744387087;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a93qrZwK32tWAKqaUVMn2Zj8PMNCzPIKT0Jeo46weyc=;
        b=b2OVqXl1qsYxs0xAfyXGZWPkxOjINAFIUy7OUBbjryGfoNff7HW3s7IbChl+m3NwQQ
         jiYN0yaDHW+9UlE8Z1bdaFMjBvD8eG4DEAoRledidfiN5qulkeDAwKGQ2zs+mMRHhyBx
         Sf0ymX/vG5iMcJ0lV6sw1VBVMWN1GR5MrsF5811bEy61c/rPNyp434t1o6C5T+1p3brq
         uwV4xZBxRNjD3ayiKRQxXWXjKfrNZ9Zy+Uo1uCxx29ael1pIEKqPuWulEPX9UeTOa6F0
         f897exs7JBXBBsvcou3U1wco1F/ptfculFGehHNH8pC40WJQrh3HD56AbRDWctRep5Jc
         lb/A==
X-Forwarded-Encrypted: i=1; AJvYcCUTF6FL4SY/4ud69KPPZ38YYPg8bPRTN3QlhaQOLv6s0DcKtnYU4OaYHqwZ/JOgumGYg5NO1fJMAi7DGZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjvxeTeI8TUPbAoAEwuVvQnZyGvN1MA7hf2JGvS20Jhn6LR381
	gVfBK8ypDusLDyt3tkCsGZChQARF/U3K8Lm9SWqQdNjEMxMtuUbnXyhOPXnsZ8U24vokphzp3ZF
	U
X-Gm-Gg: ASbGnct3OPxCgBCRbW0MBInZy32+iLrVAY2zqCjxlZgfpMBqDtB79tNWfUdUiVDC0jA
	Z3zhIRAKMXGJ+/aP/s7i3VyPyOjizBCpcboYv+0Hi584svrig4Hsy6SKk2mQuRlgWTE6Edqrlkj
	hEozoRohxv97cADonrx1NcSgpKqMxbQyE7u9vtwWAJbODqS/tQZJ3dNyqwlGjpngGoVR4PfK/Bv
	BV4eB+anpshW73XaVuzG+c2kRstEiY8uKjS2To09gaSuzhwL0NUkuo/ugEzFWnrvFLrqNEE/9IT
	I1aYtbNoscQMCMQLGlD4aTSu9PavGCk2QxJMCP7XzCPlSXNjawEhCg==
X-Google-Smtp-Source: AGHT+IHhhyMe06/G/7b5OFlGVJdZBNhQ2nVZQf4160FpDxAnIs0B8r+hzHXSzQ9vQoO7qo+JFMo5pQ==
X-Received: by 2002:a17:902:ea09:b0:220:d909:1734 with SMTP id d9443c01a7336-22a8a05a8b4mr48461375ad.14.1743782286775;
        Fri, 04 Apr 2025 08:58:06 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bffc7sm34104925ad.70.2025.04.04.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:58:06 -0700 (PDT)
Date: Fri, 04 Apr 2025 08:58:06 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Apr 2025 08:57:49 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1

for you to fetch changes up to 3eb64093f533a29d3291a463fd65126bf430ba60:

  Merge tag 'riscv-mw2-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next (2025-04-03 08:53:19 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.15 Merge Window, Part 1

* The sub-architecture selection Kconfig system has been cleaned up,
  the documentation has been improved, and various detections have been
  fixed.
* The vector-related extensions dependencies are now validated when
  parsing from device tree and in the DT bindings.
* Misaligned access probing can be overridden via a kernel command-line
  parameter, along with various fixes to misalign access handling.
* Support for relocatable !MMU kernels builds.
* Support for hpge pfnmaps, which should improve TLB utilization.
* Support for runtime constants, which improves the d_hash()
  performance.
* Support for bfloat16, Zicbom, Zaamo, Zalrsc, Zicntr, Zihpm.
* Various fixes, including:
      - We were missing a secondary mmu notifier call when flushing the
	tlb which is required for IOMMU.
      - Fix ftrace panics by saving the registers as expected by ftrace.
      - Fix a couple of stimecmp usage related to cpu hotplug.
      - purgatory_start is now aligned as per the STVEC requirements.
      - A fix for hugetlb when calculating the size of non-present PTEs.

----------------------------------------------------------------
Unless something goes way off the rails I don't have plans for a part 2, this
is very late already.  Aside from that things look clean on my end.

We have a pending semantic merge conflict with -next, specifically 2f4ab3ac10e1
("mm: support tlbbatch flush for a range of PTEs") adds a new "start" parameter
to arch_tlbbatch_add_pending(), while d9be2b9b60497a ("riscv: Call secondary
mmu notifier when flushing the tlb") introduces a "start" local variable.
Alex's suggested fix looks good to me:

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index c25a40aa2fe0..c22d5eb2b185 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -192,10 +192,9 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
-	unsigned long start = uaddr & PAGE_MASK;
-
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
-	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start & PAGE_MASK,
+						    (end & PAGE_MASK) + PAGE_SIZE);
 }

 void arch_flush_tlb_batched_pending(struct mm_struct *mm)


----------------------------------------------------------------
Alexandre Ghiti (11):
      Merge patch series "RISC-V: clarify what some RISCV_ISA* config options do & redo Zbb toolchain dependency"
      riscv: Call secondary mmu notifier when flushing the tlb
      Merge patch series "riscv: Add bfloat16 instruction support"
      Merge patch series "Support SSTC while PM operations"
      riscv: Fix missing __free_pages() in check_vector_unaligned_access()
      Merge patch series "riscv: add support for Zaamo and Zalrsc extensions"
      Merge patch series "riscv: Unaligned access speed probing fixes and skipping"
      Merge patch series "riscv: Add runtime constant support"
      riscv: Fix hugetlb retrieval of number of ptes in case of !present pte
      Merge patch series "Add some validation for vector, vector crypto and fp stuff"
      riscv: Make sure toolchain supports zba before using zba instructions

Andrew Bresticker (1):
      riscv: Support huge pfnmaps

Andrew Jones (8):
      riscv: Annotate unaligned access init functions
      riscv: Fix riscv_online_cpu_vec
      riscv: Fix check_unaligned_access_all_cpus
      riscv: Change check_unaligned_access_speed_all_cpus to void
      riscv: Fix set up of cpu hotplug callbacks
      riscv: Fix set up of vector cpu hotplug callback
      riscv: Add parameter for skipping access speed tests
      Documentation/kernel-parameters: Add riscv unaligned speed parameters

Björn Töpel (1):
      riscv/purgatory: 4B align purgatory_start

Charlie Jenkins (5):
      riscv: tracing: Fix __write_overflow_field in ftrace_partial_regs()
      riscv: Move nop definition to insn-def.h
      riscv: Add runtime constant support
      riscv: Add norvc after .option arch in runtime const
      riscv: Add norvc after .option arch in runtime const

Chin Yik Ming (2):
      riscv: Simplify base extension checks and direct boolean return
      riscv: Fix a comment typo in set_mm_asid()

Clément Léger (6):
      riscv: remove useless pc check in stacktrace handling
      dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
      riscv: add parsing for Zaamo and Zalrsc extensions
      riscv: hwprobe: export Zaamo and Zalrsc extensions
      RISC-V: KVM: Allow Zaamo/Zalrsc extensions for Guest/VM
      KVM: riscv: selftests: Add Zaamo/Zalrsc extensions to get-reg-list test

Conor Dooley (8):
      RISC-V: clarify what some RISCV_ISA* config options do
      RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
      RISC-V: add vector extension validation checks
      RISC-V: add vector crypto extension validation checks
      RISC-V: add f & d extension validation checks
      dt-bindings: riscv: d requires f
      dt-bindings: riscv: add vector sub-extension dependencies
      dt-bindings: riscv: document vector crypto requirements

Geert Uytterhoeven (2):
      riscv: defconfig: Disable Renesas SoC support
      riscv: Remove duplicate CLINT_TIMER selections

Guo Ren (1):
      riscv: Implement smp_cond_load8/16() with Zawrs

Ignacio Encinas (1):
      selftests: riscv: fix v_exec_initval_nolibc.c

Inochi Amaoto (3):
      dt-bindings: riscv: add bfloat16 ISA extension description
      riscv: add ISA extension parsing for bfloat16 ISA extension
      riscv: hwprobe: export bfloat16 ISA extension

Jinjie Ruan (1):
      riscv: Remove unused TASK_TI_FLAGS

Juhan Jin (1):
      riscv: ftrace: Add parentheses in macro definitions of make_call_t0 and make_call_ra

Masahiro Yamada (1):
      riscv: migrate to the generic rule for built-in DTB

Miquel Sabaté Solà (1):
      riscv: hwprobe: export Zicntr and Zihpm extensions

Nick Hu (2):
      riscv: Add stimecmp save and restore
      clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug

Palmer Dabbelt (4):
      Merge tag 'riscv-mw1-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      RISC-V: errata: Use medany for relocatable builds
      Merge patch series "riscv: Relocatable NOMMU kernels"
      Merge tag 'riscv-mw2-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next

Pu Lehui (2):
      riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
      riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler

Samuel Holland (6):
      riscv: Remove duplicate CONFIG_PAGE_OFFSET definition
      riscv: Allow NOMMU kernels to access all of RAM
      riscv: Support CONFIG_RELOCATABLE on NOMMU
      asm-generic: Always define Elf_Rel and Elf_Rela
      riscv: Support CONFIG_RELOCATABLE on riscv32
      riscv: Remove CONFIG_PAGE_OFFSET

Thomas Weißschuh (1):
      riscv: mm: Don't use %pK through printk

Tingbo Liao (1):
      riscv: Fix the __riscv_copy_vec_words_unaligned implementation

Yao Zi (1):
      riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator

Yunhui Cui (4):
      RISC-V: Enable cbo.clean/flush in usermode
      RISC-V: hwprobe: Expose Zicbom extension and its block size
      RISC-V: selftests: Add TEST_ZICBOM into CBO tests
      riscv: print hartid on bringup

Zixian Zeng (1):
      riscv: remove redundant CMDLINE_FORCE check

 Documentation/admin-guide/kernel-parameters.txt    |  16 ++
 Documentation/arch/riscv/hwprobe.rst               |  32 +++
 .../devicetree/bindings/riscv/extensions.yaml      | 149 ++++++++++++
 arch/riscv/Kbuild                                  |   1 -
 arch/riscv/Kconfig                                 |  84 ++++---
 arch/riscv/Kconfig.socs                            |   2 -
 arch/riscv/Makefile                                |   1 -
 arch/riscv/boot/dts/Makefile                       |   2 -
 arch/riscv/configs/defconfig                       |   2 -
 arch/riscv/configs/nommu_k210_defconfig            |   2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |   2 +-
 arch/riscv/errata/Makefile                         |   6 +-
 arch/riscv/include/asm/arch_hweight.h              |   6 +-
 arch/riscv/include/asm/asm.h                       |   1 +
 arch/riscv/include/asm/bitops.h                    |   4 +-
 arch/riscv/include/asm/checksum.h                  |   3 +-
 arch/riscv/include/asm/cmpxchg.h                   |  38 ++-
 arch/riscv/include/asm/cpufeature.h                |   7 +-
 arch/riscv/include/asm/ftrace.h                    |   7 +-
 arch/riscv/include/asm/hwcap.h                     |   5 +
 arch/riscv/include/asm/hwprobe.h                   |   2 +-
 arch/riscv/include/asm/insn-def.h                  |   3 +
 arch/riscv/include/asm/page.h                      |  27 +--
 arch/riscv/include/asm/pgtable.h                   |  55 ++++-
 arch/riscv/include/asm/ptrace.h                    |  18 +-
 arch/riscv/include/asm/runtime-const.h             | 268 +++++++++++++++++++++
 arch/riscv/include/asm/suspend.h                   |   4 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   9 +
 arch/riscv/include/uapi/asm/kvm.h                  |   2 +
 arch/riscv/kernel/asm-offsets.c                    |   1 -
 arch/riscv/kernel/cpufeature.c                     | 197 +++++++++++----
 arch/riscv/kernel/elf_kexec.c                      |   3 +
 arch/riscv/kernel/ftrace.c                         |   6 +-
 arch/riscv/kernel/jump_label.c                     |   4 +-
 arch/riscv/kernel/mcount.S                         |  24 +-
 arch/riscv/kernel/setup.c                          |   5 -
 arch/riscv/kernel/smp.c                            |   2 +
 arch/riscv/kernel/smpboot.c                        |   4 +
 arch/riscv/kernel/stacktrace.c                     |   2 +-
 arch/riscv/kernel/suspend.c                        |  14 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  15 +-
 arch/riscv/kernel/traps_misaligned.c               |  14 +-
 arch/riscv/kernel/unaligned_access_speed.c         | 242 ++++++++++++-------
 arch/riscv/kernel/vec-copy-unaligned.S             |   2 +-
 arch/riscv/kernel/vendor_extensions.c              |   2 +-
 arch/riscv/kernel/vmlinux.lds.S                    |   3 +
 arch/riscv/kvm/vcpu_onereg.c                       |   4 +
 arch/riscv/lib/csum.c                              |  21 +-
 arch/riscv/lib/strcmp.S                            |   5 +-
 arch/riscv/lib/strlen.S                            |   5 +-
 arch/riscv/lib/strncmp.S                           |   5 +-
 arch/riscv/mm/context.c                            |   2 +-
 arch/riscv/mm/hugetlbpage.c                        |  76 +++---
 arch/riscv/mm/init.c                               |  97 ++++----
 arch/riscv/mm/physaddr.c                           |   2 +-
 arch/riscv/mm/tlbflush.c                           |  37 +--
 arch/riscv/purgatory/entry.S                       |   1 +
 drivers/clocksource/timer-riscv.c                  |   6 +
 include/asm-generic/module.h                       |   8 -
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |   8 +
 tools/testing/selftests/riscv/hwprobe/cbo.c        |  66 ++++-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  10 +-
 62 files changed, 1252 insertions(+), 399 deletions(-)
 create mode 100644 arch/riscv/include/asm/runtime-const.h
