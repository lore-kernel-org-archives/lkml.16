Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516751C32
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748866552; cv=none; b=LKWoD7qK7FuI/PwwMg+t2zPbxKOGdVToX5eWg2CFNJH9D4eNPGa0E1WfSqrnKdkZlGuun45sSqmBGGS4jWA5K0gOQCJXXwrxbmLyw5kI4F59695pDUZghp7Zudyb/jDQuAl+K0bvIUl4zTxvULawLQNO4gXLXfpcMyycNlMs7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748866552; c=relaxed/simple;
	bh=K1sARFfjt5Wir3hjTbp5VcsY9vvxxeRd2uh+E+6ngVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jyfbKbEs8lIpcD2XcCZ42ZrS4bz57FRf+FtZEAV5OzWlu42CZPRLGOdElqaxXwolzTpr3OK0v/m745V0ml7m2SRH26Orrw7Pa7Wnm6KvDbGeaTnnD2JD58Jbq6xMKbbNrO6FcQjMCbw0CNcoI40HQhZeu+1vhD8xlEDNZcCv1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VrMHZtin; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VrMHZtin"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1fd59851baso2516269a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748866549; x=1749471349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDaX+Ms/JxaHPiO5VVVHhufwbnzZiaWoNqvnoO02z4M=;
        b=VrMHZtinvBwjHsAqnJF85dHQAERZqXWbKGZNrlc0Qkm/OQVgl0ajIvLR4rAXPiooDG
         /d5gfaSAGgY9ecLNGc5/i1trEmtTYlFFUABpTurjSmrVt/cKX0w44MIwlFVSvnOP8cT6
         nYE9yJJuwKiRPxKgZCzpkRYpOsZzfHoJUtxU+WRf3PktxRAr5xat6JuX2iBPLZKsEq9v
         WZEcCmAhoy4ekxwsaRAOpreJtQ3rEbyfnT9O7xr6o1lp+Hptu6AxWqoeRW1GRoOq8qiA
         cqz7BtDzZbFaMc3H7plc+2iQbmzuzqmgNJf+vhHJVp7ZIDu6dUmZ37iNT83eyYuHOWW1
         HIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748866549; x=1749471349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDaX+Ms/JxaHPiO5VVVHhufwbnzZiaWoNqvnoO02z4M=;
        b=lWSGARN03HYdSm1xzr2o3eUKxYrDruHUC/tqtxOVLUY+xZz5dFuKq73WyXfIgz0z8I
         7x8sSXVb9m2C7KJCjwXGxBGfNkjpE/o4AddfTQUICZksNnDXcOZRQiqOVfL5e5ssul1B
         0v2ZurSSUp6T9sAl/VUrUj1CIGv/QkHHxaNkvpm8CHKculBPg72Mcyb57R4IQ4FraV8r
         xuP+qy60hoXxI1L/H2M4XeujzSAvXcBVDPH7sirv6Mg5ZF1sy/TFrBoMEbG11NsA1ypA
         j9AiXYbAmCASMN3fK18KyNn3U6Lh0wNKtVhNTMs0bb91qQG9sD1APTHPD3VONKJPlW7I
         Fssg==
X-Forwarded-Encrypted: i=1; AJvYcCU34cCMziBNp7SMq5ZSpPaF5+G+pkFvXWMbSOCqFGq9b5ovO227OmNHQj8ASrr6M56zht1BG/3pGNased8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5S/AjNPRkVdSkpAmJZ+AQdgjaiRwTzFC1X8+DVgMf0oUqIVqD
	7s/nm4C4txKC+zym8k3b2gj1FAfgLz6zQWC1ZjERxDOSK1L8avS/1r+RSfRD1ZG0Pfk=
X-Gm-Gg: ASbGncuRJeh1GRp9XwnNvhD0SMWoveqMp+mS2iIpRDzM7uOJyXwWR2kTmv4+g0eAZhx
	cNimTyAKxZLdhyAwBYhIsjuHWNAk+TtxMESZdPDRHjUrSkGwebDuLT4Waa5xCftgNtnmoHfxZS1
	rpvqCmCVO62EXawXbaDgs9g3+aPOAIIptTsfXvJJRrGi79buvZOr2DmeOghVjttT+6XBVDMh7mG
	ZaJSi7Kur9G4/zIoETmZlt+tt4HDMZF/l5GqMnMqbcimJVyb9rHhHPac7eH5QahmmNVjHpoOH92
	uh61dIQ2Bn60bfZ2OzPa2Yrn0yvWbdJBkwTzBvw03/DwL6D+k0MAXEIZvg3MQoiSvkjD1MtTV+A
	0enuQR/rGdFOXx4oiEv5mq/wR0WYyMw5N6A==
