Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFB14D433
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625203; cv=none; b=uSc6GVMlYxGlYeoHajJY0nceLdSmUAnmJHT6f98Q1AK2Vq/JYtxGeF1yE6T52KGOHn+ZzI9aEr8sZaCqgLuv8xEM7xrrURR9MuIoqPugPu/AG+6prPgTmo1xGFEHWOSDyEJAqEPaMH8+++ERvWJKXz9w3DF61e9Hp17wYn/IBmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625203; c=relaxed/simple;
	bh=JphQTvb3I10QtM736571WKwUkv4cf1iWTbPNd3rRn88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeaIHzEZuasHWPr6te2TuPGUbgi2d7Z6qv1bjzanIvV2MU37L+zg+PUH6dEKNQMUKF0DjquHBJ5Gm12Su1dkZeMyPH4ceV7VNsr7/fl7jGUT2CMkm36SN+zHJuPt//HZSqXlfb2tb1yYWFhgpm68x5mrXEciOo6neACJknK4Svg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nN/2+aWN; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nN/2+aWN"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-605f7d3215cso1139766eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748625200; x=1749230000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZL7m4q85jSj/za+Y9tnRe4NNGzdKPfTLBdq6Osao+v0=;
        b=nN/2+aWN20sISMQujl6VEylpjeYf9133z5MR5pjE9/820vk9PEuxkyFaA/yomG6AD3
         5L8JWxuatyLslT5WPGCkiNPNwSTVdcEeoaAlE71E+1OdHkSfz4hQwC704S+ifIHT2ZHV
         XFhvvzxdjOHjfO9JBs2T/dG9/ET0nsSEFdrqZvSdaAfqwHCl+9bEtx/16IL1o0v20u1D
         X1JQ3cRReKW2S/JNNji3zO4Io5ZYOrYms+Vjg3Ocd0/4nGDAk4bcuk/AVarVNyMWFj9y
         NfLt8HmZJ5iROWi+h/Jc5YrlkeHOyt9TyUg/FupR6ljbXABtOFaG4eFk5vfIzLuXMAIE
         e9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748625200; x=1749230000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZL7m4q85jSj/za+Y9tnRe4NNGzdKPfTLBdq6Osao+v0=;
        b=mv5s3Bagm8zCfRxtscmL47b/dhV1BDk8zuu2zNv1IUcdnTzTDK2Ib2JFbdSRuS1Psc
         kaGRc6dwm7YeyvxeO2mNSyE2FPWhJHBlnX3LGVGawG8etaWpbH7OH48tLtSiJ+zAkF7P
         a25luUhWWf5lnbG9P9/JMHyi1MQNdaHcBzdXhb94Rem5gjbKlwI/265oqGvMakFfUdyL
         5J5T1thUGRv9XYyaE3KXIc0UlzaM41RdYvcwpGa0/QPscRpXPciQ+OOCr13IxgyrNSfl
         xq4UMFNOloOLDqjHaXsLpLqyuDWe3KDyGUVitSEcfdfIqcoBOc7zejnTjLCLpNSUrx3U
         /+kA==
X-Forwarded-Encrypted: i=1; AJvYcCWaQWVZko6yoUbqf+ql7jU8ahWJYGM/136ZVATanDEPajkYmlZNqEHd0bHxk3roUeb0cswWr04YHtwRLXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4vHThckG86URvR8IocqnA1Ul+I5vCNgyFsi/l/g3pPPBZuovt
	01EqdQM/CJujMdGE+SQVm1wbzM6jcnE/kswekFHw0czE/ppzKwA17f/bpQF5lTiHdwA=
X-Gm-Gg: ASbGncsYdTjopx72pNS72K6uv70bLgdQdyDr5VvO48JRrHV39mOO27ogi94PSN99HtZ
	TO6dnbIdpzrlSjYztJe0jgVh6TuBzLvk4Z9EBBYTTbktquZ2mP02kxZwD23dghpXWJgtfhdYdG1
	ozfoRQwO3BxQkYP/z9pRfdsRtzSqwGlsaR9aF6QS/UTbVhlqI5nlXMFxj7xOoCsed5x9CuJZXQX
	OripYSc7syxwFTwmt1vpd6lD8W2eysb3SWXgF64KB2ikyQmuk/HrnEuCK9/6BpftNpyutCLSINQ
	KpKyz098HtKszkHOGl1gzezwYNJPlKzqyFHah1+jSm3/pwqSWtWO4IFLuax5cNL+3R7KJHgSOXZ
	arRlQ3TTH307Mul8ARLL7hY928d1t
X-Google-Smtp-Source: AGHT+IF7W6PC+bFQuVbbZoJTqkb0DmlG3Whd0OGS2QBfP/HS2hvOFEnWN4sDjCl3GW7f1+nBzmvCMg==
X-Received: by 2002:a05:6820:2017:b0:60b:ca08:a73c with SMTP id 006d021491bc7-60c4d70d3b6mr2603070eaf.6.1748625200501;
        Fri, 30 May 2025 10:13:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777? ([2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c42c16sm442474eaf.7.2025.05.30.10.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:13:20 -0700 (PDT)
Message-ID: <98ccc736-a44f-43a7-acff-ac5a4cc33023@baylibre.com>
Date: Fri, 30 May 2025 12:13:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] iio: adc: ad7606: add gain calibration support
To: Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
 <20250526-wip-bl-ad7606-calibration-v7-6-b487022ce199@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250526-wip-bl-ad7606-calibration-v7-6-b487022ce199@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/26/25 5:03 AM, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add gain calibration support, using resistor values set on devicetree,
> values to be set accordingly with ADC external RFilter, as explained in
> the ad7606c-16 datasheet, rev0, page 37.
> 
> Usage example in the fdt yaml documentation.
> 
> Tested-by: David Lechner <dlechner@baylibre.com>

Testing this with parallel interface today instead of SPI and found a bug.

> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---

...

> +static int ad7606_chan_calib_gain_setup(struct iio_dev *indio_dev)
> +{
> +	struct ad7606_state *st = iio_priv(indio_dev);
> +	unsigned int num_channels = st->chip_info->num_adc_channels;
> +	struct device *dev = st->dev;
> +	int ret;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		u32 reg, r_gain;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			return ret;
> +
> +		/* Chan reg is a 1-based index. */
> +		if (reg < 1 || reg > num_channels)
> +			return ret;
> +
> +		r_gain = 0;
> +		ret = fwnode_property_read_u32(child, "adi,rfilter-ohms",
> +					       &r_gain);
> +		if (r_gain > AD7606_CALIB_GAIN_MAX)
> +			return -EINVAL;
> +
> +		ret = st->bops->reg_write(st, AD7606_CALIB_GAIN(reg - 1),
> +			DIV_ROUND_CLOSEST(r_gain, AD7606_CALIB_GAIN_STEP));

ad7606_chan_calib_gain_setup() is called before ad7606_reset() so any value
written here will be cleared by the reset.

Also, this is called before st->bops->iio_backend_config() so when using
the parallel bus, this causes a segfault.

The simplest thing to do is probably store the r_gain values and then
create a new function to write that data to the registers and call that
near the end of the probe() function.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
