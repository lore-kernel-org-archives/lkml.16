Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60A211460
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054212; cv=none; b=sLdU9O9XEYbf0uq94KYw0AcY/NmY4jKt/XERqlRBEJqBlk/ltR/Ih8U6sBDVzhfA1LMF4djF7Rcg3TaclmtAPFL/i56YAR2JiPq2l0ypcIjpNewtQZQs9MNJsZdvcULty+8pWII3EtxIIiKJRrMRhzZwHfYPm7hA9iBRNm2EWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054212; c=relaxed/simple;
	bh=YjQ5WYa32mjCnYMxrwt384S4O2wH8ZuFJlgYW5NZY3o=;
	h=Date:Subject:CC:From:To:Message-ID; b=HXK4cb14XUHFDGs9299Ey9rvag1EzbDz6Ude8kf81AJxg9cXSrZm6AfteQPBUmeedd7EDK8nEVqAs/dP6y5q6ozXjAASaw4R7J0YY0ggbYsFXJ8bWPIM+0I6amfZxmwmeoGSRDgRzxMrHYR2/pJrbOlc7HwRhi9BE+8h5TqfRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=JzcTcYq9; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="JzcTcYq9"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74264d1832eso590719b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751054210; x=1751659010; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd16DZ58Lx6jlqmHg0BJHa0UNLPbmEfykzddN70SEj8=;
        b=JzcTcYq9SsSKkrVQ+U6JR4aL8nVNvsRS61PxD2eEkArxWDj5b7qXsKR/yomsZkt+Zo
         D4KyrwW1fxpST1sZ6xTzIVxMJRgl40t3/a0aT+nYdtK3bvA+th9uPACvaUvbJRu5BACG
         kGXVKjXL8hTQPaos3IEN7RxIimVCrKvfrVfDjYpRqKzTs4n+x6GB9yJVtNMsWUj14N+V
         YLYf8Tl3l8yc3bh185EsY6H6e7XXPSGpIZaOvAMJcd9PpEKxM4j3C1y3zw55+bpx7M7H
         8vk47ivn2lG2us+3pJF2jkGk/KxuLbSZr0UCP8etDLIIQrZcJ/0Yyxed/yaG2GQlG9uX
         LtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751054210; x=1751659010;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd16DZ58Lx6jlqmHg0BJHa0UNLPbmEfykzddN70SEj8=;
        b=TpBUGgqhv1VUT+IKKF0Ib1Au0VAUmgUa1IbkKjuQbUy9bzqorX2YXE/KSD0M4fmHq6
         RXnx+tn2I4803Nib3jBSsQ3S46H9KGrotQ/yPAgmhYGvwSVoxc784NsnNCy8X0pqHhnR
         SeYCo5TFPOlWE0sLvtJtadd85VE7cr+nL24AODy2tlWhJglyJuSTNNTlJNfcLJqvvymd
         WzTquu+AvFyvVrfGa3BbdnFxankpn3teJxBTaAQ3+JLdzfWIkMlnjcqAxDZqGtbeiOqt
         TOCXvBkO+Pdtb5ugmOvIHp7rwmJaYVRLlsPPgCdKf/nqdMUlQoI9nilrmM5+aMD2BnB5
         rQbg==
X-Forwarded-Encrypted: i=1; AJvYcCUO9KPyt9RiO9FS5cDBGVSXihJ5miapRfl0mw1y2vfWcbS6lrDQaWJFWJzAjK+Wue5TbBgdw8uJyYpOQS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsCG3yuJVkhInqSb67AGO9IL39sKJz/PXg9jaxq/LG4W0G47r
	k7oWDzO6xtkl1Ur3Un1SihZZCtxXdOjpvhZxr067DcO5L353NJySpHE3cw35QkWqOZXaW41haux
	CBJL7Xj4=
X-Gm-Gg: ASbGnctXVFIPMLlHISUwQAszqi0YfIH8TQsNPyognQ5C2B0SUqmbwZq+bEcG5Jz7tlx
	N0WxNeKs/NqTiuKvShpoVHEOpBwskKW4pLfnn9+yxJ7WEiCCZzpNqOCyDvUtHzuMJKeln1s99tV
	9atJdh66j7ocirJLNpeQy/9nP9ij4hGb7NlVDaeGz2F8BRKHUQBEZCaGGzMVInie48PyRMABZJP
	RzI4GEcJIvFuYgnAoxrEospj/h4mmQpYxbZeHIgF45IB3aBsNq0MFp9W8EBBPsUqeE9vlW2hk1b
	SMoSxLrSIitXBCcqea5e9IWUMUxgBe2v71n+aiWqbVPGoyhbgFG/DP4vOz5B
