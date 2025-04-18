Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A46F2F2;
	Fri, 18 Apr 2025 09:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967222; cv=none; b=Qb8/kl2mvIqTXuIORd9zMozBnuPH0Yjgekrmk5UmmEU5nl9ZGP8JEh7UiCId9nbuUH6vPErTi/D07ZIXwk4apn8GDHUt5BQrjXr65dG1lJSjFkyljRNoiytdZYIvP6RZ2XTVN2N5Lp43w+cVZ1KpVz00f20sA57F8PDJUbUj0Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967222; c=relaxed/simple;
	bh=JBlKrQw0oZllLN8aKYTojh+lH0DW9ktIIxKgZrv5RX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFinh4rTHApn7LCyiTarMBZ9XsbK41uVtgeubtpB5amsUQqgpz9OH9nDBJ2bsVfbtkk9jMfCLS22q3tr/IYMKymS4zf8gdud9+Y/ItQbo4wloWjU31d26kcWhcYqN8hRZK9AYKGfDmuUEC/jRLFFax/zxyDGAiJ1AK0VREDUbJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVy23vAt; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVy23vAt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30572effb26so1592230a91.0;
        Fri, 18 Apr 2025 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744967219; x=1745572019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l79s9nVoK9Pwof+lUM84GvV2J/ByIgYxxt+WmTxDz6E=;
        b=JVy23vAtTRbdTWWg05VfBx3ZQcO2A0t8S16BF2CJGE5M3hx0diY37TJ5y/KfVGLrLO
         CQeHoiaqg+PCFBaz38T4/LVHaymA/g/nU0/n3SYSph4C33kuueTxnMlvC2x8oarTbXO5
         C3mmpekdA45AAbPGTyLLUaaHI7rCKX5hdqMLFoXaaOqX0ORqUDbE1vGX0reIAuRYDpJV
         qHwATn9YjTIMTgBYY+m9XZp4StJROD9oYeQtP99qBcYe//kkoBpQ4NgQiIcex2wA6MV5
         VbuZtMR0sbqFKy1e6Rd4vrQBXIRN/GUCqhr6ROozMoyyQe68jyXgz1Z7XubArjIHr0Du
         6/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744967219; x=1745572019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l79s9nVoK9Pwof+lUM84GvV2J/ByIgYxxt+WmTxDz6E=;
        b=XR9cfEbEh8VvwIuhGf5Lo1RobqhWJLFHgazYmESdEeq1nUDMK+QwkKkqXZSTfkk+bp
         2HDaBFByZ7pJ6yDLX1Mn8Nzbsmor39MZs5D3OjhOCQg82VL512+Ef7r9uoOmYnvfSd9M
         bI2vVG74jTKaI9qHucqFSKURg7uWbl8sY8rs/Y8f9HY4CFZGpBPi/0eMyr1QQg6nY/qw
         5urRJxVWN6xQ74umrg6KHtTOY3kz29KDQEg+6q2RZuoWRLqsG+hq1cM6fF8bvcJkvKdv
         bcORFln6iJJ7TZC+4+eT/hi1F8QbqMYmLGKfVQ6fy6R5s4lcS0stgx9dZN+Z1qCBoJa8
         T3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuqcS5YmYFCMXFemq+8NWuTxXT6MHIaRqb8OTcjxBVzKSdEz3C3xpfc0PEtXF3RK4Xe6FdAITPcGLl/VYrCDVyKOtatA==@vger.kernel.org, AJvYcCWhH17xMtejvfWlXp9X+cpVp5X6OA9kzOx0mWfDOqmE00YyRiAgpOs9wTkOKdObOroEDXpqY1WvDQXaY+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBX5fKNJSqL46lL1LB4wobV1Uxpdf2297iqsNeg8lenY+nAldn
	immAcGkCyyYd3+HbKeQuArpSj+yC+jKrd5wsADLI03wNC9apDvIv
X-Gm-Gg: ASbGncsAC8gE9QEzE1xFYMYsQCRHWljv4LVWX4sownSO1RVnCqag3/wIrQ7A9fLzvvq
	81dnSyZ1YHwlC6qd4wfoeEh4cRmGdsV+KPZ1G/y0FRd5O4sY9yeLy1VIiMp0B+LNljrh6RJtlD+
	J8KzUT8omM6NNIJQYDEHK5ndznrC3rc5zVSGucXMzYGogrtng/hv9kYmudNskGJeF5wbXTOVmu1
	i2EdyOuoixEeKH8Lpgp2YpslVr+RkSnJfK7PkHcBvI8CtucBkYQIaLv/7em5gNpTD/t/ZtxgD3F
	61EScnd0WTN/FSpuqBpStniLTcBlBQ6JfpL0LqePPaTpYdUDL946bkqzLgZ0dCONTTfKRb24nYd
	73fvBnezWDlwVz71OZZjxq70=
