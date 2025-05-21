Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE826C3BE
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834734; cv=none; b=S42LSr0lHA6Wzhy8iA54BlGDvfIOAVhlP5y3QJAoRNzIFGYjYLG3RXZdNJIE9dcmBQgRGoM+kCCmNIUxJDQVS+SGMatUaTyJIZGPB5uSHPg1uP7JAcSCccZgZz8x+T4VT+ajMfgmuNm521NMu8epd6b9LCAwkzfmZPlwms7u9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834734; c=relaxed/simple;
	bh=+hx5oFOWS2EEMUuSNGEtygX7a5yEtzU9AUkzGfmmmIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kge86FpYDDVVoIl+xdoLFHhYUbPsJJBA6tPz1H48DIaLbrTIp9K0zMU6E/MelzNw6kXm9xwHJUTr67SeTwYot6U7agsiuzpaLND8foj1YgYP50YVJI72oT0MMESmCWGKa+TixfzY8YfmKB3SkHFmfG8NIHlh1ed8SnDNfPo8E2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Nb7WIhEb; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Nb7WIhEb"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so21791035ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747834731; x=1748439531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr62Og+upiE+Vmsw/qF8mQucOR+O+HKyEY/t5hX6fU8=;
        b=Nb7WIhEbYluGzxliqgVJh4UFo8KjSj7JDNdkmI+o6g1rtbRWNFoBerXzpuFkUGEEaA
         my8qBACW+tsGhaNIGOrZHwKnz75VCmbmz5WBpSEoFbGhrbnOUIrHqfd/Tf9uG4nPaIGV
         2/zxPgES/pHS/6SdipLmWg4YRDU2U8O7qNFlnFzanuFH2TwTN+SKHkq8mHFhK49E4RK0
         yo5o15Ai1huEWkzhd7Hc+7ihBdIJpohmJgBL1NVdavExBy8kW1Ghx1w9eV3rQ+BRx4ZN
         UNHLBeq6FEj62ZX20bIM15T65oTAB4LN3sMzTD5Z53qgTmQNYgpgykw0d/R7YOk/cJsG
         cW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834731; x=1748439531;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mr62Og+upiE+Vmsw/qF8mQucOR+O+HKyEY/t5hX6fU8=;
        b=NIm4Q/fw4+dXfF9hKecLbROJtWlR6+adTnhzRU7BFUTyettB8IpIDoL7yUDarFHfyV
         PeOoVIUFJeNmjDGwAFiGk6k/IIBn7Y7/1Q+KFR/pjxlss/POsXgu5igSJRsmNyux+PFt
         8nIPjseioGlfigBgdNaawkX5QTggJNh43UAYE9Av6lUY6sER6EgCotNl2Uq80Uy+qZfD
         k32wjOdMCrcr0QyMnmnY5Xh7GDtzKa8/3vPqouQJYHSWmoXke+FcNPGrQcHUER7n/SvG
         wlKPemVnEcCL9HCdEPggYmo7OP5nBZgeLnNLOhpbVG/Ie2imZVxeIwD4cy2ml7o50UDE
         ZGBw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Xc313unPOPQzM6SxaSMcz9Uwz3qqjWvmeWVUVZH2oyzeb5CsoZ+OHJSCJn/eYDfuiyhDeU/v0+a8sfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Pz+m+zWUsq620wum5bvR5jwMAAXpjM6Xg8/xCjFzLyBR5Luf
	DHgX2nCBmX4gb9aLyXs1LTD1ezciUHpGAw+jSQce0mEH715VCpXxBN3KpNf6sikTfac=
