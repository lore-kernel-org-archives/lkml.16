Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3CE1EB5E1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308638; cv=none; b=udzHyBwoFRDl30UmY4V4IPDPty0RI2Yo54ZmVSxY56w640d2QdZJ0Yasg9ZvaMRsphmPx75fb3OZhavavxoGvvkA5Ee8St+ovbIKpp5anxVsrZrfvQ1IXga8b4DHKZjrZB78FXyDVNqg/fOumlcstE7RaN5V6vE9G9aPIRKvfuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308638; c=relaxed/simple;
	bh=W6fiirVxDej/XyiK9p1ILMBMNLmS8HDMUagTWQuqTDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtJkmwF6eFe9lzX/IdgVvlnBlu/Z5+fXaJRJQ/tqpjHXbBAq3GY+JyPsW/++tRBjiRl4rIOZc6l30iYy3txzdnIrMeWTq8eAmjEImi0Kn3erZG5c+fafEjKz0fM3iGj/SWYBPKE8ESB9GJMJx5igNbXontGCBqdYEj/YBGGscOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=M691sO3x; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="M691sO3x"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso47920335e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745308633; x=1745913433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqBOHlwj4256j3dBDjYtf6K6K4BniWJZiGKAMEj4vds=;
        b=M691sO3xTi7Jzd+ly4D7LcCoHV3DDMjrtH4LCxW+4o468T5+onnhBbB/0t7nE88Fjv
         YIezrgi+oDbDJ0qGOXd8Uf08hWaGOUWHhgxLR2KvH9Fy4tjAOq4emnwNYF0E80tMkjMX
         VueV87n91mW0S2gweXv9hSCuWHZjmrJyUGjC+cb838W/D2/oepI56hLjvccrujsFpYTc
         5rvILSSOiVexy1juMW5l1KsdVDOqGdbHo7sX0ladIEHYA5ZOsBbqHOndgfID5A0jueB0
         kgc0ZvhtLncVrqp96LK3kOTaXbPBHywOQR/CISLODw81npnDGiOSuN3I/lYM5nVxS3Ft
         ELmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308633; x=1745913433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqBOHlwj4256j3dBDjYtf6K6K4BniWJZiGKAMEj4vds=;
        b=L2ma0nYuBX29wuL33ag2pQexoE8/L1JGPnUwMxQE1Vx3p+ZfCBARaRwuS2xFErIKnO
         cGYh4RiMZvkauy7NNJQQ3TK209L/WOtx/6bnSM398dkRnM2CkW85ny8GdhXgHSBaQiNF
         I2cKzlc1R9ISdikIRyd/LLQOIgjyzbQv31SaMSXUGPxaFHQZtMAGy9fynknW9Ct2yRie
         GacnKSUjDRNcp4WVyDxSru67SCHK8V2EXELn4nRWR3vXkxfmCczdpL15H7Jy75PaBXag
         nGEmlMsF/aZVbxBKT9khty7IMSWIOvgyE5uGLFqZPyKWUaie4qftcfW2/2WcLv54K42J
         8BBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPybdah/alG4Zqh212RN5hINAg3GB+CZC2mox2oY9gEiKeGgQlcyGunr17thF0IkokjtkMrLjUmfhJbAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzUxtNcAWQMSGzhHyGTDQkFz+eB5F1WHaA8ZB8uGcmUEMkSJd
	/rlazDyeRA3IiwsthwjSPpYipxEsyFRfG/Zuq+Ksq2HbOt9+7HAx5yli8rkXkvU=
X-Gm-Gg: ASbGncvCWacrHZN+SxchmGHjzFwa9ZCX3avKw+VILBafZRT7vcMomHZBMu6dJUH6YIt
	dzumipUnR3xcPFX4drS+I89zPYfGoH9vbxIs5VFqPUCfp5cIqMXdLlCrwVs6w3kFGJjlbUcjgEU
	nVDy15Lm7pOq+eKwpZf+jjT8S6lOKCIHD4I4rVdq7i7v+hCNyu5pkZHx6fsYaeU5Cups+paSOH+
	Nz4SlF4BoEeTbb03HPlOqx0uFf7qGzRLk1aK74jcYAjUr09S+BWq4fNft/YnFJwflIQPdj84rRd
	ntQ1IKR0UlpcRS+KFmtZ1ywEATOBq9/r/nJehW+w9Ubwq8iAOzy/oLNryARK5xTfnKcmHsr4JYI
	9zIFJ1B+88Q==
X-Google-Smtp-Source: AGHT+IGhvdPbJvZOktQCBqw/2wUTXP1WKMQk4VP2N0DETPu5Pgx5Z2h8MnL3dE4kU4vPi/MEVPmpBQ==
X-Received: by 2002:a05:600c:1547:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-4406aba756emr107164305e9.19.1745308633516;
        Tue, 22 Apr 2025 00:57:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d7a3dsm160623495e9.38.2025.04.22.00.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:57:12 -0700 (PDT)
