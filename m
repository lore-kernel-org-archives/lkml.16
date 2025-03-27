Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3F19CC11
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091935; cv=none; b=XYdNn8CpDA/6wXYDd9lofGLY5r8QziMncEQb4zJik3s8IrnNrboPLaDOvcc9IECOvjhsEGa1FKtDhusOwJ5CeslM+cK4TCSv7FQQ6g/S7oTD9VK0xABdE+plXyJt7T4N8D8dNdoB8hIeJFU2M7jgRwuresciyOOIVtF3s4OURK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091935; c=relaxed/simple;
	bh=0SQScDqEeMbzQnwpiKKIFG9Vk68To6MbYwSHP1HvL3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+m3voA7V3nokytSPREXE3xlRjW1lAqPsxAcINU2xoX7E08GQUE5l10ITfSbS0tB4DvcyVIseszmR9B9dCFOsb0M2a0nM4waEIlAjaWHCmJUtRlbjjxP3mGwVx3bf6MuUTYFyXPvDkw/YAUoIx7wL/88aBx0/eQusOSqpdXTKA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Xtc2u7vF; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Xtc2u7vF"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3fea0363284so678313b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743091931; x=1743696731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unBVHfPgws2ZkgWdON6HD2DMgITftuEecvFOlYQpcdY=;
        b=Xtc2u7vFHOb37SBR0T56eXgaf+/sBptQ9j+ezC78qT4beeRDX1s5a99Pav5/IFOVBe
         zh+cmNHwkoJbqknMt2phTjCQAgdKXYg7oQD9yVQaBMGksO4gQRni4eoC+2+y31Avno0D
         FM+iignRE1pU5Icvw9MJNEi1dda1m3Ym2NDMxZU+ZkKuBmDghffnTxHieH3X9L1CULOO
         wsgOwR/fneDpF/znALSo16vdZ2TeS0+USX2TO/eBrHmjIGXTxwrxVH+WyESKdw31A+ox
         C4jfrdGNO4NwI7Tiq8Ty1e8GCADV6wP4P9ZXXZi88rRnpNt+oH4aQvbEiYDiq0hibaO4
         nePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091931; x=1743696731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unBVHfPgws2ZkgWdON6HD2DMgITftuEecvFOlYQpcdY=;
        b=j35tdEXd3VZggR+valKSjrgpCg5egVCJTMB81rNFXCJEq+3pfHgUMd3I5dgoCIXWeT
         8P0sRivrWC6UJ8iPemrrLxmXYiRufvkPhmyKhTmOkYUq773NJV0S9yWxTCaWU5FZNDb2
         1Qmz9BPIF28NH3IkPlfjeknIdlSQ734CCuY/WWCQ1LWuFA7bd/IPX0G4Zdq9v2DZmfuJ
         DM025M3EvidAS8ZA017gD54vi5Q7g/cK2qfrUTOHmBBVZM3EZc77caS0hrFg4KXjZUZ6
         8i/V14CDyoc4LFjx2yJtY+z8N6pOZzczu6MKENrd9EjjvIgwIZ+IKUsQj0HKOXb/shqc
         cE4A==
X-Forwarded-Encrypted: i=1; AJvYcCVA0jm+3niq0in9t7qKeWYw8pKyDStkjXJfQI40Df3DLYLoxabikYf0hxtzDcG0FBgBtdTT+LC4YBp9mRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WgFqmOV4S1jbilsGL8wqEHzLSw6Uo7CbJYrcgAeYQAEdJ5Sb
	SBKQqNZgbC9qiKPynFy9c3dSL3xa10ev2sPpfh77499LOIB6DDh3Jb94fLFqD9w=
X-Gm-Gg: ASbGncsI4WmhomfJOVW1Jlg2jSDJ/Jiv7OTInk/vg2Qms1ggu13XrR+9qiUBT3fe30I
	3tSWiOxh61igEcXPGED+q+L6S/mMlhCEfSJT1chwDMH9uYU9Z+5lOqgKhgonuSGtM3IEew3qkCC
	VWLS7bTQpKk/6DWzL/dEJpccjCTcqH6DYN4skZisKnJx0OArg/Egp8lZFiQHrXFnrgS2YY/gYDn
	aGRM3w3djrZ/bziMwDbIj0DEV2zk8thxmEu7AufV7+jFvvzcpP91PiIy435AWw0DIR8J1/9XM74
	2Dn5cpubX0s2A8v03d3pU1iefS1OsPzXuk64HYxJ1GQ6df9LI5ztcbgyYX4t6nmk43jUkPmQnru
	ElDuE8g==
X-Google-Smtp-Source: AGHT+IEByi/X8WFBEGBZrgq4UEw/KyKlyq98XRQT7qQm4oHe4x24ITtjZpAD1WQiKg8vcaO17wnr9A==
X-Received: by 2002:a05:6808:3c46:b0:3f6:ab0d:8db1 with SMTP id 5614622812f47-3ff032dcf36mr751735b6e.3.1743091930689;
        Thu, 27 Mar 2025 09:12:10 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf5e4c32sm2826363b6e.0.2025.03.27.09.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:12:09 -0700 (PDT)
