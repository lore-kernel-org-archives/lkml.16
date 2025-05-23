Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF62297B89
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020488; cv=none; b=n9frB3HwfvPIxKLPJwBFDVbIO5wJRBwZGm/18YQQ1R7eIKv1QCerLDUGc5zyyJ0jTm32wVhKjmi5tTca7/CFjgsdB75OeJeMMJSdfKgQaT2Ezoq4UhsOA/2BcXxpofx++KNrXNxXhUGUWCIGwph9wSznDKuofAGaz42bJum4o0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020488; c=relaxed/simple;
	bh=r2tIcGv/a54i+slS4UvLN7wMAS3AqDTQT3RLgno1eLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnEqCMD2Vj2mor3vdWdNINOg5v0H91cZosHmQmA1tGmKiQnfg3ijBw4hAQP4LWzCUYxpER23FBNBUUQaONUWHCMmonWTCigETUILJSuhQ3De2gNQLyCxN7Nyb8y/5W1DrFpZXUYCSJuiACwcBRayewI4LDbmonJt3VSguPi07Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=B3MLZdK6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="B3MLZdK6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2320d06b728so1015715ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748020484; x=1748625284; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ILKfp+PhHp1JJ4V01gttad8fE6fV6QpycD/TPbbAGI=;
        b=B3MLZdK6DX+eIzK9ceTuxGQs9JLt1FSQ5gcnIn8zFvJ8/pfM0/0e/F/UZe1knpETNx
         ht+NNLJID1CFt/p8dOB67Tc4+jvPe2Dr6u2HMlyPlQvMESXWNH1AdmRLy2NcrHyrknh/
         d8bVrvPy0qUR2fQs3Lb1Yz/0zFEnF341ZSUtsmNx+QDTUrbxQGJ/X0gJZxdIhm6uDv8a
         8ykbFnokaZDuYQrytttdzeD/fNRDpYyIF2oRk1lJSbxVqXq5QMWe9RNnLao0sJRwx/3J
         vqYn6y3vO8sXoT98LhVJT8rpbxHhMvzFgx6P2qu0FKtyLo4wj8m6uWLaj2XQxAhqw/T6
         G23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020484; x=1748625284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ILKfp+PhHp1JJ4V01gttad8fE6fV6QpycD/TPbbAGI=;
        b=L5svPasvP+EO1FNCqxZV7nafOsiKPz4qt0cRJRLcsfLlKc90Xk5+tpqUj2Sf7HUEVa
         U9Q7rxMlnWbqR4F0ypQCLeb7jHrfAWECv5vCBxZ4q6aszstypE8TlvIgNwm2Sp0DTlPU
         2I2qE9vyvI7kAetPDlJo0T2j9RFPtPnbMfrTNR2OMcYLXlWTlOlkqoPbE1gzzh9Mq8sw
         O8Druutz/jTL3XeC1p1TCFhl8Zvzfs1uRPufd/RSPkYoc4x9pIpNsGOqKRMZysf9jwxU
         ux4Y+Tr/TVstV/IeCer6cXeCdKrAlucm+LvvG+2x+NCyfRB0LaVoj2NtT3xy2LxiZf07
         +JMA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Z+xMm24U3aa5LlYr0r565lJnun9VAZETPe/aUllV+LSHdRl/FSq0bTi10ifMy1W+ZmsAkz+a5Pvc0mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTz88fbP4e69Aa+ffMYjKgubM5GoqZVQjA0tBInPF7P6hh09A7
	8EYn6HqyMroxGjxd89ZPHlPDE6+rTE4Mq7fIkJ2bILxwxH8tX6Pr3dhd3UD9IpMTw9k=
X-Gm-Gg: ASbGncvuHetuA6y/ojkDI/r7JLFZ+OEk/xeb+NCgx4xyuPhtWrWx3K7vaCWfvVt9MQv
	JRNmHXYoEUo+6HB8anWL/CLGGxpeRyenMfBuSL8u1Ll52Oh8C/Nw3d+qjzyyyVB2pNwoZ6qEUFX
	PnM5N5mflSQqkA4WiddPEEs8/WozTef84huATUxtH8lgz1hJ2twK3Jgk+h1lbJ4CGk8LvI+XaCi
	jWTDMQNIAMzi17rAiITo0wrf6cFLIR1lF/iJKk+9XCMMV5quYDyWhepuDoVtndlmrCVbZFvRBMg
	onS0fblGFFjWP0dNYk9RhgQ7cZoFQrBW8s+8M6NFkrwTny7C7Ekrz1Z7nc9kgg==
