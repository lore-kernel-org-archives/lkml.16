Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2B25E44F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214605; cv=none; b=mfeUDQ45DDEv4Jl6AA9LZ44JrMmc9+9+l6DCfmXPxwEaWpE8lgEahRFl/BNXTFJ6pzyIgUP5eFXenaCQlx3m5Qkfvrm2LmpElsQ7Ow3jcEdgpBJGuW3OHtHi/4AGUaDD6CsEYYGgnTJSTr8foxDYp2o0LVIJ2WdliWl/GAwadx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214605; c=relaxed/simple;
	bh=CYo3UFbDzM8ZMZrElug1khaiQNjus0j78zyH9dROJUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYvFSRV96D1lSegZu6GET6nKwjQXsYhfmjV3sk996WoEfwTuZaJ2gnAo8EWORh9v5dpLaBC5xZvEasKEjGv/67D8AHsT7UL3XEkn6CIgGF7lI6vn9OBGWn/cvJsn81b+QT5KrfBJnJ4vMcG0ZX3OsRqZv/+c1S3+4TylbV86bVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iuum56RK; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iuum56RK"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2b89114494aso662339fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739214602; x=1739819402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vsAtouGNhuNZjNhxNxCI7WHMHLo2qB21REbxiQgCzo=;
        b=iuum56RK6V7l3nyAAZ/YZBbyPArS5UaCDXYrqlKcJULBMh80IxG9mD6QHvZSUnzLCc
         AYbCFf73DttoMvhiOxGp1zNPodJ/Rurop7+J0A7wGg1TqjDTl/nlTJ2vwelbdrBc4vk5
         UAIA6MxcBRQGm9nOkyOvL9elvIU7v9L6/z3DkBX3oSzA/KT8pil4WWeoVFRKvcr6BHbt
         mLSvnoqYFnxMHVHOBrMuK0XR4IQxS/ISvlkzk232MPYDYOLRrodfmTLDFpbaR1anai/J
         K/LX7OlTi2gbuEHgR+jbmJsRb8t6+GvTnP6Hftw563w2f6XUJLyvZ8A3WHvbMCYbxupW
         M1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214602; x=1739819402;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vsAtouGNhuNZjNhxNxCI7WHMHLo2qB21REbxiQgCzo=;
        b=a6R7kVDZlpEiMG12EaoXe5nceBzblqwa0LhRf/S3aKVR2QyNCuw/aFmoXR1093P1oe
         JcgGGCpMKRqMt7FturHqtkG5znDpTANbDNtnKc1RMz62C1efHu7wDOZIoolih4pIXheB
         ry6V6nQYUc4rD9o2KqLpn99I9sGa5A2zeFBBxmOKxghyB3rQeQeqFfhM1xwtanlrXPZZ
         j4HiSuoWj0FrW1IMnyGYe+u+pUSa9hBUuIAIzjlLIzCLkSadIQEgjIpzrdqD4BzMkX/y
         zzDE5VJiifXESvIdn2YEJG/uZDm1fkmqYr5DKqNiQh4bPqJADXOYagE2tTZxxv4htQRw
         G0fg==
X-Forwarded-Encrypted: i=1; AJvYcCV28NyubD9YXWIExJuP5W50J9z8hKpzBaw3VnJpi5SK4tq6VLArMum2YZkvDamFpDbx4Z8LofN837apCHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpwFd9qkoKdsuV57wgoE3qCVU2WGutdh8wc1sfMx1TI9nbamc
	iZr9skhoPYpomPE2ACTEmLh+KVZxJVq6eW7cfsyypaRSF9Mxs9oTF4+W5MaLYb8=
X-Gm-Gg: ASbGncuRtWGUFNPrTYFtYM5cr87E9Bx8BxG7nUOkNKy3OB6DWWGg0xW14gsUI74J3A0
	N08uRdbCdPpuEtB09/SCs3qkREboJdFc22rNIDQ3UA1rmVSf635E6EmUYSOhYR8xfi931Ek2bPi
	1ZqfbMeCWJorm1wQtSUTTx0+gx+eG/dIn/+aknOPacz+grlxKpatW0plo9FHy1TlABwlWQISwGD
	78+B0zvWdi0nGphyfh7UFoMPsQMd5v5U+I3+IA7i2fz9XGDXNBs8ZC+7EsTwZeKq09KhN1he9zP
	czWlmxJzt6Zvo5O0qshVWlSXWqDdFPDlgJy4yAmvhE6jGzY7szQN
X-Google-Smtp-Source: AGHT+IHER7vdDXVtlvelU+DDmdTY5CqQ89uA26Q9f+nFEBSkTZX9vzApNRcfKwxK+awhn+jiq0oREw==
X-Received: by 2002:a05:6870:b250:b0:295:eb96:9fd4 with SMTP id 586e51a60fabf-2b8b57813camr542383fac.11.1739214602443;
        Mon, 10 Feb 2025 11:10:02 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b8262be143sm2669307fac.48.2025.02.10.11.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:10:01 -0800 (PST)
Message-ID: <f989c3d7-0fc0-40f0-8548-4d5dd1a336ac@baylibre.com>
Date: Mon, 10 Feb 2025 13:09:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/17] iio: adc: ad7944: add support for SPI offload
To: Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250207-dlech-mainline-spi-engine-offload-2-v8-0-e48a489be48c@baylibre.com>
 <20250207-dlech-mainline-spi-engine-offload-2-v8-11-e48a489be48c@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250207-dlech-mainline-spi-engine-offload-2-v8-11-e48a489be48c@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 2:09 PM, David Lechner wrote:
> Add support for SPI offload to the ad7944 driver. This allows reading
> data at the max sample rate of 2.5 MSPS.
> 

...

> ---
>  drivers/iio/adc/Kconfig  |   1 +
>  drivers/iio/adc/ad7944.c | 291 ++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 276 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index a3e8ac569ce4c6b6b30b48acb265d530aa98e89c..995b9cacbaa964d26424346120c139858f93cdcd 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -360,6 +360,7 @@ config AD7923
>  config AD7944
>  	tristate "Analog Devices AD7944 and similar ADCs driver"
>  	depends on SPI
> +	select SPI_OFFLOAD
>  	select IIO_BUFFER

I missed adding

	select IIO_BUFFER_DMAENGINE

Closes: https://lore.kernel.org/oe-kbuild-all/202502082251.NuHT15R7-lkp@intel.com/

>  	select IIO_TRIGGERED_BUFFER
>  	help