X-Google-Smtp-Source: AGHT+IE3ZZ9XZVrG6e5pbAOnOlFdHoHvNeeSOVeQA16FfBQLzHeudQW2FyoTDts8Gqcjz/FT+Fd4nw==
X-Received: by 2002:a05:6a20:6a21:b0:215:db66:2a33 with SMTP id adf61e73a8af0-21adff6bccfmr17082491637.16.1748866549492;
        Mon, 02 Jun 2025 05:15:49 -0700 (PDT)
Received: from alexghiti.ba.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeabb13sm7717558b3a.62.2025.06.02.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:15:48 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] riscv: uaccess: Only restore the CSR_STATUS SUM bit
Date: Mon,  2 Jun 2025 12:15:43 +0000
Message-Id: <20250602121543.1544278-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3042; i=alexghiti@rivosinc.com; h=from:subject; bh=QR8/6bas1i5/uuucvXOTT2dS9uCkrhYuqeChIu397zo=; b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJsp+7xv/FpyfOAyAnx+5OMt+/98OSGzSqedU4xBxXyo 5Wby3k7OkpZGMQ4GGTFFFkUzBO6WuzP1s/+c+k9zBxWJpAhDFycAjARt7cM/9O2tifwbXyTkmtz 9+b3FbHNsYuPnG9dGuKhfeGWlMOdN74M/2Nk7k89Zhv07Zbim+9Lnxz4HH3p1Ub2nULFb+QzyyX 3ObMDAA==
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp; fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
Content-Transfer-Encoding: 8bit

From: Cyril Bur <cyrilbur@tenstorrent.com>

During switch to csrs will OR the value of the register into the
corresponding csr. In this case we're only interested in restoring the
SUM bit not the entire register.

Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
Link: https://lore.kernel.org/r/20250522160954.429333-1-cyrilbur@tenstorrent.com
Co-developed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v2:
 - Rename status field
 - Remove a comment
 - Fix Fixes tag

 arch/riscv/include/asm/processor.h | 2 +-
 arch/riscv/kernel/asm-offsets.c    | 6 +++---
 arch/riscv/kernel/entry.S          | 9 +++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 7bcbb908798f2..05eb65fe95789 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -111,7 +111,7 @@ struct thread_struct {
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
 	unsigned long envcfg;
-	unsigned long status;
+	unsigned long sum;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 3aa5f56a84e9a..e4d55126dc3eb 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -34,7 +34,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
-	OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
+	OFFSET(TASK_THREAD_SUM, task_struct, thread.sum);
 
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
@@ -351,8 +351,8 @@ void asm_offsets(void)
 		  offsetof(struct task_struct, thread.s[11])
 		- offsetof(struct task_struct, thread.ra)
 	);
-	DEFINE(TASK_THREAD_STATUS_RA,
-		  offsetof(struct task_struct, thread.status)
+	DEFINE(TASK_THREAD_SUM_RA,
+		  offsetof(struct task_struct, thread.sum)
 		- offsetof(struct task_struct, thread.ra)
 	);
 
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d3cb515fb1596..77e334f7cbe4b 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -427,14 +427,15 @@ SYM_FUNC_START(__switch_to)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 
 	/* save the user space access flag */
-	li    s0, SR_SUM
-	csrr  s1, CSR_STATUS
-	REG_S s1, TASK_THREAD_STATUS_RA(a3)
+	csrr  s0, CSR_STATUS
+	REG_S s0, TASK_THREAD_SUM_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
-	REG_L s0,  TASK_THREAD_STATUS_RA(a4)
+	REG_L s0,  TASK_THREAD_SUM_RA(a4)
+	li    s1,  SR_SUM
+	and   s0,  s0, s1
 	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
 	REG_L sp,  TASK_THREAD_SP_RA(a4)
-- 
2.34.1

