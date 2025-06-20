Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7628DB53
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428646; cv=none; b=SGEUUTUYmr9UAkYHwngF6F+eYFYeErvvhst4zv/Aq5btDke9vUykfkgYmjkrOmc9z1ZEDQ1pE9xYD8O+Qv82x2mClDZIVO358wt/V04oRAo3XPGBM+EVmZpzm+MV6SaaSgZI82ppnJPguUODuK34Y+EBhlyKSFhwY+NLFQQaev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428646; c=relaxed/simple;
	bh=YAqDZHxmNX+RObv8DIq8wmyRMyMZqfUDCmP+WImAVpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDHrbqqpJAJrvng5ogf7BqKwSyR0cz3DK3kGxTHDExbaO39MeAETN89dNRJOw2OMPgMSsgyLTcB4+zr8rZiv4IWSFTcQUxSwVi98P48VexxEsZJYxh03yLsSehz/ySVdtmhMb8BeiUYRdbhy8DCTOc6TO71ADY5Qi5W92T5/XHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=OxkGvU0F; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="OxkGvU0F"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86d0c5981b3so55064939f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750428644; x=1751033444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cb95wT6YAeXhB7wAUnmyxgUJVnkrUiVyQ4loitF5Mh0=;
        b=OxkGvU0FRZib6OX6MGK7Bjr6VPlDLSKHsegvdae/aVAsEe/kHcFFNPDbBDNuPGvdVC
         0tBqJxesT+33InibM1Ge1xPmK3pt+0yJY0Vu0CA42Ks+PaRKX8THg+oyZ5rbWnyzaU7o
         CrT7GA8WN+sRAzjZCzR0e7FzUj+pneXEIYX69YgbVf49k3MTR6EpY797+2P9hrrP8yBB
         x9oVJKWJVhoOfk0uXj7PAG75Koc6fnJ4nH/BB0zw+FEAqZldMuJgSBWFINK/KY/phx1u
         2eLJOo4nW2nmIOhSFM93QO9prYR36nPcSFdyE0MM6uk8AI7nO+HzebSy8iqC3cKo02VN
         hAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428644; x=1751033444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cb95wT6YAeXhB7wAUnmyxgUJVnkrUiVyQ4loitF5Mh0=;
        b=MaXzfcPWyOTG7hxjU/czlo/5c7FTrld16tGA1E5ESktKX3hZ/EtlcqN1M4Sf4/Depx
         /VHyjvqpnWH3Y5XwMKMkpfe4qnXfNE7ayoBwcv6j+B5rag7Kq3MPBt0xWw4YBoyd4vj1
         5AtvURZnbFAdEipQ/Mis86DdkUA4QfJpWGfmcJQzXq0kLDxur2jDyW7R9/xcM3+U1JTh
         jqH/lOY5eQYQLKhmBJySkrKbpX3FSxO+ynqECnbjCNLtCVWEVF9seSv5gYOPQSet+/WV
         h4JsMET3boNRe+IJGSGMYQxa/d46dt1w0bI9mGjXV7qwWHbTxEWrfEEWrUiK4skWPQqS
         BMtw==
X-Forwarded-Encrypted: i=1; AJvYcCXotNxP3Uxo2HA7BOx6JE15VSydoxC6M4uJtb8+Ey8zZVpSPXXtrm2Kla66IyNrZn7+QKZLgkkphnO3+WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSkkpWPMqlfU1kLgMEJHsFBnoDujyFffHAnmaP2tNtzyEueCq
	9Cah2vRHESboSLfT3exBvorkDXa5kv9KwJ0jaoaeRn7KzhSuz6+GuRf6NxvHz8qXXl2l88EsvOY
	zU48F