Message-ID: <35f4d22a-e478-4a43-bbb6-f9d34ce1f888@baylibre.com>
Date: Thu, 27 Mar 2025 11:12:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] iio: adc: ad4000: Add support for SPI offload
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <d67e71b9fab270d16b6b5e26a3594dfc73be1ae5.1742992305.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <d67e71b9fab270d16b6b5e26a3594dfc73be1ae5.1742992305.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 8:24 AM, Marcelo Schmitt wrote:
> FPGA HDL projects can include a PWM generator in addition to SPI-Engine.
> The PWM IP is used to trigger SPI-Engine offload modules that in turn set
> SPI-Engine to execute transfers to poll data from the ADC. That allows data
> to be read at the maximum sample rates. Also, it is possible to set a
> specific sample rate by setting the proper PWM duty cycle and related state
> parameters, thus allowing an adjustable ADC sample rate when a PWM (offload
> trigger) is used in combination with SPI-Engine.
> 
> Add support for SPI offload.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

...

> diff --git a/drivers/iio/adc/ad4000.c b/drivers/iio/adc/ad4000.c
> index 4fe8dee48da9..9fc56853265e 100644
> --- a/drivers/iio/adc/ad4000.c
> +++ b/drivers/iio/adc/ad4000.c
> @@ -16,11 +16,13 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> +#include <linux/spi/offload/consumer.h>

Alphabetical order?

>  #include <linux/units.h>
>  #include <linux/util_macros.h>
>  #include <linux/iio/iio.h>
>  
>  #include <linux/iio/buffer.h>
> +#include <linux/iio/buffer-dmaengine.h>
>  #include <linux/iio/triggered_buffer.h>
>  #include <linux/iio/trigger_consumer.h>
>  

...

>  
> +/*
> + * When SPI offload is configured, transfers are executed withouth CPU

s/withouth/without/

> + * intervention so no soft timestamp can be recorded when transfers run.
> + * Because of that, the macros that set timestamp channel are only used when
> + * transfers are not offloaded.
> + */

...

> @@ -784,7 +1081,10 @@ static int ad4000_probe(struct spi_device *spi)
>  	switch (st->sdi_pin) {
>  	case AD4000_SDI_MOSI:
>  		indio_dev->info = &ad4000_reg_access_info;
> -		indio_dev->channels = chip->reg_access_chan_spec;
> +
> +		/* Set CNV/CS high time for when turbo mode is used */
> +		spi->cs_inactive.value = st->time_spec->t_quiet1_ns;
> +		spi->cs_inactive.unit = SPI_DELAY_UNIT_NSECS;

This code path later calls ad4000_prepare_3wire_mode_message() which sets:

	xfers[0].cs_change_delay.value = st->time_spec->t_conv_ns;

Which contradicts/overrides this.

>  
>  		/*
>  		 * In "3-wire mode", the ADC SDI line must be kept high when
> @@ -796,9 +1096,26 @@ static int ad4000_probe(struct spi_device *spi)
>  		if (ret < 0)
>  			return ret;
>  
> +		if (st->using_offload) {
> +			indio_dev->channels = &chip->reg_access_offload_chan_spec;
> +			indio_dev->num_channels = 1;
> +			ret = ad4000_prepare_offload_message(st, indio_dev->channels);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to optimize SPI msg\n");
> +		} else {
> +			indio_dev->channels = chip->reg_access_chan_spec;
> +			indio_dev->num_channels = ARRAY_SIZE(chip->reg_access_chan_spec);
> +		}
> +
> +		/*
> +		 * Call ad4000_prepare_3wire_mode_message() so single-shot read
> +		 * SPI messages are always initialized.
> +		 */
>  		ret = ad4000_prepare_3wire_mode_message(st, &indio_dev->channels[0]);
>  		if (ret)
> -			return ret;
> +			return dev_err_probe(dev, ret,
> +					     "Failed to optimize SPI msg\n");
>  
>  		ret = ad4000_config(st);
>  		if (ret < 0)
> @@ -806,19 +1123,47 @@ static int ad4000_probe(struct spi_device *spi)
>  
>  		break;
>  	case AD4000_SDI_VIO:
> -		indio_dev->info = &ad4000_info;
> -		indio_dev->channels = chip->chan_spec;
> +		if (st->using_offload) {
> +			indio_dev->info = &ad4000_offload_info;
> +			indio_dev->channels = &chip->offload_chan_spec;
> +			indio_dev->num_channels = 1;
> +
> +			/* Set CNV/CS high time for when turbo mode is not used */
> +			if (!st->cnv_gpio) {
> +				spi->cs_inactive.value = st->time_spec->t_conv_ns;
> +				spi->cs_inactive.unit = SPI_DELAY_UNIT_NSECS;

I'm still not sold on this. We know it has no effect with AXI SPI Engine and
it is writing over something that usually comes from DT. It is misleading.

And the non-offload case already does:

	xfers[0].cs_change_delay.value = st->time_spec->t_conv_ns;

which actually does work with the AXI SPI Engine. So why not be consistent and
do it the same way for the offload case?

It also seems safe to omit this altogether in the offload case and assume that
the max sample rate will also ensure that the miniumum time for CS deasserted
is respected.

> +				ret = spi_setup(spi);
> +				if (ret < 0)
> +					return ret;
> +			}
> +
> +			ret = ad4000_prepare_offload_message(st, indio_dev->channels);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to optimize SPI msg\n");
> +		} else {
> +			indio_dev->info = &ad4000_info;
> +			indio_dev->channels = chip->chan_spec;
> +			indio_dev->num_channels = ARRAY_SIZE(chip->chan_spec);
> +		}
> +
>  		ret = ad4000_prepare_3wire_mode_message(st, &indio_dev->channels[0]);
>  		if (ret)
> -			return ret;
> +			return dev_err_probe(dev, ret,
> +					     "Failed to optimize SPI msg\n");
>  
>  		break;
