Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8DC1E0E00
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759804; cv=none; b=DDvpfXmQTuwKocmevpcfI5l5H3alDhqNJvbM/QYko1Kx6XhSkI2dly6ZliuR1iqAcMt//uxRkqxEwDqK7fJjVJT+G+Wf8b/0CzOMXVvpg+Jg2ByFbbxFneL372UFNVMKUFVH+Fh/pfpn/7v9zHi5IBrg98ZIVU7BZyxJyNsLOCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759804; c=relaxed/simple;
	bh=c3c/1gf+it5plATB8n/b/Dc5WHw0xbbf4sScpQrXbxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxAuT2/oSVgRrMNDsC1i6KlmqxIsWTwzbN3keyoj/rOWdY1P04h9kIoirdpBFM4kfpY06CRt3PURyuvtPeY34hHCYtGNhLCk5I/ZQfNxjA21M+KHmrVNctPc3W4cPpoXap4ZXvMjR4HA2RqNzgYFlUkO3Qc1fbORZNYP9NCu/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=P7cPKb0Q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="P7cPKb0Q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2320e53167dso36550545ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747759801; x=1748364601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1m7Go/pX/F7PMp+Ns8T8HB1Kq+qBJFWZaihZShIHSyw=;
        b=P7cPKb0QSdfXVFotzIJ+mqu18g9Gm+YnwMOpunGPym/Ztz/2M0VLVG4VuE0oHols1i
         7z4iFw5zSwT8vrJFVHly3MjFfcbqN3CDdbrOtMAc9qLwB0R0ZjR3aI1XtHuoHQEY0jJq
         a0gAc+fl/Bk+sxLc7ZNQS7YQURde80lMKOEcbWsHuoJV3jiqkmmxZtanTRg3cz83BN/K
         //dB5yrPQDmXz013L1rx/a6z3uKHYeUGxxDJ9vQt9uvcEgKp7fBLk5uxi2HOhQjrHXUQ
         a9TYbmxe49sgIj6NRoq3kYn7ErfkW+NB5eMrE9e+Pmr5dVPI8b4rzYPpN7RyyTMd+txl
         vonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759801; x=1748364601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m7Go/pX/F7PMp+Ns8T8HB1Kq+qBJFWZaihZShIHSyw=;
        b=wuR4h7t4m04QNWlh2+2dxNHHLXwcwZW0bnXNJTewsbrETonlfNc3+fWJIq1bgVFZgB
         DJF3KXaoTmhc42ZTdpfc4DefU8cRP0dMXS4lxUrocZQQwZud2VHtAliIFscsHio+M3El
         QV8sSywhLbW70Jb6FcuMFuboCTsqO4JdiFOC+n1fe/thpEofRDHPaN1awPAyhLBsqBe6
         MXdR36ledIh+M1k47wCLf5ZzSt0kYktR5WqHuyuPmNavofAnraOqg1A896MpIiQvO3DS
         IiiTI4g+3YmF7vjMaPnmE7smacPNzK+/lUfAR0rIoVcFbL12TVbvZjktbr8YtYHE5GTH
         fmrw==
X-Forwarded-Encrypted: i=1; AJvYcCW/YuSwRmLr9+q/ZHuTtwM28YNP9WQ0dEf4smpJhHcIsvlcfzGLlUA5WqyIs5aLSMMSXHYk3BwMKdBS2Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCD1IhrAznBpuCajjhcUKHCeSLdx3uj+vz2JVaBjzftACweKRs
	5AKqLLqFJjZVz2HI33J8ohRfiLJ7fiOlz4f3TaOChFQ7somay+PIpANzM70LphJ34hKwOrXx0td
	Ntp78
X-Gm-Gg: ASbGnctqMQmkrilJgU74G0J0ncJua5xCl01+/iWV2Xjv9PrF8MkTh1mRF2wXnkGDc2N
	BDn0qXXES9hRTbtu3wMGpJP0zBe63oW+4IpB8V/faZkqhmCVLIWGYGt32cpbV/+QzIHoVUzcPRU
	ugd82JdFDAymWTM70p80CRhjoQpzek67zCMfgKqNsQeSuCM6Gs4smKhkVXd641ssqZcN5kg/VAO
	MZ25hsCvIWZWAPVwGoFAiOBfczvMUFM+2vmuTHsJC+05N1wX1k33XKwcHDfTrQJmEYLXYiQz1qv
	b8xl8Tu87B0LCSHDjFKLQWbbhqXiA9hU88kSFgK3w23vTaSorfeQaMGjuTC8Cg==
