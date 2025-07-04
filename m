Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E94230BF8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643833; cv=none; b=fGd6oeMHWGJVglDsIELT5IA+swJHIQcdqjV+KPhicOxkcN6CEJJMJJwGI6IYkqcSrQveqJLNKb+z9Wq5uFcfKMDpF5zmXT7bC7W24E/5jH7SW6xmuM6O+Q6R8Nf7n9QIz466/O7SzHY8QF3xLwJE32to3bFL9YNArNXLDYWcB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643833; c=relaxed/simple;
	bh=E+SPCuPi3jpi+MlAluR+PuW02HQ8QNUf1lFxo1VmG2A=;
	h=Date:Subject:CC:From:To:Message-ID; b=aqGZnxBiaUNRooiDwi4RBJHZvi7xbVzux0nRvglCyDAUb8ViEkdmq7ayvu6qwhdkLtrpbqCLB5MLEIHRIjTq6n7+C5LIFuiQo2o0dazMbJz/VWm4HrJuvgVsROF4a2RNwiAaSMNJvQRdHNcyitJ+5mzqd9zRdH6GRJZyTC3zv0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=WrALbTEC; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="WrALbTEC"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7490702fc7cso704049b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751643831; x=1752248631; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Fi7MgAC308LIP//ZnE1u51RXI1xNNSWwC3rsR+KjlY=;
        b=WrALbTECwBkdIal/rocz5DaS1AfFLtDs3/wTkiTGdh42G3wMa/McLpTGU5+cwiOAWE
         yR2NMDeaXTmSQq4YBMio9Uu4W1Z/nrsb3V/ny6TQL4LAcgn+tT8KSVEJ+x8Ce6C5Pykf
         4cRP6MMtkBl/SXjBljdtp7CzY8oNI0CdHF/M9LS/tArgOXnztD2S09JhvFCV1+MdkYzk
         OajrSILngpQugS0vuBuXY2rFMgiHqudTBGLe8XMok9WeSYq+aHEmq7gcDDHpA3pf1/Dp
         8Fxrxs1SW1gdQtB1PpbsFo01qZWwaoEs07G6k44Msx/SCRVipFzrBbYEnoNx4tP76RlD
         /nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643831; x=1752248631;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Fi7MgAC308LIP//ZnE1u51RXI1xNNSWwC3rsR+KjlY=;
        b=JGpA1uqCAmTHWp1vl1ULlTPLVoaXIjoYs/g03WSHnYr3dLE2f1dbEL+JfKLKqbNyZ+
         ++xXPGQ+dfjyarVcoHvmJ9OVkN9Z+S5irwiS/a1ICJ7mnbbAihmuA1wfKtc2AancZMPW
         vLUmoe46YxO1QCIn/tiodkqCgs0gdEq193IokD1d7HGphvET/omyMrHOmy56FxmpoVno
         Jd5RFpVBOxwF94ItF173bLHqD5L1HdfVoGtS9jh2TcVYHDxdG9rBcv1TbZ387KHe/pJ+
         09trT2Vad6ZLFXqhRqNdaNdXsoYgrx3aShFrpVVSf9A0cfbEQeb9DYxGGKJX5ERM2KJT
         Iyzw==
X-Forwarded-Encrypted: i=1; AJvYcCUVXMb1Y7pKSUO9iB1RfsuB+odFizYDsamGgMfqQBqBXef1GQgB1V3XYPMGbryVl38MN1EToXH1Wy+I77I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwURcJ3CGqRbgl05B5/kTcV3xnj6Jw12+3NkIwlYOHl/XkU0aDt
	6T2D6PNzi8Cnl2pnGTu59KwqVxH6NQJ/UlKF17/xZ0ENeJ8zGT7Pi78mZg4XasnLAjk=
X-Gm-Gg: ASbGncvr8Z4yOOa0DyZpmmnpjpYevKD1bdwVZqgjFg8+lL3xgFNVCanP7FCKDaQ9WVp
	AoVvu2dBZaTkObmfybLLCiJroNZWOrMITTLvQtKCSW4El1rHitiP1gNKSidcHvY1yFOH50WCmd3
	1Hy22HvV02UT6dEiFyrROSl+7IY53PVRB/sw9ceONqS6/5YFpI9nYmk/mtbUtJzsiUZ1EyngAFg
	R3LPCYXDkIhImT0n7w8yNBz/iPsJ1u+I5ggHg9+ArxGmAjFB5jenddqBIiIRc/ScWeiwkFKmMKV
	YXwhS74JY5FsgKKv0reXW2bzx+5cPstOjCB7aLx+UVw6UaweJUZiGzxRXTKauw5h7faAuw==
X-Google-Smtp-Source: AGHT+IEUDVoKYlkifMHSaDj7f/Nd2VF8qbFrSx0lugUxuKLLIiCCksgTeCHMnVKh28vqb/Op2sjC4Q==
X-Received: by 2002:a05:6a20:430b:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-225c07df36fmr5589536637.25.1751643830844;
        Fri, 04 Jul 2025 08:43:50 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce43d69f8sm2458166b3a.179.2025.07.04.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:43:50 -0700 (PDT)
Date: Fri, 04 Jul 2025 08:43:50 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Jul 2025 08:43:29 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc6
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc5

for you to fetch changes up to 5903a7452e642f1475f274373633522db168b60b:

  Merge tag 'riscv-fixes-6.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes (2025-07-02 10:51:00 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc6

* kCFI is restricted to clang-17 or newer, as earlier versions have
  known bugs.
* sbi_hsm_hart_start is now staticly allocated, to avoid tripping up the
  SBI HSM page mapping on sparse systems.

----------------------------------------------------------------
Nathan Chancellor (1):
      riscv: Require clang-17 or newer for kCFI

Palmer Dabbelt (1):
      Merge tag 'riscv-fixes-6.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes

Vivian Wang (1):
      riscv: cpu_ops_sbi: Use static array for boot_data

 arch/riscv/Kconfig              | 3 ++-
 arch/riscv/kernel/cpu_ops_sbi.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)
