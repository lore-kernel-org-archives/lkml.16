Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6AC1482F2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745086051; cv=none; b=Xb2Z/pnlvfYW7IpIi1Qy8gs6UtIgZPfY7Lw3/ZOxqVoaCMWpL/+hdFyd8h/26L/3bWNQ8rkTh8kUBwss9J1Lkoycs+1dj84UY8oBAhgEIcz7I73Ec4gR/8VhFBDwm97vkwPTijCalGw3mouiW4QZ1cU269MzkNRyRD6M7Kpavuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745086051; c=relaxed/simple;
	bh=mP5+rKQ//YiqEGI4ZVevEA6QIHwTTRq4AkSxn4CvI/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7jU2J/xgYPF/0HfSYjJ9BkKrE79bJSQYmq65q5X6WTWDfpaeRuVz1iOxut0IkPuXaeAOnE6Pfy0L5dpRFlUzRwWrptg9hUhwIHRE5VPqEvQA1qYwzLrUePjTnJZN131id/XvC+bjQv0vwPy3p47tA6NUMfl8r/LfWbYzBiptVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZgcrQhGi; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZgcrQhGi"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2d54b936ad9so420285fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 11:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745086048; x=1745690848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOy/RgKZeiDJr92IQwJqEIiI04eWEFdwqapntf9V/54=;
        b=ZgcrQhGi9wen0Tn8Tu7dzpwWrkYnG6Q1khmpz0RQOS35pFwhOdMwhEVfENTrCCSbpb
         1kYYH1dXV90odOhGMJSdNT1aqzOUYlKvqo29Nq9uhkrC4Ppw5uVLfPR/ZcxsD/Bg9JVV
         1IVa3DIJCXLcmoVjqOszdLh2Md+cAftu7n5XKXayhJHcABtpoYbLDNLVCiIUUVGh3+4I
         07Oqhrf1/maITrSkdNfH/CtWSe+atphykpPgx53jf1SvoNh6VeX1uLR5g9vYDfAoR51C
         P0cFYGP1G+jn6xkCjXbqHrIqhoxdQzZQW5VU2LPNeRuFrqHv9uiz/HRW6CEUwG8S+jss
         Zikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745086048; x=1745690848;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOy/RgKZeiDJr92IQwJqEIiI04eWEFdwqapntf9V/54=;
        b=pI953mbuhLZU5RGyMp5avej9FQ2b5rOn92FQKRn8/ZMpVmcwpV/jgHMrsxRT++FbmR
         oefbhz36Ljh4EwM1LMZOCzYE8DPwUPZrQ4RqDb5P/P2btmU5IvdqD4i0m/qV3pDtu3xP
         rxvpE0GyDgpJ8fgUq2b2LZkL6W1ViSMTPmUwc9XcHeK9N0USIvAJrAB8rLssfYIp3KLI
         CMPVMPaij8TvPJ3XPIxrEGlVypQE609xMjEv2fsDdMsOZb93EI1OdcTtoyS1mvyo+lXC
         HQ5mdnYnnDGg19V7w4M5JFYg9RLf2rBviEVjinC6pceBU2hoA67Bmye3vBPgMCbQ72Y0
         5umw==
X-Forwarded-Encrypted: i=1; AJvYcCV6/Vl5brBvT0YPeof1mQQzbxPF4bGb51DGpNSpnDy48BicDJQlIjKkSCWjwJP9EWJOhylBxTFafHhnbXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZaxEGeRw+LX2byFQ+z1lx04bLxLPmvP8FMEaz+/7C1jTIlNX
	/nYDILwxffrfmqNo3qRm+yGUvT8MPXEMkg/rp1h4JIqbIZZ7+UIxWwJK1Vtn43A=
X-Gm-Gg: ASbGncsjSN53lcd89NoE86VIbg+TE7m9y38rGuFr/rSExS5fFO9ADgEhOsyqWqrokmf
	FUv4Av+IL/GICJIk7KRj8o+btDl1to34NZXeAQ77WJG1hG4y4M6gN/gsytrFLkxG0s9hz7jaN+q
	jTbrFCgU/ql8idBl3m5EzGEAbn1pZt5TqBnUMBTdtsFicg5kOWlEj9hehI8i9JLtKVt1HOJ6waW
	sSeh3KNARwwvM4YXcNPMG8mGxE+C57Vj5a/OD2QOnwE25w6+jPCvHvAB5cA63IKiOAseGKklTiP
	S3/RGtQ5T5+iktZXqV5rx0syC6T07S5eIMn+SFCdwK6RQ4D2tDnkzOIoihaP/lrySw8Jrd1rC1C
	VVuqmKISEbcK8
X-Google-Smtp-Source: AGHT+IHYpbS/V3qjLpxNNZPZ2TVAz88J/SkYj+47cWck9twaFcMzBjcrKwck6VsnVU/ew4dc1f/dnA==
X-Received: by 2002:a05:6871:bd07:b0:2d5:750f:2f52 with SMTP id 586e51a60fabf-2d5750fce4dmr244370fac.7.1745086048086;
        Sat, 19 Apr 2025 11:07:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:79a:b8ae:edee:ec5? ([2600:8803:e7e4:1d00:79a:b8ae:edee:ec5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5212c95ebsm1040778fac.5.2025.04.19.11.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 11:07:26 -0700 (PDT)
Message-ID: <9cdc7053-ae22-4ad5-801c-46df7398ebf9@baylibre.com>
Date: Sat, 19 Apr 2025 13:07:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: amplifiers: ada4250: use DMA-safe memory for
 regmap_bulk_read()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v1-1-7e7bd6dad423@baylibre.com>
 <CAHp75Vdxdbqu6qkbuo5y4jADOH_h9Re6m8icSj3Je4hnVsha0g@mail.gmail.com>
 <ed5c4b46-0b3f-4278-ba8e-6f6977f18429@baylibre.com>
 <aAO7Lw13xrEGmZLL@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAO7Lw13xrEGmZLL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/19/25 10:03 AM, Andy Shevchenko wrote:
> On Fri, Apr 18, 2025 at 02:09:04PM -0500, David Lechner wrote:
>> On 4/18/25 1:58 PM, Andy Shevchenko wrote:
>>> пʼятниця, 18 квітня 2025 р. David Lechner <dlechner@baylibre.com <mailto:dlechner@baylibre.com>> пише:
>>>
>>>     Use DMA-safe memory instead of stack-allocated memory for the call to
>>>     regmap_bulk_read() in the ada4250_init() function as this could be used
>>>     directly by a SPI controller.
>>>
>>> Sorry, but can you elaborate more on this? If driver doesn’t override the
>>> callbacks the regmap SPI uses spi_write_then_read() which is supposed to be
>>> dma safe. 
>>
>> Ah, I didn't dig that far down. Will send a new patch that just cleans up the
>> unnecessary alignment and unaligned call.
> 
> But do you have a real life issue with that? Coincidentally we discussed
> similar case in another driver with colleague of mine, and he insists that it
> might be still broken (somewhere).
> 

Some drivers that use regmap with SPI implement their own read and write
callbacks if the default one doesn't work, so maybe something like that?
