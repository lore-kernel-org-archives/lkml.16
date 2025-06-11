Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34FE7080E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749661233; cv=none; b=D+IUWGvnoDbVSThqBt+Owh/+xLgcLBKGSsSUx4gGUFLvygwlpzavrvJwH6JPLp12MM2uxe5JSbn9BmbKgwPMwDwyYcW8EUIOGv4xjDXfGs/AXzRT1srOAa1uMnuNzmyKgMwfhIMPZuQiDSfxqWnr+MUxemPTzLJiu02Dsn+oiZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749661233; c=relaxed/simple;
	bh=FIrW8Y9sBuIf71cPV8Xo60w7A800qP+75c2RlajoR3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrUXVqFRK5yKp2TUSHzCoNZaC/V8CUjOhm9Smvgg0g6n0YVUWUgW+SkovTdIPHwoNQj4ltfrHs/OjnHfs0Z2A1cqipTzGTpM2BX/n5HEhPKBXU37DdzSEai9s70zaMzwatPhq4K49Fa8l//7oLQiB1QoWAxIZJFh32/3Rbo17bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GANdezrQ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GANdezrQ"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73884ccffcbso61183a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749661230; x=1750266030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmahb5YSlfnS2uNFzhr+DnBe9o6m7o1G+AoiCjsOwJ4=;
        b=GANdezrQ+uRgmpcxWy36o5Lpug1bOD2Im72Y/JVrj67lFeJLztdZnz6hYyG6ame2F1
         imEvnriciGwbffyGgOYeCTA3FY1ngO2yop/odMmU5NbuJ1GUlv9FC2an4nf7TQzbTOrb
         S37kiF40BaGRGKul7Iu/JSo5srRL3mBZwPRHlu2uHovehE/nuN0l/rf0jWRObqXe82LC
         L6I/kSdZPkl+U0h4eaWqH9RBawMiibm2CJXrStD46/xi1IV2v8Fynef8ZeF+xSTMZdLm
         3ALTM5Vynx92RLFTcI83+jS6oYNK1Xd/OqdNZd4wahUlJbockueYUPHGT6/u2K/TZn+M
         /FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749661230; x=1750266030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmahb5YSlfnS2uNFzhr+DnBe9o6m7o1G+AoiCjsOwJ4=;
        b=pLA9gUIlK+jQopJRVL8lQyv97oI3ZNRJPIvfnOK/46qNKO5AkplrQuxFTZzbR3j7F8
         WVunSFOWKwxL6AGhGgN1COuN/5MawoiNr61wdj13fSeKRsZ4zExMqOuDJQbBMzQsPs26
         UeuZMCwlM6Fd1+5FUefZS/4ZqHKM/WqQ3brF0n+eopwix7uWlUpB6O3iYk2jx3UjdT1l
         9fyRSalEd17CObVd2v2sKtWbt4CZCaQ7kno5n598z2uibYUmakxPj7cuZ2edOhUaN5C4
         phAq2XGPU1m9hpcm/3JjDTFiK8U42Hc43T7jkthhUHMt73z/OmXJf2FOxxrVGCLJQjH6
         3HLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZnWNyfrsVSA7gdgzk8WyL0BxQ8ds9yzE7wUleXvBM3jN+elgVmWYbPJxD1x414QorYmSAHATzUyK39Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsrONimv+SNruTbh0qmR6qnQ1I2X0W+d8LvRoa/yEw8ykFfoZ
	HqyTItaE73U8jSkHer0mCb1zfmIQc2PD4kK+ICQy92TiiicAQ3gX07jCHZU5toFAM3M=
X-Gm-Gg: ASbGncsA8mUK2HW97AEARtK1jmsKBGU0PsEOjSD3JUQcCoR7uLArkga2Bff0/LckKKI
	dE52AFlmGNhq5pst6kASpIsDkq2zwst4BNvd5eGG/wvQAmpfywVy6k+Gw9Ku2K4X7fVePAZ54Ud
	+Ikn4bqHjVBpmK1n1zi9J5K0uFI/BFA5l5/vVOAjI6R1T8MAKjWf8SIzi6vAEX1QGrlSumtHtqR
	qFgI8wLwvoUjieToQJZsN0JujHPtBy43oo+lfSYhY/t8ZflOEBTTFIy1C1i6AK4MyDDNDS7ikge
	Y6D3TBcwbg3xzzzqNEcr84nSaYtusq8SwFjo9QV5IvpQxZG4s2IAah4kE0xmE/aS2bmVq1n030/
	xvLBeykjXTl97yqEQ08p3x+wlpxPrcH92L68PAJ8=
X-Google-Smtp-Source: AGHT+IGwCp4LOdjH942XeZsameCeS93elYjYdo1RMQX2WjgMj9zWKiPjyxooL+cU42xJ7qISBBZdKw==
X-Received: by 2002:a05:6830:3789:b0:735:ae39:952e with SMTP id 46e09a7af769-73a05c99d64mr3167512a34.26.1749661229839;
        Wed, 11 Jun 2025 10:00:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a06fe0b6dsm371402a34.24.2025.06.11.10.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 10:00:29 -0700 (PDT)
Message-ID: <1bbee6de-adac-4f28-9a96-fd6480691ac4@baylibre.com>
Date: Wed, 11 Jun 2025 12:00:27 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad7949: use spi_is_bpw_supported()
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Da Xue <da@libre.computer>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-iio-adc-ad7949-use-spi_is_bpw_supported-v1-1-c4e15bfd326e@baylibre.com>
 <aEmdhV0ATRuUeGaL@smile.fi.intel.com>
 <851b7d08-3e77-4344-97d1-9d60f1fb8762@baylibre.com>
 <20250611175506.01d11675@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611175506.01d11675@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 11:55 AM, Jonathan Cameron wrote:
> On Wed, 11 Jun 2025 10:21:56 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 6/11/25 10:15 AM, Andy Shevchenko wrote:
>>> On Wed, Jun 11, 2025 at 10:04:58AM -0500, David Lechner wrote:  
>>>> Use spi_is_bpw_supported() instead of directly accessing spi->controller  
>>>> ->bits_per_word_mask. bits_per_word_mask may be 0, which implies that  
>>>> 8-bits-per-word is supported. spi_is_bpw_supported() takes this into
>>>> account while spi_ctrl_mask == SPI_BPW_MASK(8) does not.  
>>>   
>>>> Closes: https://lore.kernel.org/linux-spi/c8b8a963-6cef-4c9b-bfef-dab2b7bd0b0f@sirena.org.uk/  
>>>
>>> Reported-by yourself. I'm wondering if the Closes adds a value in this case.
>>> Otherwise I can do the same to maybe 10% of my patches, for instance. But
>>> I don't think I put Closes tag on whatever improvement potential bug fix
>>> I do report (read: notice) myself.  
>>
>> I included it so that Da Xue will know that this has been resolved and
>> doesn't need to do anything more. Normally I would have not included
>> it though.
> 
> If I followed the discussion correctly does this need a fixes tag?

I supposed it doesn't hurt. It could be possible that someone tries to
use an older stable kernel with a SPI controller that didn't set the
flags, in which case there could be a problem.

Fixes: 0b2a740b424e ("iio: adc: ad7949: enable use with non 14/16-bit controllers")

> 
>>
>>>   
>>>> Signed-off-by: David Lechner <dlechner@baylibre.com>  
>>>
>>> Code wise LGTM,
>>> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>>>   
>>
> 