X-Google-Smtp-Source: AGHT+IFYZp9eIXDMvWYA6hNO9vlZGOyZj5S0G8khsz4GfqLECIT4FzVceMBBxmyKMIqEgFnPJUUCxQ==
X-Received: by 2002:a17:902:ea04:b0:233:fbb3:c5bc with SMTP id d9443c01a7336-23414f6d173mr2700345ad.19.1748020484256;
        Fri, 23 May 2025 10:14:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac91acsm126024045ad.46.2025.05.23.10.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:14:43 -0700 (PDT)
Date: Fri, 23 May 2025 10:14:41 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andy Chiu <andybnac@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	charlie@rivosinc.com, jrtc27@jrtc27.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
Message-ID: <aDCtATl2N21fBsyT@debug.ba.rivosinc.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
 <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com>
 <b39891f0-1e1a-4559-b35b-5262fe5af93c@codethink.co.uk>
 <aC85d8Hnstck-_gx@debug.ba.rivosinc.com>
 <CAFTtA3MMx+fAk6DsV5tT9HkeW67zstp-Lrge9kZMW0Z60SVi0A@mail.gmail.com>
 <aC-oelGP53vtpuJG@debug.ba.rivosinc.com>
 <54d63ebf-b66f-41d4-85b1-ec0fa3401333@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54d63ebf-b66f-41d4-85b1-ec0fa3401333@ghiti.fr>

