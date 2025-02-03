Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83402211294
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 22:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622533; cv=none; b=CJrdv59ggT1w4AXC+3sOH6P8Cnke7eR7ojed4bF3OEwv1RLbKAPRwz2hQue3+2Vs8C/xcg4wnuXl38XjzEiR1eZv3mXCHM9/tzjQooFW28DjBFB+f/FLfOTd1HUtTduSoWf9Bhu6RDIDRQW4ZYK3a1Rjo5YrOikijaYW5ZAfrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622533; c=relaxed/simple;
	bh=SXY/ut4HPZGjQfV0TdHI+owQ/8IPFSL6uBL1jYm5kIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lPhsSuhqOqBe6x7c6c/7akll5PK5r2wGduqzCzmXKiCjbMKDhHnnz1qRxEdTJY8wDYitxaJNO00lPG9UdelA6pxmob85DDYVUVfC0azWERuvL1lR9jVkx5b39Xh+Bo7w0fL2rD7hOQc6QxMbyjCJTQ9Qi8zJnuyul0A0MbqB6/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=f+6XVLDT; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f+6XVLDT"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ebb4aae80dso2214989b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738622530; x=1739227330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJnIfOP7+jSlUs29FECy5//ffpMPbLe/6pSEbA38u3M=;
        b=f+6XVLDTnechdqBluVSaw5ZSyuaeMkrWSCzOIU0YoBMQyd87gOtCjssN32aN+ldeTf
         Pqh8ZBTqzNfmbgqz8hLrf9IbtyuDBZUxTWVY+fqhFSHs5igqV7RjkcH7Y5SfBThQ1NTt
         SzNIzm6rbA39f7faGwOlb9dJlqlzH741aSKQE3djTpu4XuWwdeeO/UYTHQ1H+J2WM+js
         ThAahDQZCxFRBTEMnq3hBwH0xepC+q9gT3cezWS2iVYCsDliAiqK/tP2BwYEnLqCp5y+
         Z4GnsPhmf3k+bEox8ce/qAQWKkQ+E0UGsmCcpAGFrm5FZPiB85WjnAW9bnFJr2PiSY1h
         VYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622530; x=1739227330;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJnIfOP7+jSlUs29FECy5//ffpMPbLe/6pSEbA38u3M=;
        b=wOPjLE8ru3DXhPou5viAeYIGjeYR+jySmbBbrKVOKHQHiOChgr9TNkAHFd4GJVC2o/
         LNSLaKMV5AMwgsECgvoQTrT1wxF5dJ2hfxTNPW4BW5nAAqnac7BXYYR+PESfpHBYDtvc
         PILRiOm6ShzrLbXWT3eOzIMdle8WomammW7evZ18w2xYcvu/USjd61kFmKpbimDwmTrw
         wgzO0SSi/WHC1F4gxbtEKus9bPK5cTeDCulRTmEx/KhPEz2NzWUbJqjXuTQb3VftiW7Y
         CI27Uec6zP5eTpKJ0Tiv4xF9p9FNwLhcUipHORGl9u0CuYtPTyL8aIhTtEM8yDSby7x5
         /EMg==
X-Forwarded-Encrypted: i=1; AJvYcCVDBi15yiAulgPOyuB4t/ODnLhKzD6MFZpgKRoiicfj+syJvSvDq2/Jyg0DYGePaYYuE47TMp1znUogYTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJReF5mQXTPlRrLLGIw+Mo/XixmUCfcTr75NP7jOopfJZCVIEv
	QnMuIUkmjv4kfxORLN0vwGzYjlYQ37YAqPndMLaIjua+XI6mRWYctR1mWKH9PKg=
X-Gm-Gg: ASbGncsVV0w1JeYiuVgwiE4PIGcUklcW6I63pWQGvM07kGw3jhaBHF/mArqCWFxDAew
	4VNwrF6IdTgpuk+T5/Pljyk7DRsnJRGL+IeElA4Dlht3Fjsw6kH4EAXQSchn7A1SSLc8uSlZHb0
	JOmyMkf62o2RQi/eG1TPoB2EWsKBhU8r1cfWpotAwF7YfHoW1ZyM/zza8zxOlTWYgv3aJJquxgA
	W4P6alKH/KwLltXGVNO0thk7YMpQqZgRf9lbzED4uY+mH613VWNvSAL/UWUuVTRZmbIoujn45fw
	7HZ42EQzaw8rxhpsIoSVWgOw4vSd3ZhYCPYu7TBcvip7p3VN9Zh2
X-Google-Smtp-Source: AGHT+IGPg3Ki4+QlI+PnxMX8N884nW9RTygynBG8qVyReXZuEsEhrg1HOrCB1+xLT/4DE7U7CBVGQQ==
X-Received: by 2002:a05:6808:2f16:b0:3e7:df63:15bc with SMTP id 5614622812f47-3f323a184cdmr15101787b6e.12.1738622530456;
        Mon, 03 Feb 2025 14:42:10 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f333523efcsm2731729b6e.8.2025.02.03.14.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 14:42:09 -0800 (PST)