X-Gm-Gg: ASbGnctH4DaA51jOFTxjuBwvolzIkuWdmV8G8a09jD6IG9PxUmVlCHWlfnPPK77Ajo/
	JpoFDcv+CDAPLy7m7mLNGKqWHnJLvZeDwyXvtbfJlJhyVhO+WfktiCSLCreOK/2HDFGbgoMrBvZ
	otFXmbw6EjRY+Jo4MLpfsfRxQV++XkNNxJ9cIHuF0G8fX6wkSoMEpM5JyhXNmQD1dhBc5VIohyV
	R4AKbDgdetpXY9Kg5vs2HxQgpQSQ4zYH6xSpXDrZOI8swzinVTARWCYnlb9UHtqJ2G4RCXFWtSQ
	ESYo86qmwjZVJsfaJbevksgR81ETYnr+XSIHSE2c3XIpycc6tMuexfxjBsqCJRU3KmUiTDY4gss
	zdXdyCHXbIc3KYcQm8XlRGRq2Xg4wLA/r80uF
X-Google-Smtp-Source: AGHT+IHOWUr/z3EkWBYHmgxBtlE4mt4YGXnWdQgUSVsQC0wQSTfNxZFXIK4wwFK7GGyxDqhayW89fg==
X-Received: by 2002:a05:6602:26ca:b0:86d:5b3:3b88 with SMTP id ca18e2360f4ac-8762d1b0cedmr243625639f.1.1750428637859;
        Fri, 20 Jun 2025 07:10:37 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8762b7adc23sm50782439f.35.2025.06.20.07.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:10:37 -0700 (PDT)
Message-ID: <8126de92-0338-4cd0-98fc-4f8c37500201@riscstar.com>
Date: Fri, 20 Jun 2025 09:10:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250619144023.GG795775@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 9:40 AM, Lee Jones wrote:
> On Fri, 13 Jun 2025, Alex Elder wrote:
> 
>> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
>> but the driver is structured to allow support for others to be added.
>>
>> The P1 PMIC is controlled by I2C, and is normally implemented with the
>> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
> 
> six or 12.  Please pick a format and remain consistent.

"Numbers smaller than ten should be spelled out."

But I'll use 6 and 12.

>> regulators.  It also implements a switch, watchdog timer, real-time clock,
>> and more, but initially we will only support its regulators.
> 
> You have to provide support for more than one device for this to be
> accepted into MFD.

OK.  I'm looking at the other device functions to see if I
can pick the easiest one.

>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/mfd/Kconfig         | 11 +++++
>>   drivers/mfd/Makefile        |  1 +
>>   drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 103 insertions(+)
>>   create mode 100644 drivers/mfd/spacemit-pmic.c
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 6fb3768e3d71c..c59ae6cc2dd8d 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
>>   	  Say M here if you want to include support for the Qualcomm RPM as a
>>   	  module. This will build a module called "qcom_rpm".
>>   
>> +config MFD_SPACEMIT_PMIC
>> +	tristate "SpacemiT PMIC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on I2C && OF
>> +	select MFD_CORE
>> +	select REGMAP_I2C
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This option enables support for SpacemiT I2C based PMICs.  At
>> +	  this time only the P1 PMIC (used with the K1 SoC) is supported.
>> +
>>   config MFD_SPMI_PMIC
>>   	tristate "Qualcomm SPMI PMICs"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 79495f9f3457b..59d1ec8db3a3f 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
>>   obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
>>   obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
>>   obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
>> +obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
>>   obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
>>   obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>>   obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>> diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
>> new file mode 100644
>> index 0000000000000..7c3c3e27236da
>> --- /dev/null
>> +++ b/drivers/mfd/spacemit-pmic.c
>> @@ -0,0 +1,91 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + * Derived from code from:
>> + *	Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/types.h>
>> +
>> +struct spacemit_pmic_data {
> 
> s/data/ddata/

I hadn't noticed that convention.  I'll use it.

>> +	const struct regmap_config *regmap_config;
>> +	const struct mfd_cell *mfd_cells;	/* array */
> 
> Hmm ... this is a red flag.  Let's see.
> 
>> +	size_t mfd_cell_count;
>> +};
>> +
>> +static const struct regmap_config p1_regmap_config = {
>> +	.reg_bits	= 8,
>> +	.val_bits	= 8,
>> +	.max_register	= 0xaa,
>> +};
>> +
>> +/* The name field defines the *driver* name that should bind to the device */
> 
> This comment is superfluous.

