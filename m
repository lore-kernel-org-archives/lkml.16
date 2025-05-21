Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D1267B1F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833801; cv=none; b=ETyIZxBQinwUOnN+gQh54GG5X83gtE+BQ4oEUzaZkUJsHSf8GTSvAGP+Kk0k41DKRoFH+O162x0n7ShJGCkJdBCHHLN/D+esimfbWYHiHZiUbGYEcuG+VGEim334s+W5waz6Ii3b2hxmljzy4ByuaeVgSEvMo9bzYqReNpo3apo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833801; c=relaxed/simple;
	bh=w73AQw8+g5fBpedRVPUGGRopTEwJA46061csugvI/zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQdxme4bbsdSAV3BIRsaXo8EC9FhxIrxcVZtN5Gd4UWB/RpMA05rXkGeYOksS3ai/kIxIcy5d8jIt6LicnqBYvmIDZwrO70ypoZf4wv9VXhEsI5G4EjogoRn/tcfP6aXUoJcv27DiB3JbabP0TXzr313dvETJ+rExigYND+K4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lqS5gWCU; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lqS5gWCU"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3fe83c8cbdbso2458360b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747833797; x=1748438597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73+Ub5D7zbTT7WbMLp31ncO7kWmhvFAqTPjsH0ZsZhs=;
        b=lqS5gWCUR4SPY9ewYeFIUWBdlTIFTKDNqHLML7XSuNWvilvicm29/SevLvdA7rPT/v
         /o2OIM2fTYfIYmqRkhHgICFHkKzk9ho+Hqzbqrcg0+zvx7ws3z/fVY06kfWFqJ4lfEef
         tyqeGx+qF2u10PgiGo72FzrcubSnhuzw2C9E9xh5XjkNR55z/6+NUMGha8ihdpteGHLB
         Q6aEj/UTi9mqop2itFHRJt6jMr8GuigOFgHfrGnUimRYB38kP9lhoGyhEm4iksDuC9Ql
         Bz3H4MxvnYUnpiPCjHyNKJ5uYVhRX55osI+N2whlZLToTW7PNIocZaesSR9h7Ha+9+MX
         zhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833797; x=1748438597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73+Ub5D7zbTT7WbMLp31ncO7kWmhvFAqTPjsH0ZsZhs=;
        b=ZTxP9VNa43Yt2X0EKMtcqmLGnW73H6PlohmuRuUOSqD4cshIxwEySHFtf0KKLCif8Q
         C1rQFzkkpCQYYJBfUj2btnI8zRGBwdlwDmB1MBejgtzfva/+ZEOlM1HNVmVUHU9isjzl
         wZUIIBoR9UtHiLH/LDCMTSH3o2P3C5lrAq2Hh4B/io0WcQ+XlcdsYxZPG9/di2gfyNMI
         VhoBkrokmYlCeCCLstD/XAcgXpiC3FCUe4sw/rQvJkugQ+97HvfoYQDztxM8JXVjt5Uy
         NhxdaXoadfHvtMhUBzUK0IXiN2Vk3tdrqMQAmAnEQARxQJEQg0YBI8qMAA6aqeTbuLyT
         mqTw==
X-Forwarded-Encrypted: i=1; AJvYcCULlLdPS8JTww4RLDohQVyuES5JzwifEU4ezUICWYNljtTKz+5ijAv8ZO0wNbvehcdc/ECWqK+P0KFL9Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOB+K+3lo+u1lYoc5Jcw+lmNZZe5DLo8OVWY4BzhZX5jfXAXa3
	qfNUSPDPaBRY7LsL3/xsobE7Df07027NUj29hXy/4nvJImYzLQbhFztxCnq8Qzl2bLo=
X-Gm-Gg: ASbGnctz8iO/biu1EPNphRxenzukXQDP5oph35ybyD/UDwPzh8+EHj0PxbggQi9PijW
	lyIke+YYYGmzT8ghHVSqczTkFYE2EHI376m53k14nUZtLl6dje/98or6u/OKUZjqfdgBikGDpzA
	Ecb/IKNbpNo3qeScthgC1RHaj+g6ZNP4Jn7EJ60KQkisNhGU4CG/u/RKr3qiY2rVSwdiK5RCGqt
	WKLzNERFQDIZ0nNm9f1VNPD/tQtndu5D+l9P4OC0KRLGrFPjZ6B6Yy3PkQh422j5oVFAUlaQnCV
	btOCHJn+3F5L2aC4vFZXBEAjV+lHhbKJcKyQ7hyjiSoFjL4kKhbdi50jRLRocWhD58IYMg+w6UL
	ZeH05M3IOTxRyyJ34SlyZFBnsww==
X-Google-Smtp-Source: AGHT+IHvmT2xe5UfsGuH7VhuaUgi4gdIlcSV03RlKzpEU+TwayEelqHe5C4jtIcDiTOXtQ/wc9WNfw==
X-Received: by 2002:a05:6808:338b:b0:403:3521:2475 with SMTP id 5614622812f47-404da826d65mr13000543b6e.37.1747833797424;
        Wed, 21 May 2025 06:23:17 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff? ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d98060ecsm2154491b6e.27.2025.05.21.06.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:23:16 -0700 (PDT)
Message-ID: <dc9c370c-e1e7-4ef9-8738-e6ac8887ee61@baylibre.com>
Date: Wed, 21 May 2025 08:23:14 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250521-nostalgic-pretty-hedgehog-d08a77@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 5:10 AM, Krzysztof Kozlowski wrote:
> On Tue, May 20, 2025 at 04:00:46PM GMT, David Lechner wrote:
>> Add support for external clock to the AXI PWM generator driver.
>>
>> In most cases, there is a separate external clock that drives the PWM
>> output separate from the peripheral clock. This allows enabling both
>> clocks.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  drivers/pwm/pwm-axi-pwmgen.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pwm/pwm-axi-pwmgen.c b/drivers/pwm/pwm-axi-pwmgen.c
>> index 4337c8f5acf055fc87dc134f2a70b99b0cb5ede6..67992a7561ec0440b1c1fa327f844a0602872771 100644
>> --- a/drivers/pwm/pwm-axi-pwmgen.c
>> +++ b/drivers/pwm/pwm-axi-pwmgen.c
>> @@ -280,9 +280,26 @@ static int axi_pwmgen_probe(struct platform_device *pdev)
>>  	ddata = pwmchip_get_drvdata(chip);
>>  	ddata->regmap = regmap;
>>  
>> -	clk = devm_clk_get_enabled(dev, NULL);
>> -	if (IS_ERR(clk))
>> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
>> +	/* When clock-names is present, there is a separate ext clock. */
>> +	if (device_property_present(dev, "clock-names")) {
> 
> No. List is ordered, you do not need such dance at all.

I should have added more to the comment here. This is also needed for
backwards compatibility where only what should be the "ext" clock is
given as clocks = <&spi_clk>; and the AXI clock was missing.

> 
>> +		struct clk *axi_clk;
>> +
>> +		axi_clk = devm_clk_get_enabled(dev, "axi");
>> +		if (IS_ERR(axi_clk))
>> +			return dev_err_probe(dev, PTR_ERR(axi_clk),
>> +					     "failed to get axi clock\n");
>> +
>> +		clk = devm_clk_get_enabled(dev, "ext");
> 
> So that's messing the order, which confirms my question from the
> binding.
> 
> No. List has a strict order, you cannot change it just because you want
> to add optional clock.
> 
> Best regards,
> Krzysztof
> 

