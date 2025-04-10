Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA56520C469;
	Thu, 10 Apr 2025 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272918; cv=none; b=ZxUC69BtcVRM7kOiUJTBuCXtBwkk1+ZQRhLjpedmdcjuzSJO3CJ2LWpSe1NrspgJqkgvRmPML9p6E0VcJ/uFMlC0IDxE2XGAgc9f1sp9/h+eqjeD+yt6xBjwIaAz19ZIkW9TlOAIAI9PUrEzSQwYnR1DnyRs0nzVXg/6urMSJSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272918; c=relaxed/simple;
	bh=TEJ75bcWXgyu16xTGaeO9Tkza70WrHE/yhq9raHi1gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rriflXjeHmSHUum/2YHNNl33qQlaaLA/Gk5gSwLxzIMfcuoe6G0DBfLjS2xnCXljamaYPHWKctm5LM5QMSdrFgQBekbiUBh8BskDDUDDpglTG9PmIAZcLa35c9CcCEW41hxfMW7mKdAhMczGOtlQdUHAdQor5g3EozPIVrqtflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqTJLb5T; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqTJLb5T"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso647186e87.3;
        Thu, 10 Apr 2025 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744272914; x=1744877714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gneycikMji292Iovmau2ZZPw4hlcAglWkCTS8hfns70=;
        b=EqTJLb5TOYDXCZYTKgh+EiEHzTE1/vAif5fXMC32BMYrzosrrqxZOaONXnQDubG182
         BJcmTbxhx9r2FHN9HXccmhTsrtuNTKb7fkzHfG4cqQEaq4pO29+UepfHxP8CniuNyG4f
         jsdcB+TFP4BPWL+GEp5Jee3HvMxhqLXq+QriFYavHYTgIXsRK38XHBnpyCRO39/iSVve
         ZAssfJYqS7NB/vpPHw84d1LYblpTX2BeJxXgpRBh2els8GtjlcmT+yzejSyd//bI9vwQ
         mnVmGj6DjvURreqnYLR432peVPsLHWRAX+/l93J5dCICfpcpMQxG2auK63/XUFYaaL8t
         of2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272914; x=1744877714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gneycikMji292Iovmau2ZZPw4hlcAglWkCTS8hfns70=;
        b=IpIhgda1xr/hpP5Gfvf+h5Qeetrn/3oAmGWmxzT5F0OAgHV3AKDBHlzZooflNzMbcl
         RyBUYqZoXIdGLFS+8Af6jMSCm8KsbOOj5DjjAMr1bQsS7LM59EYBAV1UGMrU6X4B9qQD
         aBHwsAixS5xiAiY0j1WxsD8bFou3gkj05YWiVMS5pEvkDxPHy0/+otosV4Wy9UdErrOH
         lPpA3Pr1jxMvkwYvDlIYdNuRIZs5TGxOwja2YmhfnjfJOKGk//6d+BecT4Dxi/Rplevp
         vTHjFon3W9QYHyVStBELliEpa/BZ97YKlw6q94XYuYMgY6eRVbCLT6z4oJJwQfJ+Xntv
         TLSg==
X-Forwarded-Encrypted: i=1; AJvYcCW0/ETrOCQl7ZjrsRHlzhzcRPzjQg0o0iI4nKFu4aKRYOiDnpkUDPoBYA/FCdQThGllmRcCGzt9EJ4H@vger.kernel.org, AJvYcCWq+T8iDLg+3/pk+iCksI7LU6SSCQnp2OQ8UO3bUxmSzM7aBqW2jRfrjdVf1xRsRKhV6MWParAu8Y9xQys3@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYm1rBuQiJztG/Y95wcXX98wA3jSCMLi/7y/d//HjmG1O3exZ
	tlEGuB8aOsDxZesH5YbbpLk8jy2Gi65k4Ifd6Uvlez+SSusESj5u
X-Gm-Gg: ASbGnctWZ+nvdiUw87tN8pkd/YPcGWbRRTPzcN/4xSajVvT7oE/ETjM1UvSweB4qP8g
	3dEUgyv0OIFwo8nB20h004AgsQzfJP/e9/OhIuBOK/nDwY3aUoHf6RMj0y5Kh3sXKPxQr2nUCh9
	u8h9JogFgzq8pC2IpfIEQjyqCV1IoYMDCuq4a42xFRMAHqjUZpgHnqO1yGfrInmpxrDbvzm7EyY
	QllpEa400s810ws24hMKKBb7M++le3o/tVz8uxQHb1/tJWGHDCLjG6jwZ8EGacLLUyLzGYlLOtw
	ea/N9ZjMSYX/1trAmZLNYMoWkCRNUKEh6vpQccKSdzC66v6igB8SRtGQwGRCJQXnDuMlJeIzc+w
	fBeB3SH6WQMsuFzRNPMYyuomRYFe9qSir