X-Google-Smtp-Source: AGHT+IFnEAObM1BSjDDsKlqDToLOxOJWjUHHkhJdZPf/vLzU9gv46i8iYZlBBNwApuBYvvnazZFwbw==
X-Received: by 2002:a17:903:b8f:b0:224:c76:5e57 with SMTP id d9443c01a7336-231d459bee3mr236232895ad.39.1747759801274;
        Tue, 20 May 2025 09:50:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9551sm79167335ad.40.2025.05.20.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:50:00 -0700 (PDT)
Date: Tue, 20 May 2025 09:49:58 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	charlie@rivosinc.com, jrtc27@jrtc27.com, ben.dooks@codethink.co.uk,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
Message-ID: <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>

I did give this patch my RB and had planned to come back to it to see
if it impacts cfi related patches. Thanks to alex for brinigng to my
attention again. As it stands today, it doesn't impact cfi related
changes but I've some concerns.

Overall I do agree we should reduce number of SSTATUS accesses.

Couple of questions on introducing new `sstatus` field (inline)

On Tue, Apr 22, 2025 at 04:01:35PM -0700, Deepak Gupta wrote:
>On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
>>From: Ben Dooks <ben.dooks@codethink.co.uk>
>>
>>When threads/tasks are switched we need to ensure the old execution's
>>SR_SUM state is saved and the new thread has the old SR_SUM state
>>restored.
>>
>>The issue was seen under heavy load especially with the syz-stress tool
>>running, with crashes as follows in schedule_tail:
>>
>>Unable to handle kernel access to user memory without uaccess routines
>>at virtual address 000000002749f0d0
>>Oops [#1]
>>Modules linked in:
>>CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>Hardware name: riscv-virtio,qemu (DT)
>>epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>t5 : ffffffc4043cafba t6 : 0000000000040000
>>status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>000000000000000f
>>Call Trace:
>>[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>[<ffffffe000005570>] ret_from_exception+0x0/0x14
>>Dumping ftrace buffer:
>>  (ftrace buffer empty)
>>---[ end trace b5f8f9231dc87dda ]---
>>
>>The issue comes from the put_user() in schedule_tail
>>(kernel/sched/core.c) doing the following:
>>
>>asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>{
>>...
>>       if (current->set_child_tid)
>>               put_user(task_pid_vnr(current), current->set_child_tid);
>>...
>>}
>>
>>the put_user() macro causes the code sequence to come out as follows:
>>
>>1:	__enable_user_access()
>>2:	reg = task_pid_vnr(current);
>>3:	*current->set_child_tid = reg;
>>4:	__disable_user_access()
>>
>>The problem is that we may have a sleeping function as argument which
>>could clear SR_SUM causing the panic above. This was fixed by
>>evaluating the argument of the put_user() macro outside the user-enabled
>>section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>enabling user access")"
>>
>>In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>to avoid the same issue we had with put_user() and sleeping functions we
>>must ensure code flow can go through switch_to() from within a region of
>>code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>patch addresses the problem allowing future work to enable full use of
>>unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>on every access. Make switch_to() save and restore SR_SUM.
>>
>>Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>---
>>arch/riscv/include/asm/processor.h | 1 +
>>arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>arch/riscv/kernel/entry.S          | 8 ++++++++
>>3 files changed, 14 insertions(+)
>>
>>diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>>index 5f56eb9d114a..58fd11c89fe9 100644
>>--- a/arch/riscv/include/asm/processor.h
>>+++ b/arch/riscv/include/asm/processor.h
>>@@ -103,6 +103,7 @@ struct thread_struct {
>>	struct __riscv_d_ext_state fstate;
>>	unsigned long bad_cause;
>>	unsigned long envcfg;
>>+	unsigned long status;

Do we really need a new member field in `thread_struct`. We already have
`sstatus` in `pt_regs` which reflects overall execution environment situation
for current thread. This gets saved and restored on trap entry and exit.

If we put `status` in `thread_struct` it creates ambiguity in terms of which
`status` to save to and pick from from future maintainibility purposes as the
fields get introduced to this CSR.

Why can't we access current trap frame's `sstatus` image in `__switch_to` to
save and restore?

Let me know if I am missing something obvious here. If there is a complication,
I am missing here and we do end up using this member field, I would rename it
to something like `status_kernel` to reflect that. So that future changes are
cognizant of the fact that we have split `status`. One for kernel execution env
per thread and one for controlling user execution env per thread.


>>	u32 riscv_v_flags;
>>	u32 vstate_ctrl;
>>	struct __riscv_v_ext_state vstate;
>>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>>index 16490755304e..969c65b1fe41 100644
>>--- a/arch/riscv/kernel/asm-offsets.c
>>+++ b/arch/riscv/kernel/asm-offsets.c
>>@@ -34,6 +34,7 @@ void asm_offsets(void)
>>	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
