Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2991C2DC775
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987254; cv=none; b=XO1gjeZ5fYLcHKuj0MhrmGdMMfewW/o6qP5poM5IINrkAx9sJIFzuSPAVM50X9ayX1+0WRIGWvF20s9h5obV6wzLg1v9fpxrbl91rgAlJJmijfpMn/jUqxzVRzcIEfzqVHk0RmRAmKXqFShVg7Bt7U4msQgiByvOesBxB+FeR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987254; c=relaxed/simple;
	bh=xUOvUZABjbkguVrCQ2p9JNExBqSNEKfmFFVg2NEkQos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7aOx+SCCfVuCJkiOfPfF3B1By+QSMaGPpZRGFhkop0QAqB/+wPU27lUf3fSB4bPMhGewHu2q06E/oIZuOQZZFEkTu0s6X+zdSCDffedjUCh8aCZMO4mUX/wia/zzKNUnEBXRdjB/VNIaIkwIROnpE/9zpGNWmt6O6iyRN+W2Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEC3HTBy; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEC3HTBy"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224191d92e4so74098105ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987252; x=1746592052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yisMRp57N4S0wfYh8oqiHXWJMZDekJ9wSMzIJzMXX/Y=;
        b=AEC3HTByHkDNdNmG1d5/5xTPIrORRNgU7pYKoHF8oC9W6d5BXw+cowNi5F59iBISiO
         92dMZdCrL590w033vOkj6MysOq5iAyH1Kmwm2zhUv2MNv3UjrxBEeTyg5CP2+7cODQM6
         hFGUoDj9d5dPLvsen/ePNkmS0DkroFyMvpx8/wP8FlxR1MjAUoxbhW9lZDmnSwUEgghJ
         tJa5FRbJjWVFCffstvxtn35/xmnHeAhUKX3iZaS3yxRuHcvaxXzWE64hSkBY3vUs8V4E
         zMA2B9ovvOtdegV5pY1tbuzniwq8nS7S28lDu39oD0U50BSSHJddSidxrGeTqDpVQXA+
         C0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987252; x=1746592052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yisMRp57N4S0wfYh8oqiHXWJMZDekJ9wSMzIJzMXX/Y=;
        b=cYK1GrSOt+qxvolyv4DmnaHV0Q6HVf0ADGGBUNU2LL+EI9pPFb6jmXL8uDgSCsn/Z2
         kP9jrfWaY4uLA/wMTfYJRk1/BRv/Hxnzjk91fitSJ42iKRBTaj8VYB8t9sSbm3cw6apf
         G80V9d0NF19J1/JP8tV9iVxGzHO3nWa03VCEmd2i42HySqP6ZYtaPKcyiZdHTibzKLo9
         5TAHniSm9G+YZ84aLO/c9j8Ven1RhoIBC1VnVb0cst6ErK8speQfhAxvu/Q0p+LjyuQG
         Y+NCuMpE3JJ0jRflV+yS7wjKmXt+iQ45FkcEXYExrD7BBvjbks3g4GgtGS1x2rdRhwSr
         Vl7g==
X-Forwarded-Encrypted: i=1; AJvYcCWDFcWXirShAl4oFYwc/mtRhfz3a9Sum7iUlF6Cmwy514YoZ4RgoV/65WcST89GITv4cPKbsKC3PIo4W04=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZ+I97V7s9HN9B+ydF64tghPFIh4i3nFXwbUBwK0ObbmNwi52
	jcpzP9YcK2JiH4w6IMB/+1aUuPNjaCBXAYNDTsq6HzEqc0++pEZw
X-Gm-Gg: ASbGnctSHGiemDEPIHWNdy/7n2txvKo7EdCHYa7AerPHmGqxeO1ktEVL3wvwO+oZN7r
	+fdPmh3iMmS583n1sonoDvPTjXZWwQXjTUqujm3PNNimqghh7wFjiockwM74kNDpPunvIb+T2xw
	urhWUi+9VDyKd77R75qLeSufy5unIVYuenTBpdqll2cjRcBKJ4zws7sN4BkFdl8iGHliqwjugff
	/IGIPWYq2kAcCCWiO/CYlKPO50XGroC0DtZ+xNePIf2TMrv1bnQCBS8ODqXwDKbX/GbVkHqQY+Z
	ETT/nxB30Da2Ujdcxk7ihpkueXwi2aFBWmpCezYesYgC0AzLvIJW3WNMIC0KbtJOlvTzWWBNAbT
	x4rqz+A6Oo+MsB+3npboclw==
X-Google-Smtp-Source: AGHT+IGz+n4eA0EfImRh+nJJwNNRW/jRDDM+weYXGUXjyWriWtExutVfGVYvVxhjAZdB3/oAoBwgQg==
X-Received: by 2002:a17:902:e546:b0:229:1717:882a with SMTP id d9443c01a7336-22df5764855mr15094535ad.4.1745987252183;
        Tue, 29 Apr 2025 21:27:32 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b50sm112281735ad.130.2025.04.29.21.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:27:31 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 02A30E94812; Wed, 30 Apr 2025 13:27:28 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 00/12] nommu UML
Date: Wed, 30 Apr 2025 13:27:06 +0900
Message-ID: <cover.1745980082.git.thehajime@gmail.com>
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

v8:
- rebase with the latest uml/next branch
- clean up segv_handler to align with the latest uml ([9/12])

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

Hajime Tazaki (12):
  x86/um: nommu: elf loader for fdpic
  um: decouple MMU specific code from the common part
  um: nommu: memory handling
  x86/um: nommu: syscall handling
  um: nommu: seccomp syscalls hook
  x86/um: nommu: process/thread handling
  um: nommu: configure fs register on host syscall invocation
  x86/um/vdso: nommu: vdso memory update
  x86/um: nommu: signal handling
  um: change machine name for uname output
  um: nommu: add documentation of nommu UML
  um: nommu: plug nommu code into build system

 Documentation/virt/uml/nommu-uml.rst    | 177 +++++++++++++++++++++
 MAINTAINERS                             |   1 +
 arch/um/Kconfig                         |  14 +-
 arch/um/Makefile                        |  10 ++
 arch/um/configs/x86_64_nommu_defconfig  |  64 ++++++++
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
 arch/um/os-Linux/process.c              | 149 +++++++++++++++++-
 arch/um/os-Linux/seccomp.c              |  87 +++++++++++
 arch/um/os-Linux/signal.c               |   8 +
 arch/um/os-Linux/skas/process.c         | 132 ----------------
 arch/um/os-Linux/start_up.c             |  20 +++
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
 arch/x86/um/shared/sysdep/mcontext.h    |   4 +
 arch/x86/um/shared/sysdep/ptrace.h      |   2 +-
 arch/x86/um/shared/sysdep/syscalls_64.h |   6 +
 arch/x86/um/vdso/vma.c                  |  17 ++-
 fs/Kconfig.binfmt                       |   2 +-
 45 files changed, 1313 insertions(+), 214 deletions(-)
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


base-commit: 33c9da5dfb18c2ff5a88d01aca2cf253cd0ac3bc
-- 
2.43.0

