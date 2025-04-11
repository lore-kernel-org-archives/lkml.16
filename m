Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45272980CF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360712; cv=none; b=CwiyvvD0pkDyZ3w8Z6gJBMIL8nwR91Gni7W/pn3oiTCvex57QLKbVxGybbosEwZXZL01FoYqKe/DvbTB/UV2pQmEzaGL7V5AgrZgx9lOrqLzaNS9kzztj4MdElW4ShEXxV6ayZfbAcffGdQIKP+mOTt8XY47BL1POF1wuypDHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360712; c=relaxed/simple;
	bh=iQegmjPNvgyXMQhA6K2uIdTy01dFmeDwep8uKg4p18M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYaCTNbvfOGnYC7edZ8WuwBi5bQLotHiJE/AcJHX9xFX38fWJ1kHVABhkePyl072TGxSzDX2wLTb043SxJp4BwK82elyGTVAhBv5qJRttqqFByc5ME66lbXkzePE5vg28uIrtfWgORTpAmJnmIsAITrab2tnf8nTrNE8PTjjdqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qzMeZlWI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qzMeZlWI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7370a2d1981so1339263b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744360709; x=1744965509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAL/6p83YpXkd2lWxaTuipFX1SLH+v+iTkrYyMI4qJI=;
        b=qzMeZlWI0Aka9nW1WQ4SWfM75zJD5Q+NsJ5igDsZm3GYTeqXzKmZaWXuNbIHI8WtS1
         CByH333Y8qjtawK8Gl9pYq9HptnkhEUMVuTfdl49TVI0nCli+2D6oa405YWC7OxidIvM
         Xc9vtok8vze4iUEfZ9oAnmmeyjovsSfIz77lw4EU9XtI4iD2++OU9uLrqAJBogFR79o8
         l+wgLaTEyy8bSL5m3x/HjwiCps1k9uOO+DIyo9NnNd0qF+XzUd48MSFtcHxwgcF7RHo7
         oFRCw0TmYZ5cpHM+4AB3i+rbgECwVAk2mfQSQ4XjZ6ToDscD6nbyTCXcaXUCEC0Fn25H
         ZQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360709; x=1744965509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAL/6p83YpXkd2lWxaTuipFX1SLH+v+iTkrYyMI4qJI=;
        b=e446iHIcdr80WNWJa/PTRAuZvzrDYXPqXDc+xswZMauM/GyEu6jB5lint3UHQxcVxL
         tt7YPFO9LAl89c1S0zxZ6aQTP0ZGQRXzGNOHJV0g3I69LUm6pygPf20hAyIxxSfaAOe7
         /ew6cJtcGHgMYLKHXqjTUwbKS9Km+boaTeFXqFP4+xkZiOEwBU9NmKHRLU4eh/VBNAZo
         7p3nLawFpRnfT/nFRU2JwAHIeWovLTh79qY+++t84s9bRoLmFfSDkO7ZwW1QsSwIpAE0
         VougXule61+nwvXTk+hLuNapjM1rIvtNwWp4hk9bg7IjjG27wwRjqv9q13JR3/iX+QWp
         Zdig==
X-Forwarded-Encrypted: i=1; AJvYcCURlh29LXTRdk55UTKG1XXVANyOjsWhvaacOKl99SpYyS5/gqwRQ8jQmtK8FV018k5lVY/bX0Q+XoXm/70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Fqz09cUd/Q3mPqiUuUq5ZZONsZBO7TT0AsLheeIXYV+YpcSu
	JR6lV2e4A4lajFjFXiUqMxEpXla0kDZhlLoBKos7ecQ6Oqxj9gH/SusiPqIJk2s=
X-Gm-Gg: ASbGncvp7ZDpLlvDtgY9BvIKfUnPhhXqEeBokhEvr4nwX4Ucl9iBx5xnytju+3shmAE
	7efA4btY8biDJ5JWQVvLLEyrfxoSCSwI4Br24GJ6MO+HOPbwptGd896v1AuxMsH1lMvVnUZU2kk
	QJruONNWYx0MSlDjO/VCIJoUIBLXRN6yBmrc3nsIfGZzUjqSgy7q1SjQg944by+g/ZxfqVnPkRB
	kUN74UoGxZM2SKabxuoIYyAjhGWhifVNFYnqybq95Nc+bXXhRb9kwn9UfniqyPPxEZR18RBMPPf
	IbNrEEavBq3cQah5pxjZuCHLjUIIjrPdzgmbHNkPiGASk8i0g6wBed8FRsgzs3F/V2IIwFFiN6E
	lv9pK6HTJpA==