X-Gm-Gg: ASbGncu10VVyOA48Az90Gnieau8rVgkLpLygNyjAD0BDicU3lvqu6BMfW2CofZu9A3T
	jGZDJ+Oaq6TthD+ZdTaGxUSpVJ0X+ZsMv3Wgvi69f+xqCju4Bv0JDNc52ChiScHHxaPqMhXvQpR
	KEL/SBXXyYRAssIqFsMCf+YQ8x8gYCOqVHjrbq/UEkBf33YEZ0TUB4tRV6qyL7Ddv3Zg18+LV4b
	BGH4iGNbcTcQOIskCrLzwlGRTIPE5qNuKz9rtg/mof2o33DDLg7Yye3G9lZq6Q9mNTqsMNgyiSY
	jsjwSQY46O+BfoGGZovr8DLFYibmdlxfiYH/wrLXs71Z4gMbIH2cqSXEmKAYpK4u/ik=
X-Google-Smtp-Source: AGHT+IEoQfJ6k0wDVty/sMe7IB2jV0oVzP9HtEBtOdbmbjOl/XRVecj61zCeT5zseFlTs9zk3/3E6g==
X-Received: by 2002:a05:6e02:330c:b0:3dc:811c:db71 with SMTP id e9e14a558f8ab-3dc811cdd26mr42013685ab.4.1747834730954;
        Wed, 21 May 2025 06:38:50 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc8a912a34sm324685ab.46.2025.05.21.06.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:38:50 -0700 (PDT)
Message-ID: <923f3653-3df6-4587-aef1-c449f0fa3377@sifive.com>
Date: Wed, 21 May 2025 08:38:49 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
To: Ben Dooks <ben.dooks@codethink.co.uk>, Alexandre Ghiti <alex@ghiti.fr>,
 palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Cyril Bur <cyrilbur@tenstorrent.com>, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, charlie@rivosinc.com, jrtc27@jrtc27.com
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <d09e80c2-024c-4fe0-b71e-6af88e239ea9@ghiti.fr>
 <145b6e37-bbb3-47ec-b9dc-3450a7f3da2b@codethink.co.uk>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <145b6e37-bbb3-47ec-b9dc-3450a7f3da2b@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alex, Ben,

