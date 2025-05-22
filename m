Received: from smtp134-102.sina.com.cn (smtp134-102.sina.com.cn [180.149.134.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13E2AD2D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892828; cv=none; b=ZXs/xmbhV2hZpRIqtgKqu3EslhodtlFj9CFp7Q5pKPfiKCBIWtqO1Kxcse8iL18M7AX8vRpf0VHkVEvbvg0Ifm0uZMOVii3KUYKNg2o0WpdPlBssFGixwHaRizBgGwH1uAV6zeAEaU57HDdiJhA0f4a6qD3SEOJm67tYO9Y9vEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892828; c=relaxed/simple;
	bh=8IySV+zjl4Q3PabWEsSWbmjUJYYPs2ADwVyy8nojSUk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=d/IfhLGr26IPcdMjI9LcaCtrUix8/2FBikqvnPNqLPGC+KMNbtIG1eYi6JDDRIZF3ls+t2X6U65i63Xx8jo/0GboXr/Pp3tH/3r9ua65HdOTmcb+ugZ7oMdUyJ+/TJuYNPXXyAjozETLWSs1BhLYrahpI4Z7F4uGxRmdeNWIMFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.32) with ESMTP
	id 682EBA2B000069DF; Thu, 22 May 2025 13:46:21 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 594AF7BC60AB456B903CEEEC1929F436
X-SMAIL-UIID: 594AF7BC60AB456B903CEEEC1929F436-20250522-134621
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org
Subject: RE: [PATCH 2/2] ASoC: codecs: add support for ES8375
Date: Thu, 22 May 2025 13:46:19 +0800
Message-Id: <20250522054619.9574-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> > +static int es8375_dmic_set(struct snd_kcontrol *kcontrol,
> > +	struct snd_ctl_elem_value *ucontrol)
> > +{
> 
> > +	if (val) {
> > +		regmap_update_bits_check(es8375->regmap, ES8375_ADC1, 0x80, 0x80, &changed1);
> > +		es8375->dmic_enable = 0x01;
> > +	} else {
> > +		regmap_update_bits_check(es8375->regmap, ES8375_ADC1, 0x80, 0x00, &changed1);
> > +		es8375->dmic_enable = 0x00;
> > +	}
> 
> Instead of overriding this you could just read the register value when
> you need it, you've got a register cache so it should be fast enough and
> it's a lot less code.

I'll read the ES8375_ADC1 when I need the dmic_enable.
So I can replace SOC_DAPM_ENUM_EXT with SOC_DAPM_ENUM
which is used for ADC MUX.

> > +static const struct snd_kcontrol_new es8375_snd_controls[] = {
> > +	/* Capture Path */
> > +	SOC_SINGLE_TLV("ADC OSR GAIN", ES8375_ADC_OSR_GAIN,
> > +			ADC_OSR_GAIN_SHIFT_0, ES8375_ADC_OSR_GAIN_MAX, 0,
> > +			es8375_adc_osr_gain_tlv),
> 
> Gain/volume controls should end in Volume as covered in control-names.rst.
> 
> > +	SOC_SINGLE("ADC Invert", ES8375_ADC1, ADC_INV_SHIFT_6, 1, 0),
> 
> On/off switches should end in Switch.

Thanks for reminding. I'll modify it.

> > +	ret = regulator_get_voltage(es8375->core_supply[0].consumer);
> 
> Might be nicer to have something better than a magic number to ensure
> that the supplies are in order, or use a specific variable.

I think I got your point.

> > +	case SND_SOC_DAIFMT_CBC_CFP:    /* MASTER MODE */
> > +		es8375->mastermode = 1;
> > +		regmap_update_bits(es8375->regmap, ES8375_RESET1,
> > +				0x80, 0x80);
> > +		break;
> > +	case SND_SOC_DAIFMT_CBC_CFC:    /* SLAVE MODE */
> 
> Please avoid using outdated terminologoy for clock provider and
> consumer.

I'll delete it.

> > +static void es8375_init(struct snd_soc_component *component)
> > +{
> 
> > +	regmap_write(es8375->regmap, ES8375_ADC_VOLUME, 0xBF);
> > +	regmap_write(es8375->regmap, ES8375_DAC_VOLUME, 0xBF);
> 
> Some of these settings look like they are (or should be) user
> controllable and should be left at the chip defaults, the volumes above
> really stand out.  We use chip defaults to avoid having to decide which
> use cases to configure for.

Because the default value of the chip's volume register is 0x00,
initializing the device without setting it to 0xbf will
cause the device to mute until the customer sets the volume.

> > +static struct regmap_config es8375_regmap_config = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +	.max_register = ES8375_REG_MAX,
> > +	.cache_type = REGCACHE_RBTREE,
> 
> Unless you've got a really strong reason for using _RBTREE new drivers
> should use _MAPLE, it's a more modern underlying data structure and
> makes choices more suitable for current systems.

ok
