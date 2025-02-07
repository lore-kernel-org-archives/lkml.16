Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81E1A8F97
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738961505; cv=none; b=D0I0O3VxyphQl+7iAxPjqrWBN37rmfafBMy940D9VLLU0BGQHHVwXMaHstnBAkXZyx4xeiyC9GDJ6Y76MN1IdMmGjhM/wlQ+MDFdPmDlFA67LvY2iwcZ5fYP6vKjIw3+mjeRUTbC5UW04yaDS7knHEgDwXTrG7lG1M+z+p8lCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738961505; c=relaxed/simple;
	bh=j0K3veYgNs9ITuGH6rfEbzVZGYKqSl9G/AaRQDM6RO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BcDl43PYcrAh4ji6yjrkwT7RsLZ90xNAR2ZhSR79ZyT/z19XaxT3lU4OV+lRQTV3sRiVWjZBKqzClElgenCGlPqpMbzglpPtMJ9+X0Uob81M6zM++iEjhEwFWR9sPf73moK93Sjb+osfKfXx0MaZY1meSr41r8w2lrjBCIt+lIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HHF9C7Tv; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HHF9C7Tv"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e15d9629bso831264a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738961502; x=1739566302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VQGQcdGFinvFOpfGuSYGng0xGWMSfOVhvommmb2mfPo=;
        b=HHF9C7TvC5v3O5qwMl077YKeKLExv/7juTO/sfK/IO9KN6nXmt935uSSPkBheIBR0a
         xGQv9RnuYT509ER2xjN4t5gmuGU0dNEebvg6BB4H0SuP4nRo1Rl8OUYHopu4TbiPH8rk
         2tXRGmIKGMu95eCN7gX+XJ9LMoHr0x2Fc/WCdAx348jQifRZz8GRkKE1re0iUyoS7tJ/
         WrzIhMCoW17SIGvj1g/0n5Zf0aZzpAdCRIIE+5TFVrFdFN32kXobFFbf2Djb/dYHapHn
         A6YMgBSRnmz7S0yFO7ZMeuQir1XEGSm1iyruTzkyUSkV98Lit1494ANl2exYhiNK8dYQ
         lzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738961502; x=1739566302;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQGQcdGFinvFOpfGuSYGng0xGWMSfOVhvommmb2mfPo=;
        b=Zes2IqA8WjI7/ej6XcF3wKSGf5Js0da/8LevyxiImqz/L4tx4uCv/8P9EjZ5so/NUo
         xftDSZUvmFqL/zDBsRKSpULAkQr+c2rhEJRtUWRfMREtvL6+Azv81wdREIqSUA1wqyZW
         mt1zYjJALgkMKkI/RX+Gzzkung2vR4MfGFupx1nzagmCIjbWPE9q4cy7t/BYECSccCic
         qmP//myL6qzsG7TMASBYmX3KNuwk2QLLCai0BpFbj6O7dxeVRt5zx0RDEIH0wXcKUy6N
         GexObdb7D3HjmIUHmeWXgH+V+1IvzIjszQsc2j02ASs3+AVrMbicAuqYtLpWOCUeXyk8
         i8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXl9zDZxpYJwtNyS+53s1dr4NQvx4UJD8rr667P5hPkGW3YKrJ+FESvB8NQtGGi+geija59GJ3u9TbvbOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgplC4YA0DawHgCvK7taNO3nrMHoUj3DReMpGkRz2w3JPoQdMa
	BMuH6oNv2JPL4LKg8WRWMz0wcvTU+UbYdJNiGRqGjwcs91fmtGKKgSxrBc8T0fY=
X-Gm-Gg: ASbGncvkX5c2RguGQxdWpiVH/PYWstRv3Lom23Iqx0sycpthWXbVAadXpnLwbkcbBbq
	LCJlXOo6Vzj56Ij3nH1Cd2gUkO6gCZZO6JcNYT0tXOsI8nzOoCByXxvj5v/uzRREIQKVq0KuLhC
	iJbnVLaPgU8chBd68qA7I+rGcVqlcFXM5AHloNBqz0aVXhrHGdsf5lMbhYYEoViDLzmifgiD/Ym
	lBVNrqz+3Omd9lKdEuq/jArpwVb2cW7PPlIUKfO60seqZxXZi2EWOagNWnzs6VIF04LSxgXfolv
	b4n7Va4EbRiOFYxaitG81HMo3aRZ6+eMtAcNcqmIdBOKjR+LEIZ7
X-Google-Smtp-Source: AGHT+IG7PscmiUU5iaoZJFTzcARWpAGODDHZRUMCO99df9PiCQJBs76r9w1AoVJ5tFHypQESPlOSMA==
X-Received: by 2002:a05:6830:438a:b0:71d:f343:5f5b with SMTP id 46e09a7af769-726b8829061mr3412971a34.12.1738961501979;
        Fri, 07 Feb 2025 12:51:41 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726afa4d2b7sm1006099a34.63.2025.02.07.12.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:51:41 -0800 (PST)
Message-ID: <dd263ac6-1843-493c-90ea-d303eae561e5@baylibre.com>
Date: Fri, 7 Feb 2025 14:51:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 9/9] iio: adc: ad4851: add ad485x driver
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, jic23@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20250207140918.7814-1-antoniu.miclaus@analog.com>
 <20250207140918.7814-10-antoniu.miclaus@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250207140918.7814-10-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 8:09 AM, Antoniu Miclaus wrote:
> Add support for the AD485X a fully buffered, 8-channel simultaneous
> sampling, 16/20-bit, 1 MSPS data acquisition system (DAS) with
> differential, wide common-mode range inputs.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

...

> +static int ad4851_parse_channels_common(struct iio_dev *indio_dev,
> +					struct iio_chan_spec **chans,
> +					const struct iio_chan_spec ad4851_chan)
> +{
> +	struct ad4851_state *st = iio_priv(indio_dev);
> +	struct device *dev = &st->spi->dev;
> +	struct iio_chan_spec *channels, *chan_start;
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
> +	chan_start = channels;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Missing channel number\n");
> +		if (reg >= AD4851_MAX_CH_NR)
> +			return dev_err_probe(dev, ret,

ret will be == 0 here, so need to replace with -EINVAL.

> +					     "Invalid channel number\n");
