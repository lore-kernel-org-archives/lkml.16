Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C2215193
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123655; cv=none; b=EB0/hf+Ny9pziRcM7EWRAy0NzrXr1r1u+o45S//wIdhWakNXXtAgY29oyrNgqcs6U28dcWCH35Ea67aJuSFvqpRkIcRJHiRFmlvNwA2Ni+s8+UZrLJNd0gdZtykh6cohtaRCv2I1VRb6H+q25ubqz0lgUYdhEOu8k7V/l6rHRTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123655; c=relaxed/simple;
	bh=ee/zaevnqUwSkoSunNrHFLnAVIAFt7231LYdnizFQ7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJtdeAWtWlFDWacVG+RXR/pYl5n4jtwMFFFuDRYILbUxnoADBbssTVxO+XjTC8ynpG2L6UlZ8SBKxc8vxQjd1xxIyNbkSK1z4ApOAcIj9uyq18lNTu3j4Vy4ZdzID5vJ4O8DSHZcb3aEc1lZZxw4WjA5rqoI/pEMADQhTlEcaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C8tLBCjX; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C8tLBCjX"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fe83c8cbdbso395382b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746123652; x=1746728452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYGJo3Dn7n60bY4TCOgRqk3w0LgzaCpNfAMFO24z3ig=;
        b=C8tLBCjXDJZvIXp1KMIA0mVT/oDU+czsQmMyfGRJxGrfnriQPAcWuJtegeZqAE8EP3
         LrlRjv08z7sYQwGPiELY4hJV9UqvIud21WxKsgegu2rIEw+hUAMEzUcTcKB9/FFuiyj/
         DA8OCWDV6CSd78uaPIwrywVfBBUDMNpUg96sjZOZg7cm2aApoMzDYsiyUfI4IauJ7B4b
         NrjpQirekXtlaB+vgjzHxO6kM+p2Woo2Orpu/AQhsjULHthMubZFzR/vz//yOZ3oXVnt
         v+upuHjoALAAxCfmX4Edk1C0dU3YapunEu31raEv+76oSogpvxa0f76FE5xDe2GBgwip
         1o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123652; x=1746728452;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYGJo3Dn7n60bY4TCOgRqk3w0LgzaCpNfAMFO24z3ig=;
        b=aCpRLOjVwKkGu1mDOWxZIayQ0Vi549DnlAkJFmFF45md1y3kNxniMhFkAbXGv3u61A
         dsH7jjszYR4brvhfZmQePB+L11IsIjF8TOAKJyy/GrUnHhJJIi84DeNX+SypJuGVvPZG
         b+tJje1qtRvrI4pcr6aO0+xxiWuFscU1cJ8TeetqsLPtyt9n2oTVGbIo9I51RfMsjfmH
         ZxdNr/06GJByMIJDlxFChXIAETcK2vg0NVnZJlfXybyWsh1szKiM4iMTBvNx/QxBJ5Uu
         1A+FqYXOFfrNRJNoOX1RmNmYFfkNfaYiCkoEZDkLaTTs0Wqlbq+2daO0leBJmPhLzG45
         d3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa0J0w0O9GWtVJ8RFQQmFA1Eu1qFEdblqcZCwqrvZm0MnNwIvswlCFnzBZyZp06rtmQzojRuDm7/CKUOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUOPtRG9aIdo4GY96X8pl6sQ+SHLp2QQRi8w5sWk8HLHizM3Yo
	UyyjYsA9TP75rfPBBazWVCCE/CuK9N+lUwke+y96C5iPDemuQyp8LP8xcb71gNA=
X-Gm-Gg: ASbGncsIFnZDZ8Hxc1q9Y7e3opczR9/MHY0Xoe/F3qnnGVGKqDeYVkEVgshp7Qgd0kZ
	gPtrWtrIhFaxu2BHhvxVL6zXGp0YsNgsamYfwX6GTs1aptyQx8LgH/+w6zPPJc6tbrxCk62PylC
	lV4PMl4hISsGzP1Cq1ld8t+aoO//0hi2b/nwTkMw7VmsCkon09VUG08cWCOew/E+EnQa7+G0E1Z
	+UkUXDkass2whms2hXAhOZlS672SEf67r4Iiq2ltjUf+ed7aT13daoTRNKNxFeQ3Ooize79K2xV
	HV4dji5asi7HZZfGiRzxhx39wgAg4hR91rHETf5KKgPgjzGU1jOZ0FFVE98DBjTWTJs4wMgfHnA
	AYan3oxS2LnbaTuqYcw==
