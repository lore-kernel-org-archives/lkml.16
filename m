Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E709476
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362901; cv=none; b=kNx9F4BS94xQLksOdNqFIQQbFpkSsIiGzewPByETHHizJqiUCbyQo6oOuthyPZYeBGTbUyccTrDxU2XDn6A2QVJhfaPPhy64jre5FWGXWHiYNJFelZq1BOWMouOgGfIAz1QFfgaU05k/r1KoFa+1ZU8+7FNBzKIxKlkyURr2HMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362901; c=relaxed/simple;
	bh=Q3cytmiMfm4OfZUq2VpCnq36EdkvUtoz6Y7LXH6mVsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Syc0WRhsrpX0gbQUuidHijB31N1vCub+IQh67rDqbChrfmnqG5wxudI/meaRW4hj9I4KZM7hcbQKR7dcoiRXoqEr7guCcpuIMC27BWnQ6opVuz98KGsx5tWMQhtClx+M+SPkpOWp4dL/WJrEUqaSfo0zI1LREof9rOtfehpBF98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cZtipt9Y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cZtipt9Y"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227b828de00so62073485ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745362898; x=1745967698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03XFu9N3hAU4jRC+zblJ23eZKtdC8h3stTe75d5AHr4=;
        b=cZtipt9YwCDlTW0tgkNzSEn0hnqODSq7TZKjPJAkHr5y3V2jxZeMTDdU0nx9eGDrOs
         6oyD1bOvVRAqIi6Q7i1HhaAAhfctntjihJ8M6X8u1GDw38XwhZ8D7LOP00oMUBQWbtjz
         rp+DG3OB4DkPQJCDk4MOkv9V/VqSv+PERYZSCzGMoeIRfv19Zql4I+V7CCst6DbodkrK
         EEXLN5MJ3Hw7402Qm792d46H+9NjqORdzebl3crFMN6nQnBm8JpKlRS4PeSvQpMJ+TKK
         WHvRQGDbp6JDWUGtsYdWu11lmQaMuFzuEhCZeMbNDcUuNwt2pcRf7rgXbAnvT+ny14wd
         wQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362898; x=1745967698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03XFu9N3hAU4jRC+zblJ23eZKtdC8h3stTe75d5AHr4=;
        b=cg1HwAcOpCoB4xG91/zcmgar5+nWkQ9KSkN8E+Ph6MULAalWGKezkIDIe2t7JtxmSc
         YTYlOhOhF93EvalmgqdeFeOaGGf2JA7y/woj+pzFiy8YMptHV2VZSjoAy3KJDLv4w3Zz
         uhgliQ8sTRKcuiH7710vU3PMvmt/Rl3VgKrD5ZTlylpAKzNbpPhvtvEXdUV7Nw+6oHxX
         xM5636TqKAk+nWTQm+sayDyuQfO5IhrWjeGG3NQPBLREn40Dm7rQC5COAecznAw3ruCq
         eevhOR/1nsn/2PRgP5YOGsZ1L76ixme/83fLz64W903R+M7J/xGkgqOOxdyMNkyYns+6
         VbiA==
X-Forwarded-Encrypted: i=1; AJvYcCW110nWmfQKIVW+RaYlQ3OQVapxEJPIInwQkBb4ROSlmkIhp3q0RTATeqtP0d8z2nABrHIl0TqNJPStIBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjGvReChC1IXbEvBPUzuQraSWiQ776RMxflMfPtMxuOAcP1Ej
	Oeq+Ecj8y/qVvIe7UcbIb04ms2/OCat14Qg97CmCwvC77SxNM2yA+uieh4Bw1pFuHULi8q5sGzN
	2
X-Gm-Gg: ASbGnct5Xbmr+foPAzX1WOARxCdUpLSglFr9X8jB3ts1FMh8gqgEEyzYMBO1z0j9xJv
	AB4pA22JKXyGeyjK3yXM44MeNKSfThJI15chBbhRpQpiYpUcddahNzsseal38KwUzI465pGzm6G
	B+MMXf0HyCyqkH8icRg6nT2GYTJwmwYJNxkVoBAnhMd9rTmB1mPG0WQal8tH2w2VJdR0xyUdUAT
	pvZcnUCeu4Mop+ruundJqiU/VCwMY84am4+TX0w7lsave2CX3Zl6VGdT4/Ri9sqORggj3UZSgrl
	fYrLjvUoM3/8aTWCZXj74dUEr5WyU5uZJTl0a4kW35laQkd2lM5WYpouPuV5GQ==
X-Google-Smtp-Source: AGHT+IFmp0XY5/uqqLjTkalynqeWNPyv25+6s5DBGYVR7jtj5aNKhX7IgazopW4LZJGmdcspBRQs6g==
X-Received: by 2002:a17:903:40cb:b0:227:e82b:b585 with SMTP id d9443c01a7336-22c53583228mr211623395ad.20.1745362898437;
        Tue, 22 Apr 2025 16:01:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb74sm90656115ad.166.2025.04.22.16.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 16:01:37 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:01:35 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	charlie@rivosinc.com, jrtc27@jrtc27.com, ben.dooks@codethink.co.uk,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
