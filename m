Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF501494DF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930512; cv=none; b=iWYoEri56z1Ky001Czn7ENHyM5J7UZr3R3WXl8bJwIFBxVmX8vnofNKk4U3Znxt09wMjBQkaG1vorIug7HObPgfaRwJPaA5bsdO1H0o5TF7irQCU/q2zJ00MxZLPcYGFepjqotIn5m0Sea6HYv+FI+rhP/kPny8tkKdWttNptfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930512; c=relaxed/simple;
	bh=W9tZAljYk2uneAzg/GewgWXSfQxR89ktcbPcOX/OsIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXLqUn6SDCg0mHb8gyaM4cQmVGQha/3UuDPYH+VG9HzPBzwNOi3LU3ABkR91bqwnaKZeSAvr+bEN1cMjSPC62pcWnDbMGpoiyhnituIzAJ7jFtqbck1oIzf8Q0byJXbev5OCVYlLVh2ACisRhTR0ddf5Id5rCwCXwveQxBf50Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=XPVS+SuP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="XPVS+SuP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso30435f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1747930506; x=1748535306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D41/WihX/diwHi38+mTJZD/k8kSyHxvXLukXwhNNJso=;
        b=XPVS+SuPXFJ8g5vCVTN76QyfZtjPb3DoMxEkL6floMjZH3SN5i6C9o5KqI4klv0I32
         oX221NZid265Qd8ffoa8Vh2SPUN0ghaRUJY4jO82ZOTDzwWK7wpboPeZmJtUweF7bKoK
         Fqh/bm3xgw887fSgdD+mbpsWWAzA/A0SHfcxGqxs4vw+ZxF+y3GBU6833QUFeeOax1aJ
         lDSTiex00qmvb8S/Ptm4M68C59NOX0xkWuO4u0hax0pFsMg08XelVhJmU5L2RiF17ZER
         Wsfrtu9pnpGAzt6dCnZMFwlp87L3EeYksRxkjjGeu3RzkwFdMg6DDFLJFh1/24RULpZA
         2VCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930506; x=1748535306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D41/WihX/diwHi38+mTJZD/k8kSyHxvXLukXwhNNJso=;
        b=nUx2O6o6gneneNWQPKNX8Ui3Py5ovkHFo8N3X5TFlqgJJH6ecfLOup+p1sZzORo71i
         mhADzCx+MXW7sqOdVPXXyU6lR7SpRFC6HBLEphIM4IEWUhvv/A9S/LRhm7o3dMoxAu4h
         edTBoGnXzePzbKPGwcOGjHjDh1q1V/1o25/o53g8z7HV+w7JuXWSOlMlyXo/ETjJPrm3
         QCdee6uOPBGyw5i8K71HzFQYoPzoW/ATbUxq+QX3QVC3nMDHHHzefVXGPFKaBMN/LSqg
         DFSlGdHql8JGU/KefQwlCVhJC/LlmPrLMZGAY+dXEld6yWsbbbS27YAUogT4vuWNDvp4
         IUNg==
X-Forwarded-Encrypted: i=1; AJvYcCU0ofsQ07IwZOJfCt4sQvNHEc8Ci0mTcZUK0I5fpUQVEkxVcLGNgDuubOfhISUYis8pJ4VeHEhD+Xd3Nzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP7RlEvWr+YLe9gbziKvbC0pAxytp+YIdih9jzYpJ64YCZZU2h
	lV+ABoYqalQB6IUWSqmXC+VAml4CulwunC2uaJnQPjbbJJlk3oQD/Ow5IXT3717L5A==
X-Gm-Gg: ASbGncsh81aJwH9CqRL+tbPNRNEuatonr9aZOwnXbSZPR3JPdCgmaRQ4QHtIMhWDuKw
	2oUR2D901QsQqtbcpsoQ49A/ClHOdCg5bmvfUfNr+nw2vKp3rdVCqnC3zsUkgq7Uf+E2WMHuIKD
	LyZteZL5u30ugYwWGlwdKtD7ZvIQSU6jmhY2QftWBsDdTBLUQ+MYMoIj3xO/EDd+qRsliZKbDbM
	ISXanjaR6o7gPKePFMjhwTb7dp8DMIm0mJMigWTTlcr/oN+/HhIeBGfmvzRDqypSK0Bxwc++Iaq
	deCtPudq15q5pEWsPy4hQ6Cgciu4K3YS/ELuTkyiZIQTv4i7JphT9d/+c+LL248YKmEoAFltgmn
	33JU=