X-Google-Smtp-Source: AGHT+IEQsJdpkJDVb09SU1wr49pMTne/iSq+L4sJx5vWT2zoGuZipLcGALrfoeDygSP3qPW8yNJm9A==
X-Received: by 2002:a05:6a00:4b16:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74af6e662ddmr6737555b3a.7.1751054209885;
        Fri, 27 Jun 2025 12:56:49 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af5574390sm3201286b3a.90.2025.06.27.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:56:49 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:56:49 -0700 (PDT)
X-Google-Original-Date: Fri, 27 Jun 2025 12:56:41 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.16-rc4
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc4

for you to fetch changes up to c5136add3f9b4c23b8bbe5f4d722c95d4cfb936e:

  riscv: export boot_cpu_hartid (2025-06-23 16:30:05 -0700)

----------------------------------------------------------------
There's a trivial merge conflict in .mailmap that's in next, but seems like
that's just bad luck on the timing.

----------------------------------------------------------------
RISC-V Fixes for 5.16-rc4

* .rodata is no longer linkd into PT_DYNAMIC, it was not supposed to be
  there in the first place and resultst in invalid (but unused) entries.
  This manifests as at least warnings in llvm-readelf.
* A fix for runtime constants with all-0 upper 32-bits.  This should
  only manifest on MMU=n kernels.
* A fix for context save/restore on systems using the T-Head vector
  extensions.
* A fix for a conflicting "+r"/"r" register constraint in the VDSO
  getrandom syscall wrapper, which is undefined behavior in clang.
* A fix for a missing register clobber in the RVV raid6 implementation.
  This manifests as a NULL pointer reference on some compilers, but
  could trigger in other ways.
* Misaligned accesses from userspace at faulting addresses are now
  handled correctly.
* A fix for an incorrect optimization that allowed access_ok() to mark
  invalid addresses as accessible, which can result in userspace
  triggering BUG()s.
* A few fixes for build warnings, and an update to Drew's email address.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix sparse warning in vendor_extensions/sifive.c

Charles Mirabile (1):
      riscv: fix runtime constant support for nommu kernels

Chunyan Zhang (1):
      raid6: riscv: Fix NULL pointer dereference caused by a missing clobber

Drew Fustini (1):
      MAINTAINERS: Update Drew Fustini's email address

Fangrui Song (1):
      riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment

Han Gao (1):
      riscv: vector: Fix context save/restore with xtheadvector

Klara Modin (1):
      riscv: export boot_cpu_hartid

Nam Cao (2):
      Revert "riscv: misaligned: fix sleeping function called during misaligned access handling"
      Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"

Palmer Dabbelt (3):
      Merge tag 'riscv-fixes-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes
      Merge patch "Fix a segmentation fault also add raid6test for RISC-V support"
      RISC-V: uaccess: Wrap the get_user_8 uaccess macro

Xi Ruoyao (1):
      RISC-V: vDSO: Correct inline assembly constraints in the getrandom syscall wrapper

 .mailmap                                     |  1 +
 MAINTAINERS                                  |  2 +-
 arch/riscv/include/asm/pgtable.h             |  1 -
 arch/riscv/include/asm/runtime-const.h       |  2 +-
 arch/riscv/include/asm/uaccess.h             |  3 +-
 arch/riscv/include/asm/vdso/getrandom.h      |  2 +-
 arch/riscv/include/asm/vector.h              | 12 +++----
 arch/riscv/kernel/setup.c                    |  1 +
 arch/riscv/kernel/traps_misaligned.c         |  4 +--
 arch/riscv/kernel/vdso/vdso.lds.S            |  2 +-
 arch/riscv/kernel/vendor_extensions/sifive.c |  2 +-
 lib/raid6/rvv.c                              | 48 ++++++++++++++++------------
 12 files changed, 45 insertions(+), 35 deletions(-)
