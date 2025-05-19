Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042BD1A38F9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667895; cv=none; b=Ht9joa2NjRwxh7KAQ2Nj3iJR9B9CT+iMHEKxht9fVdffxSrEM82OGGPkF7AjUoUtkSk1dySzgcEu+evhsZ8PUoVnRRKaGfTn3NcSVo5AIgQj1VSAN5OR1RYIgmTnfM2TdXLf+vEFmuwfB/is8tLUjiGUWbQzJSmY7gBP3ViTAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667895; c=relaxed/simple;
	bh=Rx3zYptxBi5JTCs/R51tw0ZrBBlrd29YDsFqOaDz5Vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mbqI2ALXdOrVklbt7OXyIpABmLvJemQrVhYmQ5GKwBYuFxZPkacZTnLup0DxJudVIy8PFUIMv6zlFvuI2mr74Fc1/O1T0GQH/QvhRZwMpipEQnbTLBStm9FFRxYGDVgAgw9W5jGNpz8r/j0Lm/oBZuzFeGHa68RWPFUQazO+Ni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GTHes2Bg; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GTHes2Bg"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c27166ab3so3839647a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747667893; x=1748272693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T96N+pvFY9kP2MUGK09qDnVnDZb9ZunHgWVFq4RJ2rw=;
        b=GTHes2BgPnmBdPFDjAoD7OA4gn61mvQtvvN5DBJg843uQSPKfU75PiachpKNt8S0qv
         jPLuvH3CdiKM12CAoo1LuM4sSDnmPVHyS58yb0qaF0Eg6WM47DqjI9nF3+rDO7LDVftZ
         rYbq/MggDEaMh1pnFEDehUW1+b6EPVI2cfWcv6eE5p7MXk1474si8A1WetFWbM5Sl4zi
         K+aEJ/VBxkQ91X879Ze+9WJDQRLMqzqyt4Rd/e98rtMEbrsINXeoIpaEPdg0SuBHoGwj
         CDE44dqTQ8GJfaRam0r9DiDPlbL+Ac31c4nrMy50K3HOly/F+iUjsyS/jwODLO5NVLWe
         0FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667893; x=1748272693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T96N+pvFY9kP2MUGK09qDnVnDZb9ZunHgWVFq4RJ2rw=;
        b=J5kf7ES275lsv78k+AyA3HMeWufDAMDlQOb2qK1cxAI8PR1kbuPz4zzUWoI+kiV9N3
         dufgMT43R2wWn2zQffeBcsOVDAI+gsynrw1ba4UmqcMimMLdoxnt0gQ370eDV5q0feQV
         UAerDZzK54mjj5Jm4TwSk/gqkSN5HSklpZGZHTXbNm3ZQ4YFzwpH5jsu7GBoAcon/nFu
         tHIdQ8GsZHMO3oPN8WQa5VEi+zpwdEugV5zV87B0e2Bu0XLguIK9Q0vcdwlHZzSSnH1B
         hGgsTT/NJZ9yfhjq1rL81SoqTWP+9PJoOU3ka5qnbCdy7JThtQ0Y3L7+w/+xxfVqsF1W
         M5dw==
X-Forwarded-Encrypted: i=1; AJvYcCU5dFARTJDwh1B5EH/4ayvuzW9MS4SIqBML3qH0W3WIsMB2nWABzZYeZzrOSVJFMJeQ1PTVJN8+vFHNSmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlP3lRkfs8h28x8XGnBdmDhib6OWwk1WagAD+O2cc+HtGc9JU
	8yWMj8Yc+Z9aS/80KQNExgd3QPYldi4eD+87CXXcK+Drn4mIBWSxOX7r8zChAzVhs5Y=
