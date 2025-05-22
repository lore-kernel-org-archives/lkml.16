Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97EC1F94C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925372; cv=none; b=IJkvvYd/2+pABBXAUDfNKFn8i0YaETEu1HhQny9dQkMxPCivzmQAh92/kfE7TNLkA3E/bfsncfOaaZeeBw7zLI1geDHShhTR6xIifUrVM7if8ywjrcM0qq08G71tq0SwGPmGxkl0/+jkT/VC/x47/W+OOxsYFrsdNsRnLWgpi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925372; c=relaxed/simple;
	bh=+80KRDEMPVa5z3LdWSChWxaczDIog85HkSHAKK4YLbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgfYv4q4aDeUBfyGGJtGiMnTgmjPC72A/UaYB16TdSGg8abdyELfrFkLG17QGEvR6YFlEI79/Sh9a+zl2yDodyUjkIN+onqgvovSi4dCLuE4RXXHadCF7KCBgH3G8m7qbkbY9K38YJUgPLVx/+aOHvbT9C4uSIsoCJ0GR4NcNkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cgCe7Uvw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cgCe7Uvw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso5265783a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747925370; x=1748530170; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQ4kj7Mccvnc2GRr0Awe5V2tu56FIeT0AJGWt5wmNLo=;
        b=cgCe7Uvw9y9/AKOtbFHfn4DM41UmuaWS3v1FP8yKr1lI97uhG/bUrpQ4QgHv/fuR4v
         FOSnYByUnw01KJBBo5574XRZ7XF7nKGUgJQqGXNb1RYNX2r3aYiACTJwqtYq/GExPHC9
         RqwNlJSPn56L0dTCTh437uWtOHSZZCSPe6+AJuJHh7zQLtzUhvjTdgnsW02YEg1piG/0
         hXldjm13+pEUkvJofIKa5WEJNPbyzAppIvax2Oyj977d9P18NB5f/YZF6Y9hWYktqHJp
         5dOBkTeQ6dUcGC7LMv2sIY1zpgnpWB0WtAA9SOTbI6qtCxl640PjuldYcSb6iOf/bmYs
         o8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925370; x=1748530170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ4kj7Mccvnc2GRr0Awe5V2tu56FIeT0AJGWt5wmNLo=;
        b=UygeqKsTjcuXsWsvo+IQAbz/tK+pH5zkcSekNGoEk42y8y+qMcVf3M3rj7U745N/8Q
         L5TIp+IZzQX+c6slANmej5+8jHIG/iRG2RhQKidSJkW4PNqHeRAh9jVFnwYMLicKQJXX
         loYgFUN5YNkNxC0XGGaK+7gqay/UAKv/qyXtTQVq+qjAMymspc8JvibRBmHsWfZS9qwZ
         17xWdkr95HC38GxEFquaSn6vXqP5RbCH1VgcQ2QhgnNXHK0uWrdgMcGASEaqiKGGYIp9
         l2hYDASKnrcJoixGGV2N63BVVfRibYtX4FK1bkqaL0TC8qGr/1AEjVke5d9Eebt1//1x
         3LZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQDiZ8TEyjoUeVpK1o76jf3sgU2Zxm2+CtNMtB1ZocIxxxpLdA9NFCgQc/dHPtDF8z+UBXaAGzMIgIDG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW1QhMMTe+X6m7/2SCvos/+8Eyiv8ZbIA+csK+sJ8cRbHJ3uqf
	Wgy7pd36GUJHJaNsnq/MBXt7p13OgAcY7VIJBXrJTdkjvwElN9SKP+TNTASe3djyZy0=
X-Gm-Gg: ASbGncvC19QVDE/XeC18GQP8vsX701F2gJGOH60sJfJC982LQ00QUMMrega+Yv6rpHm
	69zaM3WHDFGXrpfzBl0p97kAfj3QlmUMlM08r7KJ6kR6F83MVQe0Yt8PxU+5A3R43Vw2hh7WVZI
	Ig39V9zOCB3S9xZb0uRu9eQn6sBab2TId/79kWrd5bQWpwNkbdRMW7ids2XlGvPOEwSg6GmMCB1
	+1c/7pt5LoLOFJvFAAWpDzs6aNyM74komZF+QxDe1O5emR4hO/9gtPiWWRLhnLSALfLc7fIu6mP
	kmrpYh2mifKkGlndohRaLeCdUCNjx2mWZ42ytogH/Ny1Egh59VQQthA1b3qSvBuN1PwRYb3X