X-Google-Smtp-Source: AGHT+IH95yusdxRir/cXJT3ckHlcNRsZkDgwRAlLqFb4K6kB/7aHv+SLzJSxmOI7WMpz+iOmfZknvg==
X-Received: by 2002:a05:6808:1b8a:b0:403:323d:3038 with SMTP id 5614622812f47-4034147925bmr147308b6e.28.1746123652592;
        Thu, 01 May 2025 11:20:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0? ([2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dc83d9csm207984b6e.48.2025.05.01.11.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 11:20:52 -0700 (PDT)
Message-ID: <46659705-0384-4497-9f5d-cae4a8290093@baylibre.com>
Date: Thu, 1 May 2025 13:20:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] iio: adc: Add initial support for TI ADS1262
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 olivier.moysan@foss.st.com, gstols@baylibre.com, tgamblin@baylibre.com,
 alisadariana@gmail.com, eblanc@baylibre.com, antoniu.miclaus@analog.com,
 andriy.shevchenko@linux.intel.com, stefan.popa@analog.com,
 ramona.gradinariu@analog.com, herve.codina@bootlin.com,
 tobias.sperling@softing.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250501100043.325423-1-sayyad.abid16@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250501100043.325423-1-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/1/25 5:00 AM, Sayyad Abid wrote:
> The ADS1262 is a 32-bit, high-resolution delta-sigma ADC communicating
> over SPI. It's designed for precision measurements.
> 
> This initial driver provides the basic functionality needed to:
>  - Probe and register the device via SPI.
>  - Expose standard IIO channels for reading raw voltage samples.
> 
> Basic testing was performed on a Raspberry Pi Zero 2W using the hardware
> SPI0 interface. The connections used were:
> 
> +-----------------+            +-----------------+
> | RPi Zero 2W     |            | TI ADS1262      |
> | (SPI0 Pins)     |            |                 |
> |-----------------|            |-----------------|
> | MOSI            |----------->| DIN             |
> | MISO            |<-----------| DOUT/DRDY       |
> | SCLK            |----------->| SCLK            |
> | CE0             |----------->| /CS             |
> | 5V              |----------->| DVDD, AVDD      |
> | GND             |----------->| DGND, AGND      |
> +-----------------+            +-----------------+
> 
> I would greatly appreciate any feedback on the driver structure,
> IIO integration, SPI communication handling, or any potential issues
> or areas for improvement you might spot.
> 
> This series is broken down as follows:
>  Patch 1: Adds the core driver code (ti-ads1262.c).
>  Patch 2: Adds the Kconfig option.
>  Patch 3: Adds the Makefile entry for compilation.
>  Patch 4: Adds the MAINTAINERS entry.
> 
> Thanks for your time and consideration.
> 
> Sayyad Abid (5):
>   iio: adc: ti-ads1262.c: add initial driver for TI ADS1262 ADC
>   iio: adc: Kconfig: add Kconfig entry for TI ADS1262 driver
>   iio: adc: Makefile: add compile support for TI ADS1262 driver
>   MAINTAINERS: add entry for TI ADS1262 ADC driver
>   dt-bindings: iio: adc: add bindings for TI ADS1262
> 
>  .../bindings/iio/adc/ti,ads1262.yaml          | 189 ++++++++
>  MAINTAINERS                                   |   7 +
>  drivers/iio/adc/Kconfig                       |  12 +
>  drivers/iio/adc/Makefile                      |   1 +
>  drivers/iio/adc/ti-ads1262.c                  | 438 ++++++++++++++++++
>  5 files changed, 647 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
>  create mode 100644 drivers/iio/adc/ti-ads1262.c
> 
> --
> 2.39.5
> 

It looks like you managed to CC everyone who ever touched the IIO ADC makefile.
On v2, you don't need to include quite so many. :-) Just the people listed in
MAINTAINERS.

And you can drop the RFC on v2, there doesn't seem to be anything unusual that
needs more than regular review. v1 didn't really need the RFC either and is
quite good for a first IIO driver. ;-)
