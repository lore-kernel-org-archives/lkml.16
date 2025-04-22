Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828FF28DEF7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310369; cv=none; b=h8W+0FH3fbDC8Bj+JNL7EyhWWX/fJHLrgGSQmEuvLRwVZU701JAbtWR5g5FaIe+U2q4smXP3099sijcsdTr5bdmO3DgJRN2TIMRxTXQWGYU0wnUPVIkZeFaFKQ8AyBkQTIUObjQrVt8D5y2ddJrMG6/WzdmhosNXdHttxLl6gFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310369; c=relaxed/simple;
	bh=bQe59A9azQVJqinMp0+l3jtvX9SIwHQ4hfIDHa5112A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=itcCDtyrJgE1aj8/wFFwWuK5THndWl3ISWht8FJ7hsEHR4iXYp4yNX5ZcZjKd95pL12w1tW9dAQBQmHCU9hMMdE+MUpXmOAHSiEsBVI9BBSPfO2Zzt9ifKlRTB0vIitWlu6tEGMIO3VytfSD0bK9JnBjr3CIcdA3prkyUuJ4Dw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gYMUr2E/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gYMUr2E/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913b539aabso2888954f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745310366; x=1745915166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/cAgNjQa95gQP7B/B/snS+8c4HbJCPXR5Eh8cVo7zg=;
        b=gYMUr2E/GetuiLt9uIuYO2RHM1W85FEnHqFOEl3z+lhJiNkmABS3SG/KpuEenHAbW0
         EsTw2FuCl13+9edAcvvdJHfExOdPJZwdJ1Gxewn519elxNbGTzlocB+3xJI/P8BA0zcx
         LlubrBXiOsE3rAODylnRWu2wuU3cH6m4j1vvxQR/2e/oBXcEMsS2YOWCNr86TqGijJ8y
         ccabahVrf67Jogt2DoYpJ7wajogsibD40BdhlxLJrvA34BY7Rnyn2Mt9NzrnZg0VXkUH
         F5z9IxbxBlTwvl3PhSTEeyY6kv40BKnqNoKq24BGpwCxjswJflp0Pgu6i4hZHSAKn5uG
         HRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310366; x=1745915166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/cAgNjQa95gQP7B/B/snS+8c4HbJCPXR5Eh8cVo7zg=;
        b=DvaKwtUEmUpONB0ctZd7Rfke84vmoNQ/pxgPYqYOr7Qi4WjYVB/T3Nfa+sr1Ew+SPp
         Q7Wtqw/mr9C3BfS/6cZAQQwVEZF5xHF4xtDCeirI1N4dy96o7ZZ7UWwN/g+v5Dv9K4Ma
         DhYx2pVGq423qgWNl9INfgKR0SWpWaoqfqfj98ajM37h8Gabmhg5f3b6cf9/0tnk9LNW
         06iW2huYm3yL/5OxYxVFi47G1J5fShkp2j12fx8cxKRvR3BDpdtuRC71k8jWZwE/pO/r
         Yrgl8UV2XFg63P5XWwBxQ2f5sopwEY1iszssNxsIxe6+J05uxYnjoVGfSKv7i4hbauvN
         KKsw==
X-Forwarded-Encrypted: i=1; AJvYcCUFoJUMoQ/NY6x7RPLFSn4zXuU1m4gkKf9LWbQTZ74o0/w0kDt3HXWkkxhYczkut0Vx8yAysNOtKPQpVs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8W0xRbcfyU92vtcNJdewixUV0nDRQ0kIG2oWolKoPrQcBd7/t
	2i4bsoxidO/uILhp8x2iGFLT43OZcemezvJpoLe5jjWPy4uCuwgHPW18fv3CV3g=
X-Gm-Gg: ASbGncsj1dz9ad+5SMFwuwTOcQEPr43uObqCuJt4s0ZQau56Fppd/XOmirMIkFscpC4
	v32ZqPetQeac1rB+ViZxkRSUfZVVPdENs2Y2JPl9+Re6E1/MaiGFIkkTdMKp07xuVM4yVJRO6TP
	/xtuuiSZrSTTyBZr5vLJq5gauEY+AWHeZ8k0gzRk38+0+q0+LbijfSEYxUleJkOGGBcdcFDdxfp
	UTMlHZgBbvJBAYpPyvj47Huy0hIOFIOjVmRjRGVGFXgXQx7j4qtGDdpacXz0znIYvJXHg77rIqa
	TkD+g8P4UTwjU1mSBd9uK88bGOJ+YO4FtEbZvLgP2+YT5jN7BGhDGdMTqgS1
X-Google-Smtp-Source: AGHT+IE5rRNC75MFtRNKzdS288HbyuZMTD2nZQBhaznTRZ3kRoPBwHGrzOWpkgGI+7InsS8Jm3kQ6Q==
X-Received: by 2002:a05:6000:1846:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39efbae005amr10068227f8f.37.1745310365805;
        Tue, 22 Apr 2025 01:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:9fbe:20e3:2fc3:8d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43314fsm14735392f8f.39.2025.04.22.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:26:05 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/3] Move duplicated instructions macros into asm/insn.h
Date: Tue, 22 Apr 2025 10:25:42 +0200
Message-Id: <20250422082545.450453-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The instructions parsing macros were duplicated and one of them had different
implementations, which is error prone.

So let's consolidate those macros in asm/insn.h.

Alexandre Ghiti (3):
  riscv: Fix typo EXRACT -> EXTRACT
  riscv: Strengthen duplicate and inconsistent definition of RV_X()
  riscv: Move all duplicate insn parsing macros into asm/insn.h

 arch/riscv/include/asm/insn.h        | 205 ++++++++++++++++++++++++---
 arch/riscv/kernel/elf_kexec.c        |   2 +-
 arch/riscv/kernel/traps_misaligned.c | 137 +-----------------
 arch/riscv/kernel/vector.c           |   2 +-
 arch/riscv/kvm/vcpu_insn.c           | 128 +----------------
 5 files changed, 189 insertions(+), 285 deletions(-)

-- 
2.39.2

