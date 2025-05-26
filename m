Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E4A1D86DC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252301; cv=none; b=N5DBGcXYfoDkh8KmLhFL03YdRCR3fy0wsYIPb4fR+oxwldrDW+DKf3efIUUPyk/QbKLkFEs0LZ1FQySr4pJlunmwbi6kaaZ0KaovpSSJi/da0onciO3f1A2AzjRP2c609K5OGhk25zWw7eSvdOmS3Mf4x+S3WKUSTqzOEuyhVNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252301; c=relaxed/simple;
	bh=i9i8/ewq7VfXozbNbj+b/u9iFiv/PHquWUPkUve+/0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9NcYwrGAYI87QIEwq7y09zhb9IiDR09qcJCsW2UveTHR4POgNIhI5nX/1Z2QKRjPbcEX28T9rZwy6G/FtE+XxJ4nXE6LCK1CzRAcQNAtlvc4sZr/570SGDEmxiwG2VhQmk9dYM6wTbiW2veVGaLzVVHHINs4vLWx3SLNWvW6K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=t75CBBJ7; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="t75CBBJ7"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742af84818cso1198249b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748252297; x=1748857097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayXEI8Cfv1/N/P9sk6QD8plzK1Zh4bjNNg4FyYTKeW8=;
        b=t75CBBJ7R1LrkYCsBz5TIfMTqIl70m9KyqO7kgTF4RIHArUiDG3ZzgE1UVinXfohWk
         GJ9cvQDAcoC/365RclM8JQL6xgG9pCX2slQfk/2DvrMbhVqdP8ZBZMJ+Al+U5ODE5Mhc
         mp+M+7B7u8vQ7ENRPl6mzi0UZle+l8TqTtl2BmcoRorbmkr9sgdbD64QW0KEz8iopxT1
         shCd5t/b7KEM92tFRZcN//Cxs23PDZt9jwtHhF7l5d1gTT+FpFqoj168WEvVYfqku8sq
         gKLUvQdgDMvsLtsdUPHAoP3OpR0pFkmEleuPHHsfGjcnZRzU8JCOTCvWzEwMulLXWrDC
         gxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252297; x=1748857097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayXEI8Cfv1/N/P9sk6QD8plzK1Zh4bjNNg4FyYTKeW8=;
        b=TXMUHLhIvPbYys3lzUpI8ri6d4IVDYJHDi5bFo4dx9qcabgrOKiJy6SigCWPzMSGco
         q15512HMODNe5iMvPEvj4B78j6L/ncUvdhoGYCqWSEdoHA9tOOUooFStMcH41BKkPatc
         xOMVogp8vkpy7nIJXYixeLVLOKNQgbGHS/wQL39yIU65mBpQo3VnWV8ew31Qg4v9rpzY
         W28CQQyam1Sbbfo4FpHAiGf0+eZarBJL3Y3H44Q+HFdmCr9+/gp9bGvQIJkQjL06BXRm
         eYkvMmepGm7T8KYA93amW7YIhBXDMvR/JJodlFltYgr6MEtptSD00oSHBzvYRYzyzeo+
         4Piw==
X-Forwarded-Encrypted: i=1; AJvYcCULqWRfuuQ/LScpJ6GgorRoqMfVo17qpf2T6nLmCk0BoAZrf1AxgsCZhKa1urpc3wyM2tk6vz01Iz6rwvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGD69kSpBFOWyusnt/f3JH+66Q5X2ZY8XgQBUdlAFwOZcHmzp
	uIWi9pK2u359kZjKEh8apaZD9/CoJoW/U53dFT9GAMp/jhrFZJr1gTEocEEbcRG5eZ0=
X-Gm-Gg: ASbGncsK5Jr8r6pEQ19tJmDhwvQGeUFTSWWHmiyOLLE+Huj1O8a5eqP55McTlG58WAc
	LSarGFDDeEewaZs+fNw9jUW1lIEjxY0B6RQWMCTI3JuA6S9EWn2sDIiW7rTtuSIE6f+9PB3EZOH
	jmIV+MH2Zs0uGJ2zjt4EBXepgePRwvvxbRmRL2RUF0c1Gs9x0b26c21OfEWE/Gv4AIZQ48Dqy+C
	Tr/T5AJeGwHWSEasbE9rUxo55RsvGjizkkSoRb01KXZ7RkyyObya3QghNXDua0ayt7vbB2XA0Z8
	8JQdcSh8JOPvmFPbT8K43vqJ6qsj8uHGc6v0pqU3/2gy/1/bQPLK2W54DSKCi1KXCMPTgBf/ooS
	gH4bOfjXub1A6ZqiGwuTY
