Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC61C84C9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837822; cv=none; b=DYfiRW6t/3KjZlEaAsDYdEZOIltG4o9nRSCEJuHELS7NhfWgjNitSDqjdZ/9sWtZ0XBuCAn34DcFxJ+tyqPatdYK4cnDtyWjovH5uDIroat2cMbXTmkMXq7vA4muVio3xRlPOs3tiOYSrRyjIjxA3HPX3Sn3GTGAQoohrPU2Lkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837822; c=relaxed/simple;
	bh=uA96qCTfh3MvuOx3zyE5pmZCIq0A2/THR7TSIDalp8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7okW5jD8t4kQ35AgcoquAKAKeKoTA4p36lLWGHHXYLELEU/I22aP/vyEsuLB/Kws32LmlYgO0syxruoVzejds0s32nPYoSo7BhvXYC2DUzVMwEqf3mIuIWKniB4AE/i6cpioIz3KXbPOoTLdKt7W/LXv1Ppg6pXvSIi1CunSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 034001FCF3;
	Wed, 21 May 2025 14:30:12 +0000 (UTC)
Message-ID: <ea862473-8e8d-4d1b-8236-f8ce75d2589f@ghiti.fr>
Date: Wed, 21 May 2025 16:30:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
To: Samuel Holland <samuel.holland@sifive.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Cyril Bur <cyrilbur@tenstorrent.com>, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, charlie@rivosinc.com, jrtc27@jrtc27.com
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <d09e80c2-024c-4fe0-b71e-6af88e239ea9@ghiti.fr>
 <145b6e37-bbb3-47ec-b9dc-3450a7f3da2b@codethink.co.uk>
 <923f3653-3df6-4587-aef1-c449f0fa3377@sifive.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <923f3653-3df6-4587-aef1-c449f0fa3377@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffedvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedvleeivdevgeekudefjeeigeeuvdekueeiuedufeethffhiedvleeileduuddtgfenucffohhmrghinhepvghnthhrhidrshgspdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudehhedvmegtvdeivdemvggsjegsmedvfhdufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudehhedvmegtvdeivdemvggsjegsmedvfhdufedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudehhedvmegtvdeivdemvggsjegsmedvfhdufegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepshgrmhhuvghlrdhhohhllhgrnhgusehsihhfihhvvgdrtghomhdprhgtphhtthhopegsvghnr
 dguohhokhhssegtohguvghthhhinhhkrdgtohdruhhkpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjshiihhgrnhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshiiisghothdovgejgegsleegfhgviedtudgrsgelheehvdguieelsehshiiikhgrlhhlvghrrdgrphhpshhpohhtmhgrihhlrdgtohhmpdhrtghpthhtoheptgihrhhilhgsuhhrsehtvghnshhtohhrrhgvnhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi Samuel,

