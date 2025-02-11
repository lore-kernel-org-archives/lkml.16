Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3A1EE7C2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261742; cv=none; b=rIcoc+sKpClKJsg/WQNUN9Pvr1G46sa8UGJCVkbHZazkPEifCDnuW5+FZDPFOYKV8l317s9W9a1Q9lqcxA6ps/eGK/rYr7AS+JeLfq1CwDDY0caSTPVcztVY5S+97p6WwJ99q77iLUILmgFzQwP4ZUibPZuULRK9FNPmXWCcvI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261742; c=relaxed/simple;
	bh=h2/pIydPFxFhHqLCHsZVs7Z0HrzQ8CX1VOzjLTd+tok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSO9n6kpZI2xnxBZuak3q2D0gZSKCwfTqFeHiPM1UtTv7q6Oj4M0n55CocWzmjv2m4lcaNbcwylcXIcxbzss1WdRuCe+YCpTVKpYFWKEpCmCDNNS7EGQ7H7F082q9wH0w10AyG2jW5s2gZ1V5NBMSUgGELPTzc99wvhJqndvV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=s55KmjgW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="s55KmjgW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso52469425e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739261738; x=1739866538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3IGe4OcFv6FI23HlHP/OAtXBHpwlZj9qeTFPSe5VqM=;
        b=s55KmjgWgXRVU2Ccnh5UVf0CGTZ0gJQvu5+TnNU95gLupaM2ciRQYE7jHIW36H4wCM
         By8HF1CQTkHz3TVVK5L9mOiCuOkmG026CklFUHvPiGssKGow1vlGWvNArNwx9NIxahqk
         qjnDRSIuRjd0WrTarXDPbzQv4omSQCOsrij2PjlQAKTJjgm3zTCb5RyC3wtBHs9XYLsB
         WDMWvbSDvSLGhORXXLjBVl3e/2sFetEuCoKUqDY0PQnFcJFcMihQRIWGYJlRCRQviiiz
         iK/tSNHyx+kZayRcryff+uTxGO2kfa7rhZJspZpvzgpKNBCYdz2wCJIy8Ljk6eHqJ7n8
         Q7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261738; x=1739866538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3IGe4OcFv6FI23HlHP/OAtXBHpwlZj9qeTFPSe5VqM=;
        b=EHYbSXPgEjgSpPyE/m8ciA4BwobNEa6TqUckFtzbB8Cnw95ARH+E1ZI/blvQ+IhAFW
         Dy9r1nwZGY1x1DWIkaUAqrQiC9CRVQNa0XyXKIUWr6+yCyuY/zgeA1hUrTeGwJpC7FkU
         izhZN7T6to16aVN2gAZ1F2AFIl40XqWVIr0bJ1ch5KZacyAKntHv+PJQ6W+a/tqNUxow
         it9wqBdwMqpq/juVcoFlMNXdivlkBnXNGP/6RjCMPMN3xGY7NjsQFLzbmyDjULEM+oVQ
         QjDLxhdMyVT0AhDBOuPyiL6O+nOoWuoAsHJw3wabtjCGkeBA48cJn93hiUaLVPOb0udu
         6lCg==
X-Forwarded-Encrypted: i=1; AJvYcCUQpFlAss+HJJBXTs6UAyiZIEtzXoHkOTnqZ+DTBDQMKvanItckCXsi5cDyP/w66Vu7p3VvaLiI8VSNZs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNjt2zuGW4OgWrGNioUdX3bdJcwgqcb03ua6lc9raW54SLU7c
	M1DjxtEfYRmoFspyFaryyhyKdtEsqKdhi1AbR87NIX1duPIs1QD2FpPHdS7Aisg=
X-Gm-Gg: ASbGncv9WIlR6z4hO10uxtyH68c8lKWkBjA5bBxUScTw4t3TMJsEMD61XScvvESPHAx
	oBHfUqU/FcRe7imxjxWPPibnp1+ztWXTfIMZ/rMzWYxW87dX5mhnS/uh7fsKtzh0ZDcDCttJZNY
	3vvA9q8K2sONbg/bndmL3z/+IO1BH5sevk7YvXE/ICcFmT+8CAU+2ytiHr1ya0KiY7ZLVy0fiNI
	wh0+4ooTuL9equsveI7+mv5SLGlz2ckaRcjTyj86CED/oOnsbG22KmjKZ28xSJ27s6TXvNZmANV
	Xk4LZDdSMP/hZ283GYpCMog3aLlzYyJN9UMcA3f3l2TKhkPSKKBo34qYosYn
X-Google-Smtp-Source: AGHT+IH+5QrN1U/95DO6o4UiF6FvG8maAzowDO/GoyJnqUeyjwX0zNb5nUEP64Igjir4Mqu4zYfDmw==
X-Received: by 2002:a05:600c:1d02:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-439249a8276mr125068715e9.20.1739261738429;
        Tue, 11 Feb 2025 00:15:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dce18d6f9sm10586921f8f.29.2025.02.11.00.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:15:38 -0800 (PST)
Message-ID: <56d2e34f-56cf-4141-b85f-1b11f560feaa@rivosinc.com>
Date: Tue, 11 Feb 2025 09:15:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cpufeature: use bitmap_equal() instead of memcmp()
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250210155615.1545738-1-cleger@rivosinc.com>
 <968ff88f-ae77-43b4-a5b4-1a4b0bf61098@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <968ff88f-ae77-43b4-a5b4-1a4b0bf61098@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/02/2025 08:41, Alexandre Ghiti wrote:
> Hi Clément,
> 
> On 10/02/2025 16:56, Clément Léger wrote:
>> Comparison of bitmaps should be done using bitmap_equal(), not memcmp(),
>> use the former one to compare isa bitmaps.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>   arch/riscv/kernel/cpufeature.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/
>> cpufeature.c
>> index c6ba750536c3..40ac72e407b6 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -479,7 +479,7 @@ static void __init riscv_resolve_isa(unsigned long
>> *source_isa,
>>               if (bit < RISCV_ISA_EXT_BASE)
>>                   *this_hwcap |= isa2hwcap[bit];
>>           }
>> -    } while (loop && memcmp(prev_resolved_isa, resolved_isa,
>> sizeof(prev_resolved_isa)));
>> +    } while (loop && !bitmap_equal(prev_resolved_isa, resolved_isa,
>> RISCV_ISA_EXT_MAX));
>>   }
>>     static void __init match_isa_ext(const char *name, const char
>> *name_end, unsigned long *bitmap)
> 
> 
> Since bitmap does not guarantee the value of the 'extra' bits (https://
> elixir.bootlin.com/linux/v6.13.1/source/lib/bitmap.c#L24), this is a fix
> so I would add a Fixes tag:
> 
> Fixes: 625034abd52a8c ("riscv: add ISA extensions validation callback")

Yeah, I wasn't sure since it does not fix anything per se. We aligned
the ISA size to a multiple of 64 (128) so we actually do not have any
extra undefined bits. But I agree that it's better to track it correctly
as a fix.

That makes me think that we could actually size RISCV_ISA_EXT_MAX to be
exactly the number of ISA extensions we support rather than a larger
arbitrary value.

> 
> You can also add:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks !

Clément

> 
> Thanks,
> 
> Alex
> 