X-Google-Smtp-Source: AGHT+IGtpgkfGcWHXNllZ6N7OfshZvdC/ul39y9uFpqnjdl5yZSiN5+nr2uee+5tOzhJpdCxTYM3zg==
X-Received: by 2002:a05:6a21:8dc6:b0:20d:5076:dd78 with SMTP id adf61e73a8af0-2188c3c78f7mr13332787637.42.1748252297429;
        Mon, 26 May 2025 02:38:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a4af6sm16624196a12.77.2025.05.26.02.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 02:38:16 -0700 (PDT)
Message-ID: <20aeb166-6128-4dda-a963-c9f66f491bcc@rivosinc.com>
Date: Mon, 26 May 2025 11:38:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Deepak Gupta <debug@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com> <aDC-0qe5STR7ow4m@ghost>
 <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
 <20250526-baaca3f03adcac2b6488f040@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250526-baaca3f03adcac2b6488f040@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/05/2025 10:41, Andrew Jones wrote:
> On Fri, May 23, 2025 at 09:21:51PM +0200, Clément Léger wrote:
>>
>>
>> On 23/05/2025 20:30, Charlie Jenkins wrote:
>>> On Fri, May 23, 2025 at 12:19:26PM +0200, Clément Léger wrote:
>>>> Split the code that check for the uniformity of misaligned accesses
>>>> performance on all cpus from check_unaligned_access_emulated_all_cpus()
>>>> to its own function which will be used for delegation check. No
>>>> functional changes intended.
>>>>
>>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>>> ---
>>>>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>>>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
>>>> index f1b2af515592..7ecaa8103fe7 100644
>>>> --- a/arch/riscv/kernel/traps_misaligned.c
>>>> +++ b/arch/riscv/kernel/traps_misaligned.c
>>>> @@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>>>>  }
>>>>  #endif
>>>>  
>>>> +static bool all_cpus_unaligned_scalar_access_emulated(void)
>>>> +{
>>>> +	int cpu;
>>>> +
>>>> +	for_each_online_cpu(cpu)
>>>> +		if (per_cpu(misaligned_access_speed, cpu) !=
>>>> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
>>>> +			return false;
>>>> +
>>>> +	return true;
>>>> +}
>>>
>>> This ends up wasting time when !CONFIG_RISCV_SCALAR_MISALIGNED since it
>>> will always return false in that case. Maybe there is a way to simplify
>>> the ifdefs and still have performant code, but I don't think this is a
>>> big enough problem to prevent this patch from merging.
>>
>> Yeah I though of that as well but the amount of call to this function is
>> probably well below 10 times so I guess it does not really matters in
>> that case to justify yet another ifdef ?
> 
> Would it need an ifdef? Or can we just do
> 
>  if (!IS_ENABLED(CONFIG_RISCV_SCALAR_MISALIGNED))
>     return false;
> 
> at the top of the function?
> 
> While the function wouldn't waste much time since it's not called much and
> would return false on the first check done in the loop, since it's a
> static function, adding the IS_ENABLED() check would likely allow the
> compiler to completely remove it and all the branches depending on it.

Ah yeah indeed ! I'll do that

Thanks,

Clément

> 
> Thanks,
> drew
> 
>>
>>>
>>> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>>> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
>>
>> Thanks,
>>
>> Clément
>>
>>>
>>>> +
>>>>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>>>>  
>>>>  static bool unaligned_ctl __read_mostly;
>>>> @@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
>>>>  
>>>>  bool __init check_unaligned_access_emulated_all_cpus(void)
>>>>  {
>>>> -	int cpu;
>>>> -
>>>>  	/*
>>>>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>>>>  	 * accesses emulated since tasks requesting such control can run on any
>>>> @@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
>>>>  	 */
>>>>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>>>>  
>>>> -	for_each_online_cpu(cpu)
>>>> -		if (per_cpu(misaligned_access_speed, cpu)
>>>> -		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
>>>> -			return false;
>>>> +	if (!all_cpus_unaligned_scalar_access_emulated())
>>>> +		return false;
>>>>  
>>>>  	unaligned_ctl = true;
>>>>  	return true;
>>>> -- 
>>>> 2.49.0
>>>>
>>

