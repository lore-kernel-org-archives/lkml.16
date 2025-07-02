Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE721E633C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480085; cv=none; b=T7LZmtbdPPMQ2rDaNa8SRxv3Mpg3uuYxS1JI1575MrfNbFODCR4mPiKROeVVhQkxXi0ssBv7Eqi3N7CG4Jimj7ikn497KfrZ05G/5lRUzdgYIObEPJQoDpR3Nk1XiM1DmCO2FZuyuSW+mJw6+s7Odsu1lbrJrDTjt2LP8CpivEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480085; c=relaxed/simple;
	bh=Y7hcao9a6aexovvTXzUfjrIePAz1w2DYFCt+WfiZwRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVPM10wYEGsJ/NgftEcDwoJWdWgJAL5F1avUHtHgU8d8/6WnDzRz+4GPTwjYndaE8odTI9o9v3ZDtqide70tFOlmf6WzdBMCXK5qYTO1/OlwsCq0I4LURz43KpKyN0wlIVATiUL4tNJUxglyYrZhfSKFJ4hszCHpdKvdkfZ+nDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Q1NwPTcB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q1NwPTcB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso49550255e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751480080; x=1752084880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iF2pwmDnVnBgNlC3R2Sp9Qq8gNWHcSlx8oSPJnFeIBg=;
        b=Q1NwPTcBP7mokfro05Cj+jUQbgdzMcYdn1TeFxNSzkozcwn9OlpQEL1bgdnghAqMJl
         gIJIAhe47Yn+IpcQZB5A1hwtvih5T0FMiRVaOJ8PNxst03fDF3jKwIXP2LLvHIN55Jip
         brgoyXZGITrcl4go3+NQCZAOpT67SPg1lvSu+WbvFn/7wLPYIca0jDM6O3ByZiwiocnL
         3yWT1VDdXNdWnsUnVIJx3nBwwMJS3tHvXIUqeKs5LgE15qi1dgTMed/IvijT+Y+PF8OA
         7mcxH4NVI8DD9MmnSnF+3T6e6zISDW+0UJIn5ehDjPpHg8AsGxETLxd3eUDH+dfwaZlI
         ZBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480080; x=1752084880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iF2pwmDnVnBgNlC3R2Sp9Qq8gNWHcSlx8oSPJnFeIBg=;
        b=swHdhnkF4SLtfpfMxSIk7A7VrNOfF+uRE9mPG3ZeQv8QkAjQDSw1LVO8AbOtG9no8f
         V32wbzi4C2uijFoIOqYNVltYWKguW2OWGCMpLZDOg7ftMOuKj1JWT/ULQLGJqVviFzSM
         HoaO3rSYeASrriRmc0eV45mS+64nTjl3VBQrqgUvM26+vksRTb0ukzMkXrGz7BM61CXo
         xiNG/C0rcDbKohDuheJg0D9IdyxqZrUp+3br4KdM3NuX49Qrezb7eAzFUkWpMwMbYVjD
         9Ea7uABkCxSVk2aow9oFNpACeJ6ImRD4m5Z/BScDZrDQG9EAoGAwHfaXXyToFEBujyXu
         QrhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKfOf6Qu4GB5wiZvD4OukFpM17LukEjvuctWAl5NNj4aIqSNBPwrK/o5ZRBrT65sLyn/yhF7y4caEt+to=@vger.kernel.org
X-Gm-Message-State: AOJu0YywyT954To3vNQZzdZPwroQdiBp8a7+pyFm2j5vxdAJQbV84oZT
	80YkpznzcVp4CM1LycjMyzoNtCQNQRw6XD7Z1C5caIj4pwtkSXKb8T9pKp9uG+dB1qc=
X-Gm-Gg: ASbGncsQv8kYHVLUhhRXN3792Ofl+KKw/mCLcluEyfWBkpJlOS/9z7yL+h26C3JTbg9
	Z2gufOIRgoAVXbRL5PmaKekqCCKRjNuLaCTB9mYtArE3WVEVzo6/t8U2SB+oION8nTTiR7vJGPf
	NMJtb+dD7yCqr4jgK9zJdNaKlpAckaJx3how+cjwbV6jmwrw61D2m+rDDVA2qwMDQYZAUPLnapA
	aianHfizJgrtDZB1oJkip4B6uZHTcB48cqnpwXA+ZXuzl6XZKtDDLYw/AwoDkV/dO6Bma1tJ3Vv
	ZFXO3JQjPO9kqgtmN1w0DZ4vN8r0UMF+3EoUI4UNdfFXJ0UJFUA9Cl9V0FNTCOhj8vYjpSicnWl
	LsHCPmEKsgo4YJbXMEaBlkq8YCdei6hCCmA==
