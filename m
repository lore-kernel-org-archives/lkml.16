Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5988245029
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396276; cv=none; b=JwMXyp2CzR/9mD/wmTdlr8/VKQd1ZZm7CO4n6BGzXCX2KcncdM1fkXrPDz0JcNRsetXfwfqBUrRcYXaU//O/1N7DIJRCBcIrb+QhESmreoflyaw9C/F5xBmJPd13TtAt2jy69THsNK0HR+Pkrf/UCcOfbQmuL1Ounz4g6Q35xmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396276; c=relaxed/simple;
	bh=GWEL99hdlJ/IrXmR+14f96xedSnSMx9f2OPajvke3F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RImE86X4j0/desH5eJifcK5VcbR8e1lQOONxQcc09Sto6xomVFRFPp6/sUWY6jz/tmBhUUQFFacI33DL3i8BYQhNVZ4hBawsH1qaTEjfsUv/zEUCkIXF5D5rcYzWfyMhJZ3OZ9JNscDIDZqM6a06zqkCcNSUj794QtCHFtV421o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V5XSQ3ZC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V5XSQ3ZC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso3925970f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751396273; x=1752001073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=;
        b=V5XSQ3ZCbAIR01/YKILh1W/SYSBoEeEC/amW5yxeFeW9FRQnrZ/15LJv4HFHhizV59
         OoBApdRrOr7I5pE3EZLiBKfs4qbOpWR/G2SjjuqEjevDnQ0iuK9lEFmldiRuT0MBB4jK
         BktIhNlFv3lEa5i9Jj1ctzlQsBWURnmFCJ0EdguhjJtPfa4Q2mdIBx8tVClaeLDbZ4RG
         tNTSlXHiGyQps1oDruq6SpuaLFsuHj9v1dYn5XdvfwObR2Io7/c+1fVtFMqZuFtvDoVh
         8kZd16OfcRDSdhGQUJ+m9DVEy0QIRUrGj8QJ68UYJc64SiOkKfn+qGYL1AGBQaXTXFMB
         ou9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396273; x=1752001073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OnXkb5Xk0A16V2ni6PtoSDVdWoQW1678+k13MiKScA=;
        b=o5TN5IAr5n6lshWDCsjRyo/7vP8tq+9I+1UoQUCsMKjZI8RAB5vMvtMWOQLDCpQ2iu
         FgJe3vlAoytDBHDARow3leMeQdBV87T4+CMDfvktIosPn7EVoUDRQCuXHAuqeTvbPRQW
         9MQLd/TRD/4WWOctByxQnLw2YTCKM2nZ3kLejj85fuhgvYxNby/VVSktmzMPGXghdbvu
         dot7bVejYpj/VP5YnNNm5kBLjIXduhXhaq4XkREqC9jAmnJdEJl39ic6eDQ3Bs23ucbV
         L8MZjFpbqQTK9n9jQFMiO3X9xmS9dbIeV9YPiVtQkTX3mHAiZapigfCqJ5OwFYcr7FPp
         JreQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsK+99tIYVWjl7jjdH1bZw0KhtV72nlw9vOTnWjY4DsDZ5v3HeqKrSfzokPdfAfgPIspnCuyjbLXBElH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8IZc2R0IepGynxpL+oM3Ia0Qh2degDiNMOPTYXpv6JlSWBieC
	kmOub1DEWqEVL/H/ALk1hiF3ofga0mft9cj+ynl5w6H8gjyIjv4LDRs8VOEoK8Nt454=
X-Gm-Gg: ASbGncsj/X5fw2EdbeJcu/mMTVHpQRG6hTibIwS7ekhgyD6hjqhaYfqPJLYVtJEqwGi
	2vWj1TcGimtLdi6aXT5uwRZYzbgpGN19exsEjhF7n6Dj1GZtLOKpD1Uf9f1pN3ir0FV4SYGn/do
	WhU/4aM3xjSjNArV+nMFeeY90S7pX4EuyocExUw3uewqQFxgNndvqWkE+h/UJPyfVjGGhYWIuu8
	YYoAdIqIWTJr9QrT3mTXtenLm7qw6hzFS89U7JD/iwdb/KN7IFf+Gapzl/YZGAXSkZlqFukUdtf
	3W/VBVUP1TWB5kxqSomvJgLau3akKK4V4Y+3IJ+qbgpnj5IgbuWDYU8xqcbr0TBoanNSa/XRi4P
	yPU2gYhTV7oBatY2nETHhtWLX3UtJWBU=
X-Google-Smtp-Source: AGHT+IG417ZWU7rctrUCSCtMeXYKqD6ggMKJuzWIMQooXOk1KUkGBbzbIcqMGsVv01VYeq1mnM/67Q==
X-Received: by 2002:adf:9cc5:0:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a8f482c161mr14623720f8f.21.1751396273005;
        Tue, 01 Jul 2025 11:57:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:3714:f5bf:56c8:9f3? ([2a01:e0a:e50:3860:3714:f5bf:56c8:9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm203068035e9.6.2025.07.01.11.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 11:57:52 -0700 (PDT)
Message-ID: <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
Date: Tue, 1 Jul 2025 20:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nishanth Menon <nm@ti.com>, linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Content-Language: en-US
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>
>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>> select on ARCH_K3 are not needed anymore.
>> Select MAILBOX by default is not needed anymore[3],
>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
> 
> Hi,

Hi,

> 
> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
> enabling other unneeded features to pull it in.
> 
With master branch if i apply this patch and i do make ARCH=arm64 
defconfig and check in .config  both TI_SCI_PM_DOMAINS and 
PM_GENERIC_DOMAINS are enabled.
with linux-next it's same. i don't really understand link with  PM part 
in this patch and boot issue on your SOM.

I probably misunderstand something.


what is your problem exactly ?

if you can share log or link to jobs

Regards
Guillaume

> Best,
> Matthias
> 
> 
>>
>> Remove it and give possibility to enable this driver in modules.
>>
>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>> [3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>> Changes in v2:
>> - Remove some other config after comment from Nishanth.
>> - Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
>> ---
>>   arch/arm64/Kconfig.platforms | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 8b76821f190f..bf9e3d76b4c0 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -135,11 +135,7 @@ config ARCH_SPARX5
>>   
>>   config ARCH_K3
>>   	bool "Texas Instruments Inc. K3 multicore SoC architecture"
>> -	select PM_GENERIC_DOMAINS if PM
>> -	select MAILBOX
>>   	select SOC_TI
>> -	select TI_MESSAGE_MANAGER
>> -	select TI_SCI_PROTOCOL
>>   	select TI_K3_SOCINFO
>>   	help
>>   	  This enables support for Texas Instruments' K3 multicore SoC
>>
>> ---
>> base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
>> change-id: 20250504-kconfig-68f139fbf337
>>
>> Best regards,
> 

