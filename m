Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951B72E5438
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949187; cv=none; b=BDT31kg7iAhYE78LbgREry8XYg5CEifJ9s0+f4+nN/76KMT8oCZx4d1wLW1wK29jBDnd9BNMbFrvgy6QZm/M4k9ZXowvHQBmBYeSte6Z4fL3zU0JiJMAWTHjb/a9YHmKmfNnbt7tfn0VhciR3/2XuUkhgHwxqWg3dDjfC42pkLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949187; c=relaxed/simple;
	bh=zs1k4F0WNXZx9dehb9lbFIbLtYbdzEPbKTaBYS/ieXo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EoQE2C48guefSJdqhpvxVueRTHA1MGhWplhOBCGo8aNxGZNBg33LCbKSuJT+7F0KB4Q7m+Suvkaj5m/o6jyZrV4ylm8HsSLBx+x74Rt4WdvmYtWDNL6XmfQpNyOf5Vm25+7dY6Td0eibXHC4un7IO+bNedzVy56QPN+pQabNuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AtvkXdD9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AtvkXdD9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453647147c6so12052515e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750949184; x=1751553984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6UYLrhSUYbPMjdcWaSI5xPFmPT6JWIBNYaLngCWsVY=;
        b=AtvkXdD9zOUBDASDH7uQF4KI4biV2x27CpmglvsLqxOeZkjY7IoR5WaIN34KxGS18k
         Z/aSqxfgaYZwbQ/tvFSiPE8kX5gBOf5PnAk381e+C27DthOo9HXqNEvsnSog0ZmtnmyZ
         0/gf3MMd4O3oD3Q0d6IahYR0g0b30bmjNp7IvezyUkjIcKhPwDmfInnOvj4OIGFpw5fs
         ibZV+ERv/Z/oCBqO+WK0tOkQ1okp7B9lKFGdWiimvzij5aMeSN20nzZdXfCvwGuMg3+K
         hS6dg34SGhYUeYScUIlUq5yrknEvZp/iXSFmKQ7YduXYchg3EFvQ3Z2KhASAUlvwzWab
         DCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949184; x=1751553984;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y6UYLrhSUYbPMjdcWaSI5xPFmPT6JWIBNYaLngCWsVY=;
        b=wJ9lRW8JvlWJ2WKR3bFIRGtt+xqkIS8TrT4/o3TCgdtPXzEb5fXvrCPq5TE2OB6dIz
         O+/vnBVlF06Pie2DzIg+3yA2uTMJPuKzjaXAR7MIsk1EZzzyzW1tqf6PZpRc/wT/FHTC
         lb7OluX0fbe1rEN0xTCK0SiQZ/gwWeXC7RxdDWvrje82B+FpgpGeCTvPVpI+vAK+SHYD
         QX1v2W9Z/vw3EmhLj0m05z+umeeFl9QknFAo/zFYmtEnBo46HAQmn4x9VmsaTSBUjoJE
         1BuypdIn7uBEnoHvDvnL0TFzQz+V20Qher13veRJWy+IqyS1C4KDQHDJ2wgtalMBMlV6
         3M1g==
X-Forwarded-Encrypted: i=1; AJvYcCXxBE3ff3E4wkendgHfAQaiZ04N5GzdtqT4wxHfgTbs4YKa9M/eh3k4i/v7h2lV2tjDxUf4tqxvxmlo3DY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUX/7YvYK+Yt8R3LHacAqhmtlqYwp74Q1nFO4gjCWoWvmd1ZE7
	C9woIyT++eCLwnWOCnOVBqJnSaLeZgWSdLjo2sSKK11c+Y5FCTyB1rAb84i+DKhqlyQ=
X-Gm-Gg: ASbGncsk0VBw0hg6OqQehbBOa1mPq0SQlkcbtCNwYxaVEPT8vOZrOgTo0+7uwvDTLOb
	QofEeQuFA+jvqCSCQxaAvg8gz4jg0Ez28aVGNDOxbpXVtzccug23Mm5+fypxtwgyFWmW2N5Yy4y
	qbvALjw/cc0MrZOIC11jXAwy52yOmBFgw/NZzGClTQ8Uq1ESEdgISXkXbYMgrCHLYGxQz42z8ki
	lzzQm6Q/BrqbLkKrRkm4yA7HZmfO4H0OSUqEnzZ7IHUw1BjFm1C0Qe8C7JxFFH4q6eJjPvL+0vb
	6XfoyfBsu3E/ZKZrKkySxX8KWSjofIx+EHlkjvyr6LxqLpu29XWrTDMGbnX/eer+KfMBiDIgXNV
	Xc2Y2qsnaneO5Mt6gKSEr1DxbWA/+Yp1q2RuKjBc=
