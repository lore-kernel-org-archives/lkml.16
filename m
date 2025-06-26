Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6B2E175E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947081; cv=none; b=DDCkUnxbiGc3iJkKxCQE/tWWFwclm8CqlWOmNp6dWpch46/1Mm+b9JatcDtRJkI4k49fL99+scapEFBRUkc3xDfITpx83rJTTq2+GNGDRyZ1vGqnSYRLhOKKdGcLZs+eCYPS1NhEONOXpxwyCB9h2KQ5EVp6JaVu6IBR11pymIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947081; c=relaxed/simple;
	bh=NXL4L9SOb8fW0xBxfgGP4qnHYawhB1jq/nmNJI3ddVQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EQ8QIhA37pa+33aEpXr7bzlWnOcVxz+elMJLusk5AT/bsq0l9CI3E1bbtoQRi9P1tFJH2FkgDM9R6mLiMoWQWeigzjXuXzXv+9djqneyIdvf/Y4KqRC5SGIa+AkXrKDDX1ir7D76kZwo/8BfxHijT3IYKy3ElLmLK0OrLdz1XJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VG90uaKi; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VG90uaKi"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b435ef653so9146361fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750947078; x=1751551878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fdOEM8p+cMc46FrDcs5XD9n0jfsivYeiqvEqZqCd3c=;
        b=VG90uaKi2Xb3e0qyWg7xPVW29jG3TimKg+xPiJidep9xqjMECyMlqKpNBBLYOXHFsL
         jhTc68fRtm/tXSiiQ1rIQcebmFtFzy9Lwsi9+u7bDlHlkWWP1Fm/hf/6bBOdMxJTwKeG
         QFVgZe0Y+NPVIdTZGe1J/SbH4zJPaZ8JgdIzkJ5LpbqI7nFCavgHOWxcSL3AW9oRcG1w
         qArExSDfNwJKO+i3x4RkwuyxHaC+sDCytp9dSgBSWzSjrE1PravXBuHU68yI8d8d1qlP
         Wj4XNx4Xoi2N8io73oDiZ5vL/4NXgR54BWjxvJBAUsk2nAixELm5E4Qngs68O6V30Y5R
         xABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947078; x=1751551878;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6fdOEM8p+cMc46FrDcs5XD9n0jfsivYeiqvEqZqCd3c=;
        b=scsHVJotnOd2lPHxcbG6yUMBEC//YfHFHr97cn8rQozmcOlwCfcmiMRvQnPBd7cWEu
         JW2acoFrpokLBBmjNkxoUmsjo5RK4khzqhG4k/Yi8QtfHfYcDAWRBqxfiG9g+NCm0Dh2
         ZpY415iqZEi/jV3QBW/KZS7O06Z6bPHUWF8l4iVaKeXvPM6nmfQWUvs1G1KGABIzV7OO
         kZTfqQJ8BQApBtr++E4F+UJpAzEMiWzNW/vgOTRasKMCRzNgRuErbWHR0m2+7JesMFp1
         k9aKqspAmfTPDDGl8osQ6pOaQYPDzSOTLPo93gdgGcUDnemHN9YO0oaolRXn0uBOsycv
         5/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUluXrmEU86OMR+WzDd9T+DiX4iD+W+pbhrUMv8ltt5TiZB+ELzaL9P/5SHFxLqcfzREQcO/dhtwhTMQH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLR4lETjUQ0JV9DFctcyipsSfDtJc2dxF4uz5R66hReftfyld
	85lq0EtNEWIJ8n89uMXqWb4FOC6SvAbQU2j59Dcjzcr1+yZECT9RL0pTxg8bk3VEKI0=
X-Gm-Gg: ASbGncuTaetc4Iq9Em6/8RS1ogj5yZpEFJ2qDGlzNv9axrzwwfuSO4+lPpc5OmRLeE3
	TMr2Vhx7sQfXesWsi6zXhK8raU1BJSJ1AOKwxjZH6DtDTVVBgRVfwiH+SjBa7YZ5vLmeEr6qUgl
	0K0hqB8/pW4YMlCgM3XrfGlLC4+J75MoV0jqX9IwTKDO2gsikZD1LzwaqpM7Wfhn89wBzfvrcrr
	oYdD9Xyj7I7MPVFR+c5CUE7oEfsvMmPrurjn0xVgwKcQ/hDvEAUI6fuf3QOmyWWuZxI7h+ngJJn
	yQXFhcO78HZsHMxRk+lJYeZZKYnOGhjEikbppE7vuDNahNNqAlNGHz0lwGFFMOFhS6B4b+H/4O/
	DEKygpLTro4aHsst77Livt851jKS7OmPiMHoqsfI=
