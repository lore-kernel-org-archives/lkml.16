Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304621B0405
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909664; cv=none; b=RI84fdoY1XMzTgoSw+jqwqt+/E5NUs+6mXcT0FVhmQo8RpGrsPXYZV2B0swPWjHG9f4F7EDVW2ZmRVonKG4N+b3F4nOJ7eA9FtQNs8E48/qj0zPA2Ddl/69SrFPfqszg3sy6ZIClWuoqOeJSSRl7Xr9FtXwnJdOcRwStUd4w+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909664; c=relaxed/simple;
	bh=QTblW1Gq1v1BLqv3bQj+TbvXE9AnXYXO/4GsN9Rn0IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MEBvMbjawH++LEiPwFdNnpbOlvSB5ADpj06by2gktdq2lKXHbFhbrzJgQ7h33lqkGK2fRjoNm9wr1by2q2C73P8UFxFfvDqBIyDif+dZIRC5iwm9CrUkaiS62qCNHT9BMLLFR4n72ZmI/0bXCAVbLDQ+4dSaASRmneGhIxFwWbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gj2Y7Uk3; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gj2Y7Uk3"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-605ff8aa9d2so24560eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744909661; x=1745514461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=;
        b=gj2Y7Uk3x7EwWduQIwOzFt/vbkv10ZETT3diWxK7T+pg6s0cH1SuAi8Kp7ogVNv7yc
         BsRTTarBzuZTV/LptAzJFdiijtjFXpSCDzqcNo1GhAv4KxXpOefZ/f5y6Tu77eOvA/D8
         qrKxGHLHi1ASoy1QgFfO85dxNy0BlhF7UftWrI4SwNF1LealvCd/BY5Urzj5GiImhOtS
         v6/16RF0/auEVRUgQzpiff5I1Wux1o3kZcZbK1cASxkQXsuQSb5l7iBdVSfGQsERKaui
         0QOegz2jgzA/cdplbOewf2kG7dN5X/iweAZNmRPXnomR74HLBr3AZvTxc61OVBDE1BAr
         yXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744909661; x=1745514461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=;
        b=RxJc41tHxyhPp1zccHLU74ab1Yw0TGs0h8Dr/HN0JcSrJJkfZM5W0lEmLL3iyVTRjp
         34zTV4UZsCpUtlXBsfSInuzKG5nALcxMtokUHT8wcgYtQAzgzOCZY1fbaP/6wzeNHz2p
         ln9KcT2T2QK32JO5Y9QEltmmDugXPbV5eK5G63T5rn5sDXiwieZD4mjBZhyIy02GfG7L
         wGYSsNyiJ6JjnuoIwM5sCiqJHyeiX5OgbR+UTMy/TuS1yYrfiV2T29hv/GdUGyY+HF1F
         uYW1mbknBUvxqEyclMKCsknaH6wpGgkGouSrl3FKFnLI3K5DGIwhg08CnRbDfwJlmklN
         qeHg==
X-Forwarded-Encrypted: i=1; AJvYcCXEj0hX5XhGPP4c/j/88bNYLOHuRqGuaqjsZJIVNN4cEgBLz0Ew5PwOUOktEN040gAsuyNZwoBM4Z8M6m8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw53342LrY1xivJn8/obMiyRKOR05DL2TW6Qz8WiDRAvw348afD
	NGZ+EXuj/B1Av4sdLxD+5cEzIIMTmNyl9JiUAsxBypw0Y6Y157Hc8ejmMakBWiE=
X-Gm-Gg: ASbGnct0c1KtgmOmVpAOPTgfQdWRO/ah5MOhm99ln147oby3LB2Suhjk4TFqI3/+Pfb
	ViNRVjzD6knFLccmzP79vJtEm5qdRpv1oVufFOHQfiHtbcX56aAsGDV0dXtQURmvDHTHCVY4DM0
	T5Ng5MRwEiHxnJOG4zYxBXwFJEpo3ADCShjF9SjUnsm08TQxhgqb4cek+adxzAAdaOOLlbLEO7T
	8j5hhzGvrpKypKt+TRx7J58MyRIuYL2REHEJHIbR0WYbRq87WLI/RMrMTTKVvloUw/rEANOa+42
	BZj6uLQOidtHiKD5CBh9EbWXD38wpUtJoGaNnnY7NsGIGaTO4R/W7fwTxvc4C9JfJHLFDbBwKs4
	AtpMiY/sjPRQwsHValQ==
X-Google-Smtp-Source: AGHT+IHbLABiWinLwjfZ0DTmEnAkfAixBYu8A7EcycIAgYoLkSVTlOq/Pw+F15KcRSPJ7k1qWk67rg==
X-Received: by 2002:a05:6820:180c:b0:603:fada:ac47 with SMTP id 006d021491bc7-604a91e814cmr3847196eaf.1.1744909661228;
        Thu, 17 Apr 2025 10:07:41 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff5d8c40sm33099eaf.3.2025.04.17.10.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:07:39 -0700 (PDT)
Message-ID: <f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
Date: Thu, 17 Apr 2025 12:07:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
 <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 11:59 AM, Andy Shevchenko wrote:
> On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:
>> Align the buffers used with iio_push_to_buffers_with_timestamp() to
>> ensure the s64 timestamp is aligned to 8 bytes.
>>
>>  drivers/iio/accel/bmc150-accel.h | 2 +-
>>  drivers/iio/imu/adis16550.c      | 2 +-
> 
> Looks like a stray squash of the two independent commits.

Oops, sure enough.

> 
> ...
> 
>>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
>>  	struct mutex mutex;
>>  	u8 fifo_mode, watermark;
>> -	s16 buffer[8];
>> +	s16 buffer[8] __aligned(8);
> 
> As for the code, would it be possible to convert to actually use a sturcture
> rather than an array?

I do personally prefer the struct pattern, but there are very many other drivers
using this buffer pattern that I was not tempted to try to start converting them.

> 
> ...
> 
>>  	struct iio_poll_func *pf = p;
>> -	__be32 data[ADIS16550_MAX_SCAN_DATA];
>> +	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
>>  	struct iio_dev *indio_dev = pf->indio_dev;
>>  	struct adis16550 *st = iio_priv(indio_dev);
> 
> Ditto.
> 

