Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B57221F25
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049363; cv=none; b=t3xbK3zYlF0cWSVIYiQUQ2yb5M/yPABWs+a4I5e+Rn3N0719xSRIjX/89gdoVyXv97Foq4OQOjeogFSH0KYNtniBazrorsvqF1ft3/hodF9vHpejv7E1RIXiJkQ1PWpgVSVO60TsAv9mFlMTd5FFYu41FthWPMQBV2XpX8QVGWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049363; c=relaxed/simple;
	bh=jQd2bvHcJoWA2bm65jGuMSSOn7F2l5OIQSPs2B19Gnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=coKInoY2EO28RoLPJPacw1zvo97ZWsHo7XxPj2N7trGjo1BgFjna2y6fYR07jRF0C0pvSlLeyCnaVbIDv2SDiS2gn42hBuPOClF6I+WIrFv/n0zLOWWpu1TgsMywbQygCIRWSVXmMMGbNK5Pg4KzmZ3Nu2pzyPcLZRf/4ryincc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/5tKYGi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/5tKYGi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224100e9a5cso48709345ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049362; x=1744654162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNLP2WcbFnXWmhqiIcXTLGBaX0CpznpLnzRdD+AmWMw=;
        b=F/5tKYGihApKz6bwsv7AL211xtENA2sH5lvUrT7dqjC4FzSsn9pFj0ewcIT1Nxembc
         ZBpfuyCjBUL2n6Ob0Vmg691UUipI+KjTXJX4nBXRdsqb7KHkQ5oqODl7GqnVfTa3DNSR
         R7k0jCTyj+CsNGuu42NDSDup6SpDgpB0MoCGTpGupKTjnAOQFZYuIJY1xt62XDS4L2DQ
         Cc63rdUXclc4vGU1oj7DUhTkiKD3Nqu2/gWPcYxs28hetCk1BVKMAAvK/67Bkv5/97Le
         Jee1SXWdMGIJTL6n30ZPcEaHMPK+fEwRdSpiyo0l4K1cYTvzwRxmFLscg6/AoIQGhTtq
         Kmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049362; x=1744654162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNLP2WcbFnXWmhqiIcXTLGBaX0CpznpLnzRdD+AmWMw=;
        b=D/9t1oVUGBM51DuEBkzPKBliyei35Ae/ZwoOX5Mjc4uPSipmEaZCP1uOjNpqMnPBpG
         SsYliHj4/Thhy8AnAg+jyCnD/fUTwbE6/gR72cy3/cTzXEmJ9OkjL/PQFbvVGrogf/Tj
         xaiNg+B2ncrRHnygtTfm+YYQhHELRDXl9JHj58YKSpBEUJtJIeZs+H0xWySp8hEujnVk
         h80AI3XN4GR2sKCJeWHNlgGZZhD8JcMXhaHBbn7hGdlVCkIRJ0WjcspSk2kDVe6dyt9U
         OdNkPrUfH+iJHs/hpVftGy7ru0IwPENbLJ8wBP7BjX2o9RRsucCylyFAFbjCb6qVzHre
         JOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVviqi0Di+gt8d9h3aHU2spkA2fdezv8sv8yfjbgEEQKoB+XRs07zEMCYcxExGoRUjANLfEe5dZAATVG+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCTvdVx365nh0jA9gKw1UIDs3TRXmx2AMy++/JDohY1Ghy+l+
	qMmHgmygNHdAL5i0PCdBQqJtwUV1ZDWYvMz54uMEbLQxF+C8QPyr
X-Gm-Gg: ASbGncvSECkj51DuScT+pojqn8EmFsvvrRFCR+gyZdK6guhWJfTYJIcRCGaWRwIIC81
	VW+ab9Vxsm6TKL/qAgeDeCpyAoiDOzcV2Qokar0pLkEKBmQ1zdgvRiruXaYQD58oTddND1o1Lef
	YIsxM1bPQu9guuq2DdW/4UsA9NqIol3voPKAFgMDZONJ1M2L0SqOsT5Y1F1hjA8MYA7ZF1fKUL4
	oGp3wnVvYTMHzC+bo+REYyFRt3sCpIe9gORFbVBDnODZA3ItVsSahg37TvO6nonrfhZztHO60eG
	Gw7lbZwsPLy7I+kLFCgRDHIt18NqcxD44+YlE2surKcCy616xr1O723P6ZAonKp0TvDvFKZm1iw
	Gh0a8wR5yjoO7dmFDa4JD9elk9KbVa1z2ST5pefnXdWNy
