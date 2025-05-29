Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888422B8B3
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748541139; cv=none; b=ofK/1yd3k2LQF27t9E9/ExPvfPSN/6tvSMmjMTfuBKaPMu+7rXHaLncNCyuW/gpsKu1JoLkQJjFo50nSI9tbedOqnQQk+Hq2HrK4oUD3jaywSOqpav2+IlvWwYXBZ7X6VhRLW1wpAf665aK+qc5Cx5f7WlZIKExcQU+ph2caB3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748541139; c=relaxed/simple;
	bh=lZU9jQ+SXA+/p9RtnHyvE89sIS9AcJdWmjhJSFZMhng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBNZPajiOlqiieWYMy79K6ttpN93e+rVi/YFIkIcfXERs7zXAK3VscehSIer2OMntkjb6py76hX6tRFY7NDsLii9VeonQEXZjRsGW7UXHCe8uF2sJJoARtwBloLmeXu1+m9U2CsoZprH2AU+NYqBeziyCWrf+MhRW4cdqD6Sy4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oOL386Pf; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oOL386Pf"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2e3dea42465so788741fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748541135; x=1749145935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vC0sqM/mEIe/u85Iuk/8I2v+DAnDds+oTgi8MyInJSU=;
        b=oOL386Pf1Cz4WYZyLViDtGZExqj2zH6P+a0QroIfvAhowyqNaCsTVR5oaREHg/71ho
         5nerNe0xPDv4qcgpx2JuAZ/jFGsW9jsV12bIdRGw33ALENMy9cEtg/cNhewKBDKnjvsn
         h2kXZe6zu2TMweaUMbHqG8LxgPqvBCbhBuMTnxz/UrDJT61Mb5pQxnOGEdJTFGlAZRfk
         1lfZuXr34YqFtYJDzSQ39V0Rn1pD2C3gU9ZOPE57B9WtttuicwMdW8xRkFvL8Mytlqjb
         8Ns0cEmJ63p/VUoD+mWQwUC1IfzjQ7aV8RlB+eAcz4WMWjMhWXpQpAym/SjE8iaa0uPt
         Jsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748541135; x=1749145935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vC0sqM/mEIe/u85Iuk/8I2v+DAnDds+oTgi8MyInJSU=;
        b=PhXBnc2Ke3oeB7Rsb2HUMAjT++HX0Pv5hjVgoU78VSGkFQ9kUGBcMQMs/2j7ahv9lP
         BgB7y5nErhQExdV4Ha0kjvXEgNwG1y6bfAl4CXBDvuAhZ2jVW7+aSjGfsQUfmz6aaPIK
         MgYDHI+bNpep0kcgHg9ySD7EGuXH/gizEyHM6NT2L8b5XGmTJ/EQVZ9U7OBDeF4MLwOd
         wAove7xRfOZ6v4pzNBTuotu1nMlwb01ZISDJ33w2nxXqvcv1kL/y+KK2bDpPXxPpzM7f
         C8PJlup+CMZSVmXLa6e16pBVfoGTlJJCq+D3OXGYbUzctf1bTMpCVlF8gvZH//DbR5+a
         cvNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLOHLzFowvZED9pQxNXkAIEL4kVvRGPZza2umqymr5A+jlVMN/X1mlrSWr4Oskxy1MSfbv4f/lYWXVlJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKDoRizXtgSD+nM8bhVXhVBJUJBaF7B5+rzkWhGlX2YS1l0HW
	rMMcecTmMBHRdE1HsXX3pj53HDLbyl0yj04zKTCt83Rhgi2k2XbVxMfsP9MA80H4rB0=
X-Gm-Gg: ASbGncu/n8ATqHuroA8vx1xk8JXZDH5Yy0T1ArteT13u43ThCgKMg80xE021qeCEq/b
	i0qqZ+Q+yC4l815qvhkmbfbOXPWwOaV4xpW/C0ympL77Gp6Zq1Fhw5SLlg7zQ8mJ71iV6rVeQtr
	LVg2Jdr56XhD5mKbilEr96Vm67UrDPMnyBSS7OHeaWdYUnry79iTW+lJay8tBPuJ+v8u7Oem3s8
	1ysOAOQ4yA3P+BrDZ98IvNmkkCp9FqQW28TU4MNI+SwtcWb0dIaSCQRaISJY7Ytr8KSMnvqDcWg
	IX58Hpou/7CwPNeAvFbmrZ+X627Obq9T8PT7jFV19GHT87oeShzbdKdY9t8losQrRv8RfqTFBVR
	Nz22I4a2XMefgctHCVX3hFRiYsw==
X-Google-Smtp-Source: AGHT+IGt4UUSwC+w2devQaz+4TwMifJlJrW3G/nBO0+JgCycpD5mxw4Ay5R9igDfQN0hx19JjOCzAA==
X-Received: by 2002:a05:687c:2ba2:b0:2e4:9c8e:f59c with SMTP id 586e51a60fabf-2e8fce259ffmr2234622fac.19.1748541135139;
        Thu, 29 May 2025 10:52:15 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4? ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906c11210sm351409fac.44.2025.05.29.10.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 10:52:14 -0700 (PDT)
Message-ID: <521f5868-5836-47d9-9a68-88a9d4e843f6@baylibre.com>
Date: Thu, 29 May 2025 12:52:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: ad7606: add enabling of optional Vrefin
 voltage
To: Angelo Dureghello <adureghello@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com>
 <20250529-wip-bl-ad7606-reference-voltages-v1-2-9b8f16ef0f20@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250529-wip-bl-ad7606-reference-voltages-v1-2-9b8f16ef0f20@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/25 4:13 AM, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add optional refin voltage enabling. The property "refin-supply" is
> already available and optional in the current fdt dt_schema.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  drivers/iio/adc/ad7606.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
> index 3bbe9c05b5edbc11e8016c995c6ab64104836e7b..21e63260965c32988d0ab3b8bb1201aa2396f1ba 100644
> --- a/drivers/iio/adc/ad7606.c
> +++ b/drivers/iio/adc/ad7606.c
> @@ -1335,6 +1335,10 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
>  		return dev_err_probe(dev, ret,
>  				     "Failed to enable Vdrive supply\n");
>  
> +	ret = devm_regulator_get_enable_optional(dev, "refin");
> +	if (ret < 0 && ret != -ENODEV)

< 0 is probably not needed.

> +		return dev_err_probe(dev, ret, "failed to get refin voltage\n");

We aren't reading the voltage, so the message doesn't make sense.

> +
>  	st->chip_info = chip_info;
>  
>  	if (st->chip_info->oversampling_num) {
> 

