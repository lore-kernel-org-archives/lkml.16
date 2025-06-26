Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC902EB5B9;
	Thu, 26 Jun 2025 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951043; cv=none; b=bXipjEbQAlHj1unYkS4aMWHHSloUVo1o7h9zncsAcz6eWBr8+iU6hpo2uTW4vDJ49asgsNlw4LuM6HqIH83NfZSDr9HDVR+q5MIt9WQByN5G2jAYWL6wTUneeGL/+smC/PaHkcHcEM9XlHCHk2YwOgwFH6cpRQQkOsdUwDN5HfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951043; c=relaxed/simple;
	bh=2vl5iK5o15a9SAtg7r2ZqbbTYDIimQxNAtXmXwGybdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pH1eYzYSddat7IQ8TS1JH2smZv7Cyb88NWnEI++df20MsyMH//QSJzInPMm8dNJpdaHMh1lubqVuYmNXrr7dOhD6ywEIAC+f2qpTGvjznfjibiy0zHuAiOIzvFHdN7iq879d1kyMGbWqpEq9XVRBMjo2vchJkd29+PBBtkPiBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXJZCcss; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXJZCcss"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so187166266b.3;
        Thu, 26 Jun 2025 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951040; x=1751555840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO64nb8Wo3rmY+NlSzYsAo8VOmgXYduHQkU+jiDicSY=;
        b=ZXJZCcsssjLbfSv8dTGICvctlOzl58CYsf+VuwXvIczrqnV2ghLyCBUQB1vXqQPzLt
         G3zlvH0m3WWvShL7/dFf9EsaPOO+JK7pBo8YI4+oHNg6LErs0ZrdwEO2V/bGu6FTmmFi
         35T8rDKehkLYWJb/jPaOzHwbbHLtcOgwDwaTPG9kKrmtmS6g2x5aXf+lX7kC900BysGk
         cGV7RF5Qm1DvXAe6SwIuTpjWk3EmkrEk7WO2RnLU7aauIpQA4Ry/G3dkshFIcMkat3BG
         sFKRPptg+yjd56wlVXQiulXR97X385VfdtxuJ+j3U1vbUnesC4v8U4/EQXyMbYorbDO0
         ljIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951040; x=1751555840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pO64nb8Wo3rmY+NlSzYsAo8VOmgXYduHQkU+jiDicSY=;
        b=GVQeBgfSUuyGrvgalDCujh+pvYxfDlBVHfCKCpN2B248v7OzhVyBIhVuaIdgwdDBNV
         hizYG+q9tUaKFPw5wcsA3A/2bLhMLQNciYcrI0BjKLLXGjG3/PpVkvIpS0SL7ozD/j7F
         dZoK4s1JRqodUekFE8/kUhmGlV8VVhMB1EsRYEN01LXze3LnN+yCQy4AjCLyHm2dTtgc
         6XhAYWX9SIknoX2lVV/nhCaTnllnBpKEkzqjSCLhhiYibyJasaJD16J6sszw88pqB31l
         O5XW4jaCX/iN2ZXMzHvhFJnaUqtTPgTusFtU3IErZ8g1lITxKGMS+2PnRLHO432T6Yhb
         YT2A==
X-Forwarded-Encrypted: i=1; AJvYcCWFKsyMk4dWU9RWsPcnLbcQf2eXhvrQlvjhTe8xSAb7K0CXEWt70rswUlQtj8uLOrALbZhzOc68srMmf3ZJ@vger.kernel.org, AJvYcCXVGrg2bAYZYrsa/KtIdUi9/EiU76BrPt8/lzyOXvWkdTcTxGFW4TEMNPFvrjV8oBp6CCmilfQXSO9b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0qk+gUW2yegiS7HFrvgwwNN8ahEKxCpiB4SHIAjfVFsSYqa06
	7Vc6m8VWvyk2SHLMdJEls7TU+GJReewligfwfAaIAnt5krFjjQtNHo2n
X-Gm-Gg: ASbGnct2Omo45EtAw9cOayWZwl9//jnVd2E4w/Z8cqVfVKB+UZVbS7r2mEBhndIIPlp
	XFmhUGW4XiHlW/AKyQBGjLxkNcR6lsNoBgNPZloYPW9KBxTQLLvlfavFZq0hn0nG+TPvxo4f2mI
	9MxHFBcAI5n6sF2TChhUrPzHT09oT9N+XihAe9x1OLQt45AyLvUSyuAkdyJwKvSgJbE/AkP0Aza
	I5H7OvWLOxeXtTRim2VZxcA826t8t4y6UOhg4tJRg5lBAOl74zVbV3YIA4vTlppysg6wznuJujM
	lpzskIcl13dfmSUA5gwpcKdcbQZ/+Zwu//YkoH60jpUgxdb5D9NarwUIJYBRSwMuoU9pGyIyS7L
	GJB3u0LV4M1I=
X-Google-Smtp-Source: AGHT+IEhwuVWaVOb65LLZ1reiG1RBr6tyPLd43WAJv5xjaBBth4FGvOOg73t206Gy+Qp2V32L7WCGQ==
X-Received: by 2002:a17:906:7953:b0:ade:c102:dc9a with SMTP id a640c23a62f3a-ae0bef3fecbmr797730866b.40.1750951039401;
        Thu, 26 Jun 2025 08:17:19 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae21c023564sm12447266b.133.2025.06.26.08.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:17:18 -0700 (PDT)
