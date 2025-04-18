Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7AE8F77
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998282; cv=none; b=pUU9Z5CNuTgwyl0esysKeJOsQ69B0G0S3YQt3hgc9iILn2dfWh+owpdweA7WgQpWk/l7piG3xu1yjC996AhmkoK7dEkG7I0KpQZhn27BZjLnWisX0kYlfk9TbkcEQHxwdYAF/6oZniBeYf8FBr+twrFA/LOaunLjzDzR610AhFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998282; c=relaxed/simple;
	bh=lUe2Im3hgmPvqNU0ZhoHWSMbiSlthlEw0jzE7+pNyxM=;
	h=Date:Subject:CC:From:To:Message-ID; b=g6n1uZt9ykqAjLzt545/H2IRW/f6mv9cNSVAFB77pIkfPJyLBSh4+d+r0Q+LAlqOmi8ZMgA0ItaOxEynvmzozI2Yet8XGVgc2GeS4BMnLAKLKgHss48OpqGyuih5gkjAewcU8C5Zh4npO+6yuQGxh3xgxqZ1e/AhursoSZNY0Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CclAPrMV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CclAPrMV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c3407a87aso32513025ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744998279; x=1745603079; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2sScoLYMaDn6o5OZxST51MbutXhshEvaoFDk5vxulw=;
        b=CclAPrMVODX890ndaoSL4HZ8Vm2RG7IqPCCNe7NPzJbgvtk1QIot65nZHwrvvU8NsE
         kUfMmKiPkvG7Ki5ea0URHOc5CJiGMDfKyKtCpYvSPTCHDUFEPIweGUFRS2vVIp8TIauN
         NqgB098ht3xZ4hYNzp5Fw432zMg7LPQsy4G7r5MSB91TAggONsvRvMfLr6T6Ry+8i8gu
         m+EjXiLEnTrzSiBQiv+hx3D5uzVDPIZcm2qDW4tOP91gQbY17+aipEQHI3jJNhUM0rga
         0JdzIljCW6wGhqOWfhXcXLj5MvLTtA0LTOS7yomTikZvDaXedPBQ99PeDkt7Pnf7guLB
         rPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998279; x=1745603079;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2sScoLYMaDn6o5OZxST51MbutXhshEvaoFDk5vxulw=;
        b=me05lOys3YOidR8F1eOzmrnpZNIeW1mGkQU5gUjzmyuR2rtCohOMQcV4iwaDOSsSii
         MJ4oNepLS6fyFdX54igsRpAqtD7bRKstrUaRJKIwujKffphuMdrYkD6fMu6y87KjduJy
         YgTzL613gLP47m9fU6vO64PseF4KlMej3c1gjExcwe1OHOUWijotVqknE+SLZqkJVw29
         USLxZRnvLK1cQBUFBczwsTT72lDqLiim+jCgIX8RsPVHCv587vp82HGOL2P7k0NTYuud
         QS8WtlYjfoZdnrjzehR1+PFZ0xy5YVAyrKi1afbEVlfIWCUNOygDRNt12Wh1xNUbJSfR
         DZcw==
X-Forwarded-Encrypted: i=1; AJvYcCWPYpFCbPiK+D2raXozF50t29dbBEzg3hWiNxSXVA++t94Nm+gEJAR3BL5M5yu9KeZqhCrnU1tpCRl+T+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkwRityLsXlrnzqfA3qT0P4S/tQZIyeh7r3xa6/pIcZ74c/ugo
	GB5mlBp0C7+iAgAiNnjQCLL72MKyYc2zTULVNGpTwiMtDDz4/COS4E9NYhKtQnMjq4mX8fR4D2f
	K
