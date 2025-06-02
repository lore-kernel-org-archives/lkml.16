Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D02F50
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849664; cv=none; b=aQhXM0I0wxs0qlTIaWWyGoTY3snHFAJtEf1XefxjSGPsjY6Ez+3zXsVMGe4YHn12m23MgCXnXcIfKzNj3Wr/JLoapK5lbiwfKEOb+idGoGhZhd/w5JiQbpDujH6Ti3CUIRWOFBPIs/7XNOq/BA1cYDTsfUJFcTCVIKx47X/qvtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849664; c=relaxed/simple;
	bh=uA3hgsltY0xBdb452ijBKb8akp03t52GLDqtBwju+40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wzq9BO9UPtsjrD3Ypjk3dNF0Dqpju2k94eV67ZmH+fFd8K8SUsZO8+RJ6vAf4rcwpDxYaT+hSY4kfoEhxrfY92EKliv4adGSCTS6VGpjzvmi5sv3LXlsV368N3BHc8l9ostO7ulO/MUMWBd5yfLs8rSNvf+/zhAgf9aPmeRv404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jTmn7Ptz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jTmn7Ptz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so638064f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748849660; x=1749454460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lomQSXMXVkyAhZfDo/QfGczWq75wkCBIKASDR7utUXs=;
        b=jTmn7Ptz6kfSOppuSoY69nIavFM0j6x6cjftLQupxktM/KjDYrMbbAioKn5BnzQZqv
         NrbpPgfC2jZiHDF4h7OgBlAa9frj2qM21omJODmoPDnP8Gw8cY2TyON1OvpOTd71MhQo
         vgYVPbptx6bo+6HlD9UAeM5oLWNwxG/xey0iYF/f3JCw6LPRZahU3SEKCSs0j9qs6nMt
         QFtiWnKVrTISlYJF996+T0YGrW3bAmM3Lvm9gN3B58UattPMZ8uArZ2ImW1WKIw4VoCA
         fFA6Y7KJWHrB2wH98oxg88aRD6K0gj0CiQ48u+zvFk1qYNnE+qnaWj8Ir7RSh++w30ph
         lihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849660; x=1749454460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lomQSXMXVkyAhZfDo/QfGczWq75wkCBIKASDR7utUXs=;
        b=sD0FkjntbyahRHxSagDEczpcsE4hTt2y9mFTXnMSRZL7vGK/gHgBbZdwm6taPnBv88
         OTyGvqPB5RZRFFrKYWxI64/6xxry1br9KRm5HWOBgW4W3i/0i5hpAnk3gG3Zkn/ZLyU4
         7RoIkCFtPB/NIKgStlTPFlp+iVYJIdrQit2DhGq3085RPjGQ/YXsjWQnBoodFFlgqyZi
         V8mUR4BhH0XalLAN0aSxqpF78UEfkwy7cEFaW/Pp4XFKXRZgDpiVFh+Lga7nTXXgAEjH
         JgN3AEgccsZLwmBU1rVM6EZnTlNtduZ1nxnhEmZ8/fuTAEJWwETIDmszE4dtPHu/wObs
         eZIg==
X-Forwarded-Encrypted: i=1; AJvYcCU81pE6hTdWiGcK23UA9rY9eAq0ob0Ft51yTDiX0RLzonLgXOzvoYOUdU5eNDpv2hCimijvPRt8nPYFzhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUZwuIKHDV9VUzt4SmVX92Ma4Itv4PFm0gogQ6F97UiLWLgKa
	/9vormOYj/q3MUryDfUTdqyY/HhBWbdxM8bZY3toDwI29WC5xzAjYYhHMaDUBiNMZ24=
X-Gm-Gg: ASbGncvNVoerxJ9TuRctPYU0bc31ez7nfmGltHv9hLnNtu7s1Z06msNtFLgIf9v1kRZ
	r4DJNoEEDOyGmF7BOh9L+10tp0Zlm4cAy+4K85bbvcXHIK9wf8TQq3atj8/nP0duSAs4vwbY3yF
	UZyi/XSPiH7aApNApgp9HGU2+3ovfQPgY/nWlFe20UGaRLZpcfuPV1qzzkM5SUo5DkIQaadbgEA
	6Xi/uZOZ7ar3BwYRcRJymsEPorVAXQzhnMunAATlJ6blmLyNTj4oQooiE6wwlMCrf9F7Lk1CCq4
	+V2UwqtykJb5kCSAbhL44rgog/ha7/we79qqAEhIpebnvUtJ6cQ83DbOEVeU9e7B3mR81Eb3mde
	tl6cN1c+ERUxIbEZvs+qq7gYh3rFfdos=
