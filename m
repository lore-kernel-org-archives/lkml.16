Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F01553A3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835631; cv=none; b=fdC4Elldv/U/jKp1LQLpAfllisUojxPX5twVIj7oZt9qSJm/aksXuveEV1o8WAqKFUEir4Q3R6P9zCFy0ePKGE4KUCnYSRk9g7Zpja2SM6mUTrruT8dVr8QFRGByi15mpf5ixD7FhPXGaEbkluTfdTpO+dzjNg9VngQETgQNSSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835631; c=relaxed/simple;
	bh=IrZ5eRKdvHnLfdBgA5Nxy0weSbvz1ttlkMPa/YVUH3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMU/IvG88/zTvao3qxw8pLj+O1VSrMTDzXa5oE4+PdvuDW0+gIOV+JpsSOf0pIXdV0DlaPpY3vFYt9aCxqAz2LCX+K5vC8ZJDwnUyG1ONxWNUIuaG00wMC2slh4flO7OcFDBeFbx16A40nU7QUOAKjn7UVm0n+CvxyQcQTtJWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QZwU5kyJ; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QZwU5kyJ"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4034118aeb7so1886007b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747835627; x=1748440427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TN8vNo4OsWHNsyvidVWWosuPqSbZZ3DbbQtiLkxvupM=;
        b=QZwU5kyJp0JmCMBREBew1TKaiL1qXlLZhkany+saxezNUpRsyLhA11LVE7RrUbnv+G
         8+iER+bT/aDJc5X6rqZ8Ah3tP9pKpp3DDsSBXMfmL6vneSw5m25M4nvOsyh5VptH2s9Z
         OK3yi8O/wWe4LoFkOkdSknFOG90oel6gotMBIQYPu3bT4kmrZ+5zLAoooltsd8k13NQ/
         hIcwaG96f+ctNZP2CPpIbeKQovtdXQ2d7rciAoH0QOgZK4UQ1mkkoJxUMmL1Orww4Jdi
         0CC3IuJcw71pQxtbYMJHl3qGpjMdbLKyLfuEeK40bGagVADY1edtnaTwoTCHBdEuR9rT
         bX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835627; x=1748440427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TN8vNo4OsWHNsyvidVWWosuPqSbZZ3DbbQtiLkxvupM=;
        b=A/q6kxeJjnYcc0PR/rWOnyy1Rk3Nzc8/O9Du4a/NkOA0skKr9IO+OGzVUABDqXM8Lx
         ilf3pcdqe63uboEymQyf1d4YsvYxBKsEDS2MCEiT8k0TQzD/VZhgnnOJlPCB64E0yd5l
         OmMNjLlKHsRK6EdWUYaPM/i+JKE8M+5JREizImH5PNOH+/ka4ItGgxZel1AnQGpSMJuh
         l7Id/diWyC5Fuu9S/KpcZwQOqDxKOgsqz12DlYS+bguu7t3xm9YVhdk7KgrU9nCXlORe
         hpzmGsvm+6V7pR1kR5kP0lteV57i9nPKb5HNWb4aU2kr+mIlaiWX/iGgFqZD+XE7B1aV
         YISA==
X-Forwarded-Encrypted: i=1; AJvYcCXmnEAmbWwoXqKGjEhb9xv6Q3vy7RgjIyCaq4Z4IkndyZ85SABiiPLDd6Op+nlrejAMuWPebC99YPdNu5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1GkFtrDiqzuxtXqM+7WmD8+k49FDIYofWx4goml+eWskaA6p
	5GaQ2hFv6X4tVCd6qtAtuAWfJs1VLD57vUGDgSsB9VlV7sZhQ6tQcmoRsNIPoGldcpZLayGX1sI
	8sImg