X-Gm-Gg: ASbGncuklmI3YhmALUNeYMPfKKsnZSF755h59OYdefWLNp4jWlNLjN6ALLw3NL1OCXr
	IwEHJyCZvDN8fEOY8+hz5c5Mt/imieKPLS2d1XQYFhUZZdZGiI/ba116nzlkEW0TkHMOXeT6VRI
	lpL1QFWd2AjYz31prUa5xTlX4MionpAZRqPt2295dVNwfo9RsQscZvw1ssvKG0aHs9EZj+vpQF9
	I75sjHqiLnpPIbB+mI+EhSHeZnzo/gB4yb2YXHNPJtwyY+QArqNzpmYLh5tzPxUEyIWCDVA+omS
	zQ3z2qUkwdnyvonEk+NcjU3Bm528L3MAeUTVnpL4BblVEvWaa6KRVtIoTxCL7RNaWtCqDWHn8FC
	uh2rT3TRgw57Jdg/RT5JcMtUjeA==
X-Google-Smtp-Source: AGHT+IGB/HriQviRtu/8iWOaRIKaq0ZgLjfc0mLpRi6MUJMPeCnmdmCt3rySX0k7UyROtPzwY/xI2A==
X-Received: by 2002:a05:6830:6018:b0:727:3f3e:53bb with SMTP id 46e09a7af769-734f998b704mr8209365a34.24.1747667893076;
        Mon, 19 May 2025 08:18:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a9a654sm1442928a34.33.2025.05.19.08.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:18:12 -0700 (PDT)
Message-ID: <c95fb95d-f892-4dda-abb1-0b5ac98454c8@baylibre.com>
Date: Mon, 19 May 2025 10:18:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] iio: adc: ad7405: add ad7405 driver
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519140220.81489-1-pop.ioan-daniel@analog.com>
 <20250519140220.81489-7-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519140220.81489-7-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/19/25 9:02 AM, Pop Ioan Daniel wrote:
> Add support for the AD7405/ADUM770x, a high performance isolated ADC,
> 1-channel, 16-bit with a second-order Σ-Δ modulator that converts an
> analog input signal into a high speed, single-bit data stream.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---

...

> +static int ad7405_set_dec_rate(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       unsigned int dec_rate)
> +{
> +	struct ad7405_state *st = iio_priv(indio_dev);
> +	int ret;

We probably want some range checking here to make sure dec_rate is exactly one of
ad7405_dec_rates before passing it to the backend.

> +
> +	ret = iio_backend_oversampling_ratio_set(st->back, chan->scan_index, dec_rate);
> +	if (ret)
> +		return ret;
> +
> +	st->dec_rate = dec_rate;

Otherwise, this will report back a wrong value to userspace in ad7405_read_raw().

> +
> +	return 0;
> +}
> +
> +static int ad7405_get_scale(struct ad7405_state *st, int *val, int *val2)
> +{
> +	*val = st->info->full_scale_mv;
> +	*val2 = st->info->channel.scan_type.realbits - 1;
> +
> +	return IIO_VAL_FRACTIONAL_LOG2;

Probably not worth having a separate function for this. Can just do it inline.

> +}
> +
> +static int ad7405_read_raw(struct iio_dev *indio_dev,
> +			   const struct iio_chan_spec *chan, int *val,
> +			   int *val2, long info)
> +{
> +	struct ad7405_state *st = iio_priv(indio_dev);
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_SCALE:
> +		return ad7405_get_scale(st, val, val2);
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		*val = st->dec_rate;
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val = DIV_ROUND_CLOSEST_ULL(st->ref_frequency, st->dec_rate);
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_OFFSET:
> +		*val = 2 << (st->info->channel.scan_type.realbits - 1);

Isn't this supposed to be:

		*val = -(1 << (st->info->channel.scan_type.realbits - 1));

2 was a typo by me, but hopefully, you are testing this and doing the
math to double-check it is correct! I.e. generate a constant voltage signal
and capture some data, then convert it to mV with (raw + offset) * scale to
make sure it matches the voltage being applied to the input.

(I'm only human, so believe the math if disagrees with what I say. :-p)

> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ad7405_write_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, int val,
> +			    int val2, long info)
> +{
> +	switch (info) {
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:

val can be negative here, which can cause it to turn into a large positive
number when it gets changed to unsigned since the last parameter of
ad7405_set_dec_rate has unsigned type. So we should either check for negative
first here or change the parameter to signed and check in the function.

> +		return ad7405_set_dec_rate(indio_dev, chan, val);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

