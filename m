Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909419C569
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836730; cv=none; b=GQESIC0+XaHn4AKJasMK48E+T7osNTx1PszCdGkbzcSfplc8fPHTawIl0P+VD/3xGxBoTM63xHK0Diqul6qrxc7SP4+hs2ZsWHck1r04rlVpEBiAC81hS6ChDrtQVk75Uzbb3/tXmW5J8vYVNBUkADPxGX9IjeeNYx660lJQuTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836730; c=relaxed/simple;
	bh=odsaSqefquxp3EMnxzFyTlzs+P6tOxwI1Uga5f5WlgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vrr9e9Fa+6+xNbah3P5FW7+Hw9lozeYIEUXhisHYywxl64I7bDHGUJjv0X7/TLe+8/3VVTuZnl/qgrts2ETsEzrXi7F6sVUmJh/vRzeJKiI5rmIOUaIyey2EvBzz5e8s7+XhKeYxgUMac1ajv9JGreO8v/ph5Hc8/tCR0hZ1kvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nLoqpwz+; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nLoqpwz+"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2d0d25cebfeso3236032fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747836727; x=1748441527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYTDDF5UU1bTZpFDre3P+poUO7y3Ub4h619aw333K6I=;
        b=nLoqpwz+1l+0GgT5dslf8/b04vpVxd21VmG+2EOcHnhColudaYAgUkLlIW/vAs5NIQ
         qKdnNKch6c89GRSR7d3XOLHDdDQjmkGbuUD4yoBgRC2L2TNh08bqCw2v8MAc1vSG13re
         75gZCwT5Hp8yQByKnrHTuq29qUN6OCBwOAlVASufN0OE4KXKXUC20DhjA4WI7lWNWNRh
         422MeGgg7E3ibvjJEzL4R204EYIsgAjVhNY9rmhz8nED2u0bf1LDhc6mNJWto7wVy9HQ
         ye48C4Nl41bNrNqZbaD3YiMpV5kQ6dMj174jpbde18EsNyxcHftXneh2D+1PgqRaPW8P
         kXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836727; x=1748441527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYTDDF5UU1bTZpFDre3P+poUO7y3Ub4h619aw333K6I=;
        b=FdCcxF/Kcoydb3J9V3hf/ImDevLuHzBmoEI6mbtybeZAokvD6EX+PAdUw3o8B6hi+O
         ViQE0zSBPfmjGoS/sf9lEaeiA5rDvBqyo9az8nUvgH7jBdGt2q68uSbE/Pfkxm4jCvPi
         u8m+nc0ciqqLIXdrJUNVNYjTPCE8aJqqP6jQhLihaweVZvQ+0m1P4ILqimUjIk11zZZE
         0VluZNucdO3cT3ZTLtu1RMR/JTYZAWYEVxNF2yBgdLdE2HTiX7QxcIBrsI/AbsGtv8Ga
         wOMyM9aLw/+qgXi/UQ7TTqf4jg60xgugaN4bmbbWibU8kwDnYPD4LvIUez3XOcWhrplr
         nRgg==
X-Forwarded-Encrypted: i=1; AJvYcCVzKMwP50uNNjPt5qwr5oTATaDnHWXOi2z6Dm5wFRBql7M6aUezsGDXmyWmK2YLTDq6MmJkAndTINEhFoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym854+zqgXXFEBzxWsfQI6/VlooDwji2aP09pKp3MP8ApCcnjZ
	rKoxTiPna2ABs+qh/1FCG9BWV54Z7aX6oYW7B2pJD5wdzr6A/uVYM/sYsK0m3iddaqY=
