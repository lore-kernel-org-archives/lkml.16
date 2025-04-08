Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA82459C5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143077; cv=none; b=e8Gy/PZjbIg5R4DCUO/SO9DbZise2o0/RRQEXwoxBRpr3Yjw4qd5FkQZFz5sjMQoV6UtHG9rE+WcVDVl5Z0Tx5Gjkfap4AooIdmiXPjpTQpEEaxqgl4GmVkh7edDHkDhqq4zuUxeNy3BfAQs8v4ObVTRkeKyGCOGyRne1SpjXYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143077; c=relaxed/simple;
	bh=NKGR9aNCdAuFjHfEVhQYZVeV11egoapzwZVQAXZ0KhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Baj3+XA2VlCo35HmpDLrup5hizpbQbDeGjO+DXjApqgn12TsGsopugI5YcA/OXLJ7hJ44RN1j8agL2ydoh3U2Oa2V/eiWacKRrC6oUiR76Nm2FwBmVHhORN01ta5ZVrbnFmna15dRp7HJlD3q/rBlWaQqWGkCqp+pH4yAPHvOVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=d6+5PxZN; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="d6+5PxZN"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fe9fe62295so1689610b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744143072; x=1744747872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hy3Mbc+QJnexJzWSQDFuvCjCd9Gg8NAoaKf1OoRHY8k=;
        b=d6+5PxZNs8E2eLcW/C1FMT99NnUfGPkWkt9C2pDWQ7DRE67FF8EBKulcZaAsqtZa82
         oINDDQqw1sTCrPtiDc7CEKbg1NDn+lntk2beMXMJSi7Q/Kw0hPfsZCYMpYp0mClxIaPT
         YT/oyajMxCaZrZ77R9GqFdqw6JgKnEZv3Dm9Fcg1zi2yt3VZlSlDdnhSdH/aE50MDNh1
         e7xMntG2w2CDElxdqSNbKVJ2hZDuu8zObB4MdN6wGb3ajuwI5PTTCCvunf73/URERIfv
         UjiT84rgycRTYVOXRr/Docp5pTvPPzNeodbnljfx0TfH4iEPhRBClV2/Dt6j7V3DzDdr
         FW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744143072; x=1744747872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy3Mbc+QJnexJzWSQDFuvCjCd9Gg8NAoaKf1OoRHY8k=;
        b=BjmvhsD/GlPyyi4Tmc5d7aogP4XoMaOryhf7KbSMtfIh4ZtV+DvhTaChGtSAVi4240
         a6nMpYz1/SutaioxjuklsILoIPzB1V7spGvVl2ND8apHXUgoTdAcxObu3b+fIza8/V5S
         obqNKq87l82jlPti3DL6r3HhXNatGTaefLIRNmc6GwvIp8DjqM5IGZxe+FHv2zajOxIg
         c3SBx7I66lFtk2vSg4JEqrtEPUF0VDgavCv90FiDnSpu7ec7A3S+WUfKk+e5X+/RdkJN
         vgvFa2yI6J/jSbm/w8fpP+72pJ/2e+JBCVgnZ1sw7IMryW5YVvXOv6kUdxzabDQU0E7z
         oh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0hpyynwoIbRIzAaDG0A1FMRsMXr/LezXCacK/IHIQ5ToiSzw+yWA2rsZgn+Lou+D6fpDROpmjvINVoyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YykLvf0ddKhMqyQU1TliLxa5wfHnqU9+A8iEpA4tAC8/Y4PPu97
	QOibjLiXbh0X17+8FqnI8jAEUREGm/j+rCx/b8z91mPbf9XXdBeQEErvLN8jjLeXa9zJesUvxxc
	Z3B1qqw==
X-Gm-Gg: ASbGnctbz+EBwh4wAPnMVnXreXM+5c9qkL5zj7wuj6hur4E64s+d7BfYsVZbKUGyquw
	e0kucw3DoLhuVm8RvquCwg5cMQLrv7qQU3xZxQ7frQPFzM2Lo2WtKPv8pMq7G/aV4XHr404gD+P
	H/VOk5T5O07fwVgYDhoIj2m7VqsLyW01Jcz15SfSODHpvhnzpnGGQMdWkq6W6hxIES7ULWMKV4t
	Dsup5yOvzxFwZfxIH4dBnBXudllMc718ghWQ8uVgEkwqMIX7nAx3gWVDcbvcleYcfNaDL4JJDyK
	kOu41LLXr0sAmRC73l+nIehh8YL4YTRVrt8+Cm67f4kcdKqvJvv05eudnh2v6J7eM1OeHaZiGRK
	It23v4DdD