Message-ID: <2c4f4422-d9c9-4d36-b0ef-f68779b91ee9@rivosinc.com>
Date: Tue, 22 Apr 2025 09:57:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] riscv: misaligned: factorize trap handling
To: Alexandre Ghiti <alex@ghiti.fr>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
 <20250414123543.1615478-2-cleger@rivosinc.com>
 <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/04/2025 09:06, Alexandre Ghiti wrote:
> Hi Clément,
> 
> 
> On 14/04/2025 14:34, Clément Léger wrote:
>> misaligned accesses traps are not nmi and should be treated as normal
>> one using irqentry_enter()/exit().
> 
> 
> All the traps that come from kernel mode are treated as nmi as it was
> suggested by Peter here: https://lore.kernel.org/linux-riscv/
> Yyhv4UUXuSfvMOw+@hirez.programming.kicks-ass.net/
> 
> I don't know the differences between irq_nmi_entry/exit() and irq_entry/
> exit(), so is that still correct to now treat the kernel traps as non-nmi?

Hi Alex,

Actually, this discussion was raised on a previous series [1] by Maciej
which replied that we should actually reenable interrupt depending on
the state that was interrupted. Looking at other architecture/code, it
seems like treating misaligned accesses as NMI is probably not the right
way. For instance, loongarch treats them as normal IRQ using a
irqentry_enter()/exit() and reenabling IRQS if possible.

Moreover, it looks like to me that misaligned access traps are similar
(in the way they can be handled) to how the page fault are handled in
RISC-V. It uses irqentry_enter()/exit() and reenables interrupts if
needed. Additionally, the misaligned access handling does will not take
any locks if handling a misaligned access taken while in kernel so even
if we interrupt a kernel critical section that does not have interrupts
disable, we are good to go. But my understanding might be wrong as well
and I might be missing specific cases :)

Thanks,

Clément

https://lore.kernel.org/lkml/alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk/
[1]

> 
> Thanks,
> 
> Alex
> 
> 
>> Since both load/store and user/kernel
>> should use almost the same path and that we are going to add some code
>> around that, factorize it.
>>
>> Signed-off-by: Clément Léger<cleger@rivosinc.com>
>> ---
>>   arch/riscv/kernel/traps.c | 49 ++++++++++++++++-----------------------
>>   1 file changed, 20 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index 8ff8e8b36524..55d9f3450398 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -198,47 +198,38 @@ asmlinkage __visible __trap_section void
>> do_trap_insn_illegal(struct pt_regs *re
>>   DO_ERROR_INFO(do_trap_load_fault,
>>       SIGSEGV, SEGV_ACCERR, "load access fault");
>>   -asmlinkage __visible __trap_section void
>> do_trap_load_misaligned(struct pt_regs *regs)
>> +enum misaligned_access_type {
>> +    MISALIGNED_STORE,
>> +    MISALIGNED_LOAD,
>> +};
>> +
>> +static void do_trap_misaligned(struct pt_regs *regs, enum
>> misaligned_access_type type)
>>   {
>> -    if (user_mode(regs)) {
>> -        irqentry_enter_from_user_mode(regs);
>> +    irqentry_state_t state = irqentry_enter(regs);
>>   +    if (type ==  MISALIGNED_LOAD) {
>>           if (handle_misaligned_load(regs))
>>               do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
>> -                  "Oops - load address misaligned");
>> -
>> -        irqentry_exit_to_user_mode(regs);
>> +                      "Oops - load address misaligned");
>>       } else {
>> -        irqentry_state_t state = irqentry_nmi_enter(regs);
>> -
>> -        if (handle_misaligned_load(regs))
>> +        if (handle_misaligned_store(regs))
>>               do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
>> -                  "Oops - load address misaligned");
>> -
>> -        irqentry_nmi_exit(regs, state);
>> +                      "Oops - store (or AMO) address misaligned");
>>       }
>> +
>> +    irqentry_exit(regs, state);
>>   }
>>   -asmlinkage __visible __trap_section void
>> do_trap_store_misaligned(struct pt_regs *regs)
>> +asmlinkage __visible __trap_section void
>> do_trap_load_misaligned(struct pt_regs *regs)
>>   {
>> -    if (user_mode(regs)) {
>> -        irqentry_enter_from_user_mode(regs);
>> -
>> -        if (handle_misaligned_store(regs))
>> -            do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
>> -                "Oops - store (or AMO) address misaligned");
>> -
>> -        irqentry_exit_to_user_mode(regs);
>> -    } else {
>> -        irqentry_state_t state = irqentry_nmi_enter(regs);
>> -
>> -        if (handle_misaligned_store(regs))
>> -            do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
>> -                "Oops - store (or AMO) address misaligned");
>> +    do_trap_misaligned(regs, MISALIGNED_LOAD);
>> +}
>>   -        irqentry_nmi_exit(regs, state);
>> -    }
>> +asmlinkage __visible __trap_section void
>> do_trap_store_misaligned(struct pt_regs *regs)
>> +{
>> +    do_trap_misaligned(regs, MISALIGNED_STORE);
>>   }
>> +
>>   DO_ERROR_INFO(do_trap_store_fault,
>>       SIGSEGV, SEGV_ACCERR, "store (or AMO) access fault");
>>   DO_ERROR_INFO(do_trap_ecall_s,