X-Google-Smtp-Source: AGHT+IEJVH+W+cvPNVB9masQuVIjw1/4pd1uCDTCuFbsfIezp0x+6PzwSC9D9AUHrQ5rPRHOy4i8Fg==
X-Received: by 2002:a05:600c:4e05:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-454a9c93836mr7813825e9.9.1751480080374;
        Wed, 02 Jul 2025 11:14:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:9dba:9a50:1cc3:93af? ([2a01:e0a:e50:3860:9dba:9a50:1cc3:93af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989328sm4674325e9.18.2025.07.02.11.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 11:14:39 -0700 (PDT)
Message-ID: <d5a03f2c-21a2-4cd6-acfe-9142f51a8655@baylibre.com>
Date: Wed, 2 Jul 2025 20:14:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nishanth Menon <nm@ti.com>, linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
 <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
 <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

+ Vignesh who was lost in email list , sorry for that

Le 02/07/2025 à 09:25, Matthias Schiffer a écrit :
> On Tue, 2025-07-01 at 20:57 +0200, Guillaume La Roque wrote:
>>
>> Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
>>> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>>>
>>>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>>>> select on ARCH_K3 are not needed anymore.
>>>> Select MAILBOX by default is not needed anymore[3],
>>>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
>>>
>>> Hi,
>>
>> Hi,
>>
>>>
>>> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
>>> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
>>> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
>>> enabling other unneeded features to pull it in.
>>>
>> With master branch if i apply this patch and i do make ARCH=arm64
>> defconfig and check in .config  both TI_SCI_PM_DOMAINS and
>> PM_GENERIC_DOMAINS are enabled.
>> with linux-next it's same. i don't really understand link with  PM part
>> in this patch and boot issue on your SOM.
>>
>> I probably misunderstand something.
>>
>>
>> what is your problem exactly ?
>>
>> if you can share log or link to jobs
> 
> 
> Hi Guillaume,
> 
> with arm64_defconfig, this problem doesn't occur, as other CONFIG_ARCH_* symbols
> also have "select PM_GENERIC_DOMAINS" (with or without "if PM").
> 
> We are using a smaller config specific to our K3-based SOMs however. I have
> attached a defconfig that shows the problem - if you use this as the base for
> .config on linux-next, there is no way to enable TI_SCI_PM_DOMAINS, as nothing
> selects PM_GENERIC_DOMAINS.
> 
> So unless I'm missing some other configuration that would actually be useful on
> the K3 platform and that would pull in PM_GENERIC_DOMAINS, I think that part
> needs to be reverted. I can send a patch to that effect later.
> 
not sure good patch was to enable PM_GENERIC_DOMAINS on ARCH_K3 but it's 
a deps on TI_SCI_PM_DOMAINS so perhaps do a select in PM_GENERIC_DOMAINS 
Kconfig instead of a depends on should be a better solution .

Nishanth and vignesh what do you prefer for this issue ?


thanks
Guillaume

> Best,
> Matthias
> 
> 
>>
>> Regards
>> Guillaume
>>
>>> Best,
>>> Matthias
>>>
>>>
>>>>
>>>> Remove it and give possibility to enable this driver in modules.
>>>>
>>>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>>>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>>>> [3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/
>>>>
>>>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>>>> ---
>>>> Changes in v2:
>>>> - Remove some other config after comment from Nishanth.
>>>> - Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
>>>> ---
>>>>    arch/arm64/Kconfig.platforms | 4 ----
>>>>    1 file changed, 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>>>> index 8b76821f190f..bf9e3d76b4c0 100644
>>>> --- a/arch/arm64/Kconfig.platforms
>>>> +++ b/arch/arm64/Kconfig.platforms
>>>> @@ -135,11 +135,7 @@ config ARCH_SPARX5
>>>>    
>>>>    config ARCH_K3
>>>>    	bool "Texas Instruments Inc. K3 multicore SoC architecture"
>>>> -	select PM_GENERIC_DOMAINS if PM
>>>> -	select MAILBOX
>>>>    	select SOC_TI
>>>> -	select TI_MESSAGE_MANAGER
>>>> -	select TI_SCI_PROTOCOL
>>>>    	select TI_K3_SOCINFO
>>>>    	help
>>>>    	  This enables support for Texas Instruments' K3 multicore SoC
>>>>
>>>> ---
>>>> base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
>>>> change-id: 20250504-kconfig-68f139fbf337
>>>>
>>>> Best regards,
>>>
>>
> 