Message-ID: <c5722215-b720-49ab-9f0e-00b01eb4679d@baylibre.com>
Date: Mon, 3 Feb 2025 16:42:08 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 8/8] iio: adc: ad4851: add ad485x driver
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, jic23@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20250127105726.6314-1-antoniu.miclaus@analog.com>
 <20250127105726.6314-9-antoniu.miclaus@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250127105726.6314-9-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/27/25 4:57 AM, Antoniu Miclaus wrote:
> Add support for the AD485X a fully buffered, 8-channel simultaneous
> sampling, 16/20-bit, 1 MSPS data acquisition system (DAS) with
> differential, wide common-mode range inputs.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

I think we have the important bits sorted now (i.e. userspace-facing stuff).
Just noticed a few minor things in the latest revision.


> +static int ad4851_setup(struct ad4851_state *st)
> +{
> +	unsigned int product_id;
> +	int ret;
> +
> +	if (st->pd_gpio) {
> +		/* To initiate a global reset, bring the PD pin high twice */
> +		gpiod_set_value(st->pd_gpio, 1);
> +		fsleep(1);
> +		gpiod_set_value(st->pd_gpio, 0);
> +		fsleep(1);
> +		gpiod_set_value(st->pd_gpio, 1);
> +		fsleep(1);
> +		gpiod_set_value(st->pd_gpio, 0);
> +		fsleep(1000);
> +	} else {
> +		ret = regmap_set_bits(st->regmap, AD4851_REG_INTERFACE_CONFIG_A,
> +				      AD4851_SW_RESET);
> +		if (ret)
> +			return ret;

Do we also need fsleep() after software reset?

> +	}
> +

...

> +static int ad4851_parse_channels(struct iio_dev *indio_dev,
> +				 const struct iio_chan_spec ad4851_chan)
> +{
> +	struct ad4851_state *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +	struct iio_chan_spec *channels;
> +	unsigned int num_channels, reg;
> +	unsigned int index = 0;
> +	int ret;
> +
> +	num_channels = device_get_child_node_count(dev);
> +	if (num_channels > AD4851_MAX_CH_NR)
> +		return dev_err_probe(dev, -EINVAL, "Too many channels: %u\n",
> +				     num_channels);
> +
> +	channels = devm_kcalloc(dev, num_channels, sizeof(*channels), GFP_KERNEL);
> +	if (!channels)
> +		return -ENOMEM;
> +
> +	indio_dev->channels = channels;
> +	indio_dev->num_channels = num_channels;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (reg >= AD4851_MAX_CH_NR)
> +			return dev_err_probe(dev, ret,
> +					     "Invalid channel number\n");

Need to check ret first, otherwise reg may be unintialized.

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Missing channel number\n");
> +		*channels = ad4851_chan;
> +		channels->scan_index = index++;
> +		channels->channel = reg;
> +
> +		if (fwnode_property_present(child, "diff-channels")) {
> +			channels->channel2 = reg + st->info->max_channels;
> +			channels->differential = 1;
> +		}
> +
> +		channels++;
> +
> +		st->bipolar_ch[reg] = fwnode_property_read_bool(child, "bipolar");
> +
> +		if (st->bipolar_ch[reg]) {
> +			channels->scan_type.sign = 's';
> +		} else {
> +			ret = regmap_write(st->regmap, AD4851_REG_CHX_SOFTSPAN(reg),
> +					   AD4851_SOFTSPAN_0V_40V);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ad4857_parse_channels(struct iio_dev *indio_dev)
> +{
> +	const struct iio_chan_spec ad4851_chan = AD4857_IIO_CHANNEL;
> +
> +	return ad4851_parse_channels(indio_dev, ad4851_chan);
> +}
> +
> +static int ad4858_parse_channels(struct iio_dev *indio_dev)
> +{
> +	struct ad4851_state *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +	struct iio_chan_spec *ad4851_channels;
> +	const struct iio_chan_spec ad4851_chan = AD4858_IIO_CHANNEL;
> +	int ret;
> +
> +	ad4851_channels = (struct iio_chan_spec *)indio_dev->channels;
> +
> +	ret = ad4851_parse_channels(indio_dev, ad4851_chan);
> +	if (ret)
> +		return ret;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		ad4851_channels->has_ext_scan_type = 1;
> +		if (fwnode_property_present(child, "bipolar")) {

fwnode_property_read_bool() 

(to be consistent with same check in ad4851_parse_channels())

> +			ad4851_channels->ext_scan_type = ad4851_scan_type_20_b;
> +			ad4851_channels->num_ext_scan_type = ARRAY_SIZE(ad4851_scan_type_20_b);
> +
> +		} else {
> +			ad4851_channels->ext_scan_type = ad4851_scan_type_20_u;
> +			ad4851_channels->num_ext_scan_type = ARRAY_SIZE(ad4851_scan_type_20_u);
> +		}
> +		ad4851_channels++;
> +	}
> +
> +	return 0;
> +}
> +
