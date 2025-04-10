Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1113AD38
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268732; cv=none; b=KFAcaFOZ+n93OnAm//F9t3ccW8ZuHuGrZPEeyHfqVE2OUy6rh38Ineyeyw686a26RKEIBGCLrSo8JURp+Hg8ur9pOI5Hn+tHjLffcSSXlfGIwyB8Sfn1uxEYwW1+9m6IwIub18YpqOWWAH4lOtYEMirSSWTKxCyth9khzZea16I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268732; c=relaxed/simple;
	bh=n1IKV28ehE9Wn4lJdutsk5uOI+HZ1eN54KYwMd5Wkx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E9xpw7nMdCjgrM4ZHfY3gMJPB7NxvpTX5XCQMUR/uXJqnlc/IBi0syVkpM12putnd8LxVaJCkaTlbwkNvN82FESUodP3it5xHQ90y15lBXRsOP0ZIRJnB1sNDfwuy6FpH9j4qGkOvknKsQEaY+dzVP2Ph6sBOkYG6B/JpXoMN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=YitfyUkF; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="YitfyUkF"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6044db4b55cso212323eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268729; x=1744873529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfj1lD5IvxBlvbEuJ/tOL+PNehQx5cdOKt7waVQamBc=;
        b=YitfyUkFZ7Ha5HFBwRtFvyRPbjn5afeOvhuEnxUlzMOGP0LRfe56Dvh1roNTr6eMVL
         NWiZuAVEo6EGA/P1XMfkYJbTBc8bdtDKPrpZL+HIG2KeP4Sr4bbU2TAyOajbdgvWdNdM
         4qizRlE/Tnqipz9br1HNICYxN+BqQHu9a3Iw8IcBTomej0/RfP+KdMbKZSk6wndbGYtM
         W51Z39o9bmwOlEIOlO1ncKbY3NmMapjT7GmueYcsGROZodewIBmfI/VUEkUCA0OhqRzE
         zjm4bA8gKtzQtmaIiYMS55qB3JUNubjgr9hATvq0Yg9G5Lc/PNd1445UZ6OpMNzd2ed1
         A8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268729; x=1744873529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfj1lD5IvxBlvbEuJ/tOL+PNehQx5cdOKt7waVQamBc=;
        b=vNnJ1iJBvjruuMt/Djd23g5ABtipsPwsC/Y70yFYU5yNH08PhB3PeYmnBQ6DIqAZWG
         TXgEPK/Ia3tJxW3YiTOolCIBmZ9qUVJgsR0mcDtbEGT4iMze1/9Nah5ohFBrIBdtW5fH
         8iXS5Ntia+B/PZCIHiClRyZG1nXPXxoFVCTzE5pZgBFQGcTrd/OYabzA40q3sOuSjtyF
         GcL1QpNe3FGKO0OoMNwvYqMbVPbgrMO0UQjZlAlf1mCk+MylAxJCeLbsH6OhZllVQ0Nu
         xbenMa6lBvUlEmMIbXRTlWfrc9SnZwzR63DqPojueSKBGikAMEN68/yTt+RTXlLKHUHf
         o/og==
X-Forwarded-Encrypted: i=1; AJvYcCXjSamdDneyh1MH/OP45TOX55bI5ezChS/LU79nh1cnnQKAagAfDBUqrOCUMWtLUkg+RTiYGWx6wsMRxNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAD1kcs+R2bfWgo0hHLuUecMLRnaop76LLokTrcKfI2y5H/SS
	03CiJdRvvecYqjhO1K5tSvrHkOOHwaVd6epBV4C62YnjwT6RKgaUDjozXdfUiA==
X-Gm-Gg: ASbGncu22nAFWUwXd3XSrr/GXBPnRmsOMBH0r9fHIpk/NJj6L0jymS018XzP4SOQQMq
	BiCAUtUjLrsvfHPzWiYkh4jW3HDBetj7tkSflDKNVhr2O6Ax0iKLc1Wk97hSL2+d8ivlgfkEqsI
	kCLUfj/kA0ss2qG1jg2hfVQGUqKWIyUHPji348lkELGyBrmNMrHjQ0OKFYLlHX29ZEd1eN6vWq8
	d2s6S4hOwE/61z81hqWN9fR7YskIKigIYk5f/cstkkT/0hEKOhit1pEc4Tz5hkWs1KZeQauTIZy
	QSjCIbe9gRo5M2VrvYZaDeD7UqygFprbApqUhpbwK9vlaOIuwNz8s78Gv64=
