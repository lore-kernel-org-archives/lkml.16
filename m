Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A34263C72
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729193; cv=none; b=cA8ZpN90i8rDm/6iCgDrtBfNYhiar1rTSUdZMGmOannInNGqQeR+aRt801BZkZK02OvxdeBxifqphAdiAJGcZKNpsykRj5tjWswEQhRGMtFS79e6qGNxTJEPVE9voW4c+JT0KrOJ6B9guCANbdlzoJ5LsoWjfyeHtlzvD5w2H48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729193; c=relaxed/simple;
	bh=oIeZDvZ06+adGEcc2PTcN9SlCbujZpBAp1mCH9C1Smw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/eziF4GhPnROzyd21GnH4xYsSgZJlUHiLktLqy+84smwPSPgEqUN2K7yecXwqvUXLUCDdsatrtKeYwaCjXnzpTvevIi/OFGKWzKPsa4lMZiCiweO27XFCb6JXFb3CH6GQ5pDhxKPSlxHo196ZZfsfH7TxqqD8nAIj0DXIYLZ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YbITwSei; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YbITwSei"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441c99459e9so33821675e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747729189; x=1748333989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rg4dqqae5QAhm/jj8YkR21SQpKcd2PY6mEVX2p2RC/E=;
        b=YbITwSeizmZTb4FHUBv2km9ODeH/W1bdvnX3RZw7o9fw9gKd1vD/PCqLqBCUA2ZL/o
         DRhenXVr+2QzKz+XoR+inJOiWl4wJ6BuF44WjLxK0i/ShYKsWIYzs2hKT4JLSKHuHQXt
         jrYxtzKtyyailtF+p6D5LjeUyOz1IRUmbpdZdeHScPW/vNlvX1d8gjboPjO2Pf/xwz32
         8HytyKBdAcdsBu0/nUZUjEXmu6sChpxKt8TXWr5hDt3Itz1fAx9qFTAxF7S3eO7Gl8KN
         TH0ekSCbegqfTEl9Bs+M4BPtfh183BXHpIGCalPKSH+4GlRjy6ziYtEr1JYVld0eIoS6
         Tu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729189; x=1748333989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg4dqqae5QAhm/jj8YkR21SQpKcd2PY6mEVX2p2RC/E=;
        b=jgVBggTl2RMO3tIbM9SewNC6ICYQoeXkM6qd9SfznArDhXLE231TtbddytvIBxl52r
         zhriDa1M5Yu0Qn48LTDpsotECthMrDF2DvoeZNtE4yKUQJJNCCVBJQjq3YE8aXCKJgwf
         pkTKAueN1mC9hBaXtGLQTlRcOPucVPPejO3rGw/b1u0+JxJYrcd8Ln4/2wRooJJbWy9N
         pLmELWnA81/ocXuSFoemtA5MyMPCaKzs4nkfkHTlYwTP59luMhlUy6T0h6NxfPUHIV2g
         VzJv7zuZ63TP2nTpQs49xgI5FlLJ+v7RsQ0F7R9JU7SJLBX24PIWa49zBzN4yW82wT43
         0y9A==
X-Forwarded-Encrypted: i=1; AJvYcCWkC4TnPRd678wkr591mhwYlUw0tQnWxdQgAtQCFRiLEd49uFjfgXlqu1MCpnJT9yJy1ojCDUYWoc8pjWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ5E0WR93gEnaZOE0WHmwk0rP7bil/q4jqaWAL2CUoN7N4qase
	hkN4wrWKboX5l5lhqUBjM6YKf5IcvwZfM8E8F8+p1uvNrhuSxhHnEny75YiH/ECBYow=
