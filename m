Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AD51F2BB8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751140920; cv=none; b=a9iApeUnUwMcomjKvHomamtX3Nj9JaOTBxYaJ8bKnWiZXbYPMSQpY1NLNoW6fu5bNfecQfcXODe6tb0RLSptWhLSsdVsRMjdhoQQdbqb0QEB/K84TlrarOfQ+FyUq5e5sLFT9B1z9khE6l50WtfnjP9ia0BQBkt7st1K745hSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751140920; c=relaxed/simple;
	bh=C25dUvtj5jbXCc2sJQq1wwn+HEsXVicpVUN74cxm2Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za69kGHEV1YeJ/QgOEtRElCExJbwQIRit6AkH96dj9zUUBFE87Eu4RVJ6P1uM451dPMkTcEavaM+EJmlRW4nbhyoddq8flkrXx3MsLOCVvK6nxWMAcYPzPFMrqWodDeM0N+O1K+wRKaS3zExS7Pu77yiXq4w4e3O5biM+efyfS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=w+vkzI6t; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w+vkzI6t"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235ea292956so5814885ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 13:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751140917; x=1751745717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rCb37RSYZzDO3GN3ihbvCvxF6ZjiXzcFRXh0BRgUocI=;
        b=w+vkzI6tnkiqBACLmMkydF3fCy6gh+QLh8x1bo+8qV7oPp8oEXipe7uOWInSiLD3mp
         TxeWT/C5PJtS+oyZhn/yLw9ogBA5I2dCyuGLtejRbcuUj0rX8B+pBx1CBsZTNFN0pZJy
         nfZR3p5zt8cZclh6AvprKORcjsNXFjOhVp+qYDPO71bud+Qd9Gpswb9ZAp5NbfRo8MpS
         9K5BCg3p9VKxgZ/aZk/m5RD7J0djP2H7hkUemuPwsYz8OWsUYCZi6lIA4dez+bFhbNP/
         lR3lIInAYmoCggTUKPdptLvTnKmyal9dKt73Zt819fc643YmOjokOlhcCuBjHFNCT9RU
         ipig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140917; x=1751745717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCb37RSYZzDO3GN3ihbvCvxF6ZjiXzcFRXh0BRgUocI=;
        b=TiaodEsf8/fSrtqzDTCgjOQsY/VlwQKrBzq/LdHwZe8qtTNNMHHkLd2ifpeZQL9ft6
         7QBJZ4MoGyqWdjPSPI0GogOP/71VCWv2oJGD+dsuint5KqpRML1g8CyXVxQ+kLTGNZil
         Mp05+S8Sfree0KPiX0ewDgIqwnSHUC6oI2q2IUBl3DqHqcty6H337LCxsNBdMtl9oBq4
         SSor4b5ANG1Um4kFbsOEoHRxjOUC3Fj2LG8h6wtjvsJOKSEAKv/20Y7km8jx317VW/i3
         SSJTpbJS2gBKLj92Mmp+CsZUEAL+k1GwgaJqesTxup3gksHP/ozpPgpN3i+FFeArHnA7
         l+4g==
X-Forwarded-Encrypted: i=1; AJvYcCUJHASihMZtjjXE2Q1/K6PJ+RHXdPCKrkP7iA7gPG2pq74uaYGcmcF6E0TbVuRBJWjttJjWLUSg+5pSC2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjTAccsXrbNjEMMpwZfgPOmImA6NW4Xff7unRwideNIILyp0MB
	F0p637feCX0KYQjHzE3ywjsof/SP991pLCzLDXBN8aurWA8vG2iGf3Lj2p5KSziatlw=
X-Gm-Gg: ASbGncv5XwRp63yI4bUzydSx7HPyWMJ8IGOq2+smAm+KPmkwhfEJo8pMo9Pc9g1+hu4
	V3hOq7eQsRyMTK/hX5yd8jmlqPrGYo6B3gDN/U8UCo2U/A65mc2qYEhQykiY5/cKrT/xlQDQbj+
	9jExARy3lilIyMlFkrcd5IadO2JcGtH32Hk7W/nLuZMcCFqA8QsKz6wThQWCq6Ddn7txD02/UWZ
	xdI6xZbHhKINRyTogfansbj9SleZNvJQ9EcDlyakQ/T4/FZaijBRA1UmJO+s+/5xyA8NOc9Y/M0
	C4shYtG/mUHBKSZAHzwQuCLMnuvwTyDCQ99Bs6jTtFIzJBEkVh3Nfpe8zm1E2lHGJXxRGp+U33Q
	Ca6VwDy4yvny5P3rL1yTMfw==
