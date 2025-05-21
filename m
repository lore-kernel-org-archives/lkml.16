Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BCA20D509
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815988; cv=none; b=ReFgGySQhoOfs29iI2icP2vaHlpzZPWy2CFpZ5OAQ0GEiX1gCFnumgUKqQJZB9mmrJse2aWl4272Fj7bdqIU9+iK037v16IDdh96UZpjmd8FReKfVqw8Y1ubSrgd4IT9WBwHv2m/rq22zfjt+8nlcHVspaCkWCWHa8BMoOdgn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815988; c=relaxed/simple;
	bh=exX6EiFRV2s9NLbkGlB/wKAtH/cp6uJ0cB7HcdMbvyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtDz70eVOqqm4NxBsbs0Ojvc1yNimgiKe71C/1n6sSp7RHSxa482ROZpca5R/x1/i9qwQ+XmLTO4Skf1vK3BYXJ/NKDpvsE7jXPpZ+7gljyuBt53G/xpmayqFKmF6pdeAolInXYSJFELe1ARgyT0ibdTMi+iag2dnlKAWQhq5tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=f0kP9C9p; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="f0kP9C9p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=unY4ZkkFJvMvzpRLBpHRrQvWzW6DFaqYnyjHyxE82Yk=; b=f0kP9C9pbk5QepmdxX7LsfuN/C
	97Tur95xdAkqqpgmOzWxOU6tiNaFGxvuLGp3gJ+OodpUleMfqAz4Mw5Ub4J9bDYZH+OzuBBC+xAGE
	ji4tBK69AG4TWEEzsijBnQnc1DdW/9VMDxXZVRWLwq07oEi1sQ0bgnjTiGybaQlgiQT1c1uGcru3x
	xdZR6Q8cdxPGZLMauLxnUrH6yGbMzviVvMq+PXAq7yJ0WZD1TX5RYP/IKupyS+OvZibxbcAkk0Yy8
	ybVUv4b/FKJfjjeNUt5ccF/mK91bIkpZcqXAx6l9LghMrl/R9yd8gpFDDDYNSM+Uy0L5Q3flh7qhb
	JDGabJ4Q==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uHemB-00FE3X-F6; Wed, 21 May 2025 09:26:12 +0100
Message-ID: <145b6e37-bbb3-47ec-b9dc-3450a7f3da2b@codethink.co.uk>
Date: Wed, 21 May 2025 09:26:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
To: Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 charlie@rivosinc.com, jrtc27@jrtc27.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <d09e80c2-024c-4fe0-b71e-6af88e239ea9@ghiti.fr>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <d09e80c2-024c-4fe0-b71e-6af88e239ea9@ghiti.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: ben.dooks@codethink.co.uk

On 22/04/2025 11:22, Alexandre Ghiti wrote:
> Hi Cyril,
> 
> On 10/04/2025 09:05, Cyril Bur wrote:
>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>
>> When threads/tasks are switched we need to ensure the old execution's
>> SR_SUM state is saved and the new thread has the old SR_SUM state
>> restored.
>>
>> The issue was seen under heavy load especially with the syz-stress tool
>> running, with crashes as follows in schedule_tail:
>>
>> Unable to handle kernel access to user memory without uaccess routines
>> at virtual address 000000002749f0d0
>> Oops [#1]
>> Modules linked in:
>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>> Hardware name: riscv-virtio,qemu (DT)
>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>   ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>   ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>   gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>   t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>   s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>   a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>   a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>   s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>   s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>   s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>   s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>   t5 : ffffffc4043cafba t6 : 0000000000040000
>> status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>> 000000000000000f
>> Call Trace:
>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>> Dumping ftrace buffer:
>>     (ftrace buffer empty)
>> ---[ end trace b5f8f9231dc87dda ]---
>>
>> The issue comes from the put_user() in schedule_tail
>> (kernel/sched/core.c) doing the following:
>>
>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
>> {
>> ...
>>          if (current->set_child_tid)
>>                  put_user(task_pid_vnr(current), current->set_child_tid);
>> ...
>> }
>>
>> the put_user() macro causes the code sequence to come out as follows:
>>
>> 1:    __enable_user_access()
>> 2:    reg = task_pid_vnr(current);
>> 3:    *current->set_child_tid = reg;
>> 4:    __disable_user_access()
>>
>> The problem is that we may have a sleeping function as argument which
>> could clear SR_SUM causing the panic above. This was fixed by
>> evaluating the argument of the put_user() macro outside the user-enabled
>> section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>> enabling user access")"
>>
>> In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>> to avoid the same issue we had with put_user() and sleeping functions we
>> must ensure code flow can go through switch_to() from within a region of
>> code with SR_SUM enabled and come back with SR_SUM still enabled. This
>> patch addresses the problem allowing future work to enable full use of
>> unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>> on every access. Make switch_to() save and restore SR_SUM.
>>
>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>> ---
>>   arch/riscv/include/asm/processor.h | 1 +
>>   arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>   arch/riscv/kernel/entry.S          | 8 ++++++++
>>   3 files changed, 14 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/ 
>> asm/processor.h
>> index 5f56eb9d114a..58fd11c89fe9 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -103,6 +103,7 @@ struct thread_struct {
>>       struct __riscv_d_ext_state fstate;
>>       unsigned long bad_cause;
>>       unsigned long envcfg;
>> +    unsigned long status;
>>       u32 riscv_v_flags;
>>       u32 vstate_ctrl;
>>       struct __riscv_v_ext_state vstate;
>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm- 
>> offsets.c
>> index 16490755304e..969c65b1fe41 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -34,6 +34,7 @@ void asm_offsets(void)
>>       OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>       OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>       OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>> +    OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
>>       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>>       OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, 
>> thread_info.preempt_count);
>> @@ -346,6 +347,10 @@ void asm_offsets(void)
>>             offsetof(struct task_struct, thread.s[11])
>>           - offsetof(struct task_struct, thread.ra)
>>       );
>> +    DEFINE(TASK_THREAD_STATUS_RA,
>> +          offsetof(struct task_struct, thread.status)
>> +        - offsetof(struct task_struct, thread.ra)
>> +    );
>>       DEFINE(TASK_THREAD_F0_F0,
>>             offsetof(struct task_struct, thread.fstate.f[0])
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 33a5a9f2a0d4..00bd0de9faa2 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
>>       REG_S s9,  TASK_THREAD_S9_RA(a3)
>>       REG_S s10, TASK_THREAD_S10_RA(a3)
>>       REG_S s11, TASK_THREAD_S11_RA(a3)
>> +
>> +    /* save the user space access flag */
>> +    li    s0, SR_SUM
> 
> 
> This is not needed anymore ^ but I'll remove it when merging your patchset.
> 

Could you be more specific about what "this" is?

If we don't save/restore the SR_SUM bit I think our old friend
the sched_tail bug will just return.


>> +    csrr  s1, CSR_STATUS
>> +    REG_S s1, TASK_THREAD_STATUS_RA(a3)
>> +
>>       /* Save the kernel shadow call stack pointer */
>>       scs_save_current
>>       /* Restore context from next->thread */
>> +    REG_L s0,  TASK_THREAD_STATUS_RA(a4)
>> +    csrs  CSR_STATUS, s0
>>       REG_L ra,  TASK_THREAD_RA_RA(a4)
>>       REG_L sp,  TASK_THREAD_SP_RA(a4)
>>       REG_L s0,  TASK_THREAD_S0_RA(a4)
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> Thanks for the multiple revisions!
> 
> Alex
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
