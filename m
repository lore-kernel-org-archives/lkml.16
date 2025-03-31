Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1759AD23
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391026; cv=none; b=VzSnRoZOgoHa6WAS1mDoQ/OSdF4IN46buBCAThWfs5zgrtuMhYIBlwAMpTQNlNEvP3QeJEMzb5k8pC/UKxHHAT+tpMPx9ZR5wcOohSpWhTR379KqffrLOTdJNd953Xz6arYE/wW1mUqTLRG6Bgi8yw9wnVu0z5ymXpwBZmXz9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391026; c=relaxed/simple;
	bh=kKKTOnBJ54OPwPPvnnNQAu8zmas8rBfCwVfYSXLfWzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYkRs3/pJSckBZ3vgn0ncA8XlsJ1E+j3aKeXTYyOZ6+/m4eyS2blQp9BPymNFTWivHpJ2IJfZFV2kmpsB7U3nuxd1IlpdiDTA1UYi2wxBiiqPdvLZaPEVjGjWwUo9cFQZQpg3RLzRSfTAwCaI/p7eMuN6BoKyeLsmXGAGaRowRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=dlytj7aY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="dlytj7aY"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso6341079a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1743391023; x=1743995823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ve1y9rIgw7MpOuHLy2/X0r0guxkxteZOGTcsbwvgz8=;
        b=dlytj7aYBiQbIXxR7VVPxbG+ToGVg+OJD5YVsA0H+63uEY9vTF7dlM15ZRBhQo6JCw
         RjCz3aNVtv77v1o/0MpLu4zkuVhObStMo5WapoC2c42VfErZ97AwsUT2oygS0Xu1RnTU
         hMfdDuAynGBj3S3XjgsWM4vq8bygZCsgEK0Ln2nIOHH5DFeKud7VbboJR+eVlY5ZSMj8
         /x30kWfLiUTiBfn7PQusIuopGzMMcehk4oEcy5UE2Hu0m9fDs3bPEgHvic0Z7z8s7xg2
         FaY+6wul7ZYZ1DDmF0alS47YcdgMr4voVx+ctqn/HYYFUxCpcuNEAyZmUK3RSXBQDTy5
         AI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743391023; x=1743995823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ve1y9rIgw7MpOuHLy2/X0r0guxkxteZOGTcsbwvgz8=;
        b=OzSB+L1zHcIG7drx6b9w9/CDhhb9ofof1SSxu+DkeLFosRToeh9cYhI57ZyGs5ghaC
         ozEduyb66KCnAb7+m8RfE617TmG7+E5xHLt9vpvO+XG3fxqt0d8yHPP2G9v7V5Ky97Mq
         dauyuJyhjieJ02qVES7zqG5hMpuNVPZO3LheXw6CcjUPPcZgVde18LKMye4nvJyKBEhI
         myzIIv8mV25PA5LYSUPKum2MGrqsGxKCi9eQRmsOoCTySZoSjYKcu7my4KAL/v6+raHo
         4YNjwvWeI/Oon0sFfMCFw8+xurQxT2rIZwOKjcc/5ukf1cQkL7wWooL105VKDQJFcPV0
         h3HA==
X-Forwarded-Encrypted: i=1; AJvYcCXgfxDvwBQcp0MH+CKQIizJ6gjMnHisHaevsQx+aA13PABTou39wSGLhe3Xe9KWMcS/f2j9bphiTAxALus=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDe7qWxulzDRV5N6/w2OuruDN6N/ZDkpZPjDzcmVBXsiGT/T+
	QzMnXg3sPYsswEMI9WHW00bPVkeYLhu6ckwSkiyWfcRMnS5Actc5hdMI3X9T2U5Uzpx0m3USgzI
	=