X-Google-Smtp-Source: AGHT+IFwnBb03K/EWgGxHSZMUCeczsevSxPHhBr5Q9Nlteyu1sSQQHWfAssAlK/1aErAdZs0ChZmog==
X-Received: by 2002:a17:902:dac3:b0:224:256e:5e4e with SMTP id d9443c01a7336-22a8a86588cmr183418285ad.16.1744049361576;
        Mon, 07 Apr 2025 11:09:21 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:21 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 07/12] riscv: vector: Support calling schedule() for preemptible Vector
Date: Tue,  8 Apr 2025 02:08:31 +0800
Message-Id: <20250407180838.42877-7-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Chiu <andy.chiu@sifive.com>

Each function entry implies a call to ftrace infrastructure. And it may
call into schedule in some cases. So, it is possible for preemptible
kernel-mode Vector to implicitly call into schedule. Since all V-regs
are caller-saved, it is possible to drop all V context when a thread
voluntarily call schedule(). Besides, we currently don't pass argument
through vector register, so we don't have to save/restore V-regs in
ftrace trampoline.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/processor.h |  5 +++++
 arch/riscv/include/asm/vector.h    | 22 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..9c1cc716b891 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -79,6 +79,10 @@ struct pt_regs;
  *       Thus, the task does not own preempt_v. Any use of Vector will have to
  *       save preempt_v, if dirty, and fallback to non-preemptible kernel-mode
  *       Vector.
+ *  - bit 29: The thread voluntarily calls schedule() while holding an active
+ *    preempt_v. All preempt_v context should be dropped in such case because
+ *    V-regs are caller-saved. Only sstatus.VS=ON is persisted across a
+ *    schedule() call.
  *  - bit 30: The in-kernel preempt_v context is saved, and requries to be
  *    restored when returning to the context that owns the preempt_v.
  *  - bit 31: The in-kernel preempt_v context is dirty, as signaled by the
@@ -93,6 +97,7 @@ struct pt_regs;
 #define RISCV_PREEMPT_V			0x00000100
 #define RISCV_PREEMPT_V_DIRTY		0x80000000
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
+#define RISCV_PREEMPT_V_IN_SCHEDULE	0x20000000
 
 /* CPU-specific state of a task */
 struct thread_struct {
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e8a83f55be2b..45c9b426fcc5 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -120,6 +120,11 @@ static __always_inline void riscv_v_disable(void)
 		csr_clear(CSR_SSTATUS, SR_VS);
 }
 
+static __always_inline bool riscv_v_is_on(void)
+{
+	return !!(csr_read(CSR_SSTATUS) & SR_VS);
+}
+
 static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
 {
 	asm volatile (
@@ -366,6 +371,11 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	if (riscv_preempt_v_started(prev)) {
+		if (riscv_v_is_on()) {
+			WARN_ON(prev->thread.riscv_v_flags & RISCV_V_CTX_DEPTH_MASK);
+			riscv_v_disable();
+			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
+		}
 		if (riscv_preempt_v_dirty(prev)) {
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
@@ -376,10 +386,16 @@ static inline void __switch_to_vector(struct task_struct *prev,
 		riscv_v_vstate_save(&prev->thread.vstate, regs);
 	}
 
-	if (riscv_preempt_v_started(next))
-		riscv_preempt_v_set_restore(next);
-	else
+	if (riscv_preempt_v_started(next)) {
+		if (next->thread.riscv_v_flags & RISCV_PREEMPT_V_IN_SCHEDULE) {
+			next->thread.riscv_v_flags &= ~RISCV_PREEMPT_V_IN_SCHEDULE;
+			riscv_v_enable();
+		} else {
+			riscv_preempt_v_set_restore(next);
+		}
+	} else {
 		riscv_v_vstate_set_restore(next, task_pt_regs(next));
+	}
 }
 
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
-- 
2.39.3 (Apple Git-145)

