Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD818FDDB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749233441; cv=none; b=O8tU5NGoPo6mwFsy2GuPnjs+VhdBQF5wzSdd20dBciPkJf1uAG1k7EEtnPb73FQTdyk1LHjDra3tR8jOsuImgE05ent93/JXRi8EcJQaKIbQxU1iqrfhOqRp1slcGQNIxLgVbtnGn33YmJCXxKzymDIqxD1M4JVdXERlnTXv6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749233441; c=relaxed/simple;
	bh=w/xSUFKBWiGLE7Cp4S5k8nM33MEM3/93LykFyxMyrFw=;
	h=Date:Subject:CC:From:To:Message-ID; b=mWcOI5p1q9+LK9w4uyx5DpMpY+2F1lIne7HVeCoqHnNHgyY01Z7Ik1TBMygqx7/N9Pm65zo93ul1fyUb3UnbpaBZPIBllP7/q1QACy7veiwQWvhFOENL9dbTMFxTYZyAv6U0QusrHkvB8cnpswflEGGOvf+L8g1OV3ahQXSN88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=z+Zo+WAF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="z+Zo+WAF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2350fc2591dso18918055ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749233438; x=1749838238; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aEAN0z0rEb6MTT6tFdFj4VAFXSdmMFatRAaXMJXGjw=;
        b=z+Zo+WAFRqgwM/YxhI5tGy0JCiO7T9NePe2TPff4/94/mYDxFzV8BUtRI8WvH3+RNR
         yxRFrKoGc95v3ntYB8wWbfFKq9pJRtWI/yLaRaIA8Fma4up0XZYGuuXKqMgnsWrykPIi
         vqZrM6IpFAizQyvMMa6uJt/2xa3L/PKuXR+ROIsm5THiFGUSHhHogJC1UuKOPMsfpKgS
         ao9o5rUZnjOhb90/NF3U/hqzQ94kSpjYQbsRrI+UgAgil5+kS4IVDy0A8zMpTND/GZ3B
         SIkEfQ1X685piMCkO7ZwpXDXloXKylYjt2uwiNmbimAHvTeEh+BdnsQaUea4EnDwxDpB
         rzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749233438; x=1749838238;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aEAN0z0rEb6MTT6tFdFj4VAFXSdmMFatRAaXMJXGjw=;
        b=MTBF9vwBauW0FMXY7gJR5iOz/5J3lUaTzVgXZD1ra/Ne6uIQCPnDv9RDWqCtdE/RJN
         JP0/EpJCg3okh0Js27V6LoGwDdODCPF5+q9DFIDLFXpuHvL6wxx9RiwoiM6Jk+cbaUr8
         i4cj7+DzdA3NkhyIUJVhfg05GHVELVctF2TXJsWf9g+xSIUEtqXlZOxWr7iEPA0vat7C
         1hxJeldCE//L4Lt7Wnl0Sy95m21H/Tc7y1tTc4dd0QUcI4iVJegD4x3c3kzyPTyhK7HH
         Ze1wURIJSKxhgJmUKhVPE21lHrqQ9FNcCDuIo5D+T94gowKYW6fgyokg+EAesQPZZ/IK
         KlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAbo5izYibWSzpRWpEooFpAph99AU8pXcd2rHwnB+WeWegLcUNb6E9v/7KQtGvfSqatPfeyF+YQqZX3+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxasLncw4VARXwFm+d8WjMSKysK0Uw07W04YstL44EEaL+6KpO
	Bgpt35DtcVdiIFIgHT2Y6zEoqrmjZL62yngAhpbASSYpsJP/2Jemw+7X61mtz/7E5iMSgbo+cRE
	bkt3J
X-Gm-Gg: ASbGncvhMu6nD7hMca0voCdZFo13y9Ol+uJ4RBO+5raYLqTU6eMPcRy+3XAw+2LMq6W
	tv9SEw1J3VsoHa/ej9cfpfzZGbodlEjnL+oDFvmdbSjbgEqBGmQP2vd81aJ+FOZCjsTClIw6Kje
	9MYsIM7PBvgtd678aBrnq7IrmCGUG/jXzW42HULhgiltSLF5RvkxTMoaBxDVNq8gJ82VWITbB/1
	/IMMJkZvcYESnCZ7oBitfD1njTdciv9vNm0NLDNRlDz0gEeyKbnf+BqjQ2jLhh5vZRH60rbAy7N
	Zf/VOWMJZ4o7nEChCdghzMOlDDgqJjXKFJLuWxTkGHK/yM7w39H149M=