On Fri, May 23, 2025 at 02:22:21PM +0200, Alexandre Ghiti wrote:
>Hi Andy, Deepak,
>
>On 5/23/25 00:43, Deepak Gupta wrote:
>>On Fri, May 23, 2025 at 01:42:49AM +0800, Andy Chiu wrote:
>>>On Thu, May 22, 2025 at 11:09 PM Deepak Gupta <debug@rivosinc.com> 
>>>wrote:
>>>>
>>>>On Thu, May 22, 2025 at 07:23:32AM +0100, Ben Dooks wrote:
>>>>>On 20/05/2025 17:49, Deepak Gupta wrote:
>>>>>>I did give this patch my RB and had planned to come back to it to see
>>>>>>if it impacts cfi related patches. Thanks to alex for brinigng to my
>>>>>>attention again. As it stands today, it doesn't impact cfi related
>>>>>>changes but I've some concerns.
>>>>>>
>>>>>>Overall I do agree we should reduce number of SSTATUS accesses.
>>>>>>
>>>>>>Couple of questions on introducing new `sstatus` field (inline)
>>>>>>
>>>>>>On Tue, Apr 22, 2025 at 04:01:35PM -0700, Deepak Gupta wrote:
>>>>>>>On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
>>>>>>>>From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>>>
>>>>>>>>When threads/tasks are switched we need to ensure the old 
>>>>execution's
>>>>>>>>SR_SUM state is saved and the new thread has the old SR_SUM state
>>>>>>>>restored.
>>>>>>>>
>>>>>>>>The issue was seen under heavy load especially with the 
>>>>syz-stress tool
>>>>>>>>running, with crashes as follows in schedule_tail:
>>>>>>>>
>>>>>>>>Unable to handle kernel access to user memory without 
>>>>uaccess routines
>>>>>>>>at virtual address 000000002749f0d0
>>>>>>>>Oops [#1]
>>>>>>>>Modules linked in:
>>>>>>>>CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>>>>>>>5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>>>>>>>Hardware name: riscv-virtio,qemu (DT)
>>>>>>>>epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>>>>>ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>>>>>>>ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>>>>>>>epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>>>>>>>gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>>>>>>>t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>>>>>>>s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>>>>>>>a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>>>>>>>a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>>>>>>>s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>>>>>>>s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>>>>>>>s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>>>>>>>s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>>>>>>>t5 : ffffffc4043cafba t6 : 0000000000040000
>>>>>>>>status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>>>>>>>000000000000000f
>>>>>>>>Call Trace:
>>>>>>>>[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 
>>>>kernel/sched/core.c:4264
>>>>>>>>[<ffffffe000005570>] ret_from_exception+0x0/0x14
>>>>>>>>Dumping ftrace buffer:
>>>>>>>> (ftrace buffer empty)
>>>>>>>>---[ end trace b5f8f9231dc87dda ]---
>>>>>>>>
>>>>>>>>The issue comes from the put_user() in schedule_tail
>>>>>>>>(kernel/sched/core.c) doing the following:
>>>>>>>>
>>>>>>>>asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>>>>>>>{
>>>>>>>>...
>>>>>>>>      if (current->set_child_tid)
>>>>>>>>              put_user(task_pid_vnr(current), 
>>>>current->set_child_tid);
>>>>>>>>...
>>>>>>>>}
>>>>>>>>
>>>>>>>>the put_user() macro causes the code sequence to come out as 
>>>>follows:
>>>>>>>>
>>>>>>>>1:    __enable_user_access()
>>>>>>>>2:    reg = task_pid_vnr(current);
>>>>>>>>3:    *current->set_child_tid = reg;
>>>>>>>>4:    __disable_user_access()
>>>>>>>>
>>>>>>>>The problem is that we may have a sleeping function as 
>>>>argument which
>>>>>>>>could clear SR_SUM causing the panic above. This was fixed by
>>>>>>>>evaluating the argument of the put_user() macro outside the 
>>>>user-enabled
>>>>>>>>section in commit 285a76bb2cf5 ("riscv: evaluate put_user() 
>>>>arg before
>>>>>>>>enabling user access")"
>>>>>>>>
>>>>>>>>In order for riscv to take advantage of unsafe_get/put_XXX() 
>>>>macros and
>>>>>>>>to avoid the same issue we had with put_user() and sleeping 
>>>>functions we
>>>>>>>>must ensure code flow can go through switch_to() from within 
>>>>a region of
>>>>>>>>code with SR_SUM enabled and come back with SR_SUM still 
>>>>enabled. This
>>>>>>>>patch addresses the problem allowing future work to enable 
>>>>full use of
>>>>>>>>unsafe_get/put_XXX() macros without needing to take a CSR 
>>>>bit flip cost
>>>>>>>>on every access. Make switch_to() save and restore SR_SUM.
>>>>>>>>
>>>>>>>>Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>>>>>>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>>>Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>>>>>>>---
>>>>>>>>arch/riscv/include/asm/processor.h | 1 +
>>>>>>>>arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>>>>>>>arch/riscv/kernel/entry.S          | 8 ++++++++
>>>>>>>>3 files changed, 14 insertions(+)
>>>>>>>>
>>>>>>>>diff --git a/arch/riscv/include/asm/processor.h
>>>>>>>>b/arch/riscv/include/ asm/processor.h
>>>>>>>>index 5f56eb9d114a..58fd11c89fe9 100644
>>>>>>>>--- a/arch/riscv/include/asm/processor.h
>>>>>>>>+++ b/arch/riscv/include/asm/processor.h
>>>>>>>>@@ -103,6 +103,7 @@ struct thread_struct {
>>>>>>>>    struct __riscv_d_ext_state fstate;
>>>>>>>>    unsigned long bad_cause;
>>>>>>>>    unsigned long envcfg;
>>>>>>>>+    unsigned long status;
>>>>>>
>>>>>>Do we really need a new member field in `thread_struct`. We 
>>>>already have
>>>>>>`sstatus` in `pt_regs` which reflects overall execution environment
>>>>>>situation
>>>>>>for current thread. This gets saved and restored on trap entry 
>>>>and exit.
>>>>>>
>>>>>>If we put `status` in `thread_struct` it creates ambiguity in terms
>>>>>>of which
>>>>>>`status` to save to and pick from from future maintainibility
>>>>>>purposes as the
>>>>>>fields get introduced to this CSR.
>>>>>>
>>>>>>Why can't we access current trap frame's `sstatus` image in
>>>>>>`__switch_to` to
>>>>>>save and restore?
>>>>>>
>>>>>>Let me know if I am missing something obvious here. If there is a
>>>>>>complication,
>>>>>>I am missing here and we do end up using this member field, I would
>>>>>>rename it
>>>>>>to something like `status_kernel` to reflect that. So that future
>>>>>>changes are
>>>>>>cognizant of the fact that we have split `status`. One for kernel
>>>>>>execution env
>>>>>>per thread and one for controlling user execution env per thread.
>>>>>
>>>>>This is so long ago now I cannot remember if there was any sstatus in
>>>>>the pt_regs field,
>>>>
>>>>FS/VS bits encode status of floating point and vector on 
>>>>per-thread basis.
>>>>So `status` has been part of `pt_regs` for quite a while.
>>>>
>>>>> and if kernel threads have the same context as their
>>>>>userland parts.
>>>>
>>>>I didn't mean kernel thread. What I meant was kernel execution 
>>>>environment
>>>>per-thread. A userland thread does spend sometime in kernel and 
>>>>kernel does
>>>>things on its behalf. One of those thing is touching user memory 
>>>>and that
>>>>requires mucking with this CSR. So what I meant was are we 
>>>>splitting `status`
>>>>on per-thread basis for their time spent in user and kernel.
>>>>
>>>>Getting back to original question--
>>>>As I said, each thread spends sometime in user or in kernel. 
>>>>`status` in
>>>>`pt_regs` is saved on trap entry and restored on trap exit. In a sense,
>>>>`status` field in `pt_regs` is reflecting execution status of 
>>>>the thread on per
>>>>trap basis. Introducing `status` in `thread_struct` creates a 
>>>>confusion (if not
>>>>for today, certainly for future) of which `status` to pick from 
>>>>when we are
>>>>doing save/restore.
>>>
>>>I agree that it's a confusion. sstatus is already saved on pt_regs on
>>>trap entries/return, adding another entry adds code complexity and
>>>makes data inconsistent. But, perhaps we'd eventually need something
>>>like this (I will explain why). Still, there might be a better
>>>approach.
>>>
>>>Yes, we can always reflect pt_regs for sstatus. We all know that
>>>pt_regs reflects sstatus at trap entry, and the pt_regs at scheduler
>>>point refers to "user's" pt_regs whenever it first enters kernel 
>>>mode. Here
>>>are reasons why SR_SUM here may or may not be properly tracked. First,
>>>if this is a trap introduced context switch (such as interrupting in a
>>>preemptible context after we manually enable user access in put_user),
>>>then SR_SUM is saved somewhere in the kernel stack, and is not
>>>reference-able with task_pt_reg during context switch. But we are safe
>>>because the trap exit asm would help us restore the correct SR_SUM
>>>back. However, if this is a self-initiating context switch (calling
>>>into schedule()), then SR_SUM is not saved anywhere, and possibly
>>>causing this error.
>>>
>>>Preemptible Vector in the kernel mode also had this problem where a
>>>self-initiating context switch loses the track of sstatus.vs. The way
>>>I managed it is to track the VS bit at context switch time. However,
>>>this bug shows that people are repeatedly facing the problem, and
>>>maybe it suggests that we'd need a better way of managing sstatus
>>>across context switches. Given the complex nature of this register,
>>>which also touches the interrupt enable status, I don't think naively
>>>saving/restoring the entire register is the way to go. Maybe the
>>>variable deserves a more specific naming and documentation. And if
>>>we'd need a centralized place for managing these statuses, then it
>>>also has to take care of sstatus.VS.
>
>
>Andy, thanks for the precise explanation of the problem :)
>
>So it took me some time but here are my thoughts on this. We should 
>treat pt_regs and thread_struct differently as they do not represent 
>the same thing:
>- pt_regs represents the context of a thread when it takes a trap
>- thread_struct represents a "kernel-induced" (or a "in-kernel") 
>context not caused by traps

Exactly they represent different context of execution. Trap represents a
non-linear control flow change and thus a fresh start of execution control
flow into kernel while `kernel-induced` one's are again non-linear but
fully a kernel/software construct.

A fresh trapped execution context shouldn't have SUM set which is how it is
currently in kernel. This bit gets cleared in trap entry and `sstatus` gets
saved in `pt_regs` (including SR_IE) so that it could be restored whenever
`sret` happens.

The problem we'are seeing here is two fold--

1) We don't want to set and clear when we are accessing array/string for each
    word. This is software problem and this entire series is addressing it.

2) To avoid first problem we are optimizing the access to CSR by setting it
    once and clearing it once. But now we don't want to loose this bit if there
    were:

	a) trap in between 
         b) kernel induced schedule out
         c) a) followed by b)
         d) a) followed by another a)
         e) nested traps

