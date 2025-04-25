Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273052F88
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615785; cv=none; b=W5qId278ZXaIkFSFPHx9OF0QhYXXoaLFeLMn1uhvkmsLWIeT6dZKK6rK4pmYunDgbaNm4UQhYVRTCaXYfK16kRRrbm8u61+nATAz0H2gTyG6mROIE71/QuO2j4QYUaC9Ra0/pr1W/ri2Ti+Kzo/Sj+KlAHTKQtuwuytvBC77AJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615785; c=relaxed/simple;
	bh=gfFhdTGxHbl/LD37YDzvdKH+lTSppcTv0j9nC41MXw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYIXE+bRoR+RAJ/izgh/ClpzTes4PgTUrs3VmMlR4iSZZ4qSWx6m3kmfc3bQY6b/sLzHQypLZ3RgRTo+PY/a3adLTD7UzRFWRr72gv6xilZRuTByU0baed9Xnh1D/a1U206tb4FLgASamvPkzCvwl5qciDRtNL05YEzcU8LhcD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AwwVQTCP; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AwwVQTCP"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2d4f8c42f49so2172129fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615782; x=1746220582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTz9I5enTaJxLVBqLDZUEqU3il7OBimu59UQoHiVNMA=;
        b=AwwVQTCP2K9CKA4fyIHrFrdBnoSQuw+MGhcGYT6karBo24u81I/NgHboYE4KWjBdQZ
         2jQ355Uf85ipswqalfYQOcnB16PMRY6/0n7RE6yggkwGwkWUYKylHYzst8PqwPW7gYLa
         LuCp1pVUCBENWqDqqZli/UnyZCr9rgILrG8I70DDHpcgV6uawgL5yOTmD9eOvdN6+LUC
         x6v7v/W1/OTZ5h5Op2bhbChw+s938Q4jp6xsXc4xotwC0QZ0FETfq/4faR2AkUYg8GrO
         iIraHhbsryGCdQU9NCNKo635EYhf7DzZ4ruUihysiBC2+a/89G2X+9D7yPNc2E3UkAFo
         e/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615782; x=1746220582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTz9I5enTaJxLVBqLDZUEqU3il7OBimu59UQoHiVNMA=;
        b=FKdnPDASEVSx1MRPYl5NvpzyALFwyjLDGvBU/bPAlpElKbz86UNNUNHKTx4ML+5LQk
         MPWl5cFVbduAxaXaaQHvI9uXJv0zm2NUb+Fv8kJb8N/JhIQdVsSU/AXCTFpu2yBEo0Bl
         L/XycRQkdbj1Uu77UBg0HD7WRGtwxcXakKJvZvvWKKKZMKkNjfq/R0thiOUxx4x7xmHc
         KoJaS+EPiuNWpM8JESgudVm1QgZ/bQPDie7jNL4G69n2KRxwE2DKEZ2mcIfO7H5XzvJJ
         1sFjZfOobccAqX/a2iihuG00BLN4EtDH1U0jem05n01VtdkigWJqpBmxlp52pjqfhKhP
         FXzg==
X-Forwarded-Encrypted: i=1; AJvYcCVaKhDBSyoJ4cObxyFuQMt2oH80c13f3/ET3083BB0X3NGc399BwCZceJbrIIgFpTNj+9IQasmpUsVbf8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIkrcg+u0fFju3MtnwmUZoLvwyYQ+kZ3Ms0y8a6SEqPfvflqIP
	0k7FK7oT7/qw0X4u0QlynYlQuR+OxoKFDZ6g6E6eV4Q+0QwpxjqtPaMdgpj7iQU=
X-Gm-Gg: ASbGncvBV02y2EOelemPzxiBq9s4HsGVFiz19CEuIDDUvv8WqXtpVa1nD2/F1i/KBmE
	NK/vciOtP2kzWi00HyzpbWr0ztkBuWIeevztJivl5vwrN26Q7fwtj7YNXWs8FCQwJ6sTGy2GIk1
	3gyN7kbQrgbu26BxXJG9r3aSyZzwGpCnfUsg6HjeaVszh9gN68ltGcyrBVKr2ZymVyatChW7Or8
	jadAIQs+neMRv0jrqNXuUoQNN8+CZlgJL6/qDBeG3kxPBTU2N/Xw9uG6uMIZ8BuDiz8OmF8vuQ8
	ZbtY8pBsHyyLWNv2wQurJ6suOwAt0nTH8OhKHQOcY/CM5s4p9rQCWsCGJSzJeEI8tkj3p8yWSq0
	vW0y2gsAYg4NZ
X-Google-Smtp-Source: AGHT+IFP6Q8OseGcSbnqWqVTrZCG0R7+HN99jIze+0SssGMO+saUY5k74kZJ24hu1RttCmiKMZvjBQ==
X-Received: by 2002:a05:6870:611e:b0:2d4:e8ce:7bcc with SMTP id 586e51a60fabf-2d97317915cmr4604390fac.8.1745615781776;
        Fri, 25 Apr 2025 14:16:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:96a3:e28:3f6:dbac? ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f37b12fsm848940a34.43.2025.04.25.14.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:16:21 -0700 (PDT)
Message-ID: <143ffe9b-b32e-41ea-b5c7-855c680b48d4@baylibre.com>
Date: Fri, 25 Apr 2025 16:16:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] Documentation: ABI: add oversampling frequency in
 sysfs-bus-iio
To: Jorge Marques <jorge.marques@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20250422-iio-driver-ad4052-v2-0-638af47e9eb3@analog.com>
 <20250422-iio-driver-ad4052-v2-1-638af47e9eb3@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250422-iio-driver-ad4052-v2-1-638af47e9eb3@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 6:34 AM, Jorge Marques wrote:

...

> Devices with this feature are max1363, ad7606, ad799x, and ad4052.
> The max1363 driver included the events/sampling_frequency in
> commit 168c9d95a940 ("iio:adc:max1363 move from staging.")
> and ad799x in
> commit ba1d79613df3 ("staging:iio:ad799x: Use event spec for threshold
> hysteresis")
> but went undocumented so far.

It looks like this part was copied from a different commit and isn't related
to this one.

> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 33c09c4ac60a4feec82308461643134f5ba84b66..129061befb21b82a51142a01a94d96fcf1b60072 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -139,6 +139,23 @@ Contact:	linux-iio@vger.kernel.org
>  Description:
>  		Hardware dependent values supported by the oversampling filter.
>  
> +What:		/sys/bus/iio/devices/iio:deviceX/oversampling_frequency
> +KernelVersion:	6.15
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Some devices have internal clocks for oversampling.
> +		Sets the resulting frequency in Hz to trigger a conversion used by
> +		the oversampling filter.
> +		If the device has a fixed internal clock or is computed based on
> +		the sampling frequency parameter, the parameter is read only.

Don't need a newline after every period.

> +
> +What:		/sys/bus/iio/devices/iio:deviceX/oversampling_frequency_available
> +KernelVersion:	6.15
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Hardware dependent values supported by the oversampling
> +		frequency.

		oversampling_frequency attribute.

> +
>  What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_raw
>  What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_supply_raw
>  What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_i_raw
> 

