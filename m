Received: from smtp134-83.sina.com.cn (smtp134-83.sina.com.cn [180.149.134.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B72DCC09
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747967760; cv=none; b=Jb3E6AnUmI4H75Xhb+7hcVeSrHtP2G9LXCFYrAyna31/ftKalVuiD1BP7nYREP27hf3Io0kLF+1OCFcnVgExnt95i0jovnBN9A9lB7xWCGTds8VuPtnxhoUSJ7NBj236ql4ocfFOQobhT629nw9a3YcD9y8llL10lNCYJHwz+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747967760; c=relaxed/simple;
	bh=k2QUyEYtjSy2ELKzSy6CbabQnb4XeePXE+Ks4bcLdc8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=UF8VOQYAAEPuw8ra3AbPoZbTZECIoZIa/zMLoDlmB7euXFwMB0RZMpcgLSwCb4JG7q+Y/oN4BHyE/BuQF60sZatDfMLmawWP7ONs08gosW8XDAhxP9t9j4MtfqR/n6vAeDdaVwUkfkVh7/006oqDIOqd5RR3/79dayGCpj2rMOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.29) with ESMTP
	id 682FDEFE00001FF6; Fri, 23 May 2025 10:35:43 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 65ADCFA62A4F409EA62C1CA62EF59D2A
X-SMAIL-UIID: 65ADCFA62A4F409EA62C1CA62EF59D2A-20250523-103543
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
Subject: RE: [PATCH v1 2/2] ASoC: codecs: add support for ES8375
Date: Fri, 23 May 2025 10:35:41 +0800
Message-Id: <20250523023541.22682-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> > +static const struct snd_kcontrol_new es8375_snd_controls[] = {
> > +	SOC_SINGLE_TLV("ADC OSR GAIN Volume", ES8375_ADC_OSR_GAIN,
> > +			ADC_OSR_GAIN_SHIFT_0, ES8375_ADC_OSR_GAIN_MAX, 0,
> > +			es8375_adc_osr_gain_tlv),
> 
> Probably just ADC OSR Volume.
> 
> > +	SOC_SINGLE_TLV("DMIC Gain Volume", ES8375_ADC1,
> > +		DMIC_GAIN_SHIFT_2, ES8375_DMIC_GAIN_MAX,
> > +		0, es8375_adc_dmic_volume_tlv),
> 
> Same here.
> 
> > +	SOC_SINGLE("ADC Automute Enable", ES8375_ADC_AUTOMUTE,
> > +			ADC_AUTOMUTE_SHIFT_7, 1, 0),
> > +
> > +	SOC_SINGLE("DAC DSM Mute", ES8375_DAC1, DAC_DSMMUTE_SHIFT_7, 1, 0),
> > +	SOC_SINGLE("DAC DEM Mute", ES8375_DAC1, DAC_DEMMUTE_SHIFT_6, 1, 0),
> 
> > +	SOC_SINGLE("DAC Automute Enable", ES8375_DAC_AUTOMUTE1,
> > +			DAC_AUTOMUTE_EN_SHIFT_7, 1, 0),
> 
> These are all on/off switches so should be Switch.
> 
> > +	SOC_SINGLE_TLV("DAC Automute Attenuation", ES8375_DAC_AUTOMUTE,
> > +			DAC_AUTOMUTE_ATTN_SHIFT_0, ES8375_DAC_AUTOMUTE_ATTN_MAX,
> > +			0, es8375_dac_automute_attn_tlv),
> 
> This is also a Volume ("DAC Automute Volume").

I'll modify these control-name.

> > +	if (es8375->mclk_src == ES8375_BCLK_PIN) {
> > +		if (es8375->mastermode) {
> > +			dev_err(component->dev, "no mclk, cannot as master\n");
> > +			return -EINVAL;
> > +		}
> 
> Still got the outdated clocking terminology here.

I'll delete it