X-Gm-Gg: ASbGnctrrBHF9PD2zoOUr0CP0g4LWV4Qism3SnTWCxFHnNB0KpgbwKGZery1fR92nu3
	NDio/hKNOVm+c4EqrlXs5H4WMM0NKzJK7R7MO9EjK+XHHHv6g+ijg/5FV1aUyBWcAwA8qsL1Flw
	9lYWTeO4P4A1hwPVrrR7GBTL8E+HDqZNm1q4BZ4XULnMPU50N5OdPHJUXRYJSI3FWE/gAdHv84e
	yV4dqvKrl4Q7qWVUV7pkPUBi9ByNG9y4qx238mmgwB6h8nNuyCDHhJxdpm+7XvRkf5wcgXmWWJB
	AfO1F9Fnz6U+/dl+dZ1PXKd8xkw/p9S/8QmOemUJV/7cmM6HJMwNzn33U4F892lhhA==
X-Google-Smtp-Source: AGHT+IHKYm8fbWsYoc/30U3ZAeQOuSoCj31KxaAwS04vAwKumgmFGo/S/w49O6zSYyn8IbkwBqofBg==
X-Received: by 2002:a17:90b:2e4e:b0:2ff:618c:a1e9 with SMTP id 98e67ed59e1d1-30532153717mr9948595a91.23.1743391023020;
        Sun, 30 Mar 2025 20:17:03 -0700 (PDT)
