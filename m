Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7317D2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295078; cv=none; b=JftTqFz89blyKteKoZYdOXF77D2Nxg/BKPWYhmVkDS6vBDFT8gTI0RYoMqB6iy5gHi/0akXWCRdTHzVZFFPod2XM1HpeL0MGkdbrKpDa/u4K0QczcWEijLMv+idNj9wFIwA3AUAR8lSkMY1pCiCaJuyp9Ty+JhSBd/OSCR8EKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295078; c=relaxed/simple;
	bh=CGukvTsiYBnaUtyx6186HK9cuVS4EI7MpGv0k+ivaI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pcnrSIJHTWgl62vyoVsJks13ujYygq9mbHsfyGEpAVlXU7Eq8n7g1j9n6TlWwaW9U7B/ErveC38BCH8nqpyNh3X5JulYBX16Ag/vPkej8Qkb4bvmAK6jnlmdtyQw6FK0LwVwk3LKlbacQhN2mrLm/13P+c+eavujGJoi4w0BrqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtKyrTfr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtKyrTfr"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso173185b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295076; x=1750899876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLucpOXvaa4URh0gkHTacedQvpWCpnoQbI3w1+Ojf5s=;
        b=AtKyrTfrhTb4o0L6sAJUUOKYOpRYMmVPSfPl2T8a8mc1v5gD7mSDgQ8BPO3bys5IFv
         u3f3BfmLz6cLOR19Ih7c3r/1b/EIJajDGqLWW3A+y0GqZrPEtFSLKT+BkildqipmQb20
         Lbvdj+Y1hE03U8Bheu1MWfmQ3otSnTA6weFM3Oq+lzwV5tnC1aZJlnZwsqXCDxukBPgJ
         0/DjAn5Kuzm3EzU4m/fSSxxOdCGz0Pk6yOl7ZIfRnsma4yam8a+TdI4dP5IBiRoG2enG
         I3HWxoF6tIIYsKO5FQDOhNbW4S69Ig/2M9nQnSU5LDmAptfuh0EW47xuoUPtP37bGjgT
         wx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295076; x=1750899876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLucpOXvaa4URh0gkHTacedQvpWCpnoQbI3w1+Ojf5s=;
        b=UlVgc+Hx6FwEapD7kixoNdglu0phM4GF+F0u5FKCSysEiHJVeJcIspOWMWIQ1lPTGL
         5foV9A6XCdGR4T93LHgkza3EeRFLmaQ8+aE1WbjFSDpi6d4Pz755mEQUXpkJAC3TLGJW
         GnpsPgYIYD9wijepUZH+AlXO9mkETF5qvMmefaD5FfLg8YuYBxslKq7C4rMW+EguXawd
         nS+xv4TNmslClFMbgzqRRFrUa4gD2PchYSVMHSXcFi6Hyw99RQ04nawaXT9l5G28+5vr
         pnXYHw2Lq+N+FUhvZqdpZYKcP2miu5LtB7alGWj74w2Ca8wJqBxLIsll91GVb1tTcJIP
         urFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqtNQX310nxaAlWj1To+vzCH488yFZdQt/KHqIgDhknGuvjv0mVqTo/bKXIKdZ8gPILV1SwI96ArpuIGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxScCMuBhyoQW0rXXZJXSQ7Jo/jqyee+7XSi1blmXbFzzJwmh/j
	tUDI+4eLa8BkmFt/BTyBeLa0lbqqJf/ZQyX/RCUp3+Yu0hVdqAAXXIS0iOuCVw==
X-Gm-Gg: ASbGncscEXHUWbOcKGjAND8QCSv2pT/GvGkWJlDvknO3Zxyot+EH29hqkt2pxrvQlKs
	mvtEQjqM/KULDcBBFGzWHJdMXGctmE7c83+t6OhlAvaEPdvyQHfHgsGo//9+0ogGSvlqnsStXL1
	87U60VWMc1Yo7e8kETkF+lQhQT4+LXgf+1MChj3na+pqMtf3BNLp16qLW72SnD8UvpqsErePK0W
	r64see4OWONhWycEjvA/nkuFsj/xdM5jLM0lECo+ucbWLGIiDH21cxPopF/SN0xgOGxRB7r0bYV
	6NUqIFcafDZsM2bjUO7yByCFWFyqC9qq4waQfZPuwNL56upxQbqAIWbvaDWhjYDr7f6AV+IpEKR
	Eh13Ht8k1/Wgicn1gwkqTEXGO/dAFqg2V2Jg5KrLmefk=