I'll delete it.

I was expecting the driver to recognize the device, not
the device specifying what driver to use, but I guess
I'm used to the DT model.

>> +static const struct mfd_cell p1_cells[] = {
>> +	{
>> +		.name		= "spacemit-p1-regulator",
> 
> This spacing is wonky.  Take a look at all the other drivers here.
> 
> Also, you probably want to use MFD_CELL_NAME().

Yes, I see that does what I want.

> One is not enough.
> 
>> +	},
>> +};
>> +
>> +static const struct spacemit_pmic_data p1_pmic_data = {
>> +	.regmap_config	= &p1_regmap_config,
>> +	.mfd_cells	= p1_cells,
>> +	.mfd_cell_count	= ARRAY_SIZE(p1_cells),
>> +};
>> +
>> +static int spacemit_pmic_probe(struct i2c_client *client)
>> +{
>> +	const struct spacemit_pmic_data *data;
>> +	struct device *dev = &client->dev;
>> +	struct regmap *regmap;
>> +
>> +	/* We currently have no need for a device-specific structure */
> 
> Then why are we adding one?

I don't understand, but it might be moot once I add support
for another (sub)device.

>> +	data = of_device_get_match_data(dev);
>> +	regmap = devm_regmap_init_i2c(client, data->regmap_config);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap),
>> +				     "regmap initialization failed");
>> +
>> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
>> +				    data->mfd_cells, data->mfd_cell_count,
>> +				    NULL, 0, NULL);
>> +}
>> +
>> +static const struct of_device_id spacemit_pmic_match[] = {
>> +	{
>> +		.compatible	= "spacemit,p1",
>> +		.data		= &p1_pmic_data,
> 
> Ah, now I see.
> 
> We do not allow one data from registration mechanism (MFD) to be piped
> through another (OF).  If you have to match platform data to device (you
> don't), then pass through identifiers and match on those in a switch()
> statement instead.

I haven't done an MFD driver before and it took some time
to get this working.  I'll tell you what led me to it.

I used code posted by Troy Mitchell (plus downstream) as a
starting point.
   https://lore.kernel.org/lkml/20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com/

Krzysztof Kozlowski made this comment on Troy's DT binding:
   Drop compatible, regulators are not re-usable blocks.

So my goal was to have the PMIC regulators get bound to a
driver without specifying a DT compatible string, and I
found this worked.

You say I don't need to match platform data to device, but
if I did I would pass through identifiers.  Can you refer
me to an example of code that correctly does what I should
be doing instead?

One other comment/question:
   This driver is structured as if it could support a different
   PMIC (in addition to P1).  Should I *not* do that, and simply
   make a source file hard-coded for this one PMIC?

>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_pmic_match);
>> +
>> +static struct i2c_driver spacemit_pmic_i2c_driver = {
>> +	.driver = {
>> +		.name = "spacemit-pmic",
>> +		.of_match_table = spacemit_pmic_match,
>> +	},
>> +	.probe    = spacemit_pmic_probe,
> 
> Remove these odd tabs please.

OK.

>> +};
>> +
>> +static int __init spacemit_pmic_init(void)
>> +{
>> +	return i2c_add_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +static void __exit spacemit_pmic_exit(void)
>> +{
>> +	i2c_del_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
> 
> Remove this line.

Sure.

>> +module_init(spacemit_pmic_init);
>> +module_exit(spacemit_pmic_exit);
> 
> Are you sure there isn't some boiler plate to do all of this?
> 
> Ah ha:
> 
>    module_i2c_driver()

Thanks for Googling that for me.  And thank you very much
for the review.

					-Alex


>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
>> -- 
>> 2.45.2
>>
> 

