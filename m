Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7F19F49E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849833; cv=none; b=Vd6dGO/sACUdr6xFifMVuYYWKpOQWRjHmd0R30P5m6BCdlC4Fnhr5m7rK5faLsJUTALlTwvlQmGJ4IKHWK9qTk+dA7A0LbzOHaM6wP3RgY7HIhZI1sP8foa/lBYgaZvxHJpaQm2I5s2GQS2syyB9W1BwZd1mN0gzl9DrqjpsJEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849833; c=relaxed/simple;
	bh=ZFPSJEWrRSR5R2UR5eW88m8gmY8YjPhnjlUty+uw3p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+ElrJAiBpJhzO7/39yIhN5+LmZU9X/7QPbrfyxmvWx6+IjlSjwpCrWrNlqRh09GfdvlGxr4KF545vlMJ60dI6QJZjpbcoBtzuMc0ofTVnHEpUruFYuxjaAfCtRlaWVTWAJYjSxyn7BJugoUn6scc/Qno33frk516E3JhkXWtDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZRGLAXdr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZRGLAXdr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so23156785e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748849830; x=1749454630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=owj0mSUC9XrWQS9ZIjU7UCMTuXH27a1AjFrPEffsoSQ=;
        b=ZRGLAXdr8kfnt0cgFDnCnVfuaSxwFacp2HhUQiQdmRyaiVYFoiULT9hyJXKK6SqTXT
         lgHFJz9QeplIuU0tlwhAwDrlnBnniB3ZIGdqD33RuumkiNDrbCtmtOeIqenY0dxC6gcD
         x5iWOmWyVN5h78qdqUAJQKzw1+sIRTXufceJwTR9Nybke7xgSCFr8ijd/+019xIOYjpM
         2Dn8RXEUa9SC2iozyCd6G+OYx0gGO/yAYRFIgSa2R5VM5NpRLhf8AEZYrj6WYCwa+UUo
         YTkmVFgu/ISWfxo/FVnFXJ4OQQ1cAnP6/UBVTgdmV/e6o0e13GKi9nY7SY3k4eZ+6GAy
         bNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849830; x=1749454630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owj0mSUC9XrWQS9ZIjU7UCMTuXH27a1AjFrPEffsoSQ=;
        b=wc3WK26nNrluna6ZmRCzsMhXf5jtLke26iPJhE8ux7Yeo5esl0B5lmkxJmUW1wwOxr
         BwAz2vDvytcEYncAmZrS1Yol00p9ld1Drp+wanDLNQCfdiaILbwLQnRGKZp4ldGJsQA3
         x1OI92tCDILTjGB9Hm7330Zoj2cziTciqjo65/EZ5kIisl1L3CW6MxVrfeBVTDDqDngA
         kQg2mh0XTMp7UCefJ2LYWcyjmIszTQUhKRjxueP2/QaA9V/A9YCkRN2fYNqAoCT+1W76
         UBbvi1Wbwt6e/kJH4A/ucUZCRR3lCgTFzHWN4eY2Pk4uiN49PCKJrgg9R/cM0W+CRL90
         xhTg==
X-Forwarded-Encrypted: i=1; AJvYcCWMGOnizDadWYbxmCKCHSe4OslJk2JzpM2U8SV5qwY9trn+gmtakAd3seb//EgCCXwSGwvl8AYroiJQc7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGt5rQ0xtwzN2mrQtbDDaR8edMp9p4od4H51t72aDkjQwC6KyD
	sN0WUCAd+wY6lhPjnZNjvn8Gl0wMMvZS+knulSG3D/zBovKsu1Cj8M6D/g0a1hnh3Xo=
X-Gm-Gg: ASbGncuruBaU5O0REbycE57qSBIW7gvUm33rgSBrgx3AaSNH4pd+GjJXeeDLTZ1/+3p
	05rEDQf7KLYSsqvFQC9uOErRJo8LBX4M89usTPX4pOp0ubFIvuT5Ng8LMjV6Lnq02Io7+yCX3JH
	bzrqyf8/dZsW6DgCga09AEpzMF6dge6akV9N8Nc6HAMCSj7qrJ0rII7IYeqCBM0r/acNUf6ZhKT
	cvJfrAVzeU7zLShLtAZFV4iK8VzBIYdPjYGIIkntfxbNx8wi6qdFklHQwR4f+oldzwnRIKkwwZV
	bJV4XwrMwCLvNeSEoP4B0M3Bt2SAZSjFb1EJ2Kd6j6BCEVTvdCIWq1BPcJAEalBwI84sa83SgdM
	CA1JuERkc43Jy9OMpGqZh