X-Gm-Gg: ASbGnctqMc2rXRRgkQfYJP0hVjFzEWx87awzOZj1LpIIhtaCpt9BxiTOcoZlzjIUu+i
	A8XFELqegbXaVzUFK8oifFbETzimZ451sVIRkaR/In9TrvUtWKfu7M7Cxl7h0iRjQhtUyNFugz1
	XA3fD8PezHxHscFO4evl07IyPWlmFBJDvCwRZs5Jqeu8M3H64alEiALfelMu/gJWlhhxRfSA9yX
	0eGR9WcCnTqK/u3fdTe+HDmxgAX5QBSH94X7gCWxGit3Zu5rRftu1uHs1nME7FY0yDeDNFveqOS
	94UAHsePhBW5mC3kh6GTN95evSaUiKTP1Ok=
X-Google-Smtp-Source: AGHT+IEmnUz2ElBuRHEXkqy+dL2GRgVQy/otpmUsX+CAcGHoJWiC25Bm0HyRcKLFwhTOA5Qyz0xf0A==
X-Received: by 2002:a17:902:e808:b0:223:8256:533d with SMTP id d9443c01a7336-22c536207d3mr51359195ad.46.1744998278702;
        Fri, 18 Apr 2025 10:44:38 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaeb59dsm1933880b3a.177.2025.04.18.10.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:44:38 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:44:38 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Apr 2025 10:44:34 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc3
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc3
Primary key fingerprint: 00CE 76D1 8349 60DF CE88  6DF8 EF4C A150 2CCB AB41
     Subkey fingerprint: 2B3C 3747 4468 43B2 4A94  3A7A 2E13 19F3 5FBB 1889
merged tag 'riscv-fixes-6.15-rc3'

for you to fetch changes up to 615e705fc8c7bdb6816faf09b5b16a0441f050e7:

  Merge tag 'riscv-fixes-6.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes (2025-04-16 11:10:25 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc3

* A fix for an issue where C instructions ended up in non-C builds, do
  to some broken inline assembly in the KGDB breakpoint insertion code.
* A fix to avoid spurious printk messages about misaligned access
  performance probing.
* A fix for a handful of issues with /proc/iomem's reserved region
  handling.
* A pair of fixes for module relocation processing.
* A few build-time fixes.

----------------------------------------------------------------
This got hung up last week on the plugin ICE, which I thought was a RISC-V
problem but actually looks to be something pretty generic.

----------------------------------------------------------------
Andrew Jones (2):
      riscv: Fix unaligned access info messages
      riscv: Provide all alternative macros all the time

Björn Töpel (1):
      riscv: Properly export reserved regions in /proc/iomem

Nam Cao (1):
      Documentation: riscv: Fix typo MIMPLID -> MIMPID

Nathan Chancellor (2):
      riscv: Avoid fortify warning in syscall_get_arguments()
      riscv: Avoid fortify warning in syscall_get_arguments()

Palmer Dabbelt (3):
      Merge tag 'riscv-fixes-6.15-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes
      Merge patch series "riscv: Rework the arch_kgdb_breakpoint() implementation"
      Merge tag 'riscv-fixes-6.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes

Samuel Holland (2):
      riscv: module: Fix out-of-bounds relocation access
      riscv: module: Allocate PLT entries for R_RISCV_PLT32

WangYuli (2):
      riscv: KGDB: Do not inline arch_kgdb_breakpoint()
      riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break

Will Pierce (1):
      riscv: Use kvmalloc_array on relocation_hashtable

 Documentation/arch/riscv/hwprobe.rst        |  2 +-
 arch/riscv/include/asm/alternative-macros.h | 19 ++++++---------
 arch/riscv/include/asm/kgdb.h               |  9 +-------
 arch/riscv/include/asm/syscall.h            |  7 ++++--
 arch/riscv/kernel/kgdb.c                    |  6 +++++
 arch/riscv/kernel/module-sections.c         | 13 ++++++-----
 arch/riscv/kernel/module.c                  | 11 +++++----
 arch/riscv/kernel/setup.c                   | 36 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/unaligned_access_speed.c  | 35 +++++++++++++++++-----------
 9 files changed, 89 insertions(+), 49 deletions(-)
