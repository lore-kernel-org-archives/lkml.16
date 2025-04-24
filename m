Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22627A90A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497926; cv=none; b=hxE5Qkp8DaEeYdEvIxAPQY+wkCUv4a3Ak04qNYoAFk04HmWZUB0VwdnYtbAPOnaM/Y9OVAcpGiaBgyz2xTGr9AWeA21A1vdIGvUtW8NAYalAbXx9tGiMNsyy2KeuhZfmhuLTBGgs7bWQo0gnLp1PIY8VdR0ju2jP3aEUWwj3ifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497926; c=relaxed/simple;
	bh=DebhlcyRhbRiLH7Hw/JJUYX8s/MyyC03g3SuMWCXRxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3nasRKbhNSjuDqZhywd1fR4YrJF27MYY8xDUkbmYgjEbnSfLTQ0ITqTCggTDTqyOZVGnZwzzibMeSJrRHme6XqFBllgwgx3OJky0SRfw+Kf1+FG18/RAmmR0Jfk1JJd/EJy7hREW+FtaPPX/4J5YCfJ9sN1AOMJUrfV2HPA0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ouvFTuPc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ouvFTuPc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c14016868so887918f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745497922; x=1746102722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=ouvFTuPcykAOFzZ4V94TFIOqFz3HqBbaFs5gRrjRHOBeQPlpD/q6tjnKPNKE70pztZ
         BlCkmNed/Uob7QUz5I6aG2Ft1Je5Vq0P0G6wBot0svpYOKfJZ5L+Rb34vMY7M793yeXw
         p7zCxEOT5TFb5MLM7HLWfG+R8FaI85cpR2NZt3GJCbDRRUPSRElu/MOlyFYmKxM5srQx
         G2TsyZI2laV9/g4cJJN5noMFVN+laNzgFBOTAuvbUDmv0D75sHqg9iGot1P3wTj9FZjw
         4BGf+hJvfETSyHx0V7U2yHSo2SH2QzStqy0+9zjf4oFMd4iaMFLfYfdKe6kGhecaUgkB
         YfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497922; x=1746102722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=dMYmveSaf4b1qE5InXQWIXZw4UTLG2UKfy2YXnH8C5m2K2tOSsi/mteXmZOKWSqvbs
         BfiY9kLQmlADieeu59mRJBgI7RqB0Msy+DevL/B1sKi5QcW9Ekp6jQoCVyTuG/9srvxp
         BnJXKykVPwkRQZeVKW+0+JbJMYQek8fSZSZqLnqyYUL6JP25E8Y5wkqT/9w+92fz8Ckd
         BobiDXioStug9Wv7yBoyfQmJRYxlkYwNOSPWTNNu4RyvE+5/D1I2aymacht/Cbe8nWee
         aCcmUXH3Fpx3qphraN5501dQn9FH9oL8m0SEfV5/B2yCUA6B9B9rMhxjSqKyQk6C88LK
         +s4A==
X-Forwarded-Encrypted: i=1; AJvYcCXr39/wCuCggPO9lXTTmkn4/Qh1mVU08/OEyu5mNIgyAp2oJfFeBVwGYASpt7ok2yoTC+UWEtBQFBKImGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCE185ovdmxQZpd12xgGvXcpEJQLEtTGvqEoUXS+XHgsXpsUP1
	CTomDMT9jIrv7q32W9amSXExKyf4A3fUKbqqMNFFvj3Rin95cg6PCKlum7sfcAw=
X-Gm-Gg: ASbGncsF8s9ypuklt8cwvEEg3t5K0UyZ49G+HP6ZxrTnA3nKMyCUm7PaZWTA35UupCn
	JYzzXR8b9lu+SmYFC/1dXQV6R8e4Jf0sUho3GE5PJ5UgRX8zpGa8AOzG7fgqu1KABMwYNmYfFoi
	5StuC4Z+6jTBT8yAE0rAWkikc4R4uyYK8C8tEKBGK5SZdM3Rib2zPdnCOR5a/5Li6JITUDqUkH7
	WzMwny9haKheI0cyEk6Ih1na6PMg4tMhCjxiR379k5iHEET6GEtiVeeXTZMPGMKbUo+5ZaO3wjn
	RQXxjZm5CqJIQx7DfCLzpcJJ0FA7sZVHobHuo3C/NfLUvebIE/q+m3/QxsZxiSDxnim4Ekmh5Cb
	Gbeg7r6bpWw==
X-Google-Smtp-Source: AGHT+IFbJZjPmuMD3YIQwLoJ857azwRhf/epJ6CxLQ+gyc15vU+Ezwb55G76EYJKFKkcG3RmozFEJg==
X-Received: by 2002:a05:6000:2911:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-3a06cf5ede6mr2159263f8f.25.1745497922377;
        Thu, 24 Apr 2025 05:32:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4b52sm1997065f8f.55.2025.04.24.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:32:01 -0700 (PDT)
Message-ID: <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
Date: Thu, 24 Apr 2025 14:32:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
 <20250424-c85c9d2f189fe4470038b519@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-c85c9d2f189fe4470038b519@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/04/2025 13:00, Andrew Jones wrote:
> On Thu, Apr 17, 2025 at 02:19:50PM +0200, Clément Léger wrote:
>> This SBI extensions enables supervisor mode to control feature that are
>> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
>> DTE, etc). Add an interface to set local features for a specific cpu
>> mask as well as for the online cpu mask.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
>>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 74 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 7ec249fea880..c8eab315c80e 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
>>  				unsigned long asid);
>>  long sbi_probe_extension(int ext);
>>  
>> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
>> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
>> +			       unsigned long value, unsigned long flags);
> 
> I'm confused by the naming that includes 'local' and 'cpumask' together
> and...
> 
>> +/**
>> + * sbi_fwft_local_set() - Set a feature on all online cpus
>> + * @feature: The feature to be set
>> + * @value: The feature value to be set
>> + * @flags: FWFT feature set flags
>> + *
>> + * Return: 0 on success, appropriate linux error code otherwise.
>> + */
>> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
>> +				     unsigned long flags)
>> +{
>> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, flags);
> 
> ...that something named with just 'local' is applied to all online cpus.
> I've always considered 'local' functions to only affect the calling cpu.

Yeah I thought of that as well, local here refers to the fact that this
function applies for a local feature (as described in the SBI
documentation) but agreed that it's really missleading. Any idea for a
better naming ?

Thanks,

Clément

> 
> Thanks,
> drew

