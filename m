Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA111E51EF
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625460; cv=none; b=R6BrCbAmMfpoUuHoXniUqpk5af8GG4BglxZQJR3zUbHDTAOY3aAGALD6HLoFyqRIDKM5x2EXKEYPuZLcCzOV717O8RN5EsxibG6i2PZApWvgb4SwKWk4QRqIMnXUiVlHav1gy1eO4OaCUQHTE7vqGwhUlBlkKCB8TW11JA2N5hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625460; c=relaxed/simple;
	bh=u0pudonnZMMkqw9Nfj3bn0eaMI+R5dUwb0hhEPriVT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uv2VEKEpI7xJHN/p3ddGgiH9C1+ommQLk6TIXsybupPbXzzrfMi7RgwsnyclLB12toT6LevZOhFSE6Oua37xIbKx7goiPvs4bRhAwSi0NTn1/GCu1/9fqo57o/kFxLJJvtI2iM+/b/pdB8S2Y6XTs84T+JKZ9DT1MoUeVWu+X4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UPurXx+5; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UPurXx+5"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c16e658f4so1564118a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748625457; x=1749230257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgMLVyd/FWmR+p0LRFwojmTi1e0nsIp3Am2A4nMf1Is=;
        b=UPurXx+5KunV2HG3dozf8YIEhc8Qby6JmNey1tb4UzyGkOCT1Wsza63vlT7AtoMqZc
         at3/mVeNPekDXku5zD/cl+e4kz32UOkaGy91I3qTnriHi0EJrHePprLns6CGliOPmMJQ
         8UdjdVUYg13/0hr1S96kUT4etwWI1qNHTM6oD6z8mWcZrEh2wZcoNp4YiSQ5touIm1YW
         bHStNlmrDTbSEiV7RcTeUw+3aELk3faeVoxpcNvJAaH0lR/UBbbum6PnfyQKc7nn0TLM
         p8ttLdBoXGMA1kEof0USe61IDedkij1fBALSKjTjjXqWhbIMt6XJqdiktvpJ/eZebL9N
         HT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748625457; x=1749230257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgMLVyd/FWmR+p0LRFwojmTi1e0nsIp3Am2A4nMf1Is=;
        b=ZHAtGz7TzY+pFz4zJdyTd3T4Ije70g+IzV+mu1wJHDY96qutE6wwgwIsWCkgoVWApi
         R+TOu5SCmntdbtJLae2WHqVQHkpeN5tPy/AzF9M19AIsVRJ84G2OH9DTKqgLAGwI401V
         pISXOw7fWrLkOHKOYLGLThj++QqKdRJGLcBoeR/WLYrpKNEorumXECiLhkiz7Ny+GsuG
         PaV2ro8EhWdQUxTIXHOHfijRiLbkSSh/AkqJgKs82tEG4sIw8dV7fSHNNwMXMfp3GsP4
         CauuBSUm9MYOEUEuDXwvQjiH3KhY6ckNTYp6ZpgfPjlfbWiIKoS2oT9CPIALH4nqMOd6
         K55Q==
X-Forwarded-Encrypted: i=1; AJvYcCUI1cec10JJnFdNeY/dNshZLqvIEMRClY7ilWfIFUvC8SPFxUzmdk/xUcYQxgLvVhy3MfYG8NXOX7Fef9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIBwJn+JVFxamZPw/G7ca1AllZQxMcVsGXCC3bWrpk3HkVToLm
	c+69EqGCKmHh6EquXm8XsXnpBx6bFntTxs0slPixdD9ay8OcGc4RZYQ9t5420yrzK3U=
X-Gm-Gg: ASbGnctKDDbVOTZJQMX89xmU/goK5+ltEUM3roqsYf2wt/1vR5ImuCAOX02MDs4ztYs
	YrA4kt65Wr9n4gJpVxeoV1T9J37ETwYMw7fPSpcvXbfIdOzu0EysY2KJD/RgIHbOvqiJbWnYYnt
	RWrGdVmB/otCwQWbWOOyNjPI6ycA2u8xVSmgNyLW8+KiXQV7V4lVr7IYgIO0Ol78Tm7WXCJrgWt
	jOXqsNlm/gRgiW5VS8MN7JXpS6ixYlyM3T2lBFz/SwBh1r+2YjH5PeopH1BEA6eq3pzvVNPuyrt
	vXQGLWGNgegrwmQA04HvCiWhcPgoUellL8quO0ErOsMzGmKOe+FT5x7UZUTEZPZwIJxwCBzfL/z
	kcwmmEKwceTRqwRZ2ral8IZ8bSFt3
X-Google-Smtp-Source: AGHT+IG37fo+p9U9K/BQXLTH02uBUwB2n/lqoTv/Cosxft6lXahHVw3E6hEbyvKq+w9tFJIaBh5n1g==
X-Received: by 2002:a05:6830:4986:b0:72b:9674:93ed with SMTP id 46e09a7af769-73670a7cffcmr3085713a34.24.1748625457300;
        Fri, 30 May 2025 10:17:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777? ([2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d2b8sm659735a34.3.2025.05.30.10.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:17:36 -0700 (PDT)
Message-ID: <455de3ad-73df-4940-91a8-1416ead37b49@baylibre.com>
Date: Fri, 30 May 2025 12:17:36 -0500
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
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---

...

> @@ -1444,6 +1485,13 @@ static int ad7606_probe_channels(struct iio_dev *indio_dev)
>  	if (slow_bus)
>  		channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
>  
> +	/* Setting up gain calibration for all channels. */
> +	if (st->sw_mode_en && st->chip_info->calib_offset_avail) {

More logical would be:

	if (st->sw_mode_en && st->chip_info->calib_gain_setup_cb) {

> +		ret = st->chip_info->calib_gain_setup_cb(indio_dev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	indio_dev->channels = channels;
>  