X-Google-Smtp-Source: AGHT+IG6MFY9DkpD7kK44rBOQDepsenRjIZZchu6cctr0wOFSPPBWOJ6NPgY3oxDIP9/ASry+1fF+Q==
X-Received: by 2002:a05:6a00:b95:b0:740:9abe:4d94 with SMTP id d2e1a72fcca58-7489d00473bmr28379714b3a.21.1750295075499;
        Wed, 18 Jun 2025 18:04:35 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e7efcf8fsm2520391b3a.69.2025.06.18.18.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:34 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id DCC36ED6528; Thu, 19 Jun 2025 10:04:27 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 00/13] nommu UML
Date: Thu, 19 Jun 2025 10:04:04 +0900
Message-ID: <cover.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is another spin of nommu mode addition to UML.  It would
be nice to hear about your opinions on that.

There are still several limitations/issues which we already found;
here is the list of those issues.

- memory mapped by loadable modules are not distinguished from
  userspace memory.

-- Hajime

v9:
- rebase with the latest uml/next branch
- add performance numbers of new SECCOMP mode, and update results ([12/13])
- add a workaround for upstream change on MMU depedency to PCI drivers ([10/13])

v8:
- rebase with the latest uml/next branch
- clean up segv_handler to align with the latest uml ([9/12])
- https://lore.kernel.org/all/cover.1745980082.git.thehajime@gmail.com/

v7:
- properly handle FP register upon signal delivery [10/13]
- update benchmark result with new FP register handling [12/13]
- fix arch_has_single_step() for !MMU case [07/13]
- revert stack alignment as it is in uml/fixes tree [10/13]
- https://lore.kernel.org/all/cover.1737348399.git.thehajime@gmail.com/

v6:
- rebase to the latest uml/next tree
- more clean up on mmu/nommu for signal handling [10/13]
- rename functions of mcontext routines [06,10/13]
- added Acked-by tag for binfmt_elf_fdpic [02/13]
- https://lore.kernel.org/linux-um/cover.1736853925.git.thehajime@gmail.com/

v5:
- clean up stack manipulation code [05,06,07,10/13]
- https://lore.kernel.org/linux-um/cover.1733998168.git.thehajime@gmail.com/

v4:
- add arch/um/nommu, arch/x86/um/nommu to contain !MMU specific codes
- remove zpoline patch
- drop binfmt_elf_fdpic patch
- reduce ifndef CONFIG_MMU if possible
- split to elf header cleanup patch [01/13]
- fix kernel test robot warnings [06/13]
- fix coding styles [07/13]
- move task_top_of_stack definition [05/13]
- https://lore.kernel.org/linux-um/cover.1733652929.git.thehajime@gmail.com/

v3:
- https://lore.kernel.org/linux-um/cover.1733199769.git.thehajime@gmail.com/
- add seccomp-based syscall hook in addition to zpoline [06/13]
- remove RFC, add a line to MAINTAINERS file
- fix kernel test robot warnings [02/13,08/13,10/13]
- add base-commit tag to cover letter
- pull the latest uml/next
- clean up SIGSEGV handling [10/13]
- detect fsgsbase availability with elf aux vector [08/13]
- simplify vdso code with macros [09/13]

RFC v2:
- https://lore.kernel.org/linux-um/cover.1731290567.git.thehajime@gmail.com/
- base branch is now uml/linux.git instead of torvalds/linux.git.
- reorganize the patch series to clean up
- fixed various coding styles issues
- clean up exec code path [07/13]
- fixed the crash/SIGSEGV case on userspace programs [10/13]
- add seccomp filter to limit syscall caller address [06/13]
- detect fsgsbase availability with sigsetjmp/siglongjmp [08/13]
- removes unrelated changes
- removes unneeded ifndef CONFIG_MMU
- convert UML_CONFIG_MMU to CONFIG_MMU as using uml/linux.git
- proposed a patch of maple-tree issue (resolving a limitation in RFC v1)
  https://lore.kernel.org/linux-mm/20241108222834.3625217-1-thehajime@gmail.com/

RFC:
- https://lore.kernel.org/linux-um/cover.1729770373.git.thehajime@gmail.com/

