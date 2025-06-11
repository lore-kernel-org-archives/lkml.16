Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECA198A08
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655322; cv=none; b=EfsYcpzziJFCs3kCCyyuKajNVzQJ2sQs7RMIoXJSCImgkokB0Jglob4HzaCYqXP8Dh6C0yGHwR6D3dPAi3mUAHkJ4TwOEcHHxaBPSrHb3JKkilgZchNUyOB1FA+sHA2i2moLmmNPFbyl7CCdj0DH0ubkyZzIKZNn66ZBGJB6JBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655322; c=relaxed/simple;
	bh=n3FIuLuKqif1KExLRabmovZHhue7y0ojxGEe3NwRxXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvTR6dNIScafSlORCLmfW/ov2X/ceFGBl20nltUUAokHP/HV8xqUiKpzIT/WH81eRV0TAT1aaotgqwcO8p7HyBXjwPILrJ6JyOzERvAcJ8BhTCSlzP7J3u30wE3780qZo50pCFGeefJkqSaRbOLOFR+F13/GLQzmfeJkpFti5cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jULf+8cM; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jULf+8cM"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2d4f8c42f49so562931fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749655319; x=1750260119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ni1bRS8N4SwYP8j3tmW1ofRjVUzlSftGXXllzoEq6s=;
        b=jULf+8cM6m/TbcfixaF0rhXbns9HlnuZDKCJTnNKdhMLUIgezCBMiH17zKcRf9A+WB
         Ouz08KGx0yM3rbZsey4DUTLHK6vvITO6a1S919NXAknpX1bb16fPMDEtdYoNg7UIbfQY
         BUkhoUfiUNKrkC6EkblFxu5ih9/uY5HbWLKy71S1V5VOtVS3TdokY0I7E2BlSQbBsuhN
         D1Zt7ghWqtnuwIHcmV2aF7jpL68TObu9GFQnRFJt9DdgFm3lVUCH70UT9F/kx9hgwb67
         j1ytpMePrxG5rq7TNLVp6l5RsjIWsrgELzEjRFh7SHA8P+yeJTkIrWO2bIISTl3dQGFb
         gc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655319; x=1750260119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ni1bRS8N4SwYP8j3tmW1ofRjVUzlSftGXXllzoEq6s=;
        b=i1czc/6QH+kUA9uvOCtBra+BSXHXwSwGBFaU+Kg9RDCGMKHSsekLiD8JIRdNOs+3zh
         6HOoOwGORMiHqAK2BCUhKllOwDy6yZHLcdCAx5YwD7SdunJ6JTkUFiecOXbsxMlaIMJa
         z4nlR4Y3L7wER5ddL0n94TBEv64R583dQfr4YsTkhmIbXIZk4nL+vaCEcOtGmY56h2Gt
         x7pwNc7tEwQjRYmBc3dHakQfZFmje+DPBiEX2MREQKTqBwq8zAG1aJkS2EC+L2c19M+y
         MEYGgTqfc0z2CQk3npWh+KAx0rmzfx/V5HIeWWRW+YcaKbUxtJbVCcpz2SQi5JBe/BqI
         ih0g==
X-Forwarded-Encrypted: i=1; AJvYcCWvFzWqDjj1vKqRFt+WlqJ4dJuF08pwizYidCuUauBaJh7Dpo1pg9ww3Hn5Qlxw5jQp3NuPZLCdsCctAzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK2yHrdpHnYpwehckDvI1P9DKowERtWXdq4NXvV2b3G7ODn/7m
	s7h6vyByzjPNaQx/zY657IkzXotDMGdtRWK4ZeI1jtTOCSmZWYUlke46zqif0GZBS6fPjUUQrgI
	kS7sR
X-Gm-Gg: ASbGncudDcCou3KLQ4QmUsUP4Di8hzIh/LA6JRlgkkD3a2y9UyYINCoTqrBbA7M/j2J
	wLxO1NkFMV3bCk6plYnjov08uceAIZod5Pp4RdNpEDj/3DovCayIq7fEcg9PjSeLrqe01oMHV89
	BAFRRVqKAZ/slpLE9BU7tl9XMCVYkYSMUijmHHM9RA75Y7M/01s++DKV/1FGiK9VCALt1KvfRlu
	AnN6qosl2D3kv01A+qst6AWX1yGSQGbr0AF2R1TqxRPBCmEsU8K4+H2x1AQ5WX+RaN5o88wdTtT
	scRD6VhrG6t8bzXTLs6+/o5ed9TGKv2n+ojLbvqZOW3kjtuk1nyu48cJ57CpgvtD44jDnUgOCXA
	N+Zmh5ZzHtZQ8c6NbiLAVI/ryRBb66qbHhQ84
X-Google-Smtp-Source: AGHT+IFMlCBuWrdSbRxuwu2djovc+7uWlkauXqh9E527VuU0BvMxRjpCUjzMoKCENhmWc+eyP/kJqA==
X-Received: by 2002:a05:6871:4688:b0:2c1:4d18:383a with SMTP id 586e51a60fabf-2ea96314d03mr1622210fac.3.1749655318938;
        Wed, 11 Jun 2025 08:21:58 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494? ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e5d0fsm2891474fac.24.2025.06.11.08.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:21:58 -0700 (PDT)
Message-ID: <851b7d08-3e77-4344-97d1-9d60f1fb8762@baylibre.com>
Date: Wed, 11 Jun 2025 10:21:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad7949: use spi_is_bpw_supported()
To: Andy Shevchenko <andy@kernel.org>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Da Xue <da@libre.computer>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611-iio-adc-ad7949-use-spi_is_bpw_supported-v1-1-c4e15bfd326e@baylibre.com>
 <aEmdhV0ATRuUeGaL@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aEmdhV0ATRuUeGaL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 10:15 AM, Andy Shevchenko wrote:
> On Wed, Jun 11, 2025 at 10:04:58AM -0500, David Lechner wrote:
>> Use spi_is_bpw_supported() instead of directly accessing spi->controller
>> ->bits_per_word_mask. bits_per_word_mask may be 0, which implies that
>> 8-bits-per-word is supported. spi_is_bpw_supported() takes this into
>> account while spi_ctrl_mask == SPI_BPW_MASK(8) does not.
> 
>> Closes: https://lore.kernel.org/linux-spi/c8b8a963-6cef-4c9b-bfef-dab2b7bd0b0f@sirena.org.uk/
> 
> Reported-by yourself. I'm wondering if the Closes adds a value in this case.
> Otherwise I can do the same to maybe 10% of my patches, for instance. But
> I don't think I put Closes tag on whatever improvement potential bug fix
> I do report (read: notice) myself.

I included it so that Da Xue will know that this has been resolved and
doesn't need to do anything more. Normally I would have not included
it though.

> 
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
> 
> Code wise LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 

