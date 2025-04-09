Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C36B210F53
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744238855; cv=none; b=muFhRJj0E1vqnHw7rihIyC2173vU9OPkepMycMFlq0F96TGsCciCZoBd14wnEXjq8yDK3AlGSWiqa0PB76440/C1sWQZLkSD8QzebgulK33nfgz7AxjbaVgQcMmyJq5tA7CC2BfazmK2RBQ1OaIc3VLRkZ6BLKO0BEStoqwwlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744238855; c=relaxed/simple;
	bh=oNLYs8RldHGiV+Ttyc4FGdeq7MI4/Y2X5VhBOa6M9dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmyVtvGLZYhpAr/KmCXh5iL/hg5/9XfTC7zuhozSFkstmqXYB2eo0sigpzkL/yLPBYT8ijKod4o5GfgA9MJZVjEbFahHFrtkhZNrB9eWDPslLKJwQUEKlJRs8q3rhTDZ4T5XI7QjlCMQIQGiDi3Xs90cSCBg5U0KZOnTSKx1dbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lYh6Jot7; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lYh6Jot7"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso7494239f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744238851; x=1744843651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVcdr20nWkY3wqDgMeVyQ5I/xgJY//hgFMEqnYMOHQU=;
        b=lYh6Jot7xtAEYFEk/Nm3AxH6qmrDKvDY3NKQ0163dIBVDhTzyWQOMRsfrxZ4YXzm41
         vv6DlFupb33ssqLgOG3D6Sq1OvceFcnnUzLGOz2HYywQWQy6LzfAMticsQvPC3F31PrX
         cazy7KBywB73bNXza1vQr72mU11nCIneCAISxtkjs9SNySrIVOvpHxcm6brRqYonqLSG
         Qc2q9l8MYq4hht9hNiynrvCJi5E2JZtJDEgR4MBZMVU1aNagiUGdtVLiTVAe4tFwQhck
         fFPx8lLie4MbmEkXyTWybS9icCKJMK9TobjGUSlWutO1lu0ZZ6I0I3Xusy82bH1RJ/zx
         Eevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744238851; x=1744843651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVcdr20nWkY3wqDgMeVyQ5I/xgJY//hgFMEqnYMOHQU=;
        b=DQn56I3Fr1gbhP/rtSvxpmI0xsiLbF6y4uPKjWB8AaGbFyL9CVg2M2cJipa/1nnp68
         hz+vJ5ECkal1yK5uJYd3ZXfawcBq1/LVGxtgehwcRNTHyTol4iSiHbuqApyxBc/q9C0u
         UFjIIbN92xb9aWdjywUkQoa+DYRfGyy6ZC+28p40rwR28X7Sp/t5/kRvTYDeCrJAFkov
         iCAQSlBcUSWStPz0P2tExslN43TNQY/Q4uhIqukqURIWZrcfFi9LU8OMdyxUCt422G7r
         4ZMRZugC5uQj9qxJvsUvETC0rcSzWZfjJ8LoQU/SdmryAiTOXghZDiFBukv2HzONQCwP
         qFNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqUNr8ZsoGrCyubPbj6VPca/a6ag1cHkoxJJdfrqcC2YsrmPkD0WpVGayf0PtCaO7T8CevaXphrcWhwYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWplp0/NYkrZVDzSb961KvIpR6NezraY56hbY/EDCaRkw2Ty2
	k90MC0G9JTMPbRngd0co46Kl53GRQtSvyiuegwBcCf8wIqOi3RFR7NwdkGqrbCA=
X-Gm-Gg: ASbGncspWZBCQzPdKL0OWZDLILyKHGgxFHW61AonkFiZN5OizJ2xFrC+RHV8ztLvOcB
	MBMbhFxNLvBG1GpyoAP+pjhIo81Ab+QHH9aM7TAA7vC4Ap0z5TpgwxiySL1BDI/SDVen2l/BGwN
	kbzwNzq3opC5Pt821FoNhh5VOiupABYz1zbqXHyp9tkK4Ao4GGxgjFESCTou1Tcfz3w7AsSF+Tr
	u7qwP2AKGmYuS/yI0NVm5LBqmby8PZti1ifiFFlgunztWWlYLxIu8m1R25EK5mCfCHi9sZWOULr
	zWsJzLoyrrK2h5HPnCdbCMtVw8Q9d2vSZo5pSxsXvThX8dRoI2+QpEGgqlKf94NjxZSAwhNwg4V
	upozW
