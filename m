Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48F26B2D8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965700; cv=none; b=hSHVcswcdPNmcsvfshEK3KaxUAO2ydeckFHgE7cI30H6wcDknznAS/txyesEinBylNusW38ntl4acsIs9KMWbXZ/kUVVcq5Z8qDRrvZ3WfLK3I1MqZDfFu6aB9ymgTZu6XZWr1ODVqjgQnsaz3v06+O3eO96cAavgJ8f7FVJTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965700; c=relaxed/simple;
	bh=z/VMqLLc0c9P7A6tQMr61cXUcQtOdWT3vG5LQcEmd2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrALfZ9pWhCLRq+hbe3+PgdWmryIGQnNpBHkFe2SRx4SEVTsC9UkdqlnJu00I1rFCkUYhnMNj4GJUQb0G5qGasNclMOiiF9YA+ka6xgeRBtCDn5XPyCW11jb0ZSQyVww9SJdqj7WXeut28tv/tQa7QgJbs6/8DciuacNQ1NdMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6UG7Uae; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6UG7Uae"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so1017403f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744965697; x=1745570497; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gaYe4zy0Ou27FvsmHa5NmILaWl1zdTnktRLAnBaEUHo=;
        b=P6UG7UaeEs6W+GQ493c9xnAeFeDNFsel8ZCC1+Taz3/+tV2N19KXZYyN4aFDP2lH1E
         Af1AQ5xN1JV3rMnZ7batli0r5p63ct+9K8ww9M5gWr0lQXuplP47TpQLUv5cRqfdvIME
         +igzQa4h0Z3LhsqeOTZiC5dgr5yrkGNiujQsEXOyuTHFbKVC3Gjpd2OLZdFPDxlesz39
         Qwr786Pgxr0baWLF+vinKjVgF9uwiHS68v3oc5Zske9F11n0Tz5llLhAjCPIMIjIq8li
         E62QnKwOxDCiZligaMhyHlJ/DAzRjRgb96vWZCo6ZjFBfzygbgHSdLbwgvpESxG5KQEj
         7GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965697; x=1745570497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gaYe4zy0Ou27FvsmHa5NmILaWl1zdTnktRLAnBaEUHo=;
        b=RVxc15v/uIVfdhuxah99yNTSz5p81eulBpDLwCHyvbJmZNMHeyt4d3Y/Ipa+lCy2C6
         MuzDn/mtGZHONpXGd5aSwPhteu2pj2tjpALNCY3UsiRpw3Lou3ec9cFnTAIYIwY1f8dH
         iSDWtP/Gmz/VwxBlORq3wSqi7puAI44qouupvgxsm4KiDRss+0ndMhgPIDqVLhJOvlFJ
         1oFaUm8NWOdflc0OhaU3vKhu1iCATYdZSLNplqkCHyVoeF0kwqVK1lVGks/xAj/6/dzJ
         bpQHSt9mzbqnBBEkoxVuygj/WELcCkgN/Dpc1sCvThBQDnaO7nfgC+Du6MrzgJ+tB8ky
         bl+A==
X-Forwarded-Encrypted: i=1; AJvYcCWppAq/qw7JW56h+fYS5vJdORsQZr5aEL3QTUfWOeTG8OiUmPHtMGaIeS57ODBuOqR2MsRUOUYF+efIXY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzISsCTPdoEpScFgHIsS7DBQgZTKgN3JRvT5Q40drNiGg5cpmDf
	q4Ql/hy2kucUfLeUHIfAHfRgF7VrPI4MlUGFZ3KtvaKWZlWMQNlQofQAMI2O5pQ=
X-Gm-Gg: ASbGnctjK75WXQgIuEU7GTQt/6NnYTAy6dIe1u4//C+YuN3kfipmbipHr2dW1ePkL4+
	ijZPowul2CO/imafR+uTJw5z5jeP/fMvYU7d8gIvvdrJLh7qW7wBT0xXqJdSc/otkwNxfQdQXc/
	1aE6hVK+Kt8ofSjCsfJBfo/o5BVZQ93ElnR8EYf4iTP/X8tyNw+WiXH1khwB2BUyOS8Bs0nkowW
	CWDqSlFrPiAHN/JOgG+asrg9flrPT3t2LBTs2PwoZlUNbU8WzhpgRLveFHHqb8ya1dIOAOROelI
	ED8kW9WtO/85AmRFYuIaY5VjIudQjmZNYn9LYawE1F3F9Nogmk90sQ9Fvi8JVF0684UUvX2+Ojl
	LUvg=