X-Google-Smtp-Source: AGHT+IE/99meXdoEBNHbkMJErJY6XqAYkQULO4g+LJ6X8enTVNT7b2EBqEIFjhhSjpU3wOzEDV53WQ==
X-Received: by 2002:a17:90b:51d1:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-3087bbbb5damr2776868a91.34.1744967218882;
        Fri, 18 Apr 2025 02:06:58 -0700 (PDT)
Received: from ?IPV6:2409:4080:218:8190:3fb8:76d:5206:c8c? ([2409:4080:218:8190:3fb8:76d:5206:c8c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e0febecsm783200a91.39.2025.04.18.02.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 02:06:58 -0700 (PDT)
Message-ID: <309074de-9f12-45c9-8eec-8a116ee6abf8@gmail.com>
Date: Fri, 18 Apr 2025 14:36:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Fix uninitialized pmc/map
 in pmc_core_send_ltr_ignore
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: irenic.rajneesh@gmail.com, david.e.box@intel.com,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20250417075229.20540-1-purvayeshi550@gmail.com>
 <2b6412f7-28d7-e7c4-6c61-aac9be6dd84c@linux.intel.com>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <2b6412f7-28d7-e7c4-6c61-aac9be6dd84c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/04/25 18:43, Ilpo Järvinen wrote:
> On Thu, 17 Apr 2025, Purva Yeshi wrote:
> 
>> Fix Smatch-detected issue:
>>
>> drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
>> error: uninitialized symbol 'pmc'.
>>
>> drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
>> error: uninitialized symbol 'map'.
>>
>> drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
>> error: we previously assumed 'pmc' could be null (see line 479)
>>
>>
>> Prevents uninitialized symbol warnings detected by smatch.
>>
>> Ensures map is not accessed if pmc is NULL, preventing dereferencing
>> of uninitialized pointers
>>
>> Add defensive check for pmc and map to catch any unexpected edge cases
>> and ensure all required pointers are valid.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   drivers/platform/x86/intel/pmc/core.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
>> index 7a1d11f2914f..e674b940e29e 100644
>> --- a/drivers/platform/x86/intel/pmc/core.c
>> +++ b/drivers/platform/x86/intel/pmc/core.c
>> @@ -462,8 +462,8 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
>>   
>>   int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
>>   {
>> -	struct pmc *pmc;
>> -	const struct pmc_reg_map *map;
>> +	struct pmc *pmc = NULL;
>> +	const struct pmc_reg_map *map = NULL;
>>   	u32 reg;
>>   	unsigned int pmc_index;
>>   	int ltr_index;
>> @@ -480,6 +480,9 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)

>>   			continue;
>>   
>>   		map = pmc->map;
>> +		if (!map)
>> +			continue;
> 
> How can this happen?? If pmc is created, it should have a valid ->map
> AFAICT. Did you even read that code at all???

Hi,

Thanks for the feedback.

Yes, I did read through the code and I understand your point.

The motivation behind the patch was a Smatch warning about possible 
uninitialized use of map and pmc, even though they are logically 
guarded. I now see that these checks may not be necessary given the 
existing control flow.

> 
>> +
>>   		if (ltr_index <= map->ltr_ignore_max)
>>   			break;
>>   
>> @@ -491,7 +494,7 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
>>   		ltr_index = ltr_index - (map->ltr_ignore_max + 2) - 1;
>>   	}
>>   
>> -	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0)
>> +	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0 || !pmc || !map)
> 
> What are the situations pmc_index >= ARRAY_SIZE(pmcdev->pmcs) check
> didn't catch where these new checks do something useful??
> 
> Lots of noise but little real substance in this patch?

You're right, if pmc is non-NULL, then map should also be valid, and the 
bounds check on pmc_index already prevents out-of-bounds access. Adding 
further checks might just add noise.

I'll drop the patch unless there's a cleaner way to restructure the 
logic to make Smatch silence without redundant checks.

Thanks again for the clarification!

Best regards,
Purva

> 