X-Google-Smtp-Source: AGHT+IGT45bErk4jZKCTChYcJLaT1SiXW3SHwefo100Glc9Lbj7ePhm2QOKaGa81c6ZFUQWjnmWGPQ==
X-Received: by 2002:a17:902:ce87:b0:220:e924:99dd with SMTP id d9443c01a7336-231de3ace9emr359176295ad.34.1747925369804;
        Thu, 22 May 2025 07:49:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm109560685ad.201.2025.05.22.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:49:29 -0700 (PDT)
Date: Thu, 22 May 2025 07:49:27 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	charlie@rivosinc.com, jrtc27@jrtc27.com, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
Message-ID: <aC85d8Hnstck-_gx@debug.ba.rivosinc.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
 <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com>
 <b39891f0-1e1a-4559-b35b-5262fe5af93c@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b39891f0-1e1a-4559-b35b-5262fe5af93c@codethink.co.uk>

On Thu, May 22, 2025 at 07:23:32AM +0100, Ben Dooks wrote:
>On 20/05/2025 17:49, Deepak Gupta wrote:
>>I did give this patch my RB and had planned to come back to it to see
>>if it impacts cfi related patches. Thanks to alex for brinigng to my
>>attention again. As it stands today, it doesn't impact cfi related
>>changes but I've some concerns.
>>
>>Overall I do agree we should reduce number of SSTATUS accesses.
>>
>>Couple of questions on introducing new `sstatus` field (inline)
>>
>>On Tue, Apr 22, 2025 at 04:01:35PM -0700, Deepak Gupta wrote:
>>>On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
>>>>From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>
>>>>When threads/tasks are switched we need to ensure the old execution's
>>>>SR_SUM state is saved and the new thread has the old SR_SUM state
>>>>restored.
>>>>
>>>>The issue was seen under heavy load especially with the syz-stress tool
>>>>running, with crashes as follows in schedule_tail:
>>>>
>>>>Unable to handle kernel access to user memory without uaccess routines
>>>>at virtual address 000000002749f0d0
>>>>Oops [#1]
>>>>Modules linked in:
>>>>CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>>>5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>>>Hardware name: riscv-virtio,qemu (DT)
>>>>epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>>>ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>>>epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>>>gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>>>t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>>>s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>>>a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>>>a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>>>s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>>>s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>>>s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>>>s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>>>t5 : ffffffc4043cafba t6 : 0000000000040000
>>>>status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>>>000000000000000f
>>>>Call Trace:
>>>>[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>[<ffffffe000005570>] ret_from_exception+0x0/0x14
>>>>Dumping ftrace buffer:
>>>> (ftrace buffer empty)
>>>>---[ end trace b5f8f9231dc87dda ]---
>>>>
>>>>The issue comes from the put_user() in schedule_tail
>>>>(kernel/sched/core.c) doing the following:
>>>>
>>>>asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>>>{
>>>>...
>>>>      if (current->set_child_tid)
>>>>              put_user(task_pid_vnr(current), current->set_child_tid);
>>>>...
>>>>}
>>>>
>>>>the put_user() macro causes the code sequence to come out as follows:
>>>>
>>>>1:    __enable_user_access()
>>>>2:    reg = task_pid_vnr(current);
>>>>3:    *current->set_child_tid = reg;
>>>>4:    __disable_user_access()
>>>>
>>>>The problem is that we may have a sleeping function as argument which
>>>>could clear SR_SUM causing the panic above. This was fixed by
>>>>evaluating the argument of the put_user() macro outside the user-enabled
>>>>section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>>>enabling user access")"
>>>>
>>>>In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>>>to avoid the same issue we had with put_user() and sleeping functions we
>>>>must ensure code flow can go through switch_to() from within a region of
>>>>code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>>>patch addresses the problem allowing future work to enable full use of
>>>>unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>>>on every access. Make switch_to() save and restore SR_SUM.
>>>>
>>>>Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>>>---
>>>>arch/riscv/include/asm/processor.h | 1 +
>>>>arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>>>arch/riscv/kernel/entry.S          | 8 ++++++++
>>>>3 files changed, 14 insertions(+)
>>>>
>>>>diff --git a/arch/riscv/include/asm/processor.h 
>>>>b/arch/riscv/include/ asm/processor.h
>>>>index 5f56eb9d114a..58fd11c89fe9 100644
>>>>--- a/arch/riscv/include/asm/processor.h
>>>>+++ b/arch/riscv/include/asm/processor.h
>>>>@@ -103,6 +103,7 @@ struct thread_struct {
>>>>    struct __riscv_d_ext_state fstate;
>>>>    unsigned long bad_cause;
>>>>    unsigned long envcfg;
>>>>+    unsigned long status;
>>
>>Do we really need a new member field in `thread_struct`. We already have
>>`sstatus` in `pt_regs` which reflects overall execution environment 
>>situation
>>for current thread. This gets saved and restored on trap entry and exit.
>>
>>If we put `status` in `thread_struct` it creates ambiguity in terms 
>>of which
>>`status` to save to and pick from from future maintainibility 
>>purposes as the
>>fields get introduced to this CSR.
>>
>>Why can't we access current trap frame's `sstatus` image in 
>>`__switch_to` to
>>save and restore?
>>
>>Let me know if I am missing something obvious here. If there is a 
>>complication,
>>I am missing here and we do end up using this member field, I would 
>>rename it
>>to something like `status_kernel` to reflect that. So that future 
>>changes are
>>cognizant of the fact that we have split `status`. One for kernel 
>>execution env
>>per thread and one for controlling user execution env per thread.
>
>This is so long ago now I cannot remember if there was any sstatus in
>the pt_regs field, 

FS/VS bits encode status of floating point and vector on per-thread basis.
So `status` has been part of `pt_regs` for quite a while. 

> and if kernel threads have the same context as their
>userland parts.

I didn't mean kernel thread. What I meant was kernel execution environment
per-thread. A userland thread does spend sometime in kernel and kernel does
things on its behalf. One of those thing is touching user memory and that
requires mucking with this CSR. So what I meant was are we splitting `status`
on per-thread basis for their time spent in user and kernel.

Getting back to original question--
As I said, each thread spends sometime in user or in kernel. `status` in
`pt_regs` is saved on trap entry and restored on trap exit. In a sense,
`status` field in `pt_regs` is reflecting execution status of the thread on per
trap basis. Introducing `status` in `thread_struct` creates a confusion (if not
for today, certainly for future) of which `status` to pick from when we are
doing save/restore.

So my first question was why not to use `status` in `pt_regs`. It is granular
as it can get (it is available per thread context per trap basis). 


I did ask Alex as well. I'll ping him again.

>
>Does anyone else have any comment on this?
>
>>
>>>>    u32 riscv_v_flags;
>>>>    u32 vstate_ctrl;
>>>>    struct __riscv_v_ext_state vstate;
>>>>diff --git a/arch/riscv/kernel/asm-offsets.c 
>>>>b/arch/riscv/kernel/asm- offsets.c
>>>>index 16490755304e..969c65b1fe41 100644
>>>>--- a/arch/riscv/kernel/asm-offsets.c
>>>>+++ b/arch/riscv/kernel/asm-offsets.c
>>>>@@ -34,6 +34,7 @@ void asm_offsets(void)
>>>>    OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>>    OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>>    OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>>
>>_______________________________________________
>>linux-riscv mailing list
>>linux-riscv@lists.infradead.org
>>http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>
>
>-- 
>Ben Dooks				http://www.codethink.co.uk/
>Senior Engineer				Codethink - Providing Genius
>
>https://www.codethink.co.uk/privacy.html
