Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF87230997
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858984; cv=none; b=UVj8POkTBZvafNHyds4GnMXKZeVqUlMfMBOQhXhmbFndamkZuB8pnlnbceJMGZ8XcCGs8UZJFLVNh3F3uExcUScl0lPBIc/7NLrYH5lzRFn9QxcGYn71yE/gAx4dBZLocwMK4xYfJTRza0AxjWc/jqzHNSsB/GeEnG8RimoCltg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858984; c=relaxed/simple;
	bh=yQ/cMahOawtP4PxuyH9DWGJ4UyQFQnjW962HmXPyWh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ipxVLj1sRpIg9DFtQWQCO08RW1psoska3QO4ugIFhkGyt1qtn7xB+DNZHJ0kJcaG4OPqxYT/o1JAvAZU7b9QHDNpnobYVqt+soaQP/ldQavGOVEVsk80h567xA6XqxUTj1xAxPEMttqgY4FaLw/puLn1KOnrvJKgovzLIopMgFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qSAURHyB; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qSAURHyB"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2b832eabf39so192103fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738858981; x=1739463781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnC7VSfBG0ihPKxEu9pr9kDMCXHaSfGWdCeIs/YUaPw=;
        b=qSAURHyB0MucZBOyEyuVQmqRltfrCih2RlPxOwn+Ccknf2jFEAE58Ngyb0outSC9Xc
         gxYs5jitYNLO3Y62/z7/jEs2KgAEnlkm8yixp3TLREuWkvLO2xdeWxZ1WY2oOsHxzfsk
         9nqq5v60hQNzykMqZTpAVkY2SZnEJzw0uuWnz+UFxSYOCPW4KAm7sMoCgLkSSI9TVZFJ
         +CQMwBSNeEVeeF6H1/sYqsVkxaCzqR4s4fgiuK4jRY+3dA/VGgovuYOWSY+qnESOxFla
         +l+MdyA1YQGlYJDrWEUmb4IHqoR7irDNIYDNRXIcwXxIDBQ3cr1NwGakxMUgxrx7ae5e
         HzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738858981; x=1739463781;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnC7VSfBG0ihPKxEu9pr9kDMCXHaSfGWdCeIs/YUaPw=;
        b=OCfNFwXPLfR0hZOqlcmCQUMubVXK4SLobvT8041BUEJo34v5aj7TUZIPvMEEsSAOpM
         bOowGpD9iKp0/x7WnvmnZWskCVxKkDbZCLlWrqq/B405JSg8A5sw9Byh1vofu1pUvOu7
         MoIzrjZ3+8D2YTeKBuC40u2g0T8EMsNsSzHbg7RBtICRgb18YlzdxKa4133nbT5uvbGF
         eIdabxe8Kt7fuZDThiEZcK92tG+9lLv/OUXmex/LgMJ95M7OyL4OxbIsFU/ezb1cmQbd
         ST/k6XMlcwbNxNFFgkZyLGSZ4MieK1Wxht+OWU0bw6Gkmk1dNFxKZMhVQk7rDPxFlLHw
         F0rg==
X-Forwarded-Encrypted: i=1; AJvYcCXkHPAxm6X2AJ3YBVubOr/rAoV67Ml0D1In/lyfwaA3xjewewOaG6CMLKl6/JX4hx2VdziYpf/p5OHQVvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf8F0G7lGG7grqtAhnNq4GumiltINC1IFHfkp4oqqEK7M6/t/1
	LY/WltEZLVvIyj3OQMdz5Qyeg1zcdmFNlwC/1yraM+4gG+oazoaMkExhYRT2VEA=
X-Gm-Gg: ASbGncsd9ay+1jrZ6pamumBtb810v2YOJbNpYvAQekazGhZl5hHJnvZFiVRAS0PikuW
	McK2xnW4poGL3qE/Nt0F2/dBuqVqcKHGzh+FatLbc66m1Dr0UjG4+PjAnFva+uQL3tfxiBPOcCR
	ZgHMEdFPWIeVpJkqRFZ8/wdClh6J8B9brgUOGXhyHd3XKcA7sLyDJ4BThwuOsGaWoSz/kfqmg6Y
	lLsm/tYp171vMjQWALND9N/985EtSX8mshLCYRiN7nmWgmjdofwWc3/7Dx45b88+k2A9U3qfssR
	D4J3lmYKYEq6J/png4rNap3mErMNkrlV1RbJWHFJ4LR34rrROqwy
X-Google-Smtp-Source: AGHT+IGrVh/v5vcStALrqpNGUOb3jAVtv3FbIdsyoVlK6kALxIyavVWIb5C4oJiOS9AS6CkGcYPmgw==
X-Received: by 2002:a05:6870:7e07:b0:2a3:8331:717c with SMTP id 586e51a60fabf-2b804f44ca7mr5095585fac.10.1738858981173;
        Thu, 06 Feb 2025 08:23:01 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b8262622cesm348477fac.33.2025.02.06.08.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 08:23:00 -0800 (PST)
Message-ID: <b06f6457-4be3-4404-8c41-618bad0c7099@baylibre.com>
Date: Thu, 6 Feb 2025 10:22:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 8/8] iio: adc: ad4851: add ad485x driver
To: "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>,
 "jic23@kernel.org" <jic23@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
References: <20250127105726.6314-1-antoniu.miclaus@analog.com>
 <20250127105726.6314-9-antoniu.miclaus@analog.com>
 <c5722215-b720-49ab-9f0e-00b01eb4679d@baylibre.com>
 <CY4PR03MB3399B389972E92742EA3060D9BF62@CY4PR03MB3399.namprd03.prod.outlook.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CY4PR03MB3399B389972E92742EA3060D9BF62@CY4PR03MB3399.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/25 4:00 AM, Miclaus, Antoniu wrote:
>> On 1/27/25 4:57 AM, Antoniu Miclaus wrote:
>>> Add support for the AD485X a fully buffered, 8-channel simultaneous
>>> sampling, 16/20-bit, 1 MSPS data acquisition system (DAS) with
>>> differential, wide common-mode range inputs.
>>>
>>> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
>>> ---
>>
>> I think we have the important bits sorted now (i.e. userspace-facing stuff).
>> Just noticed a few minor things in the latest revision.
>>
>>
>>> +static int ad4851_setup(struct ad4851_state *st)
>>> +{
>>> +	unsigned int product_id;
>>> +	int ret;
>>> +
>>> +	if (st->pd_gpio) {
>>> +		/* To initiate a global reset, bring the PD pin high twice */
>>> +		gpiod_set_value(st->pd_gpio, 1);
>>> +		fsleep(1);
>>> +		gpiod_set_value(st->pd_gpio, 0);
>>> +		fsleep(1);
>>> +		gpiod_set_value(st->pd_gpio, 1);
>>> +		fsleep(1);
>>> +		gpiod_set_value(st->pd_gpio, 0);
>>> +		fsleep(1000);
>>> +	} else {
>>> +		ret = regmap_set_bits(st->regmap,
>> AD4851_REG_INTERFACE_CONFIG_A,
>>> +				      AD4851_SW_RESET);
>>> +		if (ret)
>>> +			return ret;
>>
>> Do we also need fsleep() after software reset?
> The datasheet doesn't mention any delay required after performing Software Reset.
> Should I add something just as a safety measure?

I guess it is probably OK if the datasheet doesn't say it needs a delay.
