Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C052356B4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807088; cv=none; b=iK2pNhUgUMjptRwx6CA/0am7H+67JD203TyAXhJWnYt0CZyWde0qPV3ZX3EW6GOP3EiyVj7k1g6vWGjpjPyaAcYy0yhXfGk8yl02hu4DaBNNzaRuWrm/kHpUgV4StVaUeRu4hphmGKL4lnevuSb1btB0VUQvr0FBBagXJXrE8JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807088; c=relaxed/simple;
	bh=OFbDPM5AB5eB3wPd6N2R1oLDMobycSvXMFYdlW1rN9o=;
	h=Date:Subject:CC:From:To:Message-ID; b=IzzqzhVCncK2ZS5HtP8+QeTRBNb1lZ+iOqTDeH71VzaSxk6P4z/Bv6zn1S2ppS6xXDm7LWqtHgrRpbAiJ5Ip7cFN0AXZGalRv6R6y2hrabMoEz8ObwOtB4LZsiXYZaFbqWnpJMMU4hsp+2PzGHehNQ0buuuARcdlSksREjDsMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=okvD4tzX; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="okvD4tzX"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2356941b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746807085; x=1747411885; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0aOqCnvyo4Ljy+61VpgCipssWf0Ra8mXAaOhu5oDyc=;
        b=okvD4tzXdLutmgMl/QUqNf52Tf3aqLiQAakOo9TZn0SJHC22GaN1gtr1i6QUVplLQD
         +2Ur5QStFQrLPiSZ32EvdgDNUl1z88izI/DpdhFy6DYxsbNeU2QW2VUSTlewDnZ2I116
         pk8cfehOR6KfFrFNk+SBNMtZObkhjilulAmsnGrS3L3+W9E1ku9VYgoRMn32eSbwyoHr
         9zwVa8X1vvnlIuGODGR0ZkOMUJLKf0SRCKPSM5hFanQbx0oafDkeOenVekZgBXgb4IRz
         W1j3gc5IFu8Hd5yfZybFN/WOumIWKSyyR4bqKjrQMRXLIsOri8QMp9Si7QfzzYt0RQxg
         nxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807085; x=1747411885;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0aOqCnvyo4Ljy+61VpgCipssWf0Ra8mXAaOhu5oDyc=;
        b=CzeShh9+Owctr7uuJI19Cs456BwdMDHL1KSc10XbEtaKotwyJGSaHGpTqLYgLbvyuS
         2kz3HP+O9OhKDr5ISkOGu2ZKDyb+y3QH32HVCqZDgI2Z7w9CTYoZ2F+In6JdiWvvmuRe
         f8Zsx2WCN/2waIgdbw5G9DbaryepkHSTsfctBt5yFRCBf1kQfJBS40raOIWfic6GoYPw
         5DJoCjoc0547OQdMQ1BZBeGnrdUlWeLSFTpdAdrooAAknXAGRAEa0lZNaz+rpkrAuErt
         d5XsbUUsbN6q/khBf1Vu6fuzBGYlLmr2mFcGCdi8EiU5UzaLJjQHvo/qHW7XUMq7Hh7M
         jfOg==
X-Forwarded-Encrypted: i=1; AJvYcCVpBJ0YKykgwuz+VlkPqxFu891g3xabFlu0TQdMxCudQCdv9M+M4dg7RF6iLWRPIickyrSd1XxHtUc8Fvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkREN8Gup5zNxvY5jbp2y6TQ+tmACVBcR/KSvsaR+IcXoLS06E
	q8nCTaYnOd3LlVLWmIwJdDSO2exnsECr4Ogu8rhKj0NlpT/dWWj++0d+kvJohLs=
X-Gm-Gg: ASbGncupJG2T6mSLWnXf9ifF7ENDIoxCZrNkhkcoRrqOBmI1+QzFlPtc3H7jGVvSnQz
	DuQxqfi1s5aHtQX0jNSwO/Vvatl2Q19Rppry1sZxw5bbKY5Y4P2ToHer03kdDNdK+TTomuYTn3+
	GlTXHBjQmpGKUJKTsf+utgIAKbjmPGr94ou1gfIGL59s9jp8cGfQkGVq0qiJLljpKI9WVaG6/Qu
	7D9KfYrmnAtjmzUPuEIhEyluX8dR4p2Enkta8d36mQ1wVwiRCfWHbHKRfMmekfD51gzsj9sF1ED
	6i4ocjtqGayWGwjwgH3khHUJLuD06zmHXoI=
X-Google-Smtp-Source: AGHT+IEaQvJ6cNeijm12GFun8Lse7HD+SQLVVMBCDaGkKmpgXK4wErI1P+ztFGBP7rqrmf4AzD++Rg==
X-Received: by 2002:a05:6a00:17a3:b0:736:34ff:be7 with SMTP id d2e1a72fcca58-7423c059c37mr5277416b3a.15.1746807085226;
        Fri, 09 May 2025 09:11:25 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237727a78sm1978937b3a.53.2025.05.09.09.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:11:24 -0700 (PDT)
Date: Fri, 09 May 2025 09:11:24 -0700 (PDT)
X-Google-Original-Date: Fri, 09 May 2025 09:11:22 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc6
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc6
merged tag 'riscv-fixes-6.15-rc6'

for you to fetch changes up to 01534f3e0dd75e27ed03e5542f0c7bf6aa7130f1:

  Merge tag 'riscv-fixes-6.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes (2025-05-08 09:40:21 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc6

* The compressed half-word misaligned access instructions (c.lhu, c.lh,
  and c.sh) from the Zcb extension are now properly emulated.
* A series of fixes to properly emulate permissions while handling
  userspace misaligned accesses.
* A pair of fixes for PR_GET_TAGGED_ADDR_CTRL to avoid accessing the
  envcfg CSR on systems that don't support that CSR, and to report those
  failures up to userspace.
* The .rela.dyn section is no longer stripped from vmlinux, as it is
  necessary to relocate the kernel under some conditions (including
  kexec).

----------------------------------------------------------------
Alexandre Ghiti (1):
      scripts: Do not strip .rela.dyn section

Clément Léger (3):
      riscv: misaligned: factorize trap handling
      riscv: misaligned: enable IRQs while handling misaligned accesses
      riscv: misaligned: use get_user() instead of __get_user()

Nam Cao (1):
      riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL

Nylon Chen (1):
      riscv: misaligned: Add handling for ZCB instructions

Palmer Dabbelt (1):
      Merge tag 'riscv-fixes-6.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes

Samuel Holland (1):
      riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm

 arch/riscv/kernel/process.c          |  6 ++++
 arch/riscv/kernel/traps.c            | 64 +++++++++++++++++++++---------------
 arch/riscv/kernel/traps_misaligned.c | 19 ++++++++++-
 scripts/Makefile.vmlinux             |  2 +-
 4 files changed, 62 insertions(+), 29 deletions(-)
