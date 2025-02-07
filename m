Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A819922F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950213; cv=none; b=jCD6AOzpwpG9VpDLH+v/RiOysUzoxg/5BrxiasJHktgZnIXky60gGbrDOfUP4DLQeEtZ66Srb8bjA3d5H+nfckEfiH/LDaKgEZGf3H6A82H9/LLE7yDKogHucqOz49TdsbYWj8S/fKsnuwi1z2iO6wr4z+W3lkRI1d16Gp9b6gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950213; c=relaxed/simple;
	bh=9m/4ZtNIG19aRdnHzcO/vXlqSMM2mmfQBeR4JAkSDc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ar5ZFa/AtRKfuw4Q+5F//o9BJc+RKRRXL/T38xBZI44i+eTZxgWDoaURSEUuWYtUmxdBeuwy2tgk0ml1mPlE/9LsUShsC23c3A7/hc1eXaatbvkpALDF2bevAPbeL3VP8vBLoZuxNxY2utvj6qEdOBz7jQcyZVcENo6R0uJAuvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QeMPXL6Q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QeMPXL6Q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so23287945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738950208; x=1739555008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IetCQx0BtEm/B71PL9JFs54qQSQD4i7yGXxs4Re/YLo=;
        b=QeMPXL6QqF1bPxgJlO/0gCt500Ocg2MWjdS5mvr3zN/8K82Q0+CSt14iIOCSZv/+Y5
         MphXlYJcFtdF8Jo6fV2XH/jnJLQhGoIFHoNQEU23TWQACz7L4kEH1xu1B/0WXYRDNXb+
         Rbp5OKLSs9tDMPfh8DIfPyOCY209TEqxgGZivK9f22VRevdYQuPLkRWMiQRH5wt1a8sj
         02bAfjo6hrKYIMbfn0fyYSNPtH96HSQzqlsLVlHIt3uWescHMmQypBOHoX7VR1ioVaQa
         ifU4OcFKk6+JA7mj8p8OniCASUclDeziTr0sdOEAygKmIS8Cw7iyZb/l+yKoXaiXRe6H
         cBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950208; x=1739555008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IetCQx0BtEm/B71PL9JFs54qQSQD4i7yGXxs4Re/YLo=;
        b=vxAickm5ZO6bshsr1Uly14Yb2e3R4oyjtJ9hjgdF4SSMeCSac+XtoluoGgJBOvUcDC
         KmToK9kL7QeM3Yk5rXYlOF3ZavurD3CbHXN0h3w8WGhVuVddMFqb5AFNVKcHtPXNJKto
         KARH3RUky/CzJfQHk2oa7yf+9dLWaSxXYGpNMFpHEWDn2WIu/pTvzNAfvk/oDZP6Bwv7
         jmXSTMCvTi1Knu+wYTJJAQgmK8j5E86wp2fhTFse0Th1Z8rKEONq4y/Dkaumzc7VZAbS
         Uq1f/SMnrPhmHdt5/ZJbRdGCCAVINurkGCINhkn5XL2qNdm3kAfp6x9nl5bee0J5P8lL
         LOXw==
X-Forwarded-Encrypted: i=1; AJvYcCXQwVZJZ//7hsWSwm702GPc3HUri57lxuJPw6m5+b21tL5BxhqIXgkHTXiIaCVprhXyosUJFbOYHfybBPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwESEtu5xrudV6QL8f9Kd6z55yHUQ/FfXAGQoDevGb25HP9ntvF
	CGINa2tWj/IwnEEyf2L1jjmnw/f7nGGQVSbZW+mheEKajAUo0r14ug0/tcBwP/o=
X-Gm-Gg: ASbGncvgtKpBM3x4psr85W0n00MghlP3l6c0m7JqqJlRKJn6GbyeIM96hZqYQLS6lHA
	rgeZm1S29CW8HHJuoDuiQRKGm+RHGUPtc7YRp87H4dLitTo7niH9Ef3PMiMWnbakVx1NwAH5vcx
	AS80nNkutuf1h4GNW7ujb7Xo4yGDK/13Ho0QwD94O4CN1ECJl5Oz/E/tyH6MO4uUp4TyCneEdnq
	8A7SN9dUGKSu70eThPVewMSPf1KB8bIKLHX7boYrAlJgUXEul7WViXyau7HqEZ5q9WPfIjtuGih
	Gah0VCijTsPCjw2BFxfX7/bAbYa8sQ/D9nGnoCp2TxfQpd9eWm9AHnXTIASf
X-Google-Smtp-Source: AGHT+IFZAkbPMDhch3CHM1MWaqe+44k/0uA7F84dwm4WQWejM1tHjBHdsK2TtZv0OcHNrDfRBy217g==
X-Received: by 2002:a05:600c:3552:b0:438:a1f5:3e38 with SMTP id 5b1f17b1804b1-439249c75c3mr41835255e9.30.1738950208480;
        Fri, 07 Feb 2025 09:43:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f61ca4sm62393345e9.1.2025.02.07.09.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:43:28 -0800 (PST)
Message-ID: <fdabae33-a1df-41f7-9e1f-9973f252599a@rivosinc.com>
Date: Fri, 7 Feb 2025 18:43:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
 <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
 <20250207-f0e7e2b868ef3e9f2a174f29@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207-f0e7e2b868ef3e9f2a174f29@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2025 18:08, Andrew Jones wrote:
> On Fri, Feb 07, 2025 at 05:47:28PM +0100, Clément Léger wrote:
>>
>>
>> On 07/02/2025 17:19, Andrew Jones wrote:
>>> We shouldn't probe when we already know vector is unsupported and
>>> we should probe when we see we don't yet know whether it's supported.
>>> Furthermore, we should ensure we've set the access type to
>>> unsupported when we don't have vector at all.
>>>
>>> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>  arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
>>> index b7a8ff7ba6df..161964cf2abc 100644
>>> --- a/arch/riscv/kernel/unaligned_access_speed.c
>>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
>>> @@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>>>  
>>>  static int riscv_online_cpu_vec(unsigned int cpu)
>>>  {
>>> -	if (!has_vector())
>>> +	if (!has_vector()) {
>>> +		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>>>  		return 0;
>>> +	}
>>>  
>>> -	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
>>> +	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>>>  		return 0;
>>>  
>>>  	check_vector_unaligned_access_emulated(NULL);
>>
>> Hi Andrew,
>>
>> Wouldn't it be easier just not to register the hotplug callback in case
>> !has_vector() ? In which case just set all possible cpus
>> vector_misaligned_access to RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED
>> at startup.
> 
> We could do that, but I have another use for the hotplug callback that
> you'll see near the end of the series.

Ok, I saw patch 7/9.

BTW, what happened to patch 8 ? I thought it was in my spam but even
lore.kernel.org does not have it:
https://lore.kernel.org/linux-riscv/20250207161939.46139-11-ajones@ventanamicro.com/T/#t

Thanks,

Clément

> 
> Thanks,
> drew