From: Muhammed Efe Cetin <muhammed.efecetin.67@gmail.com>
X-Google-Original-From: Muhammed Efe Cetin <efectn@protonmail.com>
To: neil.armstrong@linaro.org
Cc: daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	efectn@protonmail.com,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	muhammed.efecetin.67@gmail.com,
	rafael@kernel.org,
	robh+dt@kernel.org
Subject: Re: [PATCH 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge 2
Date: Thu, 26 Jun 2025 18:16:44 +0300
Message-ID: <20250626151644.1492631-1-efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <b4fa3620-53d2-41c3-9b3a-27cc2c1d846a@linaro.org>
References: <b4fa3620-53d2-41c3-9b3a-27cc2c1d846a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 6/26/25 17:46, neil.armstrong@linaro.org wrote:
> On 26/06/2025 16:36, muhammed.efecetin.67@gmail.com wrote:
>> On 6/26/25 17:11, neil.armstrong@linaro.org wrote:
>>> On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
>>>> From: Muhammed Efe Cetin <efectn@protonmail.com>
>>>>
>>>> Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
>>>> using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
>>>> Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
>>>> The original behavior can still be used when the cooling-levels property is not specified,
>>>> ensuring that the new functionality does not break old boards. 
>>>
>>> Thanks for the explanation, but would would you like to change that ? The MCU can accept
>>> any value between 0 and 99, so why change the levels from DT ?
>>>
>>> Neil 
>>
>> Thanks for the review. Therefore, you say just add values between 0-100 to cooling-device instead of remapping them using cooling-levels property?
>>
>> What would be the best practise of detecting whether the board is Khadas Edge 2? Adding new bool property, reading model propety from devicetree etc. 
>
> The register DEVICE_NO should be set at 0x12 for Edge V, 0x11 for Edge 1. I don't have the number for Edge 2, perhaps you can read it ?
>
> Neil

The DEVICE_NO register is not available for Khadas Edge 2. Here are the registers [0].

[0] https://dl.khadas.com/products/edge2/tools/mcu/edge2-mcu-register-description-en-v1.0-230520.pdf

>
>>
>> Best regards.
>>
>>>
>>>>
>>>> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
>>>> ---
>>>>    drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
>>>>    1 file changed, 72 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
>>>> index d35e5313b..504e7d254 100644
>>>> --- a/drivers/thermal/khadas_mcu_fan.c
>>>> +++ b/drivers/thermal/khadas_mcu_fan.c
>>>> @@ -15,10 +15,16 @@
>>>>    #include <linux/thermal.h>
>>>>      #define MAX_LEVEL 3
>>>> +#define MAX_SPEED 0x64
>>>>      struct khadas_mcu_fan_ctx {
>>>>        struct khadas_mcu *mcu;
>>>>        unsigned int level;
>>>> +
>>>> +    unsigned int fan_max_level;
>>>> +    unsigned int fan_register;
>>>> +    unsigned int *fan_cooling_levels;
>>>> +
>>>>        struct thermal_cooling_device *cdev;
>>>>    };
>>>>    @@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>>>                        unsigned int level)
>>>>    {
>>>>        int ret;
>>>> +    unsigned int write_level = level;
>>>> +
>>>> +    if (level > ctx->fan_max_level)
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (ctx->fan_cooling_levels != NULL) {
>>>> +        write_level = ctx->fan_cooling_levels[level];
>>>> +
>>>> +        if (write_level > MAX_SPEED)
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
>>>> +               write_level);
>>>>    -    ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>>>> -               level);
>>>>        if (ret)
>>>>            return ret;
>>>>    @@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>>>    static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>>>>                        unsigned long *state)
>>>>    {
>>>> -    *state = MAX_LEVEL;
>>>> +    struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>>> +
>>>> +    *state = ctx->fan_max_level;
>>>>          return 0;
>>>>    }
>>>> @@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>>>>    {
>>>>        struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>>>    -    if (state > MAX_LEVEL)
>>>> +    if (state > ctx->fan_max_level)
>>>>            return -EINVAL;
>>>>          if (state == ctx->level)
>>>> @@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>>>>        .set_cur_state = khadas_mcu_fan_set_cur_state,
>>>>    };
>>>>    +static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
>>>> +{
>>>> +    struct device_node *np = ctx->mcu->dev->of_node;
>>>> +    int num, i, ret;
>>>> +
>>>> +    if (!of_property_present(np, "cooling-levels"))
>>>> +        return 0;
>>>> +
>>>> +    ret = of_property_count_u32_elems(np, "cooling-levels");
>>>> +    if (ret <= 0) {
>>>> +        dev_err(dev, "Wrong data!\n");
>>>> +        return ret ? : -EINVAL;
>>>> +    }
>>>> +
>>>> +    num = ret;
>>>> +    ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
>>>> +                           GFP_KERNEL);
>>>> +    if (!ctx->fan_cooling_levels)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    ret = of_property_read_u32_array(np, "cooling-levels",
>>>> +                     ctx->fan_cooling_levels, num);
>>>> +    if (ret) {
>>>> +        dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < num; i++) {
>>>> +        if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
>>>> +            dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
>>>> +                ctx->fan_cooling_levels[i], MAX_SPEED);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    ctx->fan_max_level = num - 1;
>>>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>>>    {
>>>>        struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>>>> @@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>>>        ctx->mcu = mcu;
>>>>        platform_set_drvdata(pdev, ctx);
>>>>    +    ctx->fan_max_level = MAX_LEVEL;
>>>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
>>>> +
>>>> +    ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>>        cdev = devm_thermal_of_cooling_device_register(dev->parent,
>>>>                dev->parent->of_node, "khadas-mcu-fan", ctx,
>>>>                &khadas_mcu_fan_cooling_ops); 
>>>
>>
>

