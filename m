Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8083A2EAB7F;
	Thu, 26 Jun 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948590; cv=none; b=fDzpImYc9j8rBxDOz9YYS89XNYlMw7h/rR/Q6VPrxtVP7eo27uPYqj3w7iJuHbQnkN6PI69CbZYADeOdXpnNzU3mShPIjY0Qd9h2nxGnlGGMsSB8LPnARMKyUG2b3+GTvWhrRk6nEsSqKSkaQSouGUWE3YnwkulnzxTeQb/ruRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948590; c=relaxed/simple;
	bh=4MiqkkriQBlV+nEZU4vsU82B47r4lAT7W5HOK1FQACY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsWLIaOVyI6tHeT74YJbWgNRsunbcmrcrHAg7XtDnDnsyZ4GUDPNAgNTjSevmyyxGmxSFLDWBfDi9D/FlYw1vNsZ44A982toqmXwAMawTGvGWBmnIxsdA9coRYY7vBuKd2Jea8xeel2g6PHjRDEF9hMVd31krOjAEJm7FS+Uzmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOCDYFei; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOCDYFei"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so1749293a12.3;
        Thu, 26 Jun 2025 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750948587; x=1751553387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeiWsIBvFrWgna5yEgaH/IXXNiu0EY7mLCIeHhCpakg=;
        b=FOCDYFeiZhefQODLQCtaaLm436uBG20J3Z/7wmU7MnIQmi7qKETw9Y7D2nS9PQneVM
         zunyhN8fMFKH5AOSKOx9OvKfXcA6N+rEpYvn5EoAR/47D0whkGNbHjOUBm7bBLUnWtIw
         miQcDGnzmrzZo0CVqbRVNXPhU6zP4MBYEc3bkm9/L7EFzEiGwpWohifbiYze/QToL1w5
         saaFMTM5/VKFF2CMH8LyGzfTlX/zOdz7BN14MGlLVf/M2CKOPKcP8+IlYH6rXW+PJ+Ii
         0EqDsYMY8DorBhZU76Pq21T7WfluJMvJ26z9kcRuEClxetLiYEP52EjpJBiohvU2jEsD
         jc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948587; x=1751553387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeiWsIBvFrWgna5yEgaH/IXXNiu0EY7mLCIeHhCpakg=;
        b=Df5lUr+Owknh1/8PuNOHRJO4hN+DsQfMrxjg8I+KLW5jGh/k5gojKhduUNSxu963cf
         YYHsJ4eg7X3Klz74310MkUGQ3gHF66Nr2+HJX1gWeq66CNr21wRbCvMlpJlBoDyN0jjV
         x7y9ahwYX+E1/5PAXBuHcf55o8O2gKOEVBdymhh4Zy2px5TIldr5sxna9dky/hu7QmAn
         v8PwErS4neZNLJutFgnn08bGCJ1WOm4gkqtS+u/9uc/VSn90S1xwFDnFSqp668Q/gsJl
         rp8sgBZdU4mwhRDAToKg8RzwIEG/vtPifc4i3dnYWKjxmWB7yNjki7qURfI+VZBXhQ65
         tgwA==
X-Forwarded-Encrypted: i=1; AJvYcCUkz3KzreGQ0XXpHl71Mqq8XiCHnacp4AQ9PTbsOy83U1E3mqcZgNevTB5UPuAXCE+JWD0YkPQNobDyj965@vger.kernel.org, AJvYcCW5/GaLcCfVAugc3u/iY4AHSM4qwk5EYP6gpi2f+ZtRg5F68SZtW3/tL/6fwrDnuyZSrYWkyBE5tZe+@vger.kernel.org
X-Gm-Message-State: AOJu0YwX+Y7IO8/UKaFhV6bGwPj8iAPxzn4q5sHr6CtF9x0Fj1on+hkz
	eeQnRQt5kjeX72Rvb+8V7HMkIEIWbP++yGdvhP6F5WUuKymY0TiJOPWh
X-Gm-Gg: ASbGnctR9JbNhaNneoC1JR3Fv/n+k0tqqjoDYgTWtn3xgra8yKVYLbkQbqJhflvkP9V
	b24sf0dj/nWrGFRoHE9QMaWlHa0bXZkG2fOoCUZCEL0FcHq6z1P3AvY0smDSkgkMf5rUwrv2ieH
	USkNoyrwUR8SdU6OZ4S1PL0AhlEEJYzEGTU99blAzyOv3hFL/H+CJPI1pg/jMrc4oCzpOQnTX8M
	jGSnm4YaDS0Z9BuRuHbFAOOLXNZcEpcBDuxxCyRO6p0ZNKn3a9oSvPJs5p/TngP5FBwdCDFR0yH
	1QzgyTDhB/H5Iobq0B0A4THzmMrZTKAnGFjB3wM87w2aeb2SY0GNrpk5BlVORsXxi+ILSAwZQhK
	lrHsGIv7enXDN
