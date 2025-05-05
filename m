Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D01A070E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435401; cv=none; b=o8Rl8L12vlBDaP3IAOr3YABk/4QI/QLMRuzVmokMrPf56V//NXLE7/I/gKW/ljcOriy22/YvUNnuyJ9onPf+dYZXUkWLXcflFR6y57DwtRLPlAqOmzgD9oElXDspoVR3Uyba52bpqV0pqQ3N6BeMNskX818FtTJ1kfVesFTsE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435401; c=relaxed/simple;
	bh=SmMCH697xC8Jvds5eQIi5w8fCsVUUCW9mlghMxxm3kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcyv3Gwc0fqKKxRRo0gpM252HgdQ2VU2V9KQHoigNgbdkeZ1GPwnmQ9rA/qErvrq/pD8beTC9MNW9cAcskUB9FceeNC8zwKpXZJN0E4HTeWQgNwaqJaXHaBBoyU7IMz6lzXhvM09iGw4jZDxDe8wnTpwZT7TjlqUm8Q3i/ADLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKH0kldk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKH0kldk"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac9aea656so4479596f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435398; x=1747040198; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sv1fXA/kXVQWR1mgUjAfLmrac7SzbmHKcHFUSyKNyaM=;
        b=IKH0kldkiw8v07nDcr/TjCCgcz7Xu2sbfPrRhwzumT91UcwMsJNgwHnIA/TUICMucP
         BehgQou9jvh5B/77GNKxVO7vP4tOvK/FRIxiTnKPAT3Zn+Ux0e7zJUllNja6PqDmx+kz
         RjllalaoMWwzmOg3p3mVMDablpM1X1mlPxIM7tg5N6zgdj26Hqd3SIElyxERgiJBAnCJ
         GltrGw31BUmiXXLWqQMM3Uk3t+yCcIp1FkxfCAiiaAO9hmvTCsVnz3P6+p0hnpr3tfIC
         83jhyqct2oBRBpWXoJH8FszqfZcQCMbjIj3t6/vQpSQ/9GBjaDilyidcEp701FT+71yx
         fgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435398; x=1747040198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv1fXA/kXVQWR1mgUjAfLmrac7SzbmHKcHFUSyKNyaM=;
        b=gvg0dLZJ3gPZl31nEwO4b41xMlQ1WZJUd1+/X/l2io2KbMDpvbcvbb9YnbDx8YdB1y
         0WxWTaR1MuFUP9F/64cvRntpWil9bUV9y9l2B/23lLPEhJhACOEFkbDggZW2iFObdze/
         D60SjWaHtge1w0EEtUR8+xGLU9WnZJO5wci2PCIRSH8sct/Bsl2FOKjlKYSo5UwmmaI4
         F6HLGICobOCMKSyeIV5KrSeZ3zc8Ph3IO2t45c8cfa4DuJh9gzqegCG2WbcRTzE5X1xj
         p1Z/GKnxaHOxhkrhtzLhKkgTQ5TvvH26Wqd1vX25J1IQtploBUWSD6SOlENnxhUBDR6b
         aWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLJkCUJnncm3wLqADN8uyo3BLKs00lpdJupn2h4c+SqZb3P+PLDiaf66ai7PRzO2x4M8Sdm534bw69A00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIcxRGAR8oLNU1xQGO/1VQtZTUcF6H3aqKuv8r+EUfFWDmHRRK
	l+wJwhSRYHgSyIDhVfx/qfPjMZkBFu3/aPBqlaadoW6m7pNutXIYBRdfziSNWHc=
X-Gm-Gg: ASbGncuE5REiun6DhjD9nowlsDcAHo7DIREKqSbWrZ0Mr18/h67mjdcIqhtBLse5gvh
	Kp1VWQl3Az6UUNQpwuq02vcOdmVH+hqj+RuX74wcoVy6SrjEhylR4WuNzLUR6JNAo/8iAv7X3x1
	NDn/e6dQy4GQPptYfu+ldTeV0bZxzFB+EBY0P/CIxjJ00JXfPX4oYXhlZeXd9LnxsUs1Gmp14fk
	aaVok1pHRCRsFHcrNyLA8oLDbxKbeMgQKljQ48RGn5JR5x1qdg4K0/K5rLIboH4sKTEVoAx1gWv
	EfrMR6BU77V6RYojWnt9kSSOoc6jXe06b9HgRkCqyPXYjKBmgYOx/zx4IwX5T2WmOnIYsPiF9JI
	P/nk=