X-Google-Smtp-Source: AGHT+IEc1zf/fjqiNF1HMx499nzROimsFdgb4amqFTVGVHXlXwhSyAjiyD+tanp9f2f2sNWK6e9KZA==
X-Received: by 2002:a05:6a00:1147:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-73bd11dd516mr2510411b3a.9.1744360708569;
        Fri, 11 Apr 2025 01:38:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c65c9sm964123b3a.61.2025.04.11.01.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:38:27 -0700 (PDT)
Message-ID: <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
Date: Fri, 11 Apr 2025 10:38:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: Alexandre Ghiti <alex@ghiti.fr>, Nylon Chen <nylon.chen@sifive.com>,
 linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 jesse@rivosinc.com, evan@rivosinc.com, zhangchunyan@iscas.ac.cn,
 samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com>
 <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
 <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/04/2025 10:35, Alexandre Ghiti wrote:
> Hi Clément,
> 
> On 11/04/2025 09:36, Clément Léger wrote:
>> Hi Nylon,
>>
>> I already have a pending fix for that bug which is to reenable
>> interrupts while handling misaligned faults. Please see:
>> https://lore.kernel.org/linux-riscv/20250317170625.1142870-12-
>> cleger@rivosinc.com/
> 
> 
> Can you extract this fix from the series so that it can be merged in 6.15?

Hi Alex,

Yes sure, I can send a small series as well. However, I'd like the
associated kselftest to be reviewed since it would allow to catch such
behavior (there is no test for misaligned delegation yet).

Thanks,

Clément

> 
> Thanks,
> 
> Alex
> 
> 
>>
>> Thanks,
>>
>> Clément
>>
>> On 11/04/2025 09:38, Nylon Chen wrote:
>>> Use copy_from_user_nofault() and copy_to_user_nofault() instead of
>>> copy_from/to_user functions in the misaligned access trap handlers.
>>>
>>> The following bug report was found when executing misaligned memory
>>> accesses:
>>>
>>> BUG: sleeping function called from invalid context at ./include/
>>> linux/uaccess.h:162
>>> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
>>> preempt_count: 0, expected: 0
>>> CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
>>> Hardware name: riscv-virtio,qemu (DT)
>>> Call Trace:
>>>   [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
>>>   [<ffffffff80002304>] show_stack+0x28/0x34
>>>   [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
>>>   [<ffffffff80010fe0>] dump_stack+0x14/0x1c
>>>   [<ffffffff8004e44e>] __might_resched+0xfa/0x104
>>>   [<ffffffff8004e496>] __might_sleep+0x3e/0x62
>>>   [<ffffffff801963c4>] __might_fault+0x1c/0x24
>>>   [<ffffffff80425352>] _copy_from_user+0x28/0xaa
>>>   [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
>>>   [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
>>>   [<ffffffff809f4f1a>] handle_exception+0x146/0x152
>>>
>>> Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to
>>> kernel memory")
>>> Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE
>>> specific code")
>>>
>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
>>> ---
>>>   arch/riscv/kernel/traps_misaligned.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/
>>> kernel/traps_misaligned.c
>>> index d7275dfb6b7e..563f73f88fa8 100644
>>> --- a/arch/riscv/kernel/traps_misaligned.c
>>> +++ b/arch/riscv/kernel/traps_misaligned.c
>>> @@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct
>>> pt_regs *regs)
>>>         val.data_u64 = 0;
>>>       if (user_mode(regs)) {
>>> -        if (copy_from_user(&val, (u8 __user *)addr, len))
>>> +        if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
>>>               return -1;
>>>       } else {
>>>           memcpy(&val, (u8 *)addr, len);
>>> @@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct
>>> pt_regs *regs)
>>>           return -EOPNOTSUPP;
>>>         if (user_mode(regs)) {
>>> -        if (copy_to_user((u8 __user *)addr, &val, len))
>>> +        if (copy_to_user_nofault((u8 __user *)addr, &val, len))
>>>               return -1;
>>>       } else {
>>>           memcpy((u8 *)addr, &val, len);
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