On 5/21/25 15:38, Samuel Holland wrote:
> Hi Alex, Ben,
>
> On 2025-05-21 3:26 AM, Ben Dooks wrote:
>> On 22/04/2025 11:22, Alexandre Ghiti wrote:
>>> Hi Cyril,
>>>
>>> On 10/04/2025 09:05, Cyril Bur wrote:
>>>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>
>>>> When threads/tasks are switched we need to ensure the old execution's
>>>> SR_SUM state is saved and the new thread has the old SR_SUM state
>>>> restored.
>>>>
>>>> The issue was seen under heavy load especially with the syz-stress tool
>>>> running, with crashes as follows in schedule_tail:
>>>>
>>>> Unable to handle kernel access to user memory without uaccess routines
>>>> at virtual address 000000002749f0d0
>>>> Oops [#1]
>>>> Modules linked in:
>>>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>>> Hardware name: riscv-virtio,qemu (DT)
>>>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>    ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>>>    ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>>>    gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>>>    t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>>>    s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>>>    a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>>>    a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>>>    s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>>>    s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>>>    s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>>>    s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>>>    t5 : ffffffc4043cafba t6 : 0000000000040000
>>>> status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>>> 000000000000000f
>>>> Call Trace:
>>>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>>>> Dumping ftrace buffer:
>>>>      (ftrace buffer empty)
>>>> ---[ end trace b5f8f9231dc87dda ]---
>>>>
>>>> The issue comes from the put_user() in schedule_tail
>>>> (kernel/sched/core.c) doing the following:
>>>>
>>>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>>> {
>>>> ...
>>>>           if (current->set_child_tid)
>>>>                   put_user(task_pid_vnr(current), current->set_child_tid);
>>>> ...
>>>> }
>>>>
>>>> the put_user() macro causes the code sequence to come out as follows:
>>>>
>>>> 1:    __enable_user_access()
>>>> 2:    reg = task_pid_vnr(current);
>>>> 3:    *current->set_child_tid = reg;
>>>> 4:    __disable_user_access()
>>>>
>>>> The problem is that we may have a sleeping function as argument which
>>>> could clear SR_SUM causing the panic above. This was fixed by
>>>> evaluating the argument of the put_user() macro outside the user-enabled
>>>> section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>>> enabling user access")"
>>>>
>>>> In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>>> to avoid the same issue we had with put_user() and sleeping functions we
>>>> must ensure code flow can go through switch_to() from within a region of
>>>> code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>>> patch addresses the problem allowing future work to enable full use of
>>>> unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>>> on every access. Make switch_to() save and restore SR_SUM.
>>>>
>>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>>> ---
>>>>    arch/riscv/include/asm/processor.h | 1 +
>>>>    arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>>>    arch/riscv/kernel/entry.S          | 8 ++++++++
>>>>    3 files changed, 14 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/ asm/
>>>> processor.h
>>>> index 5f56eb9d114a..58fd11c89fe9 100644
>>>> --- a/arch/riscv/include/asm/processor.h
>>>> +++ b/arch/riscv/include/asm/processor.h
>>>> @@ -103,6 +103,7 @@ struct thread_struct {
>>>>        struct __riscv_d_ext_state fstate;
>>>>        unsigned long bad_cause;
>>>>        unsigned long envcfg;
>>>> +    unsigned long status;
>>>>        u32 riscv_v_flags;
>>>>        u32 vstate_ctrl;
>>>>        struct __riscv_v_ext_state vstate;
>>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm- offsets.c
>>>> index 16490755304e..969c65b1fe41 100644
>>>> --- a/arch/riscv/kernel/asm-offsets.c
>>>> +++ b/arch/riscv/kernel/asm-offsets.c
>>>> @@ -34,6 +34,7 @@ void asm_offsets(void)
>>>>        OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>>        OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>>        OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>>>> +    OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
>>>>        OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>>>>        OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>>>> @@ -346,6 +347,10 @@ void asm_offsets(void)
>>>>              offsetof(struct task_struct, thread.s[11])
>>>>            - offsetof(struct task_struct, thread.ra)
>>>>        );
>>>> +    DEFINE(TASK_THREAD_STATUS_RA,
>>>> +          offsetof(struct task_struct, thread.status)
>>>> +        - offsetof(struct task_struct, thread.ra)
>>>> +    );
>>>>        DEFINE(TASK_THREAD_F0_F0,
>>>>              offsetof(struct task_struct, thread.fstate.f[0])
>>>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>>> index 33a5a9f2a0d4..00bd0de9faa2 100644
>>>> --- a/arch/riscv/kernel/entry.S
>>>> +++ b/arch/riscv/kernel/entry.S
>>>> @@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
>>>>        REG_S s9,  TASK_THREAD_S9_RA(a3)
>>>>        REG_S s10, TASK_THREAD_S10_RA(a3)
>>>>        REG_S s11, TASK_THREAD_S11_RA(a3)
>>>> +
>>>> +    /* save the user space access flag */
>>>> +    li    s0, SR_SUM
>>>
>>> This is not needed anymore ^ but I'll remove it when merging your patchset.
>>>
>> Could you be more specific about what "this" is?
>>
>> If we don't save/restore the SR_SUM bit I think our old friend
>> the sched_tail bug will just return.
> I think Alex is saying the `li` instruction above is not needed because s0 is
> unused. But instead I think there is an `and` instruction missing here. The
> patch as merged ORs the entirety of the old sstatus with the new sstatus, not
> just the SUM bit, which seems extremely dangerous.


I should have checked the definition of csrs, I thought it would write 
the csr, but you're right it ORs with the current csr value which isn't 
good at all.

@Cyril Can you send a patch for that? Which also removes the `li` 
instruction that I forgot to remove :) I think we can even ask Palmer to 
squash those fixes directly into the patch.

Let me know if you can't do it and I'll do.

Thanks Samuel for noticing,

Alex


>
> Regards,
> Samuel
>
>>>> +    csrr  s1, CSR_STATUS
>>>> +    REG_S s1, TASK_THREAD_STATUS_RA(a3)
>>>> +
>>>>        /* Save the kernel shadow call stack pointer */
>>>>        scs_save_current
>>>>        /* Restore context from next->thread */
>>>> +    REG_L s0,  TASK_THREAD_STATUS_RA(a4)
>>>> +    csrs  CSR_STATUS, s0
>>>>        REG_L ra,  TASK_THREAD_RA_RA(a4)
>>>>        REG_L sp,  TASK_THREAD_SP_RA(a4)
>>>>        REG_L s0,  TASK_THREAD_S0_RA(a4)
>>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>>
>>> Thanks for the multiple revisions!
>>>
>>> Alex
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>
>>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
