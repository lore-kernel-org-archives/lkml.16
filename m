Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B721C9E7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022321; cv=none; b=TRVaP4slMERZ7uAp5qoZjr4/GfBVhPYJMRXsWurOuPQx5zYoyG4eVtu1HuVSfi5/NSjgX2acLzoz4n74h+ih+pv7/JI297hltPa4llx+SXnSV9FKWDWsZ+uvM+ycZh0SDq3ULeGsbtrpodnekAtqKKKojhJY6iP+bLsQSVQ0Cz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022321; c=relaxed/simple;
	bh=VTVoggf6JS6pnIcZ+XS3UM8XE+/4dsDQS0s1ZJJWmTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fshsaObnxEQSQTC+NMLxwN/L7gDKLfUdAG5ECjgVWYzlRSn367O4s29FmIBYPTkjWBQ90P47Jogf18d1TCvfURgiXewIPtzLG6xEJbcq4D004co4xGuyGMqyapXSdBY2XQtkaaSUfyILLE7zIvSG2Lm+dbTV/axvVPnCasHIGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vapXLKqj; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vapXLKqj"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3feaedb4d2cso4637897b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746022318; x=1746627118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXr5IaAciIjxJwMtezTJjCywVevxWSVV4iijAA9ygRc=;
        b=vapXLKqjFPve7zCgvVBiqr3aJN3yYSIriPELDGQYzdnd33A6h/ThVUb5wuaFdUfCe8
         VMhJO1UaZNhp7ssB2kiHAxRe76Q+ULaORzyBhK8QBN7Yfuc6WmrIgYyNecyc97ysE7r7
         niqGl5qym5mvTpUD5kZZwrabL2E02F0kjDVehXbh9TMfaEHUKW0XHoHNwIZmBG6xZxwW
         e6GAxdGhx56Zp6zZMz0G6OPW5f3v8dYym87F1Ihs+FMe9wTs/mOBKrRMS8syBbYoWyTM
         uelQIySMxzUjGVtATCieJNDiWwo8SR2fcAiMO5Cwb85/dPc/5SmXGdiordti0QtS0wBu
         Qn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022318; x=1746627118;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXr5IaAciIjxJwMtezTJjCywVevxWSVV4iijAA9ygRc=;
        b=OG3CUBCR0O8aFmr7NPhzNpYxQlX0+ZVNFbSYWLpRTfcHpKpmlSFF+C5Q1Qh9eIbVSS
         9eszVR0cqgrr/fYVuUQ5dZ7z0b79ioKBxummDqgyWW9AKS/d0IXwZNKPjzTV2r+9vuiz
         IJayqkhiD1kmhFB5FncW10HfBVSs/9/MZle0gxUhhnwguYGdWAI6nVBpfyNksKj8shS2
         rlP8umUeC3W/YsuiWh9SifG6gFOklJJaMYqYHMvwmpsCRbfG1Zv3hs0PYwhTDL9R8upU
         LnQ3nS3xr4d/SyxccH+V1kbFK5j73f1qbAYhkn76NgyXGl0g8dYZhjfSVmuVEhjtB0KU
         Hhgg==
X-Forwarded-Encrypted: i=1; AJvYcCXramoOCW4pr6MBsKR3fg/kdTxCixn/LQQ5t3IKk4yg7CeRrCMG8GIyeBeKrcOoKzbGJ4w3hmDWb81trPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJjPhoQ6+96lD26VbKXMNWns61tYOXXJ5qs9UWxtZUGmM/4AK
	aBRZGigCP78a4aMWVMvyh2V/wDChXg5V9ds4Pttw93nbq3DXLty4SaQ7UQOOFcc=
