Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A12222C0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744752158; cv=none; b=mGi9rMNHL1jcBrwY2P33FJmeegTOMSYVyIW2F1F94KP8ofabFnGWg4dBGoZh6YQOP+6/pWNzwOLEESQIkNqL01by42XrG4hRYNxUL9WNJuLoRAB+/DSTYIFpKym2CZ/GSGmeoXCHQw8lCDq4tlHeMrLlLaxyY7d0oBj0SzDNrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744752158; c=relaxed/simple;
	bh=sezKOxqdZwL0UPA9Nc1wZMu3XrcscN+StmeGN/bzCgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGXSsSeo0/1Nrf9KPeY4f5wN/V/AcHqi/jNVPu2+QF0BCE2oc3xa0R3V/bwsXN5d2FvbF3nvkmbRtVhfCI1FZo3oXBRqtpn43edHvmCPaS8wfpq8wR3Kj64y7ness0h5E/sHKJMZ5jLZBEV1tTbaXzgpJPncT9ggp1bP8rL8TTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3D93o1mW; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3D93o1mW"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2d071fcd89bso1753694fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744752155; x=1745356955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lZucg4YTWzLc3CaeiVcocOFzBfkAYF6dSNq9mdvqrs=;
        b=3D93o1mWLYHF2VT6GtJXPWSMViPK5hOF2xJWfJU9zvJmiFJQEtCYdP8thD9+b0JTtD
         POmPlgi7+1/ODmgPv7LcDvr7qpkHzYRcMuhBSnDyuPyHS5kiL/igXrq7T3zqmhSGDqsv
         dF0thHsW/dYoK1Ymnz6ldRPhfMrs+PVskqMD8WDNJ4gJWG4FaeOG1O+hyGxA9bvO0Z44
         nZXnyX/Un80+wJsuwlfiM/e97YzHuARshYZfN6eg5NBCwERghUokihMAVPz/KHxnh4sb
         hm206ARnaoPgIi5QZmZLMJXqHG4Mgusksx9BGyibQWQmmQaa0Dz3iAsjGDrLqdzL8NM/
         QK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744752155; x=1745356955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lZucg4YTWzLc3CaeiVcocOFzBfkAYF6dSNq9mdvqrs=;
        b=dMS2GSb3SrFT9aqsaw672Q7jwx3wiU4K8HO7jTx5fQvUSKEPJdY+SiJcGmJ2/SA/yf
         DNLaG/9HZhLb5sTwoic9/qvhqf63jrS0T89O1qXbLUW4lhdpSaYRX0vuUU9DxY0u/j5a
         JYHlwwrPOqgPxvbndKSBbLdmYDr/kyl8LYOBcahPgSazgdktI525K9B/U8HkO3zrsNYb
         o0243By6eqB/JxTBjh5AvyTaH35qEsM+wjFspLV+YObrmPGs9xhGgUrLeyK0Mni4IU3M
         4W+B5/tADSpGcSkCYt7HJTOu/nGuBpfP/9uyDt3Mgh3A7LIXNrHY6T5dZAKqE4yZD9VK
         jujw==
X-Forwarded-Encrypted: i=1; AJvYcCUX89YrwgTlgQCPBbl1E7QQvk4+6EQLyEgiXudiC4+KObXgL6SiPXuq2Jy73NN/EUM0rYkQIcDK8X5qxn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5AZuoT2mDiVTwcgCEeEr0N3Mq7pWocBdsdY9QLp1VF3YozAg
	NrzVc/2XXNvTkKw6Y/uEXoWWZymUlOfbxvDixXL3zQF1jDvEqBjVOH3eONKnifs=
X-Gm-Gg: ASbGncuS3d3w5bezuewuJUaoQ5je1K+NF1LN+BP8CDQARoJuRXd30D2OE4MZMJHElTu
	JnGpBqH3okjU6fnPWPjtywJLWDWGGnGUgU8A6Qn8AxCM/TTUHsnCWpR0e/sCEHK+IX7AmT+5KuL
	0xFZFtzOnMdNS0sB2kKv2rr3IjMYaXFAVhdh+yzVDfBBBmApfvzDq0iQkGstYkJrtdJnZ3Wm0tN
	Bqa7+9uGlQHYSaVDP56e1u0hBlvp0GQHsRhD422X+hWO0FCjMEUhQ6ojd75z2kqU8AgF1uLQBaP
	+1C93zzZMykPGc9kk0VQY1fKCZDZdfxemVRGctY6BOq+GULeg1Bk/KCE1gzdv4wwZhhDEic5IEf
	v/Vi7WsfV8mSL9Q/vsA==
X-Google-Smtp-Source: AGHT+IFDG8Sk/beG6HmPnDcmjdM56e4d71cRvdogswXByTIOWxtYfPY6H8ZVH3v0VrqRfJawQavcTQ==
X-Received: by 2002:a05:6870:ed86:b0:29e:3bea:7e67 with SMTP id 586e51a60fabf-2d4c3e2d482mr539150fac.38.1744752155259;
        Tue, 15 Apr 2025 14:22:35 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:87d2:86ee:7312:f611? ([2600:8803:e7e4:1d00:87d2:86ee:7312:f611])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e4d7e2sm2573855a34.45.2025.04.15.14.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 14:22:34 -0700 (PDT)
Message-ID: <22858e4f-db8e-4c97-8551-a1934a9f2fe7@baylibre.com>
Date: Tue, 15 Apr 2025 16:22:34 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad4000: Avoid potential double data word read
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, marcelo.schmitt1@gmail.com
References: <8f765cfd6e93fad4e755dd95d709b7bea2a388e2.1744718916.git.marcelo.schmitt@analog.com>
 <CAHp75VendQGLdpggySS3mX6M2YSeS70bvE8yg7sp_LNGDS-Scg@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAHp75VendQGLdpggySS3mX6M2YSeS70bvE8yg7sp_LNGDS-Scg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/15/25 1:02 PM, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 3:21 PM Marcelo Schmitt
> <marcelo.schmitt@analog.com> wrote:
>>
>> Currently, SPI-Engine offload module always sends 32-bit data elements to
>> DMA engine. Appropriately, when set for SPI offloading, the IIO driver uses
>> 32 storagebits for IIO ADC channel buffer elements. However, setting SPI
>> transfer length according to storagebits (32-bits in case of offload) can
>> lead to unnecessarily long transfers for ADCs that are 16-bit or less
>> precision. Adjust AD4000 single-shot read to run transfers of 2 bytes when
>> that is enough to get all ADC data bits.
> 
> ...
> 
>>         xfers[1].rx_buf = &st->scan.data;
>> -       xfers[1].len = BITS_TO_BYTES(chan->scan_type.storagebits);
>> +       xfers[1].len = chan->scan_type.realbits > 16 ? 4 : 2;
> 
> But wouldn't be logical to have
> 
>        xfers[1].len = BITS_TO_BYTES(chan->scan_type.realbits);
> 
> ?
> 

No, SPI expects 1, 2 or 4 bytes, never 3. If realbits is 18, we
need len = 4.

It would have to be:

	xfers[1].len = roundup_pow_of_two(BITS_TO_BYTES(chan->scan_type.realbits));

But that gets too long for 1 line, so I prefer what Marcelo wrote.

Maybe an idea for another day:

#define SPI_LEN_FOR_BITS(bits) roundup_pow_of_two(BITS_TO_BYTES(bits))

There are a couple of places in spi/ that could use this and several
iio drivers.