Message-ID: <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250410070526.3160847-2-cyrilbur@tenstorrent.com>

On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
>From: Ben Dooks <ben.dooks@codethink.co.uk>
>
>When threads/tasks are switched we need to ensure the old execution's
>SR_SUM state is saved and the new thread has the old SR_SUM state
>restored.
>
>The issue was seen under heavy load especially with the syz-stress tool
>running, with crashes as follows in schedule_tail:
>
>Unable to handle kernel access to user memory without uaccess routines
>at virtual address 000000002749f0d0
>Oops [#1]
>Modules linked in:
>CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>Hardware name: riscv-virtio,qemu (DT)
>epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
> ra : task_pid_vnr include/linux/sched.h:1421 [inline]
> ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
> gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
> t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
> s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
> a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
> a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
> s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
> s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
> s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
> s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
> t5 : ffffffc4043cafba t6 : 0000000000040000
>status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>000000000000000f
>Call Trace:
>[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>[<ffffffe000005570>] ret_from_exception+0x0/0x14
>Dumping ftrace buffer:
>   (ftrace buffer empty)
>---[ end trace b5f8f9231dc87dda ]---
>
>The issue comes from the put_user() in schedule_tail
>(kernel/sched/core.c) doing the following:
>
>asmlinkage __visible void schedule_tail(struct task_struct *prev)
>{
>...
>        if (current->set_child_tid)
>                put_user(task_pid_vnr(current), current->set_child_tid);
>...
>}
>
>the put_user() macro causes the code sequence to come out as follows:
>
>1:	__enable_user_access()
>2:	reg = task_pid_vnr(current);
>3:	*current->set_child_tid = reg;
>4:	__disable_user_access()
>
>The problem is that we may have a sleeping function as argument which
>could clear SR_SUM causing the panic above. This was fixed by
>evaluating the argument of the put_user() macro outside the user-enabled
>section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>enabling user access")"
>
>In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>to avoid the same issue we had with put_user() and sleeping functions we
>must ensure code flow can go through switch_to() from within a region of
>code with SR_SUM enabled and come back with SR_SUM still enabled. This
>patch addresses the problem allowing future work to enable full use of
>unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>on every access. Make switch_to() save and restore SR_SUM.
>
>Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>---
> arch/riscv/include/asm/processor.h | 1 +
> arch/riscv/kernel/asm-offsets.c    | 5 +++++
> arch/riscv/kernel/entry.S          | 8 ++++++++
> 3 files changed, 14 insertions(+)
>
>diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>index 5f56eb9d114a..58fd11c89fe9 100644
>--- a/arch/riscv/include/asm/processor.h
>+++ b/arch/riscv/include/asm/processor.h
>@@ -103,6 +103,7 @@ struct thread_struct {
> 	struct __riscv_d_ext_state fstate;
> 	unsigned long bad_cause;
> 	unsigned long envcfg;
>+	unsigned long status;
> 	u32 riscv_v_flags;
> 	u32 vstate_ctrl;
> 	struct __riscv_v_ext_state vstate;
>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>index 16490755304e..969c65b1fe41 100644
>--- a/arch/riscv/kernel/asm-offsets.c
>+++ b/arch/riscv/kernel/asm-offsets.c
>@@ -34,6 +34,7 @@ void asm_offsets(void)
> 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
> 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
> 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>+	OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
>
> 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>@@ -346,6 +347,10 @@ void asm_offsets(void)
> 		  offsetof(struct task_struct, thread.s[11])
> 		- offsetof(struct task_struct, thread.ra)
> 	);
>+	DEFINE(TASK_THREAD_STATUS_RA,
>+		  offsetof(struct task_struct, thread.status)
>+		- offsetof(struct task_struct, thread.ra)
>+	);
>
> 	DEFINE(TASK_THREAD_F0_F0,
> 		  offsetof(struct task_struct, thread.fstate.f[0])
>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>index 33a5a9f2a0d4..00bd0de9faa2 100644
>--- a/arch/riscv/kernel/entry.S
>+++ b/arch/riscv/kernel/entry.S
>@@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
> 	REG_S s9,  TASK_THREAD_S9_RA(a3)
> 	REG_S s10, TASK_THREAD_S10_RA(a3)
> 	REG_S s11, TASK_THREAD_S11_RA(a3)
>+
>+	/* save the user space access flag */
>+	li    s0, SR_SUM
>+	csrr  s1, CSR_STATUS
>+	REG_S s1, TASK_THREAD_STATUS_RA(a3)
>+
> 	/* Save the kernel shadow call stack pointer */
> 	scs_save_current
> 	/* Restore context from next->thread */
>+	REG_L s0,  TASK_THREAD_STATUS_RA(a4)
>+	csrs  CSR_STATUS, s0
> 	REG_L ra,  TASK_THREAD_RA_RA(a4)
> 	REG_L sp,  TASK_THREAD_SP_RA(a4)
> 	REG_L s0,  TASK_THREAD_S0_RA(a4)

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

Note to alex ghiti,

If this goes in before cfi changes, I might have to re-work some of the
changes with respect to zicfilp handling. zicfilp introduces `elp` state
in `sstatus`.

>-- 
>2.34.1
>
>