X-Google-Smtp-Source: AGHT+IG6GzcOAqS71lWGBgliY3BflDHFXTzjPUW02nvTUPuHcgKnnG0i35pjn6+lhawWiv/PEkLKdw==
X-Received: by 2002:a05:6602:481b:b0:85d:a173:323c with SMTP id ca18e2360f4ac-8616ed25521mr77175039f.8.1744238851471;
        Wed, 09 Apr 2025 15:47:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e7da54sm448971173.140.2025.04.09.15.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 15:47:31 -0700 (PDT)
Message-ID: <04facbe3-cd40-4d79-a204-2b91880da331@riscstar.com>
Date: Wed, 9 Apr 2025 17:47:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] serial: 8250_of: add support for an optional bus
 clock
To: Yixun Lan <dlan@gentoo.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, benjamin.larsson@genexis.eu,
 bastien.curutchet@bootlin.com, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, lkundrak@v3.sk, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250409192213.1130181-1-elder@riscstar.com>
 <20250409192213.1130181-3-elder@riscstar.com>
 <20250409214345-GYA19066@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250409214345-GYA19066@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 4:43 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 14:22 Wed 09 Apr     , Alex Elder wrote:
>> The SpacemiT UART requires a bus clock to be enabled, in addition to
>> it's "normal" core clock.  Look up the optional bus clock by name,
>> and if that's found, look up the core clock using the name "core".
>>
>> Supplying a bus clock is optional.  If no bus clock is needed, the
>> the first/only clock is used for the core clock.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: Update logic to more check for the optional bus clock first
>>
>>   drivers/tty/serial/8250/8250_of.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
>> index 11c860ea80f60..a90a5462aa72a 100644
>> --- a/drivers/tty/serial/8250/8250_of.c
>> +++ b/drivers/tty/serial/8250/8250_of.c
>> @@ -123,7 +123,16 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
>>   
>>   	/* Get clk rate through clk driver if present */
>>   	if (!port->uartclk) {
>> -		info->clk = devm_clk_get_enabled(dev, NULL);
>> +		struct clk *bus_clk;
> we also need to handle clk in suspend/resume procedure, so
> I think you need to put bus_clk inside struct of_serial_info..

OK, I didn't do anything for that in previous versions of the
series.

I think that means we'd call clk_disable_unprepare() on
the bus clock after doing so for the function clock.  And
clk_prepare_enable() on the bus clock before doing that for
the function clock in of_serial_resume().  That's easy.

Is there anything further you think is required?  There is
no clock rate associated with the bus clock that I know of,
so even if the function clock rate changes, the bus clock
can remain as-is.

> 
>> +
>> +		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> for the 'optional', we can interpret it's optional for other vendor
> UART, but a must required clk for SpacemiT's k1 UART controller
> 
> would it better to guard this inside a compatible test or even introduce
> a flag in compatible data?

I don't personally think so. We could, but the DT binding is going
out of its way to define when the bus clock is required.  This is
simpler, and generic.

					-Alex

> 	if (of_device_is_compatible(pdev->dev.of_node, "spacemit,k1-uart")) {
> 		bus_clk = devm_clk_get_enabled(dev, "bus");
> 		..
> 	}
> 
> }
>> +		if (IS_ERR(bus_clk)) {
>> +			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
>> +			goto err_pmruntime;
>> +		}
>> +
>> +		/* If the bus clock is required, core clock must be named */
>> +		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
>>   		if (IS_ERR(info->clk)) {
>>   			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
>>   			goto err_pmruntime;
>> -- 
>> 2.45.2
>>
> 