X-Google-Smtp-Source: AGHT+IE8nNTgB6dy/XdcKIBtTqym2gMO2UZjpx330tqiOTBJS+T/NPOP1RDevUQcPBjWRVuzwCtREw==
X-Received: by 2002:a05:6808:f16:b0:3f6:ab0d:8dc0 with SMTP id 5614622812f47-4007372de8cmr135170b6e.24.1744143072623;
        Tue, 08 Apr 2025 13:11:12 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400699fd5ccsm574106b6e.33.2025.04.08.13.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 13:11:12 -0700 (PDT)
Message-ID: <2b322564-10c0-4bbd-89d9-bc9da405f831@riscstar.com>
Date: Tue, 8 Apr 2025 15:11:10 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] serial: 8250_of: add support for an optional bus
 clock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, benjamin.larsson@genexis.eu,
 bastien.curutchet@bootlin.com, u.kleine-koenig@baylibre.com, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250408175146.979557-1-elder@riscstar.com>
 <20250408175146.979557-3-elder@riscstar.com>
 <Z_V-aKBOFHt-0RKz@smile.fi.intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z_V-aKBOFHt-0RKz@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 2:52 PM, Andy Shevchenko wrote:
> On Tue, Apr 08, 2025 at 12:51:43PM -0500, Alex Elder wrote:
>> The SpacemiT UART requires a bus clock to be enabled, in addition to
>> it's "normal" core clock.  Look up the core clock by name, and if
>> that's found, look up the bus clock.  If named clocks are used, both
>> are required.
>>
>> Supplying a bus clock is optional.  If no bus clock is needed, the clocks
>> aren't named and we only look up the first clock.
> 
> Code and description are not aligned. And What you are described above make
> more sense to me than what's done below.

I want to do this the right way.

My explanation says:
- look up the core clock by name
     - if that is found, look up the bus clock
     - both clocks are required in this case (error otherwise)
- If the "core" clock is not found:
     - look up the first clock.

And my code does:
- look up the core clock by name (not found is OK)
     - if it is found, look up the bus clock by name
     - If that is not found or error, it's an error
- if the "core" clock is not found
     - look up the first clock

What is not aligned?


> Also can we simply not not touch this conditional at all, but just add
> a new one before? Like
> 
> 	/* Get clk rate through clk driver if present */
> 
> 	/* Try named clock first */
> 	if (!port->uartclk) {
> 		...
> 	}
> 
> 	/* Try unnamed core clock */
> // the below is just an existing code.

That's easy enough.  I think it might be a little more code
but I have no problem with that.

> 	if (!port->uartclk) {
> 		...
> 	}
> 
> ...
> 
>>   	/* Get clk rate through clk driver if present */
>>   	if (!port->uartclk) {
>> -		info->clk = devm_clk_get_enabled(dev, NULL);
>> +		info->clk = devm_clk_get_optional_enabled(dev, "core");
>>   		if (IS_ERR(info->clk)) {
>> -			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
>> +			ret = dev_err_probe(dev, PTR_ERR(info->clk),
>> +					    "failed to get core clock\n");
> 
> Can be still one line.
> 
>>   			goto err_pmruntime;
>>   		}
>>   
>> +		/* If we got the core clock, look for a bus clock */
>> +		if (info->clk) {
>> +			info->bus_clk = devm_clk_get_enabled(dev, "bus");
>> +			if (IS_ERR(info->bus_clk)) {
>> +				ret = dev_err_probe(dev, PTR_ERR(info->bus_clk),
>> +					    "failed to get bus clock\n");
> 
> Something with indentation happened here and below.
> 
>> +				goto err_pmruntime;
>> +			}
>> +		} else {
>> +			/* Fall back to getting the one unnamed clock */
>> +			info->clk = devm_clk_get_enabled(dev, NULL);
>> +			if (IS_ERR(info->clk)) {
>> +				ret = dev_err_probe(dev, PTR_ERR(info->clk),
>> +						"failed to get clock\n");
>> +				goto err_pmruntime;
>> +			}
>> +		}
>> +
>>   		port->uartclk = clk_get_rate(info->clk);
>>   	}
> 
>> +
> 
> Stray change.

Sorry, I didn't notice that.  Next time it won't be there.

Thanks for your (quick) review.

					-Alex


>>   	/* If current-speed was set, then try not to change it. */
>>   	if (of_property_read_u32(np, "current-speed", &spd) == 0)
>>   		port->custom_divisor = port->uartclk / (16 * spd);
> 

