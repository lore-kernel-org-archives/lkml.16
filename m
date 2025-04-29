Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2551D88A4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745910435; cv=none; b=jR/vNtDU+g69dZGTOAYg8uM8JOs1tDlGrXEQWZ7qEZUv1ldpuGD0LzKbXOTgmXepHna8TKC9XzEiH1dI1Z2Gq8yNLLIpW/o3wV84iw5fmp+/CCStLvwTjtVGbZBf1TK4YvD76QXMIzcPOfKFIKUwesBWxWNu9bP98mc7HWzZgbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745910435; c=relaxed/simple;
	bh=uOg4U6NEBFX3k1kwZPha+qXY5qzuRuGE9ojz1bSRHD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7snNiONA7wzeWZMVX2nP8g9RBxVNio/YBgUuZ8P2J6A1Vjmqe1PEBdulFr+2ZSX+WXphBgnLND40QqxG+unZmWs3bxICrz3iD4UseaqIE8Hqaf2aUBigBJfGSK4v73cBmLKzh1kKhdEfeiCaCIhFJgZBpnXFZ4gbLOk5zJvH2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NgTwteJE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NgTwteJE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4297322f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745910431; x=1746515231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IouLfT/aoPa/R6OCtl0qGB7KPQxFbX8a1jsVDadjoIc=;
        b=NgTwteJEmgAbTAG5V4KeIVpQb1jPPXUedE48xsvgo4gsntf651ZqlJHRKdNOHuCg6Y
         ZOeTt/RpIHqRJdiDERLqBNcy6NeaS1v8Clw+OKsBXZeq57pCuzfLDQ2/jtAWKrsmEtah
         opNdE1YBGResvk1TowdLlv9LZO+C6qlZDt2agozJXuNedlxR0oQdfwXyeBNfxLesFzZM
         sQyjr0IdCHDaAJKBKgtKQs2dTY/ApQJUSTl75D63H9YsSjsRjK1Zo5JsWNaGBmvslOoA
         yicUNbQrxLcDf3/qNEYgopGLom1SNNEX05MXd6dQWNtQBNbCoXRzEmwBUH2ctSeY407d
         +Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745910431; x=1746515231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IouLfT/aoPa/R6OCtl0qGB7KPQxFbX8a1jsVDadjoIc=;
        b=GL/kNxJRH9gI5M76nvjQ6igt1MaMhpkpxtVM6XsrkHQ4eXcS5MkUj5M7Fx/MYMB3ig
         LoLEaM4vt4xOas+TJkYsuRjZ8g+0MAXnlLE0+TfDoY5Hu23RDU7XJui6avPlZ/9vUVjN
         toQIJe2v0GZa8ihecHo5isUYDbns/tlPdYEOgPvma+3sfj5MWnVQ5Q7jfiBZTuVVileG
         thPSpRvXiAKB0JALiB6dwqd1eGLPvGlwDWek24E36YCHk2Jo6EZXDL0NsWCTCNLa9t4d
         ogqFWL4ugTqIlGf1gyJqDD7b2MXZG5ivf4G04U39lqowUEjTSInUr9wxpczpM+vIKLJo
         CoVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnVitPn0j6whk5FUV4sxtz/m29aVA4xls//pwDnrpFDRWzMtY+619KKGkWObfzS8E/GwQOuilyXiga784=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmwbU+JlneDkGY0gYdbFaUItyCY60Qr0sZlJrRr08eAEVB9x2q
	QhBVMVBGCtRRkXFFUGEV9ruogcsPVPX1mgX956Zc6y8JzgxHLetwC0RB2HZ2ex0=
X-Gm-Gg: ASbGncsm50/UTJQ11WiUWcNvlHG8NxneA18HPoyeTqwVSu+yvWFmeGBzrQa2NXPH1Bn
	7UADTKiTows1JD4D94IrJAcGqEjYzPz37TvgnN19tFdzQjN2BK1vOT3AGj98OGZ6YtRDrKD7MKh
	p2bJvj9lxy6YM+4+ZF6hf6/RDx1F4GxQ8C/dwksI8hXqbRuyzXauT+tdwYqGULpADpxSLqS5hBA
	HoW/XwZR+aJJeZPzrATNqpZC7tc3pQuOCmAA51psoEJHPRQA1uuBlQ1XEx+iiJVR4o1wIBVgWkp
	CC2H3gzBeTnbop+8b0ILqx+RlkQSNL5emEvmg/sXKNoYobPuxcbg55JY37oB0h55ziQd7Mb2Gy1
	/gzUQCsYbcA==
X-Google-Smtp-Source: AGHT+IFj2OXOUboew7ts54Nxo8wn4cB8hSI+ZHyOLFUpeeQtltGs4Zu4l7bQC4xebcFyF+TLDjHQIg==
X-Received: by 2002:a5d:64ce:0:b0:399:71d4:a9 with SMTP id ffacd0b85a97d-3a08a3c94b1mr1324087f8f.52.1745910430947;
        Tue, 29 Apr 2025 00:07:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07a7c39a0sm10150725f8f.101.2025.04.29.00.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 00:07:10 -0700 (PDT)
