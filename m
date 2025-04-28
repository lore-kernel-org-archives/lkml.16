Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C31C5D4B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872434; cv=none; b=P+jhOW2mOWtrCt9nh8qe+0Ksz6vXm6CUvjIuG+VxBRe5z03ujXUKJ8nt4aDzdW+4Psrf9AeS07K5XFDunUKwR0UMH/ai6le/HGA4rNKDwk7dLCyfOfhw9e2s4Eov0DFlr1OXQkMqyk6EuU4YayOu/ps1V2S2iq65PhYblVMXGjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872434; c=relaxed/simple;
	bh=79oGkqwqtoEAg+LJ8PFwsRkiBa1NsJHHWe5PT8aLALc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTyVDPADBy7qR2TRCzd3rkED2DyPb10E42f0EX0/NiJkFF4mB9wUULpyT2fDZ9yEPpmnvDEBGjieK3fr6BtMIqyTgMEyhPO1ARQSpdkeniVddYBz83ct1Qj97hxGiLT40U/NvILQtvp4lF1BMmilc9zMrtFms8McpHf4KNcsev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aCFbJrme; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aCFbJrme"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c559b3eb0bso313616285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745872431; x=1746477231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79oGkqwqtoEAg+LJ8PFwsRkiBa1NsJHHWe5PT8aLALc=;
        b=aCFbJrmezUCmMNcZWmYIrcdg/p+lw3Aw5kAkIzPcLqClR0fxumM5hDsvZ08vcR39pw
         Wh9OHIFhOF/NdQ1DzU4X01N1/K26gahtzPCTSUQ53ZXIxN4jBdTlySwsQhILqptzL283
         5bHprCsFYwkOWlaxFxS6Oelhc/+4eA7550YASVLgpIdJU4jDLpMwv2XELhNu39AVrL5g
         wB8wP73UiJHc6CHdNYr6sSPiRT2o0jiTHMDpYA3ZR3tvlpb6z4clPem/MYaGk1bxSmRO
         iEq5qW3XlxcfdW1Xf4TK/TvtTOlavemQ3mpYgC6930J3km+ACgGdB2d1FP97fb+dEmjy
         Hxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872431; x=1746477231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79oGkqwqtoEAg+LJ8PFwsRkiBa1NsJHHWe5PT8aLALc=;
        b=b501RL2lbG8+6mz7sM0J0foV6yKppAfwefiqE6xZT2sK2x73qK5c7cXoyQpB9W14x6
         Pyqm0D50shlN4obGXVpWp9faz1NT7XjHmadfRYIAna+ckZW1PGqTA+6UwnKVZYY/TNnL
         h5BqleSZfZgZXLAsr9KwrjhdDP+U6hxQZ/i+q7uKUQdzSOssGHPHBhxkUqrc7aEeXKv2
         rAKZudeoliaGThkNgVCSl5rFrWsOhNAk67uuLkFhKx0/bW7kCLxmEuEELH5BZYbHS2S4
         JGBNWp6GBzGaKasFqxZntc8tJV4C5XRe/4oMsJrAY5UfsL45CPT7ns02GCT42PPyPWww
         5rUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAWE+phQ0dYNewX26RodEnwPXKnQ8GApToJ03O4Ez5uxsfGnbf7y+YqB/wt/VtEnwhFYNTuW7AM8fGmhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTZYjYJ7/XmfFISu89+cA5OVF3vnWA8V9jRJfdQpYBUUCwKpV
	IcLRGE+xuQSTIX8pX22k9g1gfUo+yfSujbDKGfNuvYS0sFsqyg5SEUGqetMsTpo=
X-Gm-Gg: ASbGncuLFn+/eI5SWDogWAFa683x9EG5I4v1/QGyxGTUyYxhdO7yM/MRDb9EVoYh5WU
	QuVP+6EOSazHicvLzzd9/ixA7+9iNwIaHlundzUPzLRCxS0Gg/u3rwEtLSupmk9/JsH5O2dBhMU
	hLD+5qRe7yX6LZZqQu+/yPuBQ0ZGh0Z+uWg+URGPjGA7/sM3ENyh8dKWZBoMuVIx22QN3ejOGuu
	DsZX7spRcyFs3jw2TVT4NTjwFn7UpJ9gxgns2bcmggPfEQJZdMSN4K88imyhVoIT/UTD/9bOpJz
	+GUX9R7Dyqn5tappG1OS40O/r6zQdhjrvcgtJIQVuRHCzcJqkrUSCwcQEADHbJd+X2CeI3yB3d5
	5C9QwYbKO3oD8RZxYke8=
X-Google-Smtp-Source: AGHT+IFlcN5nnqIp3+wIDhbfjG3UuYw4IWpcYOaPFaUvM68K3UVRPZ8o7MouMxjeweLiSpXKf08LaA==
X-Received: by 2002:a05:620a:2894:b0:7c5:4463:29aa with SMTP id af79cd13be357-7cabddaef62mr157852585a.40.1745872431252;
        Mon, 28 Apr 2025 13:33:51 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958d87309sm661055085a.80.2025.04.28.13.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:33:50 -0700 (PDT)
Message-ID: <5d76e5d1-1cdb-4921-bbb8-a611c831cfb8@baylibre.com>
Date: Mon, 28 Apr 2025 16:33:49 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] iio: adc: ad4695: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-3-6f7f6126f1cb@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-3-6f7f6126f1cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2025-04-28 16:23, David Lechner wrote:
> Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
> used with iio_push_to_buffers_with_ts(). This makes the code a bit
> easier to read and understand.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