Received: from [192.168.50.200] ([202.172.96.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ecbb3sm59770065ad.235.2025.03.30.20.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 20:17:02 -0700 (PDT)
Message-ID: <b5755b70-8fbf-4738-b9c1-08947de959be@tenstorrent.com>
Date: Mon, 31 Mar 2025 14:16:57 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] riscv: save the SR_SUM status over switches
To: Alexandre Ghiti <alex@ghiti.fr>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
References: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
 <20250320224423.1838493-2-cyrilbur@tenstorrent.com>
 <7556bdd0-1015-4175-a810-d2d53662ba64@ghiti.fr>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <7556bdd0-1015-4175-a810-d2d53662ba64@ghiti.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/3/2025 8:09 pm, Alexandre Ghiti wrote:
> Hi Cyril/Ben,
> 
> On 20/03/2025 23:44, Cyril Bur wrote:
>> From: Ben Dooks <ben.dooks@codethink.co.uk>
>>
>> When threads/tasks are switched we need to ensure the old execution's
>> SR_SUM state is saved and the new thread has the old SR_SUM state
>> restored.
>>
>> The issue is seen under heavy load especially with the syz-stress tool
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
>> (kernel/sched/core.c)
>> doing the following:
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
>> This means the task_pid_vnr() is being called with user-access enabled
>> which itself is not a good idea, but that is a separate issue. Here we
>> have a function that /might/ sleep being called with the SR_SUM and if
>> it does, then it returns with the SR_SUM flag possibly cleared thus
>> causing the above abort.
>>
>> To try and deal with this, and stop the SR_SUM leaking out into other
>> threads (this has also been tested and see under stress. It can rarely
>> happen but it /does/ under load) make sure the __switch_to() will save
>> and restore the SR_SUM flag, and clear it possibly for the next thread
>> if it does not need it.
>>
>> Note, test code to be supplied once other checks have been finished.
>>
>> There may be further issues with the mstatus flags with this, this
>> can be discussed further once some initial testing has been done.
> 
> 
> The whole changelog is outdated, it needs to be reworded:
> 
> "To prevent the evaluation of preemptible functions in unsafe_get/ 
> put_XXX() which could clear SUM bit set by get_user_access()... etc etc"
> 

Hi Alex and Ben,

Commit messages are not my forte and this one is complex. I've been 
wondering how to reword it - I feel that Bens text should live on, it 
isn't incorrect. Also I would very much appreciate if you could look 
over what I've written Ben.

I'll start it off the same and hopefully I've messaged the end successfully:


From: Ben Dooks <ben.dooks@codethink.co.uk>

When threads/tasks are switched we need to ensure the old execution's
SR_SUM state is saved and the new thread has the old SR_SUM state
restored.

The issue is seen under heavy load especially with the syz-stress tool
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

1:    __enable_user_access()
2:    reg = task_pid_vnr(current);
3:    *current->set_child_tid = reg;
4:    __disable_user_access()

This means the task_pid_vnr() is being called with user-access enabled
which itself is not a good idea, but that is a separate issue. Here we 
have a function that /might/ sleep being called with the SR_SUM and if
it does, then it returns with the SR_SUM flag possibly cleared thus
causing the above abort.

To try and deal with this, and stop the SR_SUM leaking out into other 
threads (this has also been tested and see under stress. It can rarely 
happen but it /does/ under load) make sure the __switch_to() will save 
and restore the SR_SUM flag, and clear it possibly for the next thread 
if it does not need it.

In order for riscv to take advantage of unsafe_get/put_XXX() macros we 
must ensure code flow can go through switch_to() from within a region of 
code with SR_SUM enabled and come back with SR_SUM still enabled. This 
patch addresses the problem allowing future work to enable full use of 
unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost 
on every access.


> 
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
>> index 5f56eb9d114a..0de05d652e0f 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -103,6 +103,7 @@ struct thread_struct {
>>       struct __riscv_d_ext_state fstate;
>>       unsigned long bad_cause;
>>       unsigned long envcfg;
>> +    unsigned long flags;
> 
> 
> I would prefer the use of status since it stores the sstatus csr.

I will change it in the next version of my series.

> 
> 
>>       u32 riscv_v_flags;
>>       u32 vstate_ctrl;
>>       struct __riscv_v_ext_state vstate;
>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm- 
>> offsets.c
>> index e89455a6a0e5..556ebcbb7e22 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -34,6 +34,7 @@ void asm_offsets(void)
>>       OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>       OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>       OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>> +    OFFSET(TASK_THREAD_FLAGS, task_struct, thread.flags);
>>       OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>>       OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>> @@ -347,6 +348,10 @@ void asm_offsets(void)
>>             offsetof(struct task_struct, thread.s[11])
>>           - offsetof(struct task_struct, thread.ra)
>>       );
>> +    DEFINE(TASK_THREAD_FLAGS_RA,
>> +          offsetof(struct task_struct, thread.flags)
>> +        - offsetof(struct task_struct, thread.ra)
>> +    );
>>       DEFINE(TASK_THREAD_F0_F0,
>>             offsetof(struct task_struct, thread.fstate.f[0])
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 33a5a9f2a0d4..c278b3ac37b9 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
>>       REG_S s9,  TASK_THREAD_S9_RA(a3)
>>       REG_S s10, TASK_THREAD_S10_RA(a3)
>>       REG_S s11, TASK_THREAD_S11_RA(a3)
>> +
>> +    /* save (and disable the user space access flag) */
>> +    li    s0, SR_SUM
>> +    csrrc s1, CSR_STATUS, s0
> 
> 
> Here (again), I don't think we need to clear sstatus.

I don't think so either, the bit definitely has no effect in userspace:
 > SUM has no effect when page-based virtual memory is not in effect, 
nor when executing in U-mode.

However, I wonder if Ben had a plan? If not I'll make it a read next 
version of the series.

Thanks,

Cyril

> 
> 
>> +    REG_S s1, TASK_THREAD_FLAGS_RA(a3)
>> +
>>       /* Save the kernel shadow call stack pointer */
>>       scs_save_current
>>       /* Restore context from next->thread */
>> +    REG_L s0,  TASK_THREAD_FLAGS_RA(a4)
>> +    csrs  CSR_STATUS, s0
>>       REG_L ra,  TASK_THREAD_RA_RA(a4)
>>       REG_L sp,  TASK_THREAD_SP_RA(a4)
>>       REG_L s0,  TASK_THREAD_S0_RA(a4)
> 
> 
> Thanks,
> 
> Alex
> 

