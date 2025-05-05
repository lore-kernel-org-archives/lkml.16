Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4097F2580F1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450927; cv=none; b=t3NgNXGg3xY7/1leUkU5Q7Q9wt43CbG3peM4scOmPXRB4hjXbCpUm/4Ws00SU2hjKRJXl1arGLjlX/SKhOR8hKXDeclsQFJ16AZDB0/Y/UrFFqVjN/j7dhfP8E7lTmyhBjF1JticUMSBM3AF9VyTUWRWCcG+xHvAp85GdciAcKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450927; c=relaxed/simple;
	bh=A99jGKDLRtcQrbe+REetRwAbi2+qCLn1oe+kW5V+3QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqnzpHU93XQgMHDxvxxbDDtYEwiHVoi1kwt0a7dXzuBvl+QvU8284tFzT3o65MhfKE9HDinTrpKMO8MbIpqFBD85Ge9RyLsAGbj3nNmoho6eVkI7iq117HrmVQ0zCNsT9fRX8Sw1oC2F8he1JEga9TAeYvWxi0Jd4q7Gr/T/RXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=02PyttNh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="02PyttNh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7398d65476eso3434289b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746450923; x=1747055723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+wXhdSDx+zuoZH6nHSo9n5TKzFsocoVJt1FeJpCcH4=;
        b=02PyttNhHbrba2jONU16CIjVmiSbAWfJ5N/S4rka9u3QywKH8cGfzomCRIrUSdN2gW
         fmUz68oOnHS/45vUt96WIx5ab+rYMy83OEtVX7JGl2yhNxRe4lZIUQNBBuwOdeao4dxS
         8WjDYBBZVoFUIYN+B027xIylvDH7Vvh6ygaKWBvXLIg1m6ONjzYG6XkV9mQrdRsaCyiH
         dWOzP9g0BCZfBwP/yHrFzmNIksk1KkbhEPtM6rZDcnljXXxH8mT/H19LZLGuZKzxNdpW
         BgBu1+VwAtinRiM/++Edle6YXvlO4prYdyIopPFc9v8ZjRRZpHK4ylHYth3G2daXUIx4
         0KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450923; x=1747055723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+wXhdSDx+zuoZH6nHSo9n5TKzFsocoVJt1FeJpCcH4=;
        b=R8KDjvDanlyL4giTUon4T4FDiaYs9dt0GHrdwJ7KEAYB35RKnyKaseGNvvPs/av/3S
         OmtqxqlFrnDJXkDezQLY1wepXgTcUhpUd0DPTZ13QipusAEKweS58pII8kjLLE1qpfp7
         8YQBdPbKrRtvJ0qNb+bemB6Ytoi5QMGmSfCXxuGgUrA9zWmuwl1kAHYZPZ4k3k6iK1PY
         Q+4eVzG5HAm8DapC2oyyeFCKm1bQWwbyYKd2fXjZCRYBH7mxaopDwLvxItedW97sADsl
         rj65qkditKlMczazI7iKoiJBMKKPntAj69euNVUoYpFenfvX2C5sZvj0W5M9eWAWoT2S
         Vnow==
X-Forwarded-Encrypted: i=1; AJvYcCU+vzr8B+Z6VAu+FGmFjXwEmk8xhJIIvTdlVh7mRMQW6Pycbkrp2RCrhZAV+VtXOitI68YU1Fp9VA79HBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNMR+OHWEwAro+MxZZv15TDurdHlmtpEl9EhXGp/od3NaLu7r6
	wUIbtT5ApOqPPQrsxHJt5MjKLLFb+8Mm7LmeB1zlf+ySQ8dqEKgYsyom6/D07G8=
X-Gm-Gg: ASbGncviCp8qFrCbcm0Yg6diykoSblGy6g5d/8g7OD5Vi0sOKJjVg9V/0cIT+BY/Tz1
	CiT+UsSqKv+YIKYJxPR5H0QdhxgvFyGW3p0nbX14ApgFm7/8ZTjfvzxBQz98cVDiUUDEWFILhUh
	Z8PKmUZSd8QA8KPGTnq//pPgK3+JkeqbzfeBuxH3BsHlhYgHkam+sLqPIDbZhWBgG3i4h3iDPUa
	22KxSVzjk+M0uxVw4c1Q6XJBwPLWYZQr7RbnVjAtWZYbPvlKOPwLHyqdQSy+Nc5SkkbZp2i4rIJ
	AJQTSUDYysluOYGUL6mxBfm88wOp59IxjV10NP0T4zod+NIM9nuyGeD+B0kAJZ0D5F6hOBS2TBf
	082xa+UBt/rOm
X-Google-Smtp-Source: AGHT+IGWr7oErzhQXzi3/npvL3HPlXx3q5Y4G/drXHId6r0SRlbJxSxCSrWFC6Hy+SgESOr57oqMaw==
X-Received: by 2002:a05:6a00:3774:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-74049265f69mr23753393b3a.12.1746450923390;
        Mon, 05 May 2025 06:15:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:cc35:2777:db60:cc54? ([2a01:e0a:e50:3860:cc35:2777:db60:cc54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbaa2sm6906018b3a.57.2025.05.05.06.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:15:22 -0700 (PDT)
Message-ID: <fa33b7d6-8e28-40bc-9219-41dab643e88f@baylibre.com>
Date: Mon, 5 May 2025 15:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Nishanth Menon <nm@ti.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
 <20250505123615.yqzdv7dlel7kyojf@degrease>
Content-Language: en-US, fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250505123615.yqzdv7dlel7kyojf@degrease>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 05/05/2025 à 14:36, Nishanth Menon a écrit :
> On 13:24-20250504, Guillaume La Roque wrote:
>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>> select on ARCH_K3 are not needed anymore.
>>
>> Remove it and give possibility to enable this driver in modules.
>>
>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>   arch/arm64/Kconfig.platforms | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 8b76821f190f..5b63a42c4dff 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -138,8 +138,6 @@ config ARCH_K3
>>   	select PM_GENERIC_DOMAINS if PM
>>   	select MAILBOX
>>   	select SOC_TI
>> -	select TI_MESSAGE_MANAGER
>> -	select TI_SCI_PROTOCOL
>>   	select TI_K3_SOCINFO
>>   	help
>>   	  This enables support for Texas Instruments' K3 multicore SoC
>>
> While at this, is it possible to remove MAILBOX and PM_GENERIC_DOMAINS
> from select and make them as modules?
>
good point i will confirm  and come back to you.