If a) occurs, we are definitley loosing the bit as per current code. If b)
happens then also the same situation.

Saving it in `thread_struct` only addresses `b`. And not `a`, `c`, `d` and
`e`. IMHO `e` is far-fetched situation but I believe `a`, `b`, `c` and `d` happen
during normal runtime of kernel.

So it all depends on nesting level of traps supported by riscv kernel.

Illustraing `c + d` example, if kernel can take 2 nested level of traps with
first trap context having had the SUM bit set, but the second trap had it clear
and now comes the switch out of this thread, at this point if it were saved in
`thread_struct` SUM would be lost for the first trap.

Later when the thread gets switched in again, you would go in 2nd trap
context without SUM (because `thread_context` didnt had it saved), which is
fine. Although when 2nd trap context eventually performs `sret`, it will
go back to first trap context where SUM was expected to be set because it
touching a user memory.

A good example would be a syscall, so that's the first trap. SUM bit is set,
touched user memory and took a trap (page fault). Now code is in second trap
which should clear the SUM bit. Somewhere in memory manager stack, thread is
scheduled out and now `sstatus` is saved in `thread_struct`. This is only
serving current trap context needs and not the one where `SUM` needed to be
set.

We can support such nesting only by ensuring below

On trap entry do 
- save `status` in `pt_regs` or some other FILO data structure
- clear SUM (and other bits needed to be cleared)

