Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F164120B;
	Fri, 23 May 2025 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748018563; cv=none; b=iLMZRYuJ1qhVnsO7uY1C3yVx4867sR8EkCyRiD9P7oro99gq53fGKnBygYHPTsm9bsUco+LTZCsCpCV2gH8ByPsgnfAxrsxHMBLKOtKok94IrPuuI8QfyBZHdsLrctyIT1c9hwxnrdOH8t1v7YvMLwSDl4bXeyXLQ0rFiHd3LkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748018563; c=relaxed/simple;
	bh=tq4TuVSZAIRjvQu1VdJ2ys6D+exC6+GZ9V4Q2kNeeZA=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=UdIbiIshgkvA9f20cig7bjJcYFnibaTn8oTw12+e5SWOhdsKpCA3YOFeSk5kW2xUd8pVLypN5u9Squdrj5Dy7vNteR5IR+5IuUnVHs96bMRLBtLh3iNKq5/VtGgqoO2zQtC0qjlmlTVpt1CM11fbX12adyVdwUVDFXw7G53QHUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=pOlCfneW; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="pOlCfneW"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id IVSSurGNEpEs6IVSSuRRWF; Fri, 23 May 2025 18:41:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748018484;
	bh=3+QxL/ee61ufD+4tquQWli5spOHmHSP5ezjYfdkKTd8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=pOlCfneWdXLFPaZIu5XSYv4nRFQa/8oQomownlOpjHGyymEnk4FjHH1e/0j8vaK+U
	 OiJmXmq3gSxgBRYKJ9BQAOF6c13sDc+Vn3uHi66h7HrnVF9w0QvGXr/oo4L5siH8SQ
	 vC1ZPCpI8UVRHVDtHpHTKR+4wDO1IpOWf2whW4oaMyxI3+rdXM5rsdSitn4aVFh2j2
	 SyVZj2CgjWU6m9sIkB6bNWJvUNoBN4T7njXh2p1LDW+tQxwVJoOqsV9GIA1itB0qhW
	 Kyvn47CfThH7z2dcWf7xwvtus4SFDhCCSTysUdKcZo6Yc80v7I2Ee4F1NOtTkfJoWa
	 pnlFxycmQ3lig==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 23 May 2025 18:41:24 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <29b547b3-8adc-4c14-b8e6-431a1f2e6849@wanadoo.fr>
Date: Fri, 23 May 2025 18:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add support for ES8375
References: <20250523025502.23214-1-zhangyi@everest-semi.com>
 <20250523025502.23214-3-zhangyi@everest-semi.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: zhangyi@everest-semi.com
Cc: amadeuszx.slawinski@linux.intel.com, broonie@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 krzk@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, perex@perex.cz, robh@kernel.org, tiwai@suse.com
In-Reply-To: <20250523025502.23214-3-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/05/2025 à 04:55, Zhang Yi a écrit :
> The driver is for codec es8375 of everest

...

> +#include <linux/gpio/consumer.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/tlv.h>
> +#include <sound/soc.h>
> +#include <linux/acpi.h>

Sometimes, it is preferred to keep includes in alphabetic order.

> +#include "es8375.h"
> +
> +struct	es8375_priv {
> +	struct regmap *regmap;
> +	struct clk *mclk;
> +	struct regulator_bulk_data core_supply[2];
> +	unsigned int  mclk_freq;
> +	int mastermode;
> +	u8 mclk_src;
> +	u8 vddd;
> +	enum snd_soc_bias_level bias_level;
> +};
> +
> +static const char * const es8375_core_supplies[] = {
> +	"vddd",
> +	"vdda",
> +};
> +
> +static const DECLARE_TLV_DB_SCALE(es8375_adc_osr_gain_tlv, -3100, 100, 0);
> +static const DECLARE_TLV_DB_SCALE(es8375_adc_volume_tlv, -9550, 50, 0);
> +static const DECLARE_TLV_DB_SCALE(es8375_adc_automute_attn_tlv, 0, 100, 0);
> +static const DECLARE_TLV_DB_SCALE(es8375_adc_dmic_volume_tlv, 0, 600, 0);
> +static const DECLARE_TLV_DB_SCALE(es8375_dac_volume_tlv, -9550, 50, 0);
> +static const DECLARE_TLV_DB_SCALE(es8375_dac_vppscale_tlv, -388, 12, 0);
> +static const DECLARE_TLV_DB_SCALE(es8375_dac_automute_attn_tlv, 0, 400, 0);
> +static const DECLARE_TLV_DB_SCALE(es8375_automute_ng_tlv, -9600, 600, 0);
> +
> +static const char *const es8375_ramprate_txt[] = {

Missing space after *?
(or extra space above in es8375_core_supplies)

> +	"0.125dB/LRCK",
> +	"0.125dB/2LRCK",
> +	"0.125dB/4LRCK",
> +	"0.125dB/8LRCK",
> +	"0.125dB/16LRCK",
> +	"0.125dB/32LRCK",
> +	"0.125dB/64LRCK",
> +	"0.125dB/128LRCK",
> +	"disable softramp",
> +};
> +static SOC_ENUM_SINGLE_DECL(es8375_adc_ramprate, ES8375_ADC2,
> +		ADC_RAMPRATE_SHIFT_0, es8375_ramprate_txt);
> +static SOC_ENUM_SINGLE_DECL(es8375_dac_ramprate, ES8375_DAC2,
> +		DAC_RAMPRATE_SHIFT_0, es8375_ramprate_txt);
> +
> +static const char *const es8375_automute_ws_txt[] = {

Missing space after *?
(or extra space above in es8375_core_supplies)

... same several times below ...

> +	"256 samples",
> +	"512 samples",
> +	"1024 samples",
> +	"2048 samples",
> +	"4096 samples",
> +	"8192 samples",
> +	"16384 samples",
> +	"32768 samples",
> +};

