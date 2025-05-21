Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E81DD9AB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838758; cv=none; b=jLAW2gH3yuV+hN/8hlm8UVB7RJdw2DrShs5IfvdYeoYYEEhV4TfDSE+wXIFo7bLQOdlI7dK9LVk71TPt00LzkdeyRrxsBtxAoLO89y3RN0G0qXFQS6nORUPLxylxs6eK6Qrp8ozj6LV6p4pDILaIAsyhpMXWOUKL17mO9UOb5u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838758; c=relaxed/simple;
	bh=iYX/zA7Q+rb+F3nlGwugxIqy5TaKTKGP1baNV9BPjqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4zRsBAyM0nks4L56wOYC4FzgwO3fjsr3hFz+sQG1vgu2SjN4NRiyiKi0n1fqs1+VcsTJuhss7MTZSS5U+Bsr/+vXeOiniq4TFSJPMJ2JPoby9vnNtHsx2HtYyE5NZe1QghDscosH976u3fKUcY+huniUFdUl2u2O+2x1BYSEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=cj0lyg2C; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="cj0lyg2C"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ede096d73so50744245e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1747838754; x=1748443554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95KaRblLuW/izK5ZHGYXoj7V1jWGiqPvWT2NoGphqZQ=;
        b=cj0lyg2CkdtHAIjs4eja+oRqd9bzMPc6Bes4GXfHGtrkVK3w9O91POneuyZQL4/58L
         46jxl56Vc8M1TTP5YpZ8R/Jjk8tecsE4pQuAjrEEmXs/Cdmfd3ySvknamAAwINfcE/Se
         wG75zSEED+Q/qVCqTNilK/X7p3zLmnR5cfY8USxVcwtycHJxOaLE0w9MsPfxSmJpy5ac
         UrckSIrnJdUIFminyeHxYHOy/aRB5S8Ok6QMAZFmaTHraVF40zziEr1SLyzKtwcNFtPh
         zg0D+Vt4iwNCrphHrsVEXbBG5N42g8bgqmPe4GuNqvEAOgtxLyi76IQJyC0xJURZfJ+r
         RG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838754; x=1748443554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95KaRblLuW/izK5ZHGYXoj7V1jWGiqPvWT2NoGphqZQ=;
        b=xGCggXBkyTgLdguxuodmPmsjNS1DtlM3lKFbEGCbUSrueMCF7hk9AFiLIZkhKYiiRE
         xwuQ67pn21nlhBSK7rUJiem3kMeKxyN7Y3sEbIYhzc2D54JsuCWZA5L4emMh7cG8dkYH
         og6cWMNhaaeGxKCQk03F4wc956GzDNHRe5a24aZZuR8ZjB6+KUtucVfeVvA0O0mJ00eO
         IyIJinnv5XQldVLemC08Ux7uAZHACzBJi+h8bFuRIrN2M26s9ksdapnbgQWkbL3Uwn2N
         yQ9f8R/uUBEXy1HwnK9pvXxS829B9bW2H+MG7wQp0MUWPv4Rdt8x9vCmpkbENOi4K92H
         iZFg==
X-Forwarded-Encrypted: i=1; AJvYcCV5DRCLt0iHEw8gxpYj9OC42hlkjg476cznBgzgA4jZkGik01QYSt6IUwpDHBHi3Fjao1Vm1GDh4erCqqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZX7VqdMJz3u4ldid55scpk+EawaU4NOVTOusy1kKAh3/pFA36
	048Crzr3CoJ5x7Z3FZi0VW3ufOvQ+F6+j+BiUtgtJV446LhKfc0w2BQLef+nQ5yE0Q==
X-Gm-Gg: ASbGnctGZmawLwOL6lTpsfIFQWiHw3iANVyP1Cz2xZffVksU6GPN//jX2Yn2IOwqfih
	wCVq6F4kdD+sm1UJyns9V7aH2yiICm7iUmn17bQtB73IsRhXK9UdKcHyz4ZkFCz0b+70WR5WKqd
	dyTQqLhSKEVdrwNXSE5EgmbaLelJA2fGoxJDmcYqH+OxVjbCjUI3joKhxVgufznlwjYf9C/SP8z
	fyHMNrUyeBRqmGyUm/5dUE2KEjDF1CK0uSQLk+wMzoEfnB/AcdzkXQmVqsajj80VXTrVfUkeJuS
	B6j8KtOZ3wMeeUoPIGotUz21HkNfmYCOffpsSCGkxgzNvMu59fQGXiSZ19F3G8tGVCSe+zhXLJz
	bR2DAbf/N0uLG27dGl9IHv4mpdwZA3XSSDq8LsmQoC+sX6TzsvLk=
X-Google-Smtp-Source: AGHT+IGJX9ihlwesY/4oB5ujx+BcIky97cKMVgQ6sO3z0AQnAqdxxIm3CiW54Koq4vCrJcownQxp1Q==
X-Received: by 2002:a05:600c:ccb:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-442fd5a2bfemr245741245e9.0.1747838753958;
        Wed, 21 May 2025 07:45:53 -0700 (PDT)
Received: from [192.168.1.21] (lfbn-idf1-1-1841-122.w90-91.abo.wanadoo.fr. [90.91.27.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78b0a46sm69403945e9.30.2025.05.21.07.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:45:53 -0700 (PDT)
Message-ID: <453e4b8f-bb96-4ed6-ab33-8e4eca5c63ce@tenstorrent.com>
Date: Wed, 21 May 2025 16:45:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
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

Hi Alex,

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

Yes can do, I'll whip something up.

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