On 2025-05-21 3:26 AM, Ben Dooks wrote:
> On 22/04/2025 11:22, Alexandre Ghiti wrote:
>> Hi Cyril,
>>
>> On 10/04/2025 09:05, Cyril Bur wrote:
>>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>
>>> When threads/tasks are switched we need to ensure the old execution's
>>> SR_SUM state is saved and the new thread has the old SR_SUM state
>>> restored.
>>>
>>> The issue was seen under heavy load especially with the syz-stress tool
>>> running, with crashes as follows in schedule_tail:
>>>
>>> Unable to handle kernel access to user memory without uaccess routines
>>> at virtual address 000000002749f0d0
>>> Oops [#1]
>>> Modules linked in:
>>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>> Hardware name: riscv-virtio,qemu (DT)
>>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>   ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>>   ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>>   gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>>   t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>>   s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>>   a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>>   a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>>   s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>>   s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>>   s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>>   s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>>   t5 : ffffffc4043cafba t6 : 0000000000040000
>>> status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>> 000000000000000f
>>> Call Trace:
>>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>>> Dumping ftrace buffer:
>>>     (ftrace buffer empty)
>>> ---[ end trace b5f8f9231dc87dda ]---
>>>
>>> The issue comes from the put_user() in schedule_tail
>>> (kernel/sched/core.c) doing the following:
>>>
>>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>> {
>>> ...
>>>          if (current->set_child_tid)
>>>                  put_user(task_pid_vnr(current), current->set_child_tid);
>>> ...
>>> }
>>>
>>> the put_user() macro causes the code sequence to come out as follows:
>>>
>>> 1:    __enable_user_access()
>>> 2:    reg = task_pid_vnr(current);
>>> 3:    *current->set_child_tid = reg;
>>> 4:    __disable_user_access()
>>>
>>> The problem is that we may have a sleeping function as argument which
>>> could clear SR_SUM causing the panic above. This was fixed by
>>> evaluating the argument of the put_user() macro outside the user-enabled
>>> section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>> enabling user access")"
>>>
>>> In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>> to avoid the same issue we had with put_user() and sleeping functions we
>>> must ensure code flow can go through switch_to() from within a region of
>>> code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>> patch addresses the problem allowing future work to enable full use of
>>> unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>> on every access. Make switch_to() save and restore SR_SUM.
>>>
>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>> ---
>>>   arch/riscv/include/asm/processor.h | 1 +
>>>   arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>>   arch/riscv/kernel/entry.S          | 8 ++++++++
>>>   3 files changed, 14 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/ asm/
>>> processor.h
>>> index 5f56eb9d114a..58fd11c89fe9 100644
>>> --- a/arch/riscv/include/asm/processor.h
>>> +++ b/arch/riscv/include/asm/processor.h
>>> @@ -103,6 +103,7 @@ struct thread_struct {
>>>       struct __riscv_d_ext_state fstate;
>>>       unsigned long bad_cause;
>>>       unsigned long envcfg;
>>> +    unsigned long status;
>>>       u32 riscv_v_flags;
>>>       u32 vstate_ctrl;
>>>       struct __riscv_v_ext_state vstate;
>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm- offsets.c
>>> index 16490755304e..969c65b1fe41 100644
>>> --- a/arch/riscv/kernel/asm-offsets.c
>>> +++ b/arch/riscv/kernel/asm-offsets.c
>>> @@ -34,6 +34,7 @@ void asm_offsets(void)
>>>       OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>       OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>       OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>>> +    OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
>>>       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>>>       OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>>> @@ -346,6 +347,10 @@ void asm_offsets(void)
>>>             offsetof(struct task_struct, thread.s[11])
>>>           - offsetof(struct task_struct, thread.ra)
>>>       );
>>> +    DEFINE(TASK_THREAD_STATUS_RA,
>>> +          offsetof(struct task_struct, thread.status)
>>> +        - offsetof(struct task_struct, thread.ra)
>>> +    );
>>>       DEFINE(TASK_THREAD_F0_F0,
>>>             offsetof(struct task_struct, thread.fstate.f[0])
>>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>> index 33a5a9f2a0d4..00bd0de9faa2 100644
>>> --- a/arch/riscv/kernel/entry.S
>>> +++ b/arch/riscv/kernel/entry.S
>>> @@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
>>>       REG_S s9,  TASK_THREAD_S9_RA(a3)
>>>       REG_S s10, TASK_THREAD_S10_RA(a3)
>>>       REG_S s11, TASK_THREAD_S11_RA(a3)
>>> +
>>> +    /* save the user space access flag */
>>> +    li    s0, SR_SUM
>>
>>
>> This is not needed anymore ^ but I'll remove it when merging your patchset.
>>
> 
> Could you be more specific about what "this" is?
> 
> If we don't save/restore the SR_SUM bit I think our old friend
> the sched_tail bug will just return.

I think Alex is saying the `li` instruction above is not needed because s0 is
unused. But instead I think there is an `and` instruction missing here. The
patch as merged ORs the entirety of the old sstatus with the new sstatus, not
just the SUM bit, which seems extremely dangerous.

Regards,
Samuel

>>> +    csrr  s1, CSR_STATUS
>>> +    REG_S s1, TASK_THREAD_STATUS_RA(a3)
>>> +
>>>       /* Save the kernel shadow call stack pointer */
>>>       scs_save_current
>>>       /* Restore context from next->thread */
>>> +    REG_L s0,  TASK_THREAD_STATUS_RA(a4)
>>> +    csrs  CSR_STATUS, s0
>>>       REG_L ra,  TASK_THREAD_RA_RA(a4)
>>>       REG_L sp,  TASK_THREAD_SP_RA(a4)
>>>       REG_L s0,  TASK_THREAD_S0_RA(a4)
>>
>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>
>> Thanks for the multiple revisions!
>>
>> Alex
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
> 
> 