On trap return do
- reload `status` from `pt_regs` or some FILO data structure

Quite analogous to what we do for SR_IE as well.

>
>That's why I don't really like Deepak's proposal below as it mixes 
>both and I find it tricky.
>
>I can't find a situation where saving/restoring the entire sstatus at 
>context-switch is a problem though, does anyone have such thing in 
>mind?
>
>Finally I understand that having another copy of sstatus in 
>thread_struct is not intuitive and we should, either explain why or 
>only store the SUM bit (like for sstatus.VS).
>
>Please continue the discussion as we need to find a solution that 
>pleases everyone soon :)
>
>Thanks all for jumping in,
>
>Alex
>
>
>>
>>
>>IMHO, the problem we are trying to solve in this patch is easily 
>>solvable in
>>below manner.
>>
>>
>>diff --git a/arch/riscv/include/asm/switch_to.h 
>>b/arch/riscv/include/asm/switch_to.h
>>index 0e71eb82f920..499d00a6fb67 100644
>>--- a/arch/riscv/include/asm/switch_to.h
>>+++ b/arch/riscv/include/asm/switch_to.h
>>@@ -58,6 +58,20 @@ static inline void __switch_to_fpu(struct 
>>task_struct *prev,
>>        fstate_restore(next, task_pt_regs(next));
>> }
>>
>>+static inline void __switch_to_status(struct task_struct *prev,
>>+                                  struct task_struct *next)
>>+{
>>+       struct pt_regs *regs;
>>+
>>+       /* save status */
>>+       regs = task_pt_regs(prev);
>>+       regs->status = csr_read(CSR_STATUS);
>>+
>>+       /* restore status */
>>+       regs = task_pt_regs(next);
>>+       csr_write(CSR_STATUS, regs->status);
>>+}
>>+
>> static __always_inline bool has_fpu(void)
>> {
>>        return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
>>@@ -115,6 +129,7 @@ do 
>>{                                                        \
>>        struct task_struct *__prev = (prev);            \
>>        struct task_struct *__next = (next);            \
>>        __set_prev_cpu(__prev->thread);                 \
>>+       __switch_to_status(__prev, __next)              \
>>        if (has_fpu())                                  \
>>                __switch_to_fpu(__prev, __next);        \
>>        if (has_vector() || has_xtheadvector())         \
>>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>index 8d25837a9384..a3b98c1be055 100644
>>--- a/arch/riscv/kernel/entry.S
>>+++ b/arch/riscv/kernel/entry.S
>>@@ -162,17 +162,8 @@ SYM_CODE_START(handle_exception)
>>        REG_S x5,  PT_T0(sp)
>>        save_from_x6_to_x31
>>
>>-       /*
>>-        * Disable user-mode memory access as it should only be set 
>>in the
>>-        * actual user copy routines.
>>-        *
>>-        * Disable the FPU/Vector to detect illegal usage of 
>>floating point
>>-        * or vector in kernel space.
>>-        */
>>-       li t0, SR_SUM | SR_FS_VS | SR_ELP
>>-
>>        REG_L s0, TASK_TI_USER_SP(tp)
>>-       csrrc s1, CSR_STATUS, t0
>>+       csrr s1, CSR_STATUS
>>        save_userssp s2, s1
>>        csrr s2, CSR_EPC
>>        csrr s3, CSR_TVAL
>>@@ -185,6 +176,16 @@ SYM_CODE_START(handle_exception)
>>        REG_S s4, PT_CAUSE(sp)
>>        REG_S s5, PT_TP(sp)
>>
>>+       /*
>>+        * It is fresh trap entry. Disable user-mode memory access 
>>as it should only be set in the
>>+        * actual user copy routines.
>>+        *
>>+        * Disable the FPU/Vector to detect illegal usage of 
>>floating point
>>+        * or vector in kernel space.
>>+        */
>>+       li t0, SR_SUM | SR_FS_VS | SR_ELP
>>+       csrrc s1, CSR_STATUS, t0
>>+
>>        /*
>>         * Set the scratch register to 0, so that if a recursive 
>>exception
>>         * occurs, the exception vector knows it came from the kernel
>>
>>
>>
>>During the time spent in kernel if sets SUM bit in status then, above
>>`__switch_to_status` will ensure that `status` will get saved for current
>>thread and restored for next thread.
>>
>>Furthermore, current trap entry code clears FS/VS/SUM (for right 
>>reasons). It
>>represents non-linear change of control flow and thus whatever will 
>>execute next
>>shouldn't need SUM/FS/VS unless it wants to set it). This patch slightly
>>modifies the flow by first saving the `status` on trap frame (thus 
>>if previous
>>trap frame had SUM=1, it will be saved and restored). And then it
>>unconditionally clears the SUM/FS/VS to ensure that this new trap 
>>context runs
>>without needing SUM=1. This ensures nesting of trap frames without 
>>diluting
>>security properties of SUM.
>>
>>>
>>>Thanks,
>>>Andy
>>>
>>>
>>>
>>>
>>>>
>>>>So my first question was why not to use `status` in `pt_regs`. 
>>>>It is granular
>>>>as it can get (it is available per thread context per trap basis).
>>>>
>>>>
>>>>I did ask Alex as well. I'll ping him again.
>>>>
>>>>>
>>>>>Does anyone else have any comment on this?
>>>>>
>>>>>>
>>>>>>>>    u32 riscv_v_flags;
>>>>>>>>    u32 vstate_ctrl;
>>>>>>>>    struct __riscv_v_ext_state vstate;
>>>>>>>>diff --git a/arch/riscv/kernel/asm-offsets.c
>>>>>>>>b/arch/riscv/kernel/asm- offsets.c
>>>>>>>>index 16490755304e..969c65b1fe41 100644
>>>>>>>>--- a/arch/riscv/kernel/asm-offsets.c
>>>>>>>>+++ b/arch/riscv/kernel/asm-offsets.c
>>>>>>>>@@ -34,6 +34,7 @@ void asm_offsets(void)
>>>>>>>>    OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>>>>>>    OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>>>>>>    OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>>>>>>
>>>>>>_______________________________________________
>>>>>>linux-riscv mailing list
>>>>>>linux-riscv@lists.infradead.org
>>>>>>http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>>>>
>>>>>
>>>>>
>>>>>--
>>>>>Ben Dooks http://www.codethink.co.uk/
>>>>>Senior Engineer                                Codethink - 
>>>>Providing Genius
>>>>>
>>>>>https://www.codethink.co.uk/privacy.html
>>>>
>>>>_______________________________________________
>>>>linux-riscv mailing list
>>>>linux-riscv@lists.infradead.org
>>>>http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>>_______________________________________________
>>linux-riscv mailing list
>>linux-riscv@lists.infradead.org
>>http://lists.infradead.org/mailman/listinfo/linux-riscv