X-Google-Smtp-Source: AGHT+IEq3/uj00FVp1Xbt3y1cXdeUi85YNR7lcgCj8wlN2GuL4uWrvH1Xd+HddZZQveM1t1bjtbp3Q==
X-Received: by 2002:a05:6808:318b:b0:3f9:3de3:c8de with SMTP id 5614622812f47-4007cc7dbacmr654153b6e.12.1744268729571;
        Thu, 10 Apr 2025 00:05:29 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:28 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
Date: Thu, 10 Apr 2025 07:05:22 +0000
Message-Id: <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Dooks <ben.dooks@codethink.co.uk>

When threads/tasks are switched we need to ensure the old execution's
SR_SUM state is saved and the new thread has the old SR_SUM state
restored.

The issue was seen under heavy load especially with the syz-stress tool
running, with crashes as follows in schedule_tail:

Unable to handle kernel access to user memory without uaccess routines
at virtual address 000000002749f0d0
Oops [#1]
Modules linked in:
CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
Hardware name: riscv-virtio,qemu (DT)
epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
 ra : task_pid_vnr include/linux/sched.h:1421 [inline]
 ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
 gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
 t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
 s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
 a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
 a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
 s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
 s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
 s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
 s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
 t5 : ffffffc4043cafba t6 : 0000000000040000
status: 0000000000000120 badaddr: 000000002749f0d0 cause:
000000000000000f
Call Trace:
[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
[<ffffffe000005570>] ret_from_exception+0x0/0x14
Dumping ftrace buffer:
   (ftrace buffer empty)
---[ end trace b5f8f9231dc87dda ]---

The issue comes from the put_user() in schedule_tail
(kernel/sched/core.c) doing the following:

asmlinkage __visible void schedule_tail(struct task_struct *prev)
{
...
        if (current->set_child_tid)
                put_user(task_pid_vnr(current), current->set_child_tid);
...
}

the put_user() macro causes the code sequence to come out as follows:

1:	__enable_user_access()
2:	reg = task_pid_vnr(current);
3:	*current->set_child_tid = reg;
4:	__disable_user_access()

The problem is that we may have a sleeping function as argument which
could clear SR_SUM causing the panic above. This was fixed by
evaluating the argument of the put_user() macro outside the user-enabled
section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
enabling user access")"

In order for riscv to take advantage of unsafe_get/put_XXX() macros and
to avoid the same issue we had with put_user() and sleeping functions we
must ensure code flow can go through switch_to() from within a region of
code with SR_SUM enabled and come back with SR_SUM still enabled. This
patch addresses the problem allowing future work to enable full use of
unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
on every access. Make switch_to() save and restore SR_SUM.

Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/processor.h | 1 +
 arch/riscv/kernel/asm-offsets.c    | 5 +++++
 arch/riscv/kernel/entry.S          | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..58fd11c89fe9 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -103,6 +103,7 @@ struct thread_struct {
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
 	unsigned long envcfg;
+	unsigned long status;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 16490755304e..969c65b1fe41 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -34,6 +34,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+	OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
 
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
@@ -346,6 +347,10 @@ void asm_offsets(void)
 		  offsetof(struct task_struct, thread.s[11])
 		- offsetof(struct task_struct, thread.ra)
 	);
+	DEFINE(TASK_THREAD_STATUS_RA,
+		  offsetof(struct task_struct, thread.status)
+		- offsetof(struct task_struct, thread.ra)
+	);
 
 	DEFINE(TASK_THREAD_F0_F0,
 		  offsetof(struct task_struct, thread.fstate.f[0])
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4..00bd0de9faa2 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
 	REG_S s9,  TASK_THREAD_S9_RA(a3)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
+
+	/* save the user space access flag */
+	li    s0, SR_SUM
+	csrr  s1, CSR_STATUS
+	REG_S s1, TASK_THREAD_STATUS_RA(a3)
+
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
+	REG_L s0,  TASK_THREAD_STATUS_RA(a4)
+	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
 	REG_L sp,  TASK_THREAD_SP_RA(a4)
 	REG_L s0,  TASK_THREAD_S0_RA(a4)
-- 
2.34.1