X-Google-Smtp-Source: AGHT+IFepfbgL5FL5fc7F67zCMeGhfU6MSqbq8WhZXJbSylhitW/eqXVBzS3q1dD54TfD0UHJbodmQ==
X-Received: by 2002:a05:600c:3555:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-450d6bbb899mr114080925e9.15.1748849829678;
        Mon, 02 Jun 2025 00:37:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012af3sm109895745e9.35.2025.06.02.00.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:37:08 -0700 (PDT)
Message-ID: <cea8cdf2-4b1e-4628-a5df-249adf4387b5@rivosinc.com>
Date: Mon, 2 Jun 2025 09:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-3-cleger@rivosinc.com>
 <718fb1d7-9f0c-4637-abe8-5a34305c3ae2@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <718fb1d7-9f0c-4637-abe8-5a34305c3ae2@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/05/2025 14:35, Alexandre Ghiti wrote:
> On 5/30/25 22:56, Clément Léger wrote:
>> Doing misaligned access to userspace memory would make a trap on
>> platform where it is emulated. Latest fixes removed the kernel
>> capability to do unaligned accesses to userspace memory safely since
>> interrupts are kept disabled at all time during that. Thus doing so
>> would crash the kernel.
>>
>> Such behavior was detected with GET_UNALIGN_CTL() that was doing
>> a put_user() with an unsigned long* address that should have been an
>> unsigned int*. Reenabling kernel misaligned access emulation is a bit
>> risky and it would also degrade performances. Rather than doing that,
>> we will try to avoid any misaligned accessed by using copy_from/to_user()
>> which does not do any misaligned accesses. This can be done only for
>> !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
>> a bit more code for this config.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
>>   1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/
>> asm/uaccess.h
>> index 046de7ced09c..b542c05f394f 100644
>> --- a/arch/riscv/include/asm/uaccess.h
>> +++ b/arch/riscv/include/asm/uaccess.h
>> @@ -169,8 +169,21 @@ do {                                \
>>     #endif /* CONFIG_64BIT */
>>   +unsigned long __must_check __asm_copy_to_user(void __user *to,
>> +    const void *from, unsigned long n);
>> +unsigned long __must_check __asm_copy_from_user(void *to,
>> +    const void __user *from, unsigned long n);
>> +
>>   #define __get_user_nocheck(x, __gu_ptr, label)            \
>>   do {                                \
>> +    if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>> {            \
>> +        if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr)))
>> {        \
> 
> 
> Nit: I would use && instead of 2 ifs.
> 
> 
>> +            if (__asm_copy_from_user(&(x), __gu_ptr,
>> sizeof(*__gu_ptr)))    \
>> +                goto label;            \
>> +            else                    \
>> +                break;                \
> 
> 
> Here I would remove the else

Hi Alex,

The "else" is needed to break from the outer do/while loop or it will go
though the next switch case (and it will crash due to misaligned accesses).

> 
> 
>> +        }                        \
>> +    }                            \
>>       switch (sizeof(*__gu_ptr)) {                \
>>       case 1:                            \
>>           __get_user_asm("lb", (x), __gu_ptr, label);    \
>> @@ -297,6 +310,15 @@ do {                                \
>>     #define __put_user_nocheck(x, __gu_ptr, label)            \
>>   do {                                \
>> +    if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>> {            \
>> +        if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr)))
>> {        \
>> +            unsigned long val = (unsigned long)(x);                \
> 
> 
> Here it sems like __inttype(*(__gu_ptr)) is more accurate than unsigned
> long, even though I think unsigned long works fine too.

Wasn't aware of __inttype, but it sounds good.

Thanks,

Clément

> 
> 
>> +            if (__asm_copy_to_user(__gu_ptr, &(val),
>> sizeof(*__gu_ptr)))    \
>> +                goto label;            \
>> +            else                    \
>> +                break;                \
>> +        }                        \
>> +    }                            \
>>       switch (sizeof(*__gu_ptr)) {                \
>>       case 1:                            \
>>           __put_user_asm("sb", (x), __gu_ptr, label);    \
>> @@ -385,12 +407,6 @@ err_label:                            \
>>           -EFAULT;                    \
>>   })
>>   -
>> -unsigned long __must_check __asm_copy_to_user(void __user *to,
>> -    const void *from, unsigned long n);
>> -unsigned long __must_check __asm_copy_from_user(void *to,
>> -    const void __user *from, unsigned long n);
>> -
>>   static inline unsigned long
>>   raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>>   {