X-Google-Smtp-Source: AGHT+IFMNEOccS5H1c+9eg0kvVfM2JTlZ9ejc6LVtNoJXe6O6Fn56JDnZ4pP7VZIoUaQFgbEspXVTA==
X-Received: by 2002:a05:6000:25c1:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3a4f7a654a9mr9829041f8f.24.1748849659826;
        Mon, 02 Jun 2025 00:34:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8besm14017930f8f.16.2025.06.02.00.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:34:18 -0700 (PDT)
Message-ID: <836dffaf-c1c4-4e1a-957a-355deaa2d963@rivosinc.com>
Date: Mon, 2 Jun 2025 09:34:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-3-cleger@rivosinc.com>
 <20250531192801.5d6329c3@pumpkin>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250531192801.5d6329c3@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/05/2025 20:28, David Laight wrote:
> On Fri, 30 May 2025 22:56:58 +0200
> Clément Léger <cleger@rivosinc.com> wrote:
> 
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
> 
> For get_user() you are much better off reading the two words that contain
> the value and then doing 'shift' and 'or' to get the correct value.
> 
> Even for put_user() doing the explicit byte accesses will be faster than
> going though the generic copy_to/from_user() function.

Hi David,

Alexandre tried that approach as well but that added a bit more code and
it was more complex than just calling copy_from/to_user(). That can
still be done in another commit if we need more performance later. As a
side note, prior to that patch, these misaligned accesses were using
trap-and-emulate so that is still a performance improvement.

Thanks,

Clément

> 
> 	David
> 
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>> index 046de7ced09c..b542c05f394f 100644
>> --- a/arch/riscv/include/asm/uaccess.h
>> +++ b/arch/riscv/include/asm/uaccess.h
>> @@ -169,8 +169,21 @@ do {								\
>>  
>>  #endif /* CONFIG_64BIT */
>>  
>> +unsigned long __must_check __asm_copy_to_user(void __user *to,
>> +	const void *from, unsigned long n);
>> +unsigned long __must_check __asm_copy_from_user(void *to,
>> +	const void __user *from, unsigned long n);
>> +
>>  #define __get_user_nocheck(x, __gu_ptr, label)			\
>>  do {								\
>> +	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {			\
>> +		if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {		\
>> +			if (__asm_copy_from_user(&(x), __gu_ptr, sizeof(*__gu_ptr)))	\
>> +				goto label;			\
>> +			else					\
>> +				break;				\
>> +		}						\
>> +	}							\
>>  	switch (sizeof(*__gu_ptr)) {				\
>>  	case 1:							\
>>  		__get_user_asm("lb", (x), __gu_ptr, label);	\
>> @@ -297,6 +310,15 @@ do {								\
>>  
>>  #define __put_user_nocheck(x, __gu_ptr, label)			\
>>  do {								\
>> +	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {			\
>> +		if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {		\
>> +			unsigned long val = (unsigned long)(x);				\
>> +			if (__asm_copy_to_user(__gu_ptr, &(val), sizeof(*__gu_ptr)))	\
>> +				goto label;			\
>> +			else					\
>> +				break;				\
>> +		}						\
>> +	}							\
>>  	switch (sizeof(*__gu_ptr)) {				\
>>  	case 1:							\
>>  		__put_user_asm("sb", (x), __gu_ptr, label);	\
>> @@ -385,12 +407,6 @@ err_label:							\
>>  		-EFAULT;					\
>>  })
>>  
>> -
>> -unsigned long __must_check __asm_copy_to_user(void __user *to,
>> -	const void *from, unsigned long n);
>> -unsigned long __must_check __asm_copy_from_user(void *to,
>> -	const void __user *from, unsigned long n);
>> -
>>  static inline unsigned long
>>  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>>  {
> 