X-Google-Smtp-Source: AGHT+IGBfj0HisJC5Hs7wbCAlRtLKFU3fvp+QXCNcRi1xOH0OF9hMH/GCsxQFG5ls3pbZPdGawEVYA==
X-Received: by 2002:a17:906:f581:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-ae0bec4e39cmr782595366b.18.1750948586462;
        Thu, 26 Jun 2025 07:36:26 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143da38fsm7884666b.78.2025.06.26.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:36:25 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
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
Date: Thu, 26 Jun 2025 17:36:07 +0300
Message-ID: <20250626143607.1423954-1-muhammed.efecetin.67@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <09af27e2-34a7-4cda-b36c-5577829cc173@linaro.org>
References: <09af27e2-34a7-4cda-b36c-5577829cc173@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 6/26/25 17:11, neil.armstrong@linaro.org wrote:
> On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
>> From: Muhammed Efe Cetin <efectn@protonmail.com>
>>
>> Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
>> using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
>> Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
>> The original behavior can still be used when the cooling-levels property is not specified,
>> ensuring that the new functionality does not break old boards. 
>
> Thanks for the explanation, but would would you like to change that ? The MCU can accept
> any value between 0 and 99, so why change the levels from DT ?
>
> Neil

Thanks for the review. Therefore, you say just add values between 0-100 to cooling-device instead of remapping them using cooling-levels property?

What would be the best practise of detecting whether the board is Khadas Edge 2? Adding new bool property, reading model propety from devicetree etc.

Best regards.

>
>>
>> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
>> ---
>>   drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
>>   1 file changed, 72 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
>> index d35e5313b..504e7d254 100644
>> --- a/drivers/thermal/khadas_mcu_fan.c
>> +++ b/drivers/thermal/khadas_mcu_fan.c
>> @@ -15,10 +15,16 @@
>>   #include <linux/thermal.h>
>>     #define MAX_LEVEL 3
>> +#define MAX_SPEED 0x64
>>     struct khadas_mcu_fan_ctx {
>>       struct khadas_mcu *mcu;
>>       unsigned int level;
>> +
>> +    unsigned int fan_max_level;
>> +    unsigned int fan_register;
>> +    unsigned int *fan_cooling_levels;
>> +
>>       struct thermal_cooling_device *cdev;
>>   };
>>   @@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>                       unsigned int level)
>>   {
>>       int ret;
>> +    unsigned int write_level = level;
>> +
>> +    if (level > ctx->fan_max_level)
>> +        return -EINVAL;
>> +
>> +    if (ctx->fan_cooling_levels != NULL) {
>> +        write_level = ctx->fan_cooling_levels[level];
>> +
>> +        if (write_level > MAX_SPEED)
>> +            return -EINVAL;
>> +    }
>> +
>> +    ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
>> +               write_level);
>>   -    ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>> -               level);
>>       if (ret)
>>           return ret;
>>   @@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>   static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>>                       unsigned long *state)
>>   {
>> -    *state = MAX_LEVEL;
>> +    struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>> +
>> +    *state = ctx->fan_max_level;
>>         return 0;
>>   }
>> @@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>>   {
>>       struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>   -    if (state > MAX_LEVEL)
>> +    if (state > ctx->fan_max_level)
>>           return -EINVAL;
>>         if (state == ctx->level)
>> @@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>>       .set_cur_state = khadas_mcu_fan_set_cur_state,
>>   };
>>   +static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
>> +{
>> +    struct device_node *np = ctx->mcu->dev->of_node;
>> +    int num, i, ret;
>> +
>> +    if (!of_property_present(np, "cooling-levels"))
>> +        return 0;
>> +
>> +    ret = of_property_count_u32_elems(np, "cooling-levels");
>> +    if (ret <= 0) {
>> +        dev_err(dev, "Wrong data!\n");
>> +        return ret ? : -EINVAL;
>> +    }
>> +
>> +    num = ret;
>> +    ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
>> +                           GFP_KERNEL);
>> +    if (!ctx->fan_cooling_levels)
>> +        return -ENOMEM;
>> +
>> +    ret = of_property_read_u32_array(np, "cooling-levels",
>> +                     ctx->fan_cooling_levels, num);
>> +    if (ret) {
>> +        dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
>> +        return ret;
>> +    }
>> +
>> +    for (i = 0; i < num; i++) {
>> +        if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
>> +            dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
>> +                ctx->fan_cooling_levels[i], MAX_SPEED);
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>> +    ctx->fan_max_level = num - 1;
>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
>> +
>> +    return 0;
>> +}
>> +
>>   static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>   {
>>       struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>> @@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>       ctx->mcu = mcu;
>>       platform_set_drvdata(pdev, ctx);
>>   +    ctx->fan_max_level = MAX_LEVEL;
>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
>> +
>> +    ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
>> +    if (ret)
>> +        return ret;
>> +
>>       cdev = devm_thermal_of_cooling_device_register(dev->parent,
>>               dev->parent->of_node, "khadas-mcu-fan", ctx,
>>               &khadas_mcu_fan_cooling_ops); 
>

