Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C50C2E0
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628005; cv=none; b=hfxX32okLZYPWKIo3EaKtKlmREdTMoAVKJIir0rgvncJNg9IOI13ZSewYXjkT2dqOSMbBCrklR494fXWkqDwuFZ/DdQYYzyPQVdsP17t6L3j2i4AYh3l4aaISOLvLs3IVgM8t6aiVayI5ZUw+8clceaQa5mlQoi6G8plfzHDUtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628005; c=relaxed/simple;
	bh=t0ll4U5iJMoNLMg/yrUhAMz2Td3f3OaQyakV3KGWbV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCpQ5gtu8FydBdytx7vmQr1NhV18NTtosUS0I7g/16EOr8Ewg/Eilyx4gaW4CTMGVHg7MFypbtQ3obMvQac670aM6+75o9MxQaDd7h7c5oIk55p+C/3OsBLlr6gn092oyEamPircGSwtiHy+R24TW/OKn9YkT4l90wxOjibpw2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5bh+qtw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5bh+qtw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so2846242a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628002; x=1751232802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWA3StPiWkAfs4FcE2soHgzcqqw9xVR9Ej4dw8gKLE4=;
        b=B5bh+qtw3pvvSAHy6sS6CJsh+A9IL9RPAkvaOADZ/DQBHDvmFCqudBDMm+zKNsFXWb
         KjYEEPU1dH9Tpl+VmJKZLC9WBjzbtmjSQZt+1qnFzymsoaBDMY2gg8IG0xH79/vFJaDN
         CA6iN/HCr7HypsHW+GfNy8mtvsvb9jNoJwZ+aBmmr8gOaK8KjwL1Wf1Owd3bjeai4q11
         5AnliGPxkq7P6Z4aeOXlGNbK4H3Tuzbk1cHUL5zf2mr/vl0NvafubLtcsehHLsMZt4GL
         kI2gCgbelB2W46D2kz+OtzdtPN44zo8EBpx2UzS90Py625zMXQ4JHLdvTvZ4OAQigFgr
         6AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628002; x=1751232802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWA3StPiWkAfs4FcE2soHgzcqqw9xVR9Ej4dw8gKLE4=;
        b=wy/gu0txThnUhSZ2Br5RIarq6NC3YWtmtOVKnYOkrU5QbRejJbY68mxNJIrGL2ayws
         l3KJN5sE2Ra9iI8lUGP0A+sujaoM4fHL/24VSRe1Q1lVIe5h/YoUf4yKWXiUjmAcLxKI
         cAz9FGY1hlViCU42pmxesir6Hz01zrAoxgoc5Wn3sWlDUEjunr+7yZtdYqxbcDTns2wF
         kM9Gu/NEdZF1Gf3a83DocQDtqnc6tLRcGWKl+eeTQ+hx25NHAuPzp//MBlrSy0QSq6Bb
         tlGMmmWoV66o+qZf8P6MG7QS+76daTIRNrfncYTrRQaAH1PnTXFDOcELWBX3/geoKlIO
         xYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcKDimpQ4ZHA1p6HsCxRxu7jyQDaziymksyLSGhIRPnMnkAARYRsrWWvfCO/THfI52+gu4zXSS0KKmp3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9hByw/HBh4OLWQeVZLOluLvxOhVR/G6180SpF5ihDhoX3Xs4I
	Oyg4pIAfi7+WSJQzDbLtLgF7nCdI5SMEjhmC/o9qRaQP95wxk3uzEd9W
X-Gm-Gg: ASbGncsJqSz1LMwU2cqpuz1BGqzhUmbqZYPwHRQBYtP5UKvpj6CsXUs3II5b/Qut4mC
	bo+u18x0ufwJ1YvuWVss8M5RHCiPUISiy+2SobfoYisQXTe93fzxw9mQIDM3uf09pNJpa+iNKAS
	iyuJOI4HqiTMu+co8WMI8Ei5OXoTCwvOrfwgjSuKCmBWh+72ogRtXGlr5Ik+6PvAJWsfPFvK0kR
	Cyqj+c4dOlVYX8EvYCLNrMGNAEIKgQivrjW3++YCFqB35QOvn/kTCFBJd9V0PQX2dF6Y72hbyun
	rAjgQQfulKzpfh04/SWay45cIK6ohlD2UlUkJ3XsA3hGI5/cxHHdg5syEYQobD5SIx7ix92PRmp
	7+OdD/mpdZE1sfnGpbFYja3MEyYf2f8hc
X-Google-Smtp-Source: AGHT+IFpzxz28YJ7KUHpAeQcZWN/pVFUI5GcIqdDZHFqQtYD02f9HFVJDuPRXmKToeMZcqJl9FFJng==
X-Received: by 2002:a17:90b:5148:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-3159d57b142mr17909263a91.0.1750628002435;
        Sun, 22 Jun 2025 14:33:22 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a331babsm8982152a91.46.2025.06.22.14.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:21 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 9657AEF1EA4; Mon, 23 Jun 2025 06:33:14 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 00/13] nommu UML
Date: Mon, 23 Jun 2025 06:32:58 +0900
Message-ID: <cover.1750594487.git.thehajime@gmail.com>
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

v10:
- fix wrong comment on gs register handling ([09/13])
- remove unnecessary code of early syscall implementation ([04/13])

v9:
- rebase with the latest uml/next branch
- add performance numbers of new SECCOMP mode, and update results ([12/13])
- add a workaround for upstream change on MMU depedency to PCI drivers ([10/13])
- https://lore.kernel.org/all/cover.1750294482.git.thehajime@gmail.com/

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
 arch/x86/um/nommu/do_syscall_64.c       |  68 +++++++++
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
 46 files changed, 1306 insertions(+), 216 deletions(-)
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