X-Google-Smtp-Source: AGHT+IGgKdHHRzRFXIUkI9/XXEoFfkSCagpx+2vHi+FbNluTJ/xUkEOH9aHhI17yT5kabItmPLAE6g==
X-Received: by 2002:a05:6512:104f:b0:549:8db6:b2dd with SMTP id 2adb3069b0e04-54cb1175ff3mr594047e87.31.1744272913526;
        Thu, 10 Apr 2025 01:15:13 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d23a586sm73583e87.100.2025.04.10.01.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 01:15:12 -0700 (PDT)
Message-ID: <6f8e644c-d383-476d-87f8-2304e47436fd@gmail.com>
Date: Thu, 10 Apr 2025 11:15:11 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] Support ROHM Scalable PMIC family
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1742802856.git.mazziesaccount@gmail.com>
 <20250404154355.GH372032@google.com>
 <ddd8882f-05b6-40f0-9a26-ab21d9644364@gmail.com>
 <20250410080233.GO372032@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250410080233.GO372032@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 11:02, Lee Jones wrote:
> On Tue, 08 Apr 2025, Matti Vaittinen wrote:
> 
>> On 04/04/2025 18:43, Lee Jones wrote:
>>> On Mon, 24 Mar 2025, Matti Vaittinen wrote:
>>>
>>>> Support ROHM BD96802, BD96805 and BD96806 PMICs
>>>>
>>>> The ROHM BD96801 [1] and BD96805 [2] are almost identical PMICs what comes
>>>> to the digital interface. Main difference is voltage tuning range.
>>>> Supporting BD96805 with BD96801 drivers is mostly just a matter of being
>>>> able to differentiate the PMICs (done based on the devicetree
>>>> compatible) and then providing separate voltage tables.
>>>>
>>>> The ROHM BD96802 [3] is a companion PMIC which is intended to be used to
>>>> provide more capacity on systems where the BD96801 alone is not
>>>> sufficient. Startup sequence of these PMICs can be synchronized in
>>>> hardware level, and there seems to be some mechanisms which allow
>>>> delivering the companion PMIC (BD96802) status to the main PMIC
>>>> (BD96801/BD96805). This patch series does treat the companion PMIC(s) as
>>>> individual PMICs and allows using them from software point of view as a
>>>> stand alone ICs. From the digital point of view, the BD96802 is a subset
>>>> of BD96801, providing only buck1 and buck2 regulators. Please see the
>>>> data sheet
>>>>
>>>> The ROHM BD96806 [4] is similar to the BD96802, except that it does also
>>>> provide different voltage tuning ranges.
>>>>
>>>> This series adds basic voltage monitoring and control as well as a
>>>> watchdog support for these PMICs using the BD96801 drivers.
>>>>
>>>> Similarly to the BD96801, these PMICs too have a few configurations
>>>> which can only be done when the PMIC is in STBY state. Similarly to the
>>>> BD96801, doing these configurations isn't supported by the driver. The
>>>> original BD96801 RFC [5] driver should be able to cover those
>>>> configurations, if modified to support these models.
>>>>
>>>> [1]: ROHM BD96801 data sheet:
>>>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96801qxx-c-e.pdf
>>>> [2]: ROHM BD96805 data sheet:
>>>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96805qxx-c-e.pdf
>>>> [3]: ROHM BD96802 data sheet:
>>>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96802qxx-c-e.pdf
>>>> [4]: ROHM BD96806 data sheet:
>>>> https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/product_brief_bd96806qxx-c-e.pdf
>>>> [5]: Original BD96801 RFC:
>>>> https://lore.kernel.org/all/cover.1712058690.git.mazziesaccount@gmail.com/
>>>>
>>>> Revision history:
>>>>
>>>> v1 => v2: MFD driver changes after review by Lee
>>>>    - Use enum for chip type instead of picking the data directly from the
>>>>      of_match_data.
>>>>    - rename "chip data" variable 'cd' to more widely used 'ddata'.
>>>>    link to v1:
>>>>     https://lore.kernel.org/all/cover.1741864404.git.mazziesaccount@gmail.com/
>>
>>>
>>> The MFD stuff looks okay to me now.
>>>
>>> Let me know when everything else is ready to go.
>>>
>>
>> I'll treat this as an ACK for the V3. Please, let me know if that's not
>> Okay.
> 
> Acks are tricky because another maintainer might (have have in the past)
> assume that they can apply the set with my blessing, this is not the
> case.  I used to use `Acked-for-MFD-by: <me>`, but these ended up being
> merged.  *face palm*
> 
> Anyway, no harm done this time around I think.

I remembered you used to use the "Acked-for-MFD-by". Never knew the 
rationale though. Thanks for sharing the reason - and downside :)

I try to remember to not treat your "this looks good to me" as an ACK in 
the future then, but expect explicit acks.

Yours,
	-- Matti