X-Gm-Gg: ASbGncsWN5rpV9w9hHbaEev/Ywgzg2y8Dh4wENy9yBb7oFYsHz/0KCdBCNOClQtfvgD
	q862MsFWhUAJ/W6FBZ2uuhnI3RIX2zhrH8td9t8OeGHbSx5YSL/h6nR84hat61WuT0XcesRAB6C
	o84gaAC+gaxZ42b4ppIYNJ8+t6X6h/e1ejqx/P6XkInIo6FYM/SVSOuk9cvM48SWupeQSehE18h
	v92m5bYmzW2CANJO4dY7liKnWxVqMJGB10RbWWsLHL9J080DZC/SaRSUYxzcMf6FuXjoenBwPUn
	WCXU9o6129SxyIQKxexT2Nb1sZQN9U8hEZvcjDBk59enuKG94TJ+Lu2GFgtvEJBEzb2UYrgLE4H
	3y30JUXav7jMuDn3PveqVox1qVg==
X-Google-Smtp-Source: AGHT+IFYCXtc00k34yANAC2zmBuis0tebfqeNN9MhmWjygKNfbvjf2hqAzmrtv2L+E0iPrKoPM/yoQ==
X-Received: by 2002:a05:6808:4486:b0:3f7:dd2b:229 with SMTP id 5614622812f47-404da70a2c2mr12335197b6e.7.1747835626938;
        Wed, 21 May 2025 06:53:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff? ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404eacec299sm1630070b6e.26.2025.05.21.06.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:53:45 -0700 (PDT)
Message-ID: <99c6295c-9ed8-4611-a3db-ad57a33f4f38@baylibre.com>
Date: Wed, 21 May 2025 08:53:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pwm: axi-pwmgen: add support for external clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
 <20250520-pwm-axi-pwmgen-add-external-clock-v1-3-6cd63cc001c8@baylibre.com>
 <20250521-nostalgic-pretty-hedgehog-d08a77@kuoka>
 <dc9c370c-e1e7-4ef9-8738-e6ac8887ee61@baylibre.com>
 <17a9ee62-8185-4833-acfc-1639fd17efc5@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <17a9ee62-8185-4833-acfc-1639fd17efc5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 8:30 AM, Krzysztof Kozlowski wrote:
> On 21/05/2025 15:23, David Lechner wrote:
>> On 5/21/25 5:10 AM, Krzysztof Kozlowski wrote:
>>> On Tue, May 20, 2025 at 04:00:46PM GMT, David Lechner wrote:
>>>> Add support for external clock to the AXI PWM generator driver.
>>>>
>>>> In most cases, there is a separate external clock that drives the PWM
>>>> output separate from the peripheral clock. This allows enabling both
>>>> clocks.
>>>>
>>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>>> ---
>>>>  drivers/pwm/pwm-axi-pwmgen.c | 23 ++++++++++++++++++++---
>>>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/pwm/pwm-axi-pwmgen.c b/drivers/pwm/pwm-axi-pwmgen.c
>>>> index 4337c8f5acf055fc87dc134f2a70b99b0cb5ede6..67992a7561ec0440b1c1fa327f844a0602872771 100644
>>>> --- a/drivers/pwm/pwm-axi-pwmgen.c
>>>> +++ b/drivers/pwm/pwm-axi-pwmgen.c
>>>> @@ -280,9 +280,26 @@ static int axi_pwmgen_probe(struct platform_device *pdev)
>>>>  	ddata = pwmchip_get_drvdata(chip);
>>>>  	ddata->regmap = regmap;
>>>>  
>>>> -	clk = devm_clk_get_enabled(dev, NULL);
>>>> -	if (IS_ERR(clk))
>>>> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
>>>> +	/* When clock-names is present, there is a separate ext clock. */
>>>> +	if (device_property_present(dev, "clock-names")) {
>>>
>>> No. List is ordered, you do not need such dance at all.
>>
>> I should have added more to the comment here. This is also needed for
>> backwards compatibility where only what should be the "ext" clock is
>> given as clocks = <&spi_clk>; and the AXI clock was missing.
> 
> I do not see this needed at all. That's already handled by old code. You
> only need to take new optional, second clock - axi clk. You take it by
> index.

Except that it is the "ext" clock that is supposed to be optional and
the "axi" clock is supposed to be required.

> 
> Best regards,
> Krzysztof