Hajime Tazaki (13):
  x86/um: nommu: elf loader for fdpic
  um: decouple MMU specific code from the common part
  um: nommu: memory handling
  x86/um: nommu: syscall handling
  um: nommu: seccomp syscalls hook
  x86/um: nommu: process/thread handling
  um: nommu: configure fs register on host syscall invocation
  x86/um/vdso: nommu: vdso memory update
  x86/um: nommu: signal handling
  um: nommu: a work around for MMU dependency to PCI driver
  um: change machine name for uname output
  um: nommu: add documentation of nommu UML
  um: nommu: plug nommu code into build system

 Documentation/virt/uml/nommu-uml.rst    | 180 ++++++++++++++++++++++
 MAINTAINERS                             |   1 +
 arch/um/Kconfig                         |  14 +-
 arch/um/Makefile                        |  10 ++
 arch/um/configs/x86_64_nommu_defconfig  |  54 +++++++
 arch/um/include/asm/dma.h               |  13 ++
 arch/um/include/asm/futex.h             |   4 +
 arch/um/include/asm/mmu.h               |   8 +
 arch/um/include/asm/mmu_context.h       |   2 +
 arch/um/include/asm/ptrace-generic.h    |   8 +-
 arch/um/include/asm/uaccess.h           |   7 +-
 arch/um/include/shared/kern_util.h      |   6 +
 arch/um/include/shared/os.h             |  16 ++
 arch/um/kernel/Makefile                 |   5 +-
 arch/um/kernel/mem-pgtable.c            |  55 +++++++
 arch/um/kernel/mem.c                    |  38 +----
 arch/um/kernel/process.c                |  25 +++
 arch/um/kernel/skas/process.c           |  27 ----
 arch/um/kernel/um_arch.c                |   3 +
 arch/um/nommu/Makefile                  |   3 +
 arch/um/nommu/os-Linux/Makefile         |   7 +
 arch/um/nommu/os-Linux/signal.c         |  29 ++++
 arch/um/nommu/trap.c                    | 194 ++++++++++++++++++++++++
 arch/um/os-Linux/Makefile               |   8 +-
 arch/um/os-Linux/internal.h             |   5 +
 arch/um/os-Linux/mem.c                  |   4 +
 arch/um/os-Linux/process.c              | 144 +++++++++++++++++-
 arch/um/os-Linux/seccomp.c              |  87 +++++++++++
 arch/um/os-Linux/signal.c               |   8 +
 arch/um/os-Linux/skas/process.c         | 132 ----------------
 arch/um/os-Linux/start_up.c             |  25 ++-
 arch/um/os-Linux/util.c                 |   3 +-
 arch/x86/um/Makefile                    |   7 +-
 arch/x86/um/asm/elf.h                   |   8 +-
 arch/x86/um/nommu/Makefile              |   8 +
 arch/x86/um/nommu/do_syscall_64.c       |  80 ++++++++++
 arch/x86/um/nommu/entry_64.S            | 113 ++++++++++++++
 arch/x86/um/nommu/os-Linux/Makefile     |   6 +
 arch/x86/um/nommu/os-Linux/mcontext.c   |  24 +++
 arch/x86/um/nommu/syscalls.h            |  16 ++
 arch/x86/um/nommu/syscalls_64.c         | 115 ++++++++++++++
 arch/x86/um/shared/sysdep/mcontext.h    |   5 +
 arch/x86/um/shared/sysdep/ptrace.h      |   2 +-
 arch/x86/um/shared/sysdep/syscalls_64.h |   6 +
 arch/x86/um/vdso/vma.c                  |  17 ++-
 fs/Kconfig.binfmt                       |   2 +-
 46 files changed, 1318 insertions(+), 216 deletions(-)
 create mode 100644 Documentation/virt/uml/nommu-uml.rst
 create mode 100644 arch/um/configs/x86_64_nommu_defconfig
 create mode 100644 arch/um/kernel/mem-pgtable.c
 create mode 100644 arch/um/nommu/Makefile
 create mode 100644 arch/um/nommu/os-Linux/Makefile
 create mode 100644 arch/um/nommu/os-Linux/signal.c
 create mode 100644 arch/um/nommu/trap.c
 create mode 100644 arch/um/os-Linux/seccomp.c
 create mode 100644 arch/x86/um/nommu/Makefile
 create mode 100644 arch/x86/um/nommu/do_syscall_64.c
 create mode 100644 arch/x86/um/nommu/entry_64.S
 create mode 100644 arch/x86/um/nommu/os-Linux/Makefile
 create mode 100644 arch/x86/um/nommu/os-Linux/mcontext.c
 create mode 100644 arch/x86/um/nommu/syscalls.h
 create mode 100644 arch/x86/um/nommu/syscalls_64.c


base-commit: cfc4ca8986bb1f6182da6cd7bb57f228590b4643
-- 
2.43.0