X-Gm-Gg: ASbGncte+tFyXIYtTAYxeMt+G8mfH8D75eijgH6qWlTLPsAJu4gGr3vO0kl/2rGvEfl
	mgAmN3X3OByquaqTp31Em4uhMYLEcH1iIqlMMAc6XiExvp7FVv2WTzRYfGRJyES7cka6F7bABn/
	Q5HP1on4GdFd2m8jNCN2Sudaa2btvaVQ0BQtYLyOruuHXzUQD51q/zgdrWm20b/n80wUK8BFmz6
	HMHBk3rrdwRvvXIdWbQcqd7SUJrEdKeQGXZMJssnzfmRYch+tInTRc3opJECJzodzruoVeKo3Iy
	aO25IZRnGMpBuilSxWOC7ugevRT2HZcYqeyx4ai/td01vbCTY+3v6TuYGAV72Ja0ISanM+w9oT2
	RTvf6aXe/Ii9dkcg=
X-Google-Smtp-Source: AGHT+IGm+YRDzAV25Fg59YboolWAEWJM5fvIS8POZ8P+KjKU4rTAu+9CAE/+oSyEAf7EUAu7s7UD8w==
X-Received: by 2002:a05:6808:8518:b0:3f7:ccac:287f with SMTP id 5614622812f47-402d24e8ef8mr1326804b6e.27.1746022317997;
        Wed, 30 Apr 2025 07:11:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:359a:f1e:f988:206a? ([2600:8803:e7e4:1d00:359a:f1e:f988:206a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40212a598f5sm819181b6e.36.2025.04.30.07.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 07:11:57 -0700 (PDT)
Message-ID: <c6e1c555-37c0-484c-a955-39163cd148bb@baylibre.com>
Date: Wed, 30 Apr 2025 09:11:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] iio: adc: ad4080: add driver support
To: "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>
Cc: "jic23@kernel.org" <jic23@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250425112538.59792-1-antoniu.miclaus@analog.com>
 <20250425112538.59792-12-antoniu.miclaus@analog.com>
 <27e40c72-7c3a-4595-8647-5fd1f428ea9f@baylibre.com>
 <CY4PR03MB3399A9584A631E5C30CF72EC9B832@CY4PR03MB3399.namprd03.prod.outlook.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CY4PR03MB3399A9584A631E5C30CF72EC9B832@CY4PR03MB3399.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 7:31 AM, Miclaus, Antoniu wrote:
> ...
>>> +	unsigned int num_channels;
>>> +};
>>
>> I guess this is preparing the driver to support more than one chip?
>>
> Yes. It is stated also in the cover letter.
>>> +
>>> +struct ad4080_state {
>>> +	struct spi_device		*spi;
>>
>> It looks like this is only ever used to get &spi->dev. We could drop this and
>> get dev from regmap instead.
> How can I get the dev from regmap?

struct device *dev = regmap_get_device(regmap);

>>> +	struct regmap			*regmap;
>>> +	struct clk			*clk;
>>> +	struct iio_backend		*back;
>>> +	const struct ad4080_chip_info	*info;
>>> +	/*
>>> +	 * Synchronize access to members the of driver state, and ensure
>>> +	 * atomicity of consecutive regmap operations.
>>> +	 */
>>> +	struct mutex			lock;
>>> +	unsigned int			num_lanes;
>>> +	unsigned int			dec_rate;
>>> +	enum ad4080_filter_type		filter_type;
>>> +	bool				lvds_cnv_en;
>>> +};
>>> +
>>> +static const struct regmap_config ad4080_regmap_config = {
>>> +	.reg_bits = 16,
>>> +	.val_bits = 8,
>>> +	.read_flag_mask = BIT(7),
>>> +	.max_register = 0x29,
>>> +};
>>> +
>>> +static int ad4080_reg_access(struct iio_dev *indio_dev, unsigned int reg,
>>> +			     unsigned int writeval, unsigned int *readval)
>>> +{
>>> +	struct ad4080_state *st = iio_priv(indio_dev);
>>> +
>>
>> Missing guard(mutex)(&st->lock); ?
> Aren't regmap operations thread safe? (own internal locking).

For single operations, yes. But I assumed that you added the lock so that when
functions that do multiple regmap read/writes don't have another thread doing
a different regmap operation in the middle.

However, it looks like ad4080_lvds_sync_write() is currently the only function
like this and it is only called during probe. So it seems like the extra mutex
lock isn't currently needed and could be removed from the driver entirely.

>>> +	if (readval)
>>> +		return regmap_read(st->regmap, reg, readval);
>>> +
>>> +	return regmap_write(st->regmap, reg, writeval);
>>> +}


