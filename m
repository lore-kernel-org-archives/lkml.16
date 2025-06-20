Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ECF28F930
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428649; cv=none; b=U/urZ732IEsHc/hY/iCZSyONIQJVNwUKfcRxrUm6Mn5mnw3Q8PfEYTrnCl9Q7bVlNwQq5uHLKPDkqu7PuNnsw2sPswtQKMD3SypS+tLBUTMLyES3OdtXZaXGALnDojjUpqcmqdPxTNLojLwsRqRTeVewfH5vBQo8CGbJZziOByc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428649; c=relaxed/simple;
	bh=AbfY+khRhmnoM2GrJwd2PvwKLx/Otd5i6x62C7zENKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFWaryB6yx5V4a3cOHgFqBFZDjsDDIStaPIKe9g/k8Ab63hYxWJa6RULc/XO4v87Kct1G87E1iXNHBOs+MPfTWemW7lHzQZZDtjNUBwXvgFCQPqnhmVr/VTsLAhVdG2fOId8T+HZyyRTagk8frlo3p3MGBlqog/1rH7lPwofM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=m2M53BNA; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="m2M53BNA"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86d00726631so44374439f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750428647; x=1751033447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/V0jiwDrSai/Ua3D+JcI8BdoFAg+vd8bUJc9dl+oAL0=;
        b=m2M53BNAPMQakuPBoA8nbB5BJF1FVJoiUXEM87RN0ElDc79J7O6YWGAiELH5lpWe/F
         4XWMNqv5uiwk2UJcyovpZVvjJjS36v/UjCtfGAr9j5wb0w6S1U7yhVvPCCIplXLEpuOk
         lxEsg3k0EUWBTE12zNvYHdNYwfuy82yq2IVfS60HUWXBgMtai9u2D34ZnshNSMxRh2RP
         q2/BO7716xNAulr10M28Bp4ljHf07VpoIhdekOAELxs7MGrAKSiJwukRCByaxe56sziU
         P9GmfyKAV5eu4sDrKoV9n+N7sPZiLVD9EcNJzVfQ0bObCuWyVTSJlJdZfL3YnR2x3+Bt
         GRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428647; x=1751033447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/V0jiwDrSai/Ua3D+JcI8BdoFAg+vd8bUJc9dl+oAL0=;
        b=RWx52CNRSaskaQyBAHnBSDbkTiuHzXDK4JGD5K1+fBQzVtucvg8SfKsVCyCyh1FYNf
         jZ9B1OsKzBVFhuEQkXWAGxbWmyeYQ3Ke7w2EAdjwucT/yhAbk7O4FhJoL/Fc31DRO7ry
         Z44VRlY364scXAevHJ6IcQOXD6t791foFrGeVGBg5NhAlV2e8eE1CuD39buf7wjvoz27
         569wBeYpNhtZf5vLdFHUhg5bgfB6I3/KI2FPIK6+Y54GMVWta/IQzNad6pnOxfcORYx4
         Wa2RLVZCQ0Riu/BviQlmRPaBmkg68EF03Cnjn4LpBn5YZS1t7AcRciyUUInkSm58oaws
         3tRg==
X-Forwarded-Encrypted: i=1; AJvYcCWCzOk8vsSbjYIx7/6g1UWYkIu8GwSi3W9llWxKVD1XaAnzRFtQXkUrKOOiSvQbeu6+2jQfzB/PdX42/pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwucAFEeGfukKxkb/UUWZqXAcKQi595d5ZCBNttO4OScdXhXU2w
	aUFi4LPKv+KkB9264pSpJl1im/1fzT4cu6eU2330XkLjg8c3JAHTtPjAkk/V+kyAExs=
X-Gm-Gg: ASbGnculpxVp7nC6ryTTHAvJeGe+mint6B3pjS/eD4lMk5C/8woiB3Z4pYQeWWPLlBG
	kMRJ1oaoOAKsNdlQTccEqXwhrBzSIjnay0SzsWSFzJSNhfVx3pO8+Q7N6JAlpIkBxY5YnxVIOhR
	CpP8rqkwtl17uqnEqN9jDBdBorfjRvAy+Z7JRehU66X9JttFY/t/l8ZUgJRm0lw/QA3lVwdx2WW
	wp6yac4d0L30yDXFZgfv2fRsbW9/UhN41BZr/vAWjMeC71cXneTDOJjE+O5BNH5z+Bb3vWvLaBG
	yfUhblwxGxcbfUa5Fd8x4TTbAQFTkPT1qWrzvTbO76Hp3G/xjnAZewHqngEPCNKy5SUISJ+nAQ6
	zaoLYCcPjGK+Xz1g2GmySKdvVGA==
X-Google-Smtp-Source: AGHT+IF191sx1Gw+x8ilTUOKPF8dmHGnHILkCee7ddq/TBaGfyhQHSrZPkzvoftsWVolVXrmsAPBTg==
X-Received: by 2002:a05:6602:380d:b0:873:1ad3:e353 with SMTP id ca18e2360f4ac-8762d1e8c96mr306397539f.9.1750428646946;
        Fri, 20 Jun 2025 07:10:46 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8762b7adc23sm50782439f.35.2025.06.20.07.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:10:46 -0700 (PDT)
Message-ID: <a694de5a-50d3-4637-a8c3-f90971bf33f8@riscstar.com>
Date: Fri, 20 Jun 2025 09:10:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com> <20250619144147.GH795775@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250619144147.GH795775@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 9:41 AM, Lee Jones wrote:
> On Thu, 19 Jun 2025, Lee Jones wrote:
> 
>> On Fri, 13 Jun 2025, Alex Elder wrote:
>>
>>> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
>>> but the driver is structured to allow support for others to be added.
>>>
>>> The P1 PMIC is controlled by I2C, and is normally implemented with the
>>> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
>>
>> six or 12.  Please pick a format and remain consistent.
>>
>>> regulators.  It also implements a switch, watchdog timer, real-time clock,
>>> and more, but initially we will only support its regulators.
>>
>> You have to provide support for more than one device for this to be
>> accepted into MFD.
>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/mfd/Kconfig         | 11 +++++
>>>   drivers/mfd/Makefile        |  1 +
>>>   drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 103 insertions(+)
>>>   create mode 100644 drivers/mfd/spacemit-pmic.c
> 
> Right now, it looks like all you need is:
> 
> drivers/mfd/simple-mfd-i2c.c

Now *that* is a good suggestion.  I'll look at that now and will use
that if I can.

Thanks.

					-Alex