Message-ID: <b779beed-e44e-4a5e-9551-4647682b0d21@rivosinc.com>
Date: Tue, 29 Apr 2025 09:07:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 jesse@rivosinc.com, evan@rivosinc.com, zhangchunyan@iscas.ac.cn,
 samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com>
 <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
 <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr>
 <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
 <CAHh=Yk-jk-KzDK_kJTbGi8HOZqsUPZjdGN8eF_op=HKF2V-Udw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAHh=Yk-jk-KzDK_kJTbGi8HOZqsUPZjdGN8eF_op=HKF2V-Udw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 29/04/2025 07:57, Nylon Chen wrote:
> Hi Clément,
> 
> Thank you for sharing your patch. I’ve reviewed the changes, but I’m
> not sure I fully grasp the design rationale.
> Could you please briefly explain the main considerations behind this
> modification?
> 
> We’re also discussing internally the differences between my _nofault
> approach and your IRQ-enable approach, and I’d appreciate your
> perspective on the pros and cons of each.

Hi Nylon,

There is not really pro vs cons. Using nofault would lead to failure to
read from user memory that is paged out for instance. This is not really
acceptable, we should handle user misaligned access even at an address
that would generate a page fault. One way to do so is to reenable IRQs
when coming from userspace and use copy_from/to_user() since it can
sleep while accessing memory. My latest version of the series [1] now
reenables interrupts only when coming from userspace.

Thanks,

Clément

[1]
https://lore.kernel.org/linux-riscv/20250422162324.956065-1-cleger@rivosinc.com/
> 
> Looking forward to your suggestions!
> 
> Nylon
> 
> Clément Léger <cleger@rivosinc.com> 於 2025年4月11日 週五 下午4:38寫道：
>>
>>
>>
>> On 11/04/2025 10:35, Alexandre Ghiti wrote:
>>> Hi Clément,
>>>
>>> On 11/04/2025 09:36, Clément Léger wrote:
>>>> Hi Nylon,
>>>>
>>>> I already have a pending fix for that bug which is to reenable
>>>> interrupts while handling misaligned faults. Please see:
>>>> https://lore.kernel.org/linux-riscv/20250317170625.1142870-12-
>>>> cleger@rivosinc.com/
>>>
>>>
>>> Can you extract this fix from the series so that it can be merged in 6.15?
>>
>> Hi Alex,
>>
>> Yes sure, I can send a small series as well. However, I'd like the
>> associated kselftest to be reviewed since it would allow to catch such
>> behavior (there is no test for misaligned delegation yet).
>>
>> Thanks,
>>
>> Clément
>>
>>>
>>> Thanks,
>>>
>>> Alex
>>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Clément
>>>>
>>>> On 11/04/2025 09:38, Nylon Chen wrote:
>>>>> Use copy_from_user_nofault() and copy_to_user_nofault() instead of
>>>>> copy_from/to_user functions in the misaligned access trap handlers.
>>>>>
>>>>> The following bug report was found when executing misaligned memory
>>>>> accesses:
>>>>>
>>>>> BUG: sleeping function called from invalid context at ./include/
>>>>> linux/uaccess.h:162
>>>>> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
>>>>> preempt_count: 0, expected: 0
>>>>> CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
>>>>> Hardware name: riscv-virtio,qemu (DT)
>>>>> Call Trace:
>>>>>   [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
>>>>>   [<ffffffff80002304>] show_stack+0x28/0x34
>>>>>   [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
>>>>>   [<ffffffff80010fe0>] dump_stack+0x14/0x1c
>>>>>   [<ffffffff8004e44e>] __might_resched+0xfa/0x104
>>>>>   [<ffffffff8004e496>] __might_sleep+0x3e/0x62
>>>>>   [<ffffffff801963c4>] __might_fault+0x1c/0x24
>>>>>   [<ffffffff80425352>] _copy_from_user+0x28/0xaa
>>>>>   [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
>>>>>   [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
>>>>>   [<ffffffff809f4f1a>] handle_exception+0x146/0x152
>>>>>
>>>>> Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to
>>>>> kernel memory")
>>>>> Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE
>>>>> specific code")
>>>>>
>>>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>>>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
>>>>> ---
>>>>>   arch/riscv/kernel/traps_misaligned.c | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/
>>>>> kernel/traps_misaligned.c
>>>>> index d7275dfb6b7e..563f73f88fa8 100644
>>>>> --- a/arch/riscv/kernel/traps_misaligned.c
>>>>> +++ b/arch/riscv/kernel/traps_misaligned.c
>>>>> @@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct
>>>>> pt_regs *regs)
>>>>>         val.data_u64 = 0;
>>>>>       if (user_mode(regs)) {
>>>>> -        if (copy_from_user(&val, (u8 __user *)addr, len))
>>>>> +        if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
>>>>>               return -1;
>>>>>       } else {
>>>>>           memcpy(&val, (u8 *)addr, len);
>>>>> @@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct
>>>>> pt_regs *regs)
>>>>>           return -EOPNOTSUPP;
>>>>>         if (user_mode(regs)) {
>>>>> -        if (copy_to_user((u8 __user *)addr, &val, len))
>>>>> +        if (copy_to_user_nofault((u8 __user *)addr, &val, len))
>>>>>               return -1;
>>>>>       } else {
>>>>>           memcpy((u8 *)addr, &val, len);
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>