...

>>> +
>>> +static int ad4080_set_dec_rate(struct iio_dev *dev,
>>> +			       const struct iio_chan_spec *chan,
>>> +			       unsigned int mode)
>>> +{
>>> +	struct ad4080_state *st = iio_priv(dev);
>>> +	int ret;
>>> +
>>
>> Don't we need to check for < 2 as well?
>>
>>> +	if (st->filter_type >= SINC_5 && mode >= 512)
>>> +		return -EINVAL;
>>> +
>>> +	guard(mutex)(&st->lock);
>>> +	ret = regmap_update_bits(st->regmap, AD4080_REG_FILTER_CONFIG,
>>> +
>> AD4080_FILTER_CONFIG_SINC_DEC_RATE_MSK,
>>> +
>> FIELD_PREP(AD4080_FILTER_CONFIG_SINC_DEC_RATE_MSK,
>>> +					    (ilog2(mode) - 1)));
>>
>> Otherwise ilog2(mode) - 1 could be < 0.
>>
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	st->dec_rate = mode;
>>
>> This saves the value the user entered, not what the hardware is actually doing.
>> It should be saving the power of 2 value instead.
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int ad4080_read_raw(struct iio_dev *indio_dev,
>>> +			   struct iio_chan_spec const *chan,
>>> +			   int *val, int *val2, long m)
>>> +{
>>> +	struct ad4080_state *st = iio_priv(indio_dev);
>>> +	int dec_rate;
>>> +
>>> +	switch (m) {
>>> +	case IIO_CHAN_INFO_SCALE:
>>> +		return ad4080_get_scale(st, val, val2);
>>> +	case IIO_CHAN_INFO_SAMP_FREQ:
>>> +		if (st->filter_type == SINC_5_COMP)
>>> +			dec_rate = st->dec_rate * 2;
>>> +		else
>>> +			dec_rate = st->dec_rate;
>>
>> As a concequence of the above, this will return incorrect information if the
>> user didn't enter an exact value.
> Isn't the user constrained by the ad4080_read_avail for entering the dec_rate values?
> The user both writes and reads the actual decimation rate value. The conversions are done inside the functions.

Yes, the oversampling_ratio attribute is calling ad4080_get_dec_rate(), so
that one is OK, but this is the sampling_frequency attribute. Currently
st->dec_rate holds the user-requested value and isn't necessarily the same as
the value that would be returned by ad4080_get_dec_rate(indio_dev, chan).

If we dropped st->dec_rate and used ad4080_get_dec_rate(indio_dev, chan) here
too, that would be an acceptable solution too.

>>
>>> +		if (st->filter_type)
>>> +			*val = DIV_ROUND_CLOSEST(clk_get_rate(st->clk),
>> dec_rate);
>>> +		else
>>> +			*val = clk_get_rate(st->clk);
>>> +		return IIO_VAL_INT;
>>> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>>> +		*val = ad4080_get_dec_rate(indio_dev, chan);
>>> +		return IIO_VAL_INT;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +}

...

>>> +static const struct iio_chan_spec ad4080_channels[] = {
>>
>> Array with one element doesn't make sense. It can just be a single struct.
> Isn't indio_dev->channels expecting an array?

No, it expects a pointer. So &ad4080_channel; can be used to get a pointer to
a single struct instance.