X-Google-Smtp-Source: AGHT+IFJDLrx7ywjg4S4bUF/qUoRM9GFUNFWqz+Q59e4xQXUhehdQBrs0a8xNAd+1AuhXOTd7j4eRg==
X-Received: by 2002:a17:903:2ecd:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23ac3dec4a2mr106216265ad.8.1751140916690;
        Sat, 28 Jun 2025 13:01:56 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm46210995ad.62.2025.06.28.13.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 13:01:56 -0700 (PDT)
Date: Sat, 28 Jun 2025 13:01:53 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Nishanth Menon <nm@ti.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] iio: adc: ti-adc128s052: Use shift and realbits
Message-ID: <aGBKMcZGYOcXmKdB@dev-linux>
References: <20250614091504.575685-1-sbellary@baylibre.com>
 <20250614091504.575685-3-sbellary@baylibre.com>
 <20250614142743.23ee2203@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614142743.23ee2203@jic23-huawei>

On Sat, Jun 14, 2025 at 02:27:43PM +0100, Jonathan Cameron wrote:
> On Sat, 14 Jun 2025 02:15:01 -0700
> Sukrut Bellary <sbellary@baylibre.com> wrote:
> 
> > This adcxx communicates with a host processor via an SPI/Microwire Bus
> > interface. The device family responds with 12-bit data, of which the LSB bits
> > are transmitted by the lower resolution devices as 0. The unavailable bits are
> > 0 in LSB. Shift is calculated per resolution and used in scaling and raw data
> > read.
> > 
> > Create a separate structure for each device type instead of an array.
> > These changes help to reuse the driver to support the family of devices with
> > name ADC<bb><c>S<sss>, where
> > * bb is the resolution in number of bits (8, 10, 12)
> > * c is the number of channels (1, 2, 4, 8)
> > * sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS
> > and 101 for 1 MSPS)
> > 
> > Complete datasheets are available at TI's website here:
> > https://www.ti.com/lit/ds/symlink/adc<bb><c>s<sss>.pdf
> > 
> > Co-developed-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> >  drivers/iio/adc/ti-adc128s052.c | 115 ++++++++++++++++++--------------
> >  1 file changed, 66 insertions(+), 49 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
> > index 1b46a8155803..2b206745e53d 100644
> > --- a/drivers/iio/adc/ti-adc128s052.c
> > +++ b/drivers/iio/adc/ti-adc128s052.c
> > @@ -41,13 +41,14 @@ struct adc128 {
> >  	} __aligned(IIO_DMA_MINALIGN);
> >  };
> >  
> > -static int adc128_adc_conversion(struct adc128 *adc, u8 channel)
> > +static int adc128_adc_conversion(struct adc128 *adc,
> > +				 struct iio_chan_spec const *channel)
> >  {
> >  	int ret;
> >  
> >  	guard(mutex)(&adc->lock);
> >  
> > -	adc->buffer[0] = channel << 3;
> > +	adc->buffer[0] = channel->channel << 3;
> >  	adc->buffer[1] = 0;
> >  
> >  	ret = spi_write(adc->spi, &adc->buffer, sizeof(adc->buffer));
> > @@ -58,7 +59,10 @@ static int adc128_adc_conversion(struct adc128 *adc, u8 channel)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	return be16_to_cpu(adc->buffer16) & 0xFFF;
> > +	ret = (be16_to_cpu(adc->buffer16) >> channel->scan_type.shift) &
> > +	       GENMASK(channel->scan_type.realbits - 1, 0);
> > +
> Even though it is a bit long I'd go with
> 
> 	return (be16_to_cpu(adc->buffer16) >> channel->scan_type.shift) &
> 		GENMASK();
>
Thanks for the review.
I will fix this in v5.

> > +	return ret;
> >  }
> >  
> >  static int adc128_read_raw(struct iio_dev *indio_dev,
> > @@ -71,7 +75,7 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
> >  	switch (mask) {
> >  	case IIO_CHAN_INFO_RAW:
> >  
> > -		ret = adc128_adc_conversion(adc, channel->channel);
> > +		ret = adc128_adc_conversion(adc, channel);
> >  		if (ret < 0)
> >  			return ret;
> >  
> > @@ -81,7 +85,7 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
> >  	case IIO_CHAN_INFO_SCALE:
> >  
> >  		*val = adc->vref_mv;
> > -		*val2 = 12;
> > +		*val2 = channel->scan_type.realbits;
> >  		return IIO_VAL_FRACTIONAL_LOG2;
> >  
> >  	default:
> > @@ -90,15 +94,24 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
> >  
> >  }
> >  
> > -#define ADC128_VOLTAGE_CHANNEL(num)	\
> > -	{ \
> > -		.type = IIO_VOLTAGE, \
> > -		.indexed = 1, \
> > -		.channel = (num), \
> > -		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> > -		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) \
> > +#define _ADC128_VOLTAGE_CHANNEL(num, real_bits)				\
> > +	{								\
> 
> I would minimise the churn and stick to existing style of one space then \
> I don't think we have any specific style guidance around this.
>
I will fix this in v5.

> > +		.type = IIO_VOLTAGE,					\
> > +		.indexed = 1,						\
> > +		.channel = (num),					\
> > +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> > +		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> > +		.scan_index = (num),					\
> > +		.scan_type = {						\
> > +			.sign = 'u',					\
> > +			.realbits = (real_bits),			\
> > +			.storagebits = 16,				\
> > +			.shift = (12 - real_bits),			\
> > +		},							\
> >  	}
> >  
> > +#define ADC128_VOLTAGE_CHANNEL(num) _ADC128_VOLTAGE_CHANNEL(num, 12)
> 
> I wonder if it would be clearer to just have the 12 explicit in each entry
> and skip this two levels of macro thing?
>
Do you mean to pass realbits to
ADC128_VOLTAGE_CHANNEL/_ADC128_VOLTAGE_CHANNEL as e.g.,

static const struct iio_chan_spec adc122s021_channels[] = {
        ADC128_VOLTAGE_CHANNEL(0, 12),
        ADC128_VOLTAGE_CHANNEL(1, 12),
};

I think we added 2nd level macros as ADC082_VOLTAGE_CHANNEL,
ADC102_VOLTAGE_CHANNEL, etc., to have a visual distinction for a different
part nos.
But I am ok if you prefer ADC128_VOLTAGE_CHANNEL with a second parameter
as real_bits.

> > +
> >  static const struct iio_chan_spec adc128s052_channels[] = {
> >  	ADC128_VOLTAGE_CHANNEL(0),
> >  	ADC128_VOLTAGE_CHANNEL(1),
> > @@ -124,26 +137,30 @@ static const struct iio_chan_spec adc124s021_channels[] = {
> >  
> >  static const char * const bd79104_regulators[] = { "iovdd" };
> >  
> > -static const struct adc128_configuration adc128_config[] = {
> > -	{
> > -		.channels = adc128s052_channels,
> > -		.num_channels = ARRAY_SIZE(adc128s052_channels),
> > -		.refname = "vref",
> > -	}, {
> > -		.channels = adc122s021_channels,
> > -		.num_channels = ARRAY_SIZE(adc122s021_channels),
> > -		.refname = "vref",
> > -	}, {
> > -		.channels = adc124s021_channels,
> > -		.num_channels = ARRAY_SIZE(adc124s021_channels),
> > -		.refname = "vref",
> > -	}, {
> > -		.channels = adc128s052_channels,
> > -		.num_channels = ARRAY_SIZE(adc128s052_channels),
> > -		.refname = "vdd",
> > -		.other_regulators = &bd79104_regulators,
> > -		.num_other_regulators = 1,
> > -	},
> > +static const struct adc128_configuration adc122s021_config = {
> > +	.channels = adc122s021_channels,
> > +	.num_channels = ARRAY_SIZE(adc122s021_channels),
> > +	.refname = "vref",
> > +};
> 
> Ideal would be to have this as a precursor patch rather than adding complexity
> to this one which is focused on the bits related stuff.
> 
> It's a good change to have but does make it harder to spot the main
> content in here.
> 
>
I will split this in v5.

> > +
> > +static const struct adc128_configuration adc124s021_config = {
> > +	.channels = adc124s021_channels,
> > +	.num_channels = ARRAY_SIZE(adc124s021_channels),
> > +	.refname = "vref",
> > +};
> 