X-Gm-Gg: ASbGncurNNbX301YpN2Kd1+fqmkl5I4Q9SWVDWoWegAJn9FyGrby9St6TAb5GwJyivH
	THX9vGUn8DW7V1WkklHxsnjq0PQi28c7lUh3y8ePcSSftvdm8xl6Dh2uhAgavgkIQF+FjP++kYu
	3mezWY9JH0rrvnIhW84/Oa18Hx1zxcFDW7SChTx+NsQPnLaD8e2Lzp1coCF/Apa1wQ8Umr8ojhJ
	/mzKoB/cskkbjNjNyUXgirKYQFXWYsHivLA2xxGLgVbfRUl2yHOLJfUAh2MpthszdEL9fCnQz1o
	q5rxHGG5wMw81zeZJGjHDBrPKyiKDrL/pJuqxkaSMPp2TyCbIS5jm6fgQuja7JaY5zDrHzGGCSP
	nekifq4YplfNFaIprs3l7
X-Google-Smtp-Source: AGHT+IEnBNI1O6DOXTrHnPp911hPTHbpDnBVZzrdBEbI+pdS0MKdIeQtQ/je5/atfqHW1EnEtC8JdA==
X-Received: by 2002:a05:600c:1c03:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-442fd627744mr144511695e9.12.1747729189050;
        Tue, 20 May 2025 01:19:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aea59sm21045525e9.25.2025.05.20.01.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:19:48 -0700 (PDT)
Message-ID: <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com>
Date: Tue, 20 May 2025 10:19:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com> <aCu_ce-kVQsyjrh5@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <aCu_ce-kVQsyjrh5@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/05/2025 01:32, Charlie Jenkins wrote:
> On Thu, May 15, 2025 at 10:22:10AM +0200, Clément Léger wrote:
>> Split the code that check for the uniformity of misaligned accesses
>> performance on all cpus from check_unaligned_access_emulated_all_cpus()
>> to its own function which will be used for delegation check. No
>> functional changes intended.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
>> index e551ba17f557..287ec37021c8 100644
>> --- a/arch/riscv/kernel/traps_misaligned.c
>> +++ b/arch/riscv/kernel/traps_misaligned.c
>> @@ -647,6 +647,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>>  }
>>  #endif
>>  
>> +static bool all_cpus_unaligned_scalar_access_emulated(void)
>> +{
>> +	int cpu;
>> +
>> +	for_each_online_cpu(cpu)
>> +		if (per_cpu(misaligned_access_speed, cpu) !=
> 
> misaligned_access_speed is only defined when
> CONFIG_RISCV_SCALAR_MISALIGNED. This function should return false when
> !CONFIG_RISCV_SCALAR_MISALIGNED and only use this logic otherwise.

Hi Charlie,

misaligned_access_speed is defined in unaligned_access_speed.c which is
compiled based on CONFIG_RISCV_MISALIGNED (ditto for trap_misaligned.c)

obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o

However, the declaration for it in the header cpu-feature.h however is
under a CONFIG_RISCV_SCALAR_MISALIGNED ifdef. So either the declaration
or the definition is wrong but the ifdefery soup makes it quite
difficult to understand what's going on.

I would suggest to move the DECLARE_PER_CPU under
CONFIG_RISCV_MISALIGNED so that it reduces ifdef in traps_misaligned as
well.

Thanks,

Clément

> 
> - Charlie
> 
>> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
>> +			return false;
>> +
>> +	return true;
>> +}
>> +
>>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>>  
>>  static bool unaligned_ctl __read_mostly;
>> @@ -685,8 +697,6 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
>>  
>>  bool __init check_unaligned_access_emulated_all_cpus(void)
>>  {
>> -	int cpu;
>> -
>>  	/*
>>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>>  	 * accesses emulated since tasks requesting such control can run on any
>> @@ -694,10 +704,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
>>  	 */
>>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>>  
>> -	for_each_online_cpu(cpu)
>> -		if (per_cpu(misaligned_access_speed, cpu)
>> -		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
>> -			return false;
>> +	if (!all_cpus_unaligned_scalar_access_emulated())
>> +		return false;
>>  
>>  	unaligned_ctl = true;
>>  	return true;
>> -- 
>> 2.49.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