X-Gm-Gg: ASbGnct951qIANoaWPCHc19kagJmpErrXcX0hd/aMI3JDJAXBZRgfG3JQ6wjldMHf8X
	CxB9UJgRRH/+cwBqLK1owdUUTlsUsA8lDt+rLsTi7h2PR23JHH1AZeKnkgC1vPjoIA+Q8EGzicw
	PGmVPyxYLfJXAfqncUJOgEP/4hFVohHHkgYFJElP4tYEgMgqGAtflk8w5E4MEaxsx2ZXhLJ3+Wz
	Cmnd5U4dD93McFNxuQCBD5PKTH3M1hFE+74N3uBioLjI+H/t8XQgptpEig7EDV/t9APAZItd4x0
	YpUDAxu+NuT3oUvAZolS9zpxaWk2DI5s1NgJX7vAzKkrKCbc2/SP6W5YsH+UxChLA31a+H70tOC
	yRERW0uL1ppXrpqPQdjVZhfT4SA==
X-Google-Smtp-Source: AGHT+IFZ2dh+kUDz4CadhBuUt+VbW2XvI2VqdXWMjeSLEb0HI1UL7Tc8JFlMvCWqx445ddJxdyhZjw==
X-Received: by 2002:a05:6870:7994:b0:2c2:541d:2cd6 with SMTP id 586e51a60fabf-2e3c1b61385mr14163348fac.6.1747836727294;
        Wed, 21 May 2025 07:12:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff? ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b5f68asm2146882a34.66.2025.05.21.07.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:12:05 -0700 (PDT)
Message-ID: <14a80484-5cfa-49bb-9608-12f25a113b23@baylibre.com>
Date: Wed, 21 May 2025 09:12:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pwm: axi-pwmgen: add support for external clock
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
 <20250520-pwm-axi-pwmgen-add-external-clock-v1-3-6cd63cc001c8@baylibre.com>
 <zdltaexty6pzbqesoluuyluygyt6w7nq7r2wccmtfktppwuw3e@qb36fsu3jq4k>
 <0dd1a97e-ff7c-4d09-b18e-5df9944488c6@baylibre.com>
 <p3ejuwktdxcjwv43nnap5tin33ziimgxfan2xoghtaaubsxgy7@tjmwjpwy6yy5>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <p3ejuwktdxcjwv43nnap5tin33ziimgxfan2xoghtaaubsxgy7@tjmwjpwy6yy5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/21/25 8:54 AM, Uwe Kleine-König wrote:
> Hello David,
> 
> On Wed, May 21, 2025 at 08:19:51AM -0500, David Lechner wrote:
>> On 5/21/25 4:22 AM, Uwe Kleine-König wrote:
>>> Can you achieve the same effect with the (IMHO slightly nicer but
>>> hand-crafted) following patch:
>>>
>>>  	ddata = pwmchip_get_drvdata(chip);
>>>  	ddata->regmap = regmap;
>>>  
>>> -	clk = devm_clk_get_enabled(dev, NULL);
>>> -	if (IS_ERR(clk))
>>> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
>>> +	axi_clk = devm_clk_get_enabled(dev, "axi");
>>> +	if (IS_ERR(axi_clk))
>>> +		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get axi clock\n");
>>>
>>> +	clk = devm_clk_get_enabled_optional(dev, "ext");
>>> +	if (IS_ERR(clk))
>>> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get ext clock\n");
>>> +	}
>>
>> The trouble with this is that it would not work with existing .dtbs
>> that don't have clock-names set. I think it would need to be more like this:
>>
>>
>> 	axi_clk = devm_clk_get_enabled(dev, NULL);
>> 	if (IS_ERR(axi_clk))
>> 		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get axi clock\n");
>>
>> 	clk = devm_clk_get_enabled_optional(dev, "ext");
>> 	if (IS_ERR(clk))
>> 		return dev_err_probe(dev, PTR_ERR(clk), "failed to get ext clock\n");
>>
>> 	if (!clk)
>> 		clk = axi_clk
>>
> 
> If there are no clock-names, the parameter is ignored. (I didn't test,
> only quickly checked the code.) So passing "axi" instead of NULL should
> work and yield a more robust solution.
> 
> Best regards
> Uwe


I didn't know that. So with your suggestion, I guess we would get/enable
the same clock twice. I guess that doesn't hurt anything. I will try it.