X-Google-Smtp-Source: AGHT+IGdwB1n5Hfp/EPE9UIcSDFeslDjsQLAW8xrE4nxWT5wqqFoYILk6ydKTS2s4DS26tcagpzuxw==
X-Received: by 2002:a2e:b8c6:0:b0:30b:b987:b6a7 with SMTP id 38308e7fff4ca-32cc631712fmr26665881fa.0.1750947077698;
        Thu, 26 Jun 2025 07:11:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fa6f:b132:4858:18cc? ([2a01:e0a:3d9:2080:fa6f:b132:4858:18cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c0812sm50833075e9.34.2025.06.26.07.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:11:17 -0700 (PDT)
Message-ID: <09af27e2-34a7-4cda-b36c-5577829cc173@linaro.org>
Date: Thu, 26 Jun 2025 16:11:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge
 2
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, lee@kernel.org,
 rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
References: <cover.1746518265.git.efectn@protonmail.com>
 <d8596aeea72b2acab614277372f15b773ef3d008.1746518265.git.efectn@protonmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <d8596aeea72b2acab614277372f15b773ef3d008.1746518265.git.efectn@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
> From: Muhammed Efe Cetin <efectn@protonmail.com>
> 
> Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
> using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
> Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
> The original behavior can still be used when the cooling-levels property is not specified,
> ensuring that the new functionality does not break old boards.

Thanks for the explanation, but would would you like to change that ? The MCU can accept
any value between 0 and 99, so why change the levels from DT ?

Neil

> 
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> ---
>   drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
>   1 file changed, 72 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
> index d35e5313b..504e7d254 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
> @@ -15,10 +15,16 @@
>   #include <linux/thermal.h>
>   
>   #define MAX_LEVEL 3
> +#define MAX_SPEED 0x64
>   
>   struct khadas_mcu_fan_ctx {
>   	struct khadas_mcu *mcu;
>   	unsigned int level;
> +
> +	unsigned int fan_max_level;
> +	unsigned int fan_register;
> +	unsigned int *fan_cooling_levels;
> +
>   	struct thermal_cooling_device *cdev;
>   };
>   
> @@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   				    unsigned int level)
>   {
>   	int ret;
> +	unsigned int write_level = level;
> +
> +	if (level > ctx->fan_max_level)
> +		return -EINVAL;
> +
> +	if (ctx->fan_cooling_levels != NULL) {
> +		write_level = ctx->fan_cooling_levels[level];
> +
> +		if (write_level > MAX_SPEED)
> +			return -EINVAL;
> +	}
> +
> +	ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
> +			   write_level);
>   
> -	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> -			   level);
>   	if (ret)
>   		return ret;
>   
> @@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>   					unsigned long *state)
>   {
> -	*state = MAX_LEVEL;
> +	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
> +
> +	*state = ctx->fan_max_level;
>   
>   	return 0;
>   }
> @@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   {
>   	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>   
> -	if (state > MAX_LEVEL)
> +	if (state > ctx->fan_max_level)
>   		return -EINVAL;
>   
>   	if (state == ctx->level)
> @@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>   	.set_cur_state = khadas_mcu_fan_set_cur_state,
>   };
>   
> +static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
> +{
> +	struct device_node *np = ctx->mcu->dev->of_node;
> +	int num, i, ret;
> +
> +	if (!of_property_present(np, "cooling-levels"))
> +		return 0;
> +
> +	ret = of_property_count_u32_elems(np, "cooling-levels");
> +	if (ret <= 0) {
> +		dev_err(dev, "Wrong data!\n");
> +		return ret ? : -EINVAL;
> +	}
> +
> +	num = ret;
> +	ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
> +						   GFP_KERNEL);
> +	if (!ctx->fan_cooling_levels)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32_array(np, "cooling-levels",
> +					 ctx->fan_cooling_levels, num);
> +	if (ret) {
> +		dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num; i++) {
> +		if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
> +			dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
> +				ctx->fan_cooling_levels[i], MAX_SPEED);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	ctx->fan_max_level = num - 1;
> +	ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
> +
> +	return 0;
> +}
> +
>   static int khadas_mcu_fan_probe(struct platform_device *pdev)
>   {
>   	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
> @@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>   	ctx->mcu = mcu;
>   	platform_set_drvdata(pdev, ctx);
>   
> +	ctx->fan_max_level = MAX_LEVEL;
> +	ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
> +
> +	ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
> +	if (ret)
> +		return ret;
> +
>   	cdev = devm_thermal_of_cooling_device_register(dev->parent,
>   			dev->parent->of_node, "khadas-mcu-fan", ctx,
>   			&khadas_mcu_fan_cooling_ops);

