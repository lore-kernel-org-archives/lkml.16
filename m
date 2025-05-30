Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E301C8603
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625718; cv=none; b=fR/Z3r7NVDyMXBXX89/DS1eEXP09LgJPOfPpxm84mQNPNR/G1gZuHBvrscyJfUAs89fFYberp1fDlN6GY6ykylIQVzAPWtHs31cf2ZZ5n/tp5mi7ZjBS5VH/ItXVyQH6txa8JUD6Wn+kwAevB343BfTLhZ1RojyIpPxqEh4FTZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625718; c=relaxed/simple;
	bh=wX0obJuWwWvBhFCj6J1Giw1HxQdDFBK1JTnke8Tc1q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dx6r5OycBKsDqYf039RnBZJu1kWMNbbg34sRCr0RnyV3jMg6PJxlGuGnfIeZc98EAKRspKbCrFXkYZ07STSLGQW2go329xCZKZQAPKJbMTKQw6WCfqw5LNHDjfmE6TOdjPN4/cBYPsGT4zhg83G5pxGA2PtIPM25LxKzY6G5uSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nnFgPntZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nnFgPntZ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73c17c770a7so2592234b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748625716; x=1749230516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fx3LNtc1BL1NPZaSnlXRzmMDR51HZrm8EkyfaUNT3Vo=;
        b=nnFgPntZOYUnKp2l5ic/2a9SbrYgstFUrEqAwuHT1KMqdz8GdcuL5iH5oWPuRz5C3Y
         RulgW/UFoVeQD1kpxwsUU6j0IIKVjIv3TGcpb1Nkh3pPChNFhNy6L+79K6zHpBoTU0cB
         kgyfPWKp4zanxFfA61oMhiCHIZHWfBhYWd0GSHhf+SMZlS9v3RzB3fyAE/FYb2M0y0oc
         OEyWkQkUeYJFZRyfkA50vyvmpeR9NKouw9YidAIpzeOHNMXXROIuitlR6Rmujdd7E8O8
         YTL7fMSePXCpvVtXFpvBViDy0bbdxF+zWsn5Y/GYYoZhV9MUUtd0ikpxM9Lcb3t6bTSg
         2mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748625716; x=1749230516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx3LNtc1BL1NPZaSnlXRzmMDR51HZrm8EkyfaUNT3Vo=;
        b=MECRSsztkjezWRjEJEoseTMH63yNc9iWSZd21B0Io3qtvE5kFnjnmWvRCaT8UHGG/O
         FX1vonUt3MfTyidm8YlV2q7sRca02wK6nY7WNhubYkbIKPrhvnyWX2RGUJrP8a1VFcsH
         hEAfpU/qnvGmOLC4WTSh+Le0LC50N7tTwn+uiG+ek5tmz4sEuQOibMy8eGuKHsg9oaXH
         XqvpqRSAti1oJCe0Tba2KyUPnMVn2WTB/Fjw7T0yx+thQNwqq7YrKdecHL155b3cyPDU
         aQZOEIULio4+26yIap+cbRdj5Eysbjh80cpNoTb9DgLylpSgB4iKepXuSroWa4C+ucq1
         AqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqb4iTVzcUVCEDeoMXgKBrqc/PVKY3SGoyskUBz07lLJ6VfafPqYCaxx/NS8Fe32ZQlFVHPJDYDvOnBTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyviPmvNeGjmJqIU8EidceAJ2d9y6mC6vH+uCv9v5hsnNAwbGOQ
	Y1iNc3FNmf4mo/LTilrfcQ3Xd0ABHbeWR6e6S2xPZFijpDrm6NU2X6fZo+rN6AM/gReUAb78WH/
	nI2Yr
X-Gm-Gg: ASbGncuam8VGpAGOCQ/3sEHzeujxq/CaMg9KTmcGuYCmqtgwrYkt97hXAKCIREY5mP+
	JEQYQ6TiMnyP7qeurMxA7JFcD+TzsWNLjCuuIMRRd32nEkb6Eb7pvA1p14JfDuCRV3hr+TM6xqv
	Ougv+bJCBUO/jHupuMJ+MbSRrDAm+i4ZxPg7r0FJ36q+y25UmmNSV2iDs7061DMtAHvsW606O2E
	iLbobNbPbL86RG7X5ZLmaSNfcOtbAVwe3oBOO3w4TRwTqzrlANByRQ5RmfRvHaamiVN9pF3IZb3
	NyxvMGlZbwTOmJeVfKopIVihdYn1OzNghwoqgGBgxOz/p8yTBpR3TQvE8K28VcxWmGxALKRggGf
	qKS7B2CeL1ty4+4Axkde318gFlfUW
X-Google-Smtp-Source: AGHT+IGxQ4vx/p7gFcrPUXmfUl5nW4TgCsxZE4dbab/ZMJxQ+jpblaeElxTMSWbhudFctt+RNP7NeA==
X-Received: by 2002:a05:6808:448d:b0:3f3:e9d5:7790 with SMTP id 5614622812f47-4067962bf6bmr2154323b6e.6.1748625704848;
        Fri, 30 May 2025 10:21:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777? ([2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678ce830fsm453255b6e.31.2025.05.30.10.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:21:44 -0700 (PDT)
Message-ID: <ad5b68b3-75f3-440b-80ef-6fc58128767c@baylibre.com>
Date: Fri, 30 May 2025 12:21:43 -0500
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

ret is assigned but not checked

> +		if (r_gain > AD7606_CALIB_GAIN_MAX)
> +			return -EINVAL;
> +
> +		ret = st->bops->reg_write(st, AD7606_CALIB_GAIN(reg - 1),
> +			DIV_ROUND_CLOSEST(r_gain, AD7606_CALIB_GAIN_STEP));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