X-Google-Smtp-Source: AGHT+IE3GyLzZUyelI40gS2vTuDQpSNMhcJ1TL+LpOT3j005P7cUJ4VklepZjvjFsXXu1LyMWnIBEQ==
X-Received: by 2002:a05:6000:18a2:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-39efba5af80mr1425563f8f.29.1744965696999;
        Fri, 18 Apr 2025 01:41:36 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a5150sm2039295f8f.82.2025.04.18.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:41:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:41:34 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 3/6] thermal/drivers/sun8i: Add support for A523 THS0/1
 controllers
Message-ID: <aAIQPtxCDuT2e7vE@mai.linaro.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-4-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411003827.782544-4-iuncuim@gmail.com>

On Fri, Apr 11, 2025 at 08:38:23AM +0800, Mikhail Kalashnikov wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> The A523 processor has two temperature controllers, THS0 and THS1.
> THS0 has only one temperature sensor, which is located in the DRAM.
> 
> THS1 does have 3 sensors:
> ths1_0 - "big" cores
> ths1_1 - "little" cores
> ths1_2 - gpu
> 
> The datasheet mentions a fourth sensor in the NPU, but lacks any registers
> for operation other than calibration registers. The vendor code reads the
> value from ths1_2, but uses separate calibration data, so we get two
> different values from real one.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 134 ++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index dc4055c9c..919b05a96 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -116,6 +116,15 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
>  		return -1590 * reg / 10 + 276000;
>  }
>  
> +static int sun55i_a523_calc_temp(struct ths_device *tmdev,
> +					int id, int reg)
> +{
> +	if (reg >= 0x7c8)
> +		return tmdev->chip->scale * (tmdev->chip->offset - reg);
> +	else
> +		return 65 * (2825 - reg);
> +}

Please use macro instead of litterals