...

> +static struct regmap_config es8375_regmap_config = {

I think this could be const.

> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = ES8375_REG_MAX,
> +	.cache_type = REGCACHE_MAPLE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +	.writeable_reg = es8375_writeable_register,
> +};

...

> +static int es8375_read_device_properities(struct device *dev, struct es8375_priv *es8375)
> +{
> +	int ret, i;
> +
> +	ret = device_property_read_u8(dev, "everest,mclk-src", &es8375->mclk_src);
> +	if (ret != 0)
> +		es8375->mclk_src = ES8375_MCLK_SOURCE;
> +	dev_dbg(dev, "mclk-src %x", es8375->mclk_src);
> +
> +	for (i = 0; i < ARRAY_SIZE(es8375_core_supplies); i++)
> +		es8375->core_supply[i].supply = es8375_core_supplies[i];
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(es8375_core_supplies), es8375->core_supply);
> +	if (ret) {
> +		dev_err(dev, "Failed to request core supplies %d\n", ret);

dev_err_probe() in the whole function maybe, as already used just below.

> +		return ret;
> +	}
> +
> +	es8375->mclk = devm_clk_get(dev, "mclk");

devm_clk_get_enabled() maybe?

> +	if (IS_ERR(es8375->mclk))
> +		return dev_err_probe(dev, PTR_ERR(es8375->mclk), "unable to get mclk\n");
> +
> +	if (!es8375->mclk)
> +		dev_warn(dev, "assuming static mclk\n");
> +
> +	ret = clk_prepare_enable(es8375->mclk);

If kept as-is, clk_disable_unprepare() should be called in the probe if 
devm_snd_soc_register_component() fails, and a removed function looks 
needed.

> +	if (ret) {
> +		dev_err(dev, "unable to enable mclk\n");
> +		return ret;
> +	}
> +	ret = regulator_bulk_enable(ARRAY_SIZE(es8375_core_supplies), es8375->core_supply);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable core supplies: %d\n", ret);
> +		clk_disable_unprepare(es8375->mclk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int es8375_i2c_probe(struct i2c_client *i2c_client)
> +{
> +	struct es8375_priv *es8375;
> +	struct device *dev = &i2c_client->dev;
> +	int ret;
> +	unsigned int val;
> +
> +	es8375 = devm_kzalloc(&i2c_client->dev, sizeof(*es8375), GFP_KERNEL);
> +	if (!es8375)
> +		return -ENOMEM;
> +
> +	es8375->regmap = devm_regmap_init_i2c(i2c_client,
> +			&es8375_regmap_config);
> +	if (IS_ERR(es8375->regmap))
> +		return dev_err_probe(&i2c_client->dev, PTR_ERR(es8375->regmap),
> +			"regmap_init() failed\n");
> +
> +	i2c_set_clientdata(i2c_client, es8375);
> +
> +	ret = regmap_read(es8375->regmap, ES8375_CHIP_ID1, &val);
> +	if (ret < 0) {
> +		dev_err(&i2c_client->dev, "failed to read i2c at addr %X\n",
> +				i2c_client->addr);
> +		return ret;
> +	}
> +
> +	if (val != 0x83) {
> +		dev_err(&i2c_client->dev, "device at addr %X is not an es8375\n",
> +				i2c_client->addr);
> +		return -ENODEV;
> +	}
> +
> +	ret = regmap_read(es8375->regmap, ES8375_CHIP_ID0, &val);
> +	if (val != 0x75) {
> +		dev_err(&i2c_client->dev, "device at addr %X is not an es8375\n",
> +				i2c_client->addr);
> +		return -ENODEV;
> +	}
> +
> +	ret = es8375_read_device_properities(dev, es8375);

Typo? Change the fct name to es8375_read_device_properties()?

> +	if (ret != 0) {
> +		dev_err(&i2c_client->dev, "get an error from dts info %X\n", ret);
> +		return ret;
> +	}
> +
> +	return devm_snd_soc_register_component(&i2c_client->dev, &es8375_codec_driver,
> +			&es8375_dai, 1);
> +}

...

> +static const struct i2c_device_id es8375_id[] = {
> +	{"es8375"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, es8375_id);
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id es8375_acpi_match[] = {
> +	{"ESSX8375", 0},
> +	{},

Unneeded , after a terminator

> +};
> +
> +MODULE_DEVICE_TABLE(acpi, es8375_acpi_match);
> +#endif

...

CJ