X-Google-Smtp-Source: AGHT+IGFC9wJPGy9w9zM4lQbeHkV4J++XWAD0duAQoWFoAKPpYUeIdoLVDuFGCHBWcITLHWBGnstPQ==
X-Received: by 2002:a17:903:234d:b0:231:e413:986c with SMTP id d9443c01a7336-23612451420mr970445ad.11.1749233438355;
        Fri, 06 Jun 2025 11:10:38 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:2724])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2360340605csm15254075ad.164.2025.06.06.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:10:37 -0700 (PDT)
Date: Fri, 06 Jun 2025 11:10:37 -0700 (PDT)
X-Google-Original-Date: Fri, 06 Jun 2025 11:09:56 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1

for you to fetch changes up to 51f1b16367dfde89a4ef5bee2270f6a4d523ef3b:

  Merge patch series "riscv: add SBI FWFT misaligned exception delegation support" (2025-06-05 14:03:19 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.16 Merge Window, Part 1

* Support for the FWFT SBI extension, which is part of SBI 3.0 and a
  dependency for many new SBI and ISA extensions.
* Support for getrandom() in the VDSO.
* Support for mseal.
* Optimized routines for raid6 syndrome and recovery calculations.
* kexec_file() supports loading Image-formatted kernel binaries.
* Improvements to the instruction patching framework to allow for atomic
  instruction patching, along with rules as to how systems need to
  behave in order to function correctly.
* Support for a handful of new ISA extensions: Svinval, Zicbop, Zabha,
  some SiFive vendor extensions.
* Various fixes and cleanups, including: misaligned access handling, perf
  symbol mangling, module loading, PUD THPs, and improved uaccess
  routines.

----------------------------------------------------------------
I don't plan on sending a part 2, it's way too late already.

Apologies in advance if something has gone off the rails here: between changing
jobs and some tree-related chaos there's been a lot of git surgery here.  I
poked around and think I managed to get things sane, but I've screwed that up
in the past.

The tests are all clean on my end for this one, both pre and post merge, and I
don't have anything from the bots overnight.

----------------------------------------------------------------
Alexandre Ghiti (7):
      riscv: Introduce Zicbop instructions
      riscv: Add support for Zicbop
      riscv: Add support for PUD THP
      Merge patch series "riscv: ftrace: atmoic patching and preempt improvements"
      riscv: hwprobe: export Zabha extension
      riscv: make unsafe user copy routines use existing assembly routines
      Merge patch series "riscv: Add Zicbop & prefetchw support"

Andy Chiu (11):
      riscv: ftrace: support fastcc in Clang for WITH_ARGS
      riscv: ftrace factor out code defined by !WITH_ARG
      riscv: ftrace: align patchable functions to 4 Byte boundary
      kernel: ftrace: export ftrace_sync_ipi
      riscv: ftrace: prepare ftrace for atomic code patching
      riscv: ftrace: do not use stop_machine to update code
      riscv: vector: Support calling schedule() for preemptible Vector
      riscv: add a data fence for CMODX in the kernel mode
      riscv: ftrace: support PREEMPT
      riscv: ftrace: support direct call using call_ops
      riscv: Documentation: add a description about dynamic ftrace

Atish Patra (1):
      MAINTAINERS: Update Atish's email address

Ben Dooks (1):
      riscv: save the SR_SUM status over switches

Chunyan Zhang (1):
      raid6: Add RISC-V SIMD syndrome and recovery calculations

Clément Léger (12):
      riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
      riscv: sbi: remove useless parenthesis
      riscv: sbi: add new SBI error mappings
      riscv: sbi: add FWFT extension interface
      riscv: sbi: add SBI FWFT extension calls
      riscv: misaligned: request misaligned exception from SBI
      riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
      riscv: misaligned: declare misaligned_access_speed under CONFIG_RISCV_MISALIGNED
      riscv: misaligned: move emulated access uniformity check in a function
      riscv: misaligned: add a function to check misalign trap delegability
      riscv: process: use unsigned int instead of unsigned long for put_user()
      riscv: uaccess: do not do misaligned accesses in get/put_user()

Cyan Yang (12):
      dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
      riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
      riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
      riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
      dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
      riscv: Add SiFive xsfvfnrclipxfqf vendor extension
      riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
      riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
      dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
      riscv: Add SiFive xsfvfwmaccqqq vendor extension
      riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
      riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension

Cyril Bur (1):
      riscv: uaccess: Only restore the CSR_STATUS SUM bit

Guo Ren (2):
      riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
      riscv: xchg: Prefetch the destination word for sc.w

Haibo Xu (1):
      perf symbols: Ignore mapping symbols on riscv

Jisheng Zhang (5):
      riscv: implement user_access_begin() and families
      riscv: uaccess: use input constraints for ptr of __put_user()
      riscv: uaccess: use 'asm goto' for put_user()
      riscv: uaccess: use 'asm_goto_output' for get_user()
      riscv: enable mseal sysmap for RV64

Joel Stanley (1):
      riscv: defconfig: Remove EXPERT

Mayuresh Chitale (1):
      riscv: mm: Add support for Svinval extension

Miquel Sabaté Solà (1):
      riscv: Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE

Nylon Chen (2):
      riscv: misaligned: fix sleeping function called during misaligned access handling
      riscv: misaligned: Add handling for ZCB instructions

Palmer Dabbelt (10):
      Merge patch series "riscv: misaligned: Add ZCB handling and fix sleeping function"
      Merge patch series "riscv: uaccess: optimisations"
      Merge patch series "riscv: Add vendor extensions support for SiFive"
      Revert "RISC-V: vDSO: Wire up getrandom() vDSO implementation"
      Merge patch series "riscv: kexec_file: Support loading Image binary file"
      Merge tag 'riscv-mw1-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      RISC-V: Documentation: Add enough title underlines to CMODX
      Merge tag 'riscv-mw2-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      Merge patch series "riscv: misaligned: fix misaligned accesses handling in put/get_user()"
      Merge patch series "riscv: add SBI FWFT misaligned exception delegation support"

Puranjay Mohan (1):
      riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS

Samuel Holland (1):
      riscv: module: Optimize PLT/GOT entry counting

Song Shuai (2):
      riscv: kexec_file: Split the loading of kernel and others
      riscv: kexec_file: Support loading Image binary file

Tiezhu Yang (1):
      riscv: Make regs_irqs_disabled() more clear

Xi Ruoyao (3):
      RISC-V: vDSO: Wire up getrandom() vDSO implementation
      riscv: vDSO: Remove --hash-style=both
      RISC-V: vDSO: Wire up getrandom() vDSO implementation

Yao Zi (1):
      riscv/kexec_file: Fix comment in purgatory relocator

谢致邦 (XIE Zhibang) (1):
      RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND

 .mailmap                                           |    3 +-
 Documentation/arch/riscv/cmodx.rst                 |   46 +-
 Documentation/arch/riscv/hwprobe.rst               |   26 +
 .../devicetree/bindings/riscv/extensions.yaml      |   25 +
 MAINTAINERS                                        |    4 +-
 arch/riscv/Kconfig                                 |   38 +-
 arch/riscv/Kconfig.vendor                          |   13 +
 arch/riscv/Makefile                                |    4 +-
 arch/riscv/configs/defconfig                       |   24 +-
 arch/riscv/include/asm/asm-prototypes.h            |    2 +-
 arch/riscv/include/asm/barrier.h                   |    5 -
 arch/riscv/include/asm/cacheflush.h                |    1 +
 arch/riscv/include/asm/cmpxchg.h                   |    4 +-
 arch/riscv/include/asm/cpufeature.h                |   14 +-
 arch/riscv/include/asm/ftrace.h                    |   62 +-
 arch/riscv/include/asm/hwcap.h                     |    1 +
 arch/riscv/include/asm/hwprobe.h                   |    3 +-
 arch/riscv/include/asm/image.h                     |    2 +
 arch/riscv/include/asm/insn-def.h                  |   66 ++
 arch/riscv/include/asm/kexec.h                     |    6 +
 arch/riscv/include/asm/pgtable-64.h                |    5 +-
 arch/riscv/include/asm/pgtable.h                   |   97 ++
 arch/riscv/include/asm/processor.h                 |   31 +-
 arch/riscv/include/asm/ptrace.h                    |    2 +-
 arch/riscv/include/asm/sbi.h                       |   60 +
 arch/riscv/include/asm/tlbflush.h                  |    2 +
 arch/riscv/include/asm/uaccess.h                   |  218 +++-
 arch/riscv/include/asm/vdso/getrandom.h            |   30 +
 arch/riscv/include/asm/vector.h                    |   22 +-
 arch/riscv/include/asm/vendor_extensions/sifive.h  |   16 +
 .../include/asm/vendor_extensions/sifive_hwprobe.h |   19 +
 arch/riscv/include/uapi/asm/hwprobe.h              |    2 +
 arch/riscv/include/uapi/asm/vendor/sifive.h        |    6 +
 arch/riscv/kernel/Makefile                         |    2 +-
 arch/riscv/kernel/asm-offsets.c                    |   18 +
 arch/riscv/kernel/cpufeature.c                     |   21 +
 arch/riscv/kernel/elf_kexec.c                      |  485 --------
 arch/riscv/kernel/entry.S                          |    9 +
 arch/riscv/kernel/ftrace.c                         |  242 ++--
 arch/riscv/kernel/kexec_elf.c                      |  144 +++
 arch/riscv/kernel/kexec_image.c                    |   96 ++
 arch/riscv/kernel/machine_kexec_file.c             |  361 ++++++
 arch/riscv/kernel/mcount-dyn.S                     |  117 +-
 arch/riscv/kernel/module-sections.c                |   81 +-
 arch/riscv/kernel/process.c                        |    2 +-
 arch/riscv/kernel/sbi.c                            |   81 +-
 arch/riscv/kernel/sys_hwprobe.c                    |    6 +
 arch/riscv/kernel/traps_misaligned.c               |  116 +-
 arch/riscv/kernel/unaligned_access_speed.c         |    8 +-
 arch/riscv/kernel/vdso.c                           |    2 +-
 arch/riscv/kernel/vdso/Makefile                    |   15 +-
 arch/riscv/kernel/vdso/getrandom.c                 |   10 +
 arch/riscv/kernel/vdso/vdso.lds.S                  |    3 +
 arch/riscv/kernel/vdso/vgetrandom-chacha.S         |  249 ++++
 arch/riscv/kernel/vendor_extensions.c              |   10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |    2 +
 arch/riscv/kernel/vendor_extensions/sifive.c       |   21 +
 .../kernel/vendor_extensions/sifive_hwprobe.c      |   22 +
 arch/riscv/lib/riscv_v_helpers.c                   |   11 +-
 arch/riscv/lib/uaccess.S                           |   50 +-
 arch/riscv/lib/uaccess_vector.S                    |   15 +-
 arch/riscv/mm/cacheflush.c                         |   29 +-
 arch/riscv/mm/pgtable.c                            |   10 +
 arch/riscv/mm/tlbflush.c                           |   38 +
 include/linux/ftrace.h                             |    2 +
 include/linux/raid/pq.h                            |    5 +
 kernel/trace/ftrace.c                              |    2 +-
 lib/raid6/Makefile                                 |    1 +
 lib/raid6/algos.c                                  |    9 +
 lib/raid6/recov_rvv.c                              |  229 ++++
 lib/raid6/rvv.c                                    | 1212 ++++++++++++++++++++
 lib/raid6/rvv.h                                    |   39 +
 tools/perf/util/symbol-elf.c                       |    6 +
 tools/testing/selftests/vDSO/vgetrandom-chacha.S   |    2 +
 74 files changed, 3787 insertions(+), 855 deletions(-)
 create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 delete mode 100644 arch/riscv/kernel/elf_kexec.c
 create mode 100644 arch/riscv/kernel/kexec_elf.c
 create mode 100644 arch/riscv/kernel/kexec_image.c
 create mode 100644 arch/riscv/kernel/vdso/getrandom.c
 create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
 create mode 100644 lib/raid6/recov_rvv.c
 create mode 100644 lib/raid6/rvv.c
 create mode 100644 lib/raid6/rvv.h