X-Google-Smtp-Source: AGHT+IGfImCYDlojSB1Sb4V6Dn940fvmK1LybNwwBa7WbdE2kVT+4CXyDuAT8T7krErERsIUODmGCw==
X-Received: by 2002:a5d:64e8:0:b0:38f:2766:759f with SMTP id ffacd0b85a97d-3a09fdbf30cmr4610206f8f.41.1746435398100;
        Mon, 05 May 2025 01:56:38 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172a8sm9880997f8f.91.2025.05.05.01.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:56:37 -0700 (PDT)
Date: Mon, 5 May 2025 10:56:35 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] thermal: thermal-generic-adc: add temperature
 sensor channel
Message-ID: <aBh9Q8zr2MtfVJtq@mai.linaro.org>
References: <20250430055807.11805-1-clamor95@gmail.com>
 <20250430055807.11805-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430055807.11805-2-clamor95@gmail.com>

On Wed, Apr 30, 2025 at 08:58:07AM +0300, Svyatoslav Ryhel wrote:
> To avoid duplicating sensor functionality and conversion tables, this
> design allows converting an ADC IIO channel's output directly into a
> temperature IIO channel. This is particularly useful for devices where
> hwmon isn't suitable or where temperature data must be accessible through
> IIO.
> 
> One such device is, for example, the MAX17040 fuel gauge.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/thermal/thermal-generic-adc.c | 55 ++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
> index ee3d0aa31406..7c844589b153 100644
> --- a/drivers/thermal/thermal-generic-adc.c
> +++ b/drivers/thermal/thermal-generic-adc.c
> @@ -7,6 +7,7 @@
>   * Author: Laxman Dewangan <ldewangan@nvidia.com>
>   */
>  #include <linux/iio/consumer.h>
> +#include <linux/iio/iio.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -73,6 +74,58 @@ static const struct thermal_zone_device_ops gadc_thermal_ops = {
>  	.get_temp = gadc_thermal_get_temp,
>  };
>  
> +static const struct iio_chan_spec gadc_thermal_iio_channels[] = {
> +	{
> +		.type = IIO_TEMP,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),
> +	}
> +};
> +
> +static int gadc_thermal_read_raw(struct iio_dev *indio_dev,
> +				 struct iio_chan_spec const *chan,
> +				 int *val, int *val2, long mask)
> +{
> +	struct gadc_thermal_info *gtinfo = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_PROCESSED:
> +		ret = gadc_thermal_get_temp(gtinfo->tz_dev, val);
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_info gadc_thermal_iio_info = {
> +	.read_raw = gadc_thermal_read_raw,
> +};
> +
> +static int gadc_iio_register(struct device *dev, struct gadc_thermal_info *gti)
> +{
> +	struct gadc_thermal_info *gtinfo;
> +	struct iio_dev *indio_dev;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*gtinfo));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	gtinfo = iio_priv(indio_dev);
> +	memcpy(gtinfo, gti, sizeof(*gtinfo));

Why copy the structure ?

Copying the thermal zone device pointer should be enough, no ?

> +	indio_dev->name = dev_name(dev);
> +	indio_dev->info = &gadc_thermal_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = gadc_thermal_iio_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(gadc_thermal_iio_channels);
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
>  static int gadc_thermal_read_linear_lookup_table(struct device *dev,
>  						 struct gadc_thermal_info *gti)
>  {
> @@ -153,7 +206,7 @@ static int gadc_thermal_probe(struct platform_device *pdev)
>  
>  	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
>  
> -	return 0;
> +	return gadc_iio_register(&pdev->dev, gti);
>  }
>  
>  static const struct of_device_id of_adc_thermal_match[] = {
> -- 
> 2.48.1
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