X-Google-Smtp-Source: AGHT+IHSIfxpDtvk3b/o/PTfPvJVJIuPEiExp0FjAt9JCuDCjQ/lxdskoiYS4v6Pweak4/OZQri5nw==
X-Received: by 2002:a05:600c:4fc5:b0:441:a715:664a with SMTP id 5b1f17b1804b1-45381b0f414mr67611325e9.20.1750949183748;
        Thu, 26 Jun 2025 07:46:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fa6f:b132:4858:18cc? ([2a01:e0a:3d9:2080:fa6f:b132:4858:18cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad247sm54579635e9.26.2025.06.26.07.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:46:23 -0700 (PDT)
Message-ID: <b4fa3620-53d2-41c3-9b3a-27cc2c1d846a@linaro.org>
Date: Thu, 26 Jun 2025 16:46:19 +0200
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
To: muhammed.efecetin.67@gmail.com
Cc: daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 efectn@protonmail.com, heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
 lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 rafael@kernel.org, robh+dt@kernel.org
References: <09af27e2-34a7-4cda-b36c-5577829cc173@linaro.org>
 <20250626143607.1423954-1-muhammed.efecetin.67@gmail.com>
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
In-Reply-To: <20250626143607.1423954-1-muhammed.efecetin.67@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 16:36, muhammed.efecetin.67@gmail.com wrote:
> On 6/26/25 17:11, neil.armstrong@linaro.org wrote:
>> On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
>>> From: Muhammed Efe Cetin <efectn@protonmail.com>
>>>
>>> Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
>>> using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
>>> Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
>>> The original behavior can still be used when the cooling-levels property is not specified,
>>> ensuring that the new functionality does not break old boards.
>>
>> Thanks for the explanation, but would would you like to change that ? The MCU can accept
>> any value between 0 and 99, so why change the levels from DT ?
>>
>> Neil
> 
> Thanks for the review. Therefore, you say just add values between 0-100 to cooling-device instead of remapping them using cooling-levels property?
> 
> What would be the best practise of detecting whether the board is Khadas Edge 2? Adding new bool property, reading model propety from devicetree etc.

The register DEVICE_NO should be set at 0x12 for Edge V, 0x11 for Edge 1. I don't have the number for Edge 2, perhaps you can read it ?

Neil

> 
> Best regards.
> 
>>
>>>
>>> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
>>> ---
>>>    drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
>>>    1 file changed, 72 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
>>> index d35e5313b..504e7d254 100644
>>> --- a/drivers/thermal/khadas_mcu_fan.c
>>> +++ b/drivers/thermal/khadas_mcu_fan.c
>>> @@ -15,10 +15,16 @@
>>>    #include <linux/thermal.h>
>>>      #define MAX_LEVEL 3
>>> +#define MAX_SPEED 0x64
>>>      struct khadas_mcu_fan_ctx {
>>>        struct khadas_mcu *mcu;
>>>        unsigned int level;
>>> +
>>> +    unsigned int fan_max_level;
>>> +    unsigned int fan_register;
>>> +    unsigned int *fan_cooling_levels;
>>> +
>>>        struct thermal_cooling_device *cdev;
>>>    };
>>>    @@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>>                        unsigned int level)
>>>    {
>>>        int ret;
>>> +    unsigned int write_level = level;
>>> +
>>> +    if (level > ctx->fan_max_level)
>>> +        return -EINVAL;
>>> +
>>> +    if (ctx->fan_cooling_levels != NULL) {
>>> +        write_level = ctx->fan_cooling_levels[level];
>>> +
>>> +        if (write_level > MAX_SPEED)
>>> +            return -EINVAL;
>>> +    }
>>> +
>>> +    ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
>>> +               write_level);
>>>    -    ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>>> -               level);
>>>        if (ret)
>>>            return ret;
>>>    @@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>>    static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>>>                        unsigned long *state)
>>>    {
>>> -    *state = MAX_LEVEL;
>>> +    struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>> +
>>> +    *state = ctx->fan_max_level;
>>>          return 0;
>>>    }
>>> @@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>>>    {
>>>        struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>>    -    if (state > MAX_LEVEL)
>>> +    if (state > ctx->fan_max_level)
>>>            return -EINVAL;
>>>          if (state == ctx->level)
>>> @@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>>>        .set_cur_state = khadas_mcu_fan_set_cur_state,
>>>    };
>>>    +static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
>>> +{
>>> +    struct device_node *np = ctx->mcu->dev->of_node;
>>> +    int num, i, ret;
>>> +
>>> +    if (!of_property_present(np, "cooling-levels"))
>>> +        return 0;
>>> +
>>> +    ret = of_property_count_u32_elems(np, "cooling-levels");
>>> +    if (ret <= 0) {
>>> +        dev_err(dev, "Wrong data!\n");
>>> +        return ret ? : -EINVAL;
>>> +    }
>>> +
>>> +    num = ret;
>>> +    ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
>>> +                           GFP_KERNEL);
>>> +    if (!ctx->fan_cooling_levels)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = of_property_read_u32_array(np, "cooling-levels",
>>> +                     ctx->fan_cooling_levels, num);
>>> +    if (ret) {
>>> +        dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    for (i = 0; i < num; i++) {
>>> +        if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
>>> +            dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
>>> +                ctx->fan_cooling_levels[i], MAX_SPEED);
>>> +            return -EINVAL;
>>> +        }
>>> +    }
>>> +
>>> +    ctx->fan_max_level = num - 1;
>>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>    static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>>    {
>>>        struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>>> @@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>>        ctx->mcu = mcu;
>>>        platform_set_drvdata(pdev, ctx);
>>>    +    ctx->fan_max_level = MAX_LEVEL;
>>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
>>> +
>>> +    ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>        cdev = devm_thermal_of_cooling_device_register(dev->parent,
>>>                dev->parent->of_node, "khadas-mcu-fan", ctx,
>>>                &khadas_mcu_fan_cooling_ops);
>>
> 