X-Google-Smtp-Source: AGHT+IExwooxDO3Dnzvny29I+w/WYRyAjQsbiLHruKLxaeemWAWVphO2X0WDNYGOrabbkOgj589IdA==
X-Received: by 2002:a05:6000:228a:b0:3a3:7675:902 with SMTP id ffacd0b85a97d-3a4c1526be5mr103277f8f.21.1747930505640;
        Thu, 22 May 2025 09:15:05 -0700 (PDT)
Received: from [172.25.51.40] ([83.144.38.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35e49262fsm22969002f8f.44.2025.05.22.09.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:15:04 -0700 (PDT)
Message-ID: <a22e352d-0701-4143-b005-9309f49325be@tenstorrent.com>
Date: Thu, 22 May 2025 18:15:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v6 1/5] riscv: save the SR_SUM status over
 switches
To: Alexandre Ghiti <alex@ghiti.fr>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <d09e80c2-024c-4fe0-b71e-6af88e239ea9@ghiti.fr>
 <145b6e37-bbb3-47ec-b9dc-3450a7f3da2b@codethink.co.uk>
 <923f3653-3df6-4587-aef1-c449f0fa3377@sifive.com>
 <ea862473-8e8d-4d1b-8236-f8ce75d2589f@ghiti.fr>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <ea862473-8e8d-4d1b-8236-f8ce75d2589f@ghiti.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On 21/5/2025 12:30 am, Alexandre Ghiti wrote:
> Hi Samuel,
> 
> On 5/21/25 15:38, Samuel Holland wrote:
>> Hi Alex, Ben,
>>
>> On 2025-05-21 3:26 AM, Ben Dooks wrote:
>>> On 22/04/2025 11:22, Alexandre Ghiti wrote:
>>>> Hi Cyril,
>>>>
>>>> On 10/04/2025 09:05, Cyril Bur wrote:
>>>>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>
>>>>> When threads/tasks are switched we need to ensure the old execution's
>>>>> SR_SUM state is saved and the new thread has the old SR_SUM state
>>>>> restored.
>>>>>
>>>>> The issue was seen under heavy load especially with the syz-stress 
>>>>> tool
>>>>> running, with crashes as follows in schedule_tail:
>>>>>
>>>>> Unable to handle kernel access to user memory without uaccess routines
>>>>> at virtual address 000000002749f0d0
>>>>> Oops [#1]
>>>>> Modules linked in:
>>>>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>>>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>>>> Hardware name: riscv-virtio,qemu (DT)
>>>>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>>    ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>>>>    ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>>>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>>>>    gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>>>>    t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>>>>    s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>>>>    a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>>>>    a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>>>>    s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>>>>    s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>>>>    s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>>>>    s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>>>>    t5 : ffffffc4043cafba t6 : 0000000000040000
>>>>> status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>>>> 000000000000000f
>>>>> Call Trace:
>>>>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>>>>> Dumping ftrace buffer:
>>>>>      (ftrace buffer empty)
>>>>> ---[ end trace b5f8f9231dc87dda ]---
>>>>>
>>>>> The issue comes from the put_user() in schedule_tail
>>>>> (kernel/sched/core.c) doing the following:
>>>>>
>>>>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>>>> {
>>>>> ...
>>>>>           if (current->set_child_tid)
>>>>>                   put_user(task_pid_vnr(current), current- 
>>>>> >set_child_tid);
>>>>> ...
>>>>> }
>>>>>
>>>>> the put_user() macro causes the code sequence to come out as follows:
>>>>>
>>>>> 1:    __enable_user_access()
>>>>> 2:    reg = task_pid_vnr(current);
>>>>> 3:    *current->set_child_tid = reg;
>>>>> 4:    __disable_user_access()
>>>>>
>>>>> The problem is that we may have a sleeping function as argument which
>>>>> could clear SR_SUM causing the panic above. This was fixed by
>>>>> evaluating the argument of the put_user() macro outside the user- 
>>>>> enabled
>>>>> section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>>>> enabling user access")"
>>>>>
>>>>> In order for riscv to take advantage of unsafe_get/put_XXX() macros 
>>>>> and
>>>>> to avoid the same issue we had with put_user() and sleeping 
>>>>> functions we
>>>>> must ensure code flow can go through switch_to() from within a 
>>>>> region of
>>>>> code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>>>> patch addresses the problem allowing future work to enable full use of
>>>>> unsafe_get/put_XXX() macros without needing to take a CSR bit flip 
>>>>> cost
>>>>> on every access. Make switch_to() save and restore SR_SUM.
>>>>>
>>>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>>>> ---
>>>>>    arch/riscv/include/asm/processor.h | 1 +
>>>>>    arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>>>>    arch/riscv/kernel/entry.S          | 8 ++++++++
>>>>>    3 files changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/ 
>>>>> include/ asm/
>>>>> processor.h
>>>>> index 5f56eb9d114a..58fd11c89fe9 100644
>>>>> --- a/arch/riscv/include/asm/processor.h
>>>>> +++ b/arch/riscv/include/asm/processor.h
>>>>> @@ -103,6 +103,7 @@ struct thread_struct {
>>>>>        struct __riscv_d_ext_state fstate;
>>>>>        unsigned long bad_cause;
>>>>>        unsigned long envcfg;
>>>>> +    unsigned long status;
>>>>>        u32 riscv_v_flags;
>>>>>        u32 vstate_ctrl;
>>>>>        struct __riscv_v_ext_state vstate;
>>>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/ 
>>>>> asm- offsets.c
>>>>> index 16490755304e..969c65b1fe41 100644
>>>>> --- a/arch/riscv/kernel/asm-offsets.c
>>>>> +++ b/arch/riscv/kernel/asm-offsets.c
>>>>> @@ -34,6 +34,7 @@ void asm_offsets(void)
>>>>>        OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>>>        OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>>>        OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>>>>> +    OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
>>>>>        OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>>>>>        OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, 
>>>>> thread_info.preempt_count);
>>>>> @@ -346,6 +347,10 @@ void asm_offsets(void)
>>>>>              offsetof(struct task_struct, thread.s[11])
>>>>>            - offsetof(struct task_struct, thread.ra)
>>>>>        );
>>>>> +    DEFINE(TASK_THREAD_STATUS_RA,
>>>>> +          offsetof(struct task_struct, thread.status)
>>>>> +        - offsetof(struct task_struct, thread.ra)
>>>>> +    );
>>>>>        DEFINE(TASK_THREAD_F0_F0,
>>>>>              offsetof(struct task_struct, thread.fstate.f[0])
>>>>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>>>> index 33a5a9f2a0d4..00bd0de9faa2 100644
>>>>> --- a/arch/riscv/kernel/entry.S
>>>>> +++ b/arch/riscv/kernel/entry.S
>>>>> @@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
>>>>>        REG_S s9,  TASK_THREAD_S9_RA(a3)
>>>>>        REG_S s10, TASK_THREAD_S10_RA(a3)
>>>>>        REG_S s11, TASK_THREAD_S11_RA(a3)
>>>>> +
>>>>> +    /* save the user space access flag */
>>>>> +    li    s0, SR_SUM
>>>>
>>>> This is not needed anymore ^ but I'll remove it when merging your 
>>>> patchset.
>>>>
>>> Could you be more specific about what "this" is?
>>>
>>> If we don't save/restore the SR_SUM bit I think our old friend
>>> the sched_tail bug will just return.
>> I think Alex is saying the `li` instruction above is not needed 
>> because s0 is
>> unused. But instead I think there is an `and` instruction missing 
>> here. The
>> patch as merged ORs the entirety of the old sstatus with the new 
>> sstatus, not
>> just the SUM bit, which seems extremely dangerous.
> 
> 
> I should have checked the definition of csrs, I thought it would write 
> the csr, but you're right it ORs with the current csr value which isn't 
> good at all.
> 
> @Cyril Can you send a patch for that? Which also removes the `li` 
> instruction that I forgot to remove :) I think we can even ask Palmer to 
> squash those fixes directly into the patch.

So I've sent a patch. In writing it, I think Ben was correct to have the 
original patch clear the SUM bit. The way we have it now, if the SUM bit 
is ever set, we don't clear it when swapping to the new thread. The 
condition is unlikely but if you extrapolate far enough, in theory, we 
could start running with the SUM bit effectively permanently on.

Should I resend with also clearing the SUM bit in between?

Cyril
> 
> Let me know if you can't do it and I'll do.
> 
> Thanks Samuel for noticing,
> 
> Alex
> 
> 
>>
>> Regards,
>> Samuel
>>
>>>>> +    csrr  s1, CSR_STATUS
>>>>> +    REG_S s1, TASK_THREAD_STATUS_RA(a3)
>>>>> +
>>>>>        /* Save the kernel shadow call stack pointer */
>>>>>        scs_save_current
>>>>>        /* Restore context from next->thread */
>>>>> +    REG_L s0,  TASK_THREAD_STATUS_RA(a4)
>>>>> +    csrs  CSR_STATUS, s0
>>>>>        REG_L ra,  TASK_THREAD_RA_RA(a4)
>>>>>        REG_L sp,  TASK_THREAD_SP_RA(a4)
>>>>>        REG_L s0,  TASK_THREAD_S0_RA(a4)
>>>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>>>
>>>> Thanks for the multiple revisions!
>>>>
>>>> Alex
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>>
>>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