> +
>  static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
>  {
>  	struct tsensor *s = thermal_zone_device_priv(tz);
> @@ -208,6 +217,100 @@ static irqreturn_t sun8i_irq_thread(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +
> +/*
> + * The A523 nvmem calibration values. The ths1_3 is not used as it
> + * doesn't have its own sensor and doesn't have any internal switch.
> + * Instead, the value from the ths1_2 sensor is used, which gives the
> + * illusion of an independent sensor for NPU and GPU when using
> + * different calibration values.
> + *
> + * efuse layout 0x38-0x3F (caldata[0..3]):
> + *     caldata[0]      caldata[1]      caldata[2]      caldata[3]
> + * 0               16      24      32  36          48          60 64
> + * +---------------+---------------+---------------+---------------+
> + * |               |       |   temp    |  ths1_0   |  ths1_1   |   +
> + * +---------------+---------------+---------------+---------------+
> + *
> + * efuse layout 0x40-0x43 (caldata[4..5]) - not in use
> + *
> + * efuse layout 0x44-0x4B (caldata[6..9]):
> + *     caldata[6]      caldata[7]      caldata[8]      caldata[9]
> + * 0           12  16      24      32  36          48             64
> + * +---------------+---------------+---------------+---------------+
> + * |  ths1_2   |  ths1_3   |  ths0_0   |           |               +
> + * +---------------+---------------+---------------+---------------+
> + */
> +static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
> +				   u16 *caldata, int callen)
> +{
> +	struct device *dev = tmdev->dev;
> +	int i, ft_temp;
> +
> +	if (!caldata[0])
> +		return -EINVAL;
> +
> +	ft_temp = (((caldata[2] << 8) | (caldata[1] >> 8)) & FT_TEMP_MASK) * 100;
> +
> +	for (i = 0; i < tmdev->chip->sensor_num; i++) {
> +		int sensor_reg, sensor_temp, cdata, offset;
> +		/*
> +		 * Chips ths0 and ths1 have common parameters for value
> +		 * calibration. To separate them we can use the number of
> +		 * temperature sensors on each chip.
> +		 * For ths0 this value is 1.
> +		 */
> +		if (tmdev->chip->sensor_num == 1) {
> +			sensor_reg = ((caldata[7] >> 8) | (caldata[8] << 8)) & TEMP_CALIB_MASK;
> +		} else {
> +			switch (i) {
> +			case 0:
> +				sensor_reg = (caldata[2] >> 4) & TEMP_CALIB_MASK;
> +				break;
> +			case 1:
> +				sensor_reg = caldata[3] & TEMP_CALIB_MASK;
> +				break;
> +			case 2:
> +				sensor_reg = caldata[6] & TEMP_CALIB_MASK;
> +				break;
> +			default:
> +				sensor_reg = 0;
> +				break;
> +			}
> +		}
> +
> +		sensor_temp = tmdev->chip->calc_temp(tmdev, i, sensor_reg);
> +
> +		/*
> +		 * Calibration data is CALIBRATE_DEFAULT - (calculated
> +		 * temperature from sensor reading at factory temperature
> +		 * minus actual factory temperature) * X (scale from
> +		 * temperature to register values)
> +		 */
> +		cdata = CALIBRATE_DEFAULT -
> +			((sensor_temp - ft_temp) / tmdev->chip->scale);
> +
> +		if (cdata & ~TEMP_CALIB_MASK) {
> +			/*
> +			 * Calibration value more than 12-bit, but calibration
> +			 * register is 12-bit. In this case, ths hardware can
> +			 * still work without calibration, although the data
> +			 * won't be so accurate.
> +			 */
> +			dev_warn(dev, "sensor%d is not calibrated.\n", i);
> +			continue;
> +		}
> +
> +		offset = (i % 2) * 16;
> +		regmap_update_bits(tmdev->regmap,
> +				   SUN50I_H6_THS_TEMP_CALIB + (i / 2 * 4),
> +				   TEMP_CALIB_MASK << offset,
> +				   cdata << offset);
> +	}
> +
> +	return 0;
> +}
> +
>  static int sun8i_h3_ths_calibrate(struct ths_device *tmdev,
>  				  u16 *caldata, int callen)
>  {
> @@ -721,6 +824,35 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
>  	.calc_temp = sun8i_ths_calc_temp,
>  };
>  
> +/* The A523 has a shared reset line for both chips */
> +static const struct ths_thermal_chip sun55i_a523_ths0 = {
> +	.sensor_num = 1,
> +	.has_bus_clk_reset = true,
> +	.has_gpadc_clk = true,
> +	.ft_deviation = 5000,
> +	.offset = 2736,
> +	.scale = 74,
> +	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
> +	.calibrate = sun55i_a523_ths_calibrate,
> +	.init = sun50i_h6_thermal_init,
> +	.irq_ack = sun50i_h6_irq_ack,
> +	.calc_temp = sun55i_a523_calc_temp,
> +};
> +
> +static const struct ths_thermal_chip sun55i_a523_ths1 = {
> +	.sensor_num = 3,
> +	.has_bus_clk_reset = true,
> +	.has_gpadc_clk = true,
> +	.ft_deviation = 5000,
> +	.offset = 2736,
> +	.scale = 74,
> +	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
> +	.calibrate = sun55i_a523_ths_calibrate,
> +	.init = sun50i_h6_thermal_init,
> +	.irq_ack = sun50i_h6_irq_ack,
> +	.calc_temp = sun55i_a523_calc_temp,
> +};
> +
>  static const struct of_device_id of_ths_match[] = {
>  	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
>  	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
> @@ -731,6 +863,8 @@ static const struct of_device_id of_ths_match[] = {
>  	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
>  	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
>  	{ .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
> +	{ .compatible = "allwinner,sun55i-a523-ths0", .data = &sun55i_a523_ths0 },
> +	{ .compatible = "allwinner,sun55i-a523-ths1", .data = &sun55i_a523_ths1 },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, of_ths_match);
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
