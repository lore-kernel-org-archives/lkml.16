Received: from smtp134-79.sina.com.cn (smtp134-79.sina.com.cn [180.149.134.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B891A8F60
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743068310; cv=none; b=HvoOWI2fbLE/lpk/FGVvBRJtSyRsbAEuk/6kDYKxhLp0/LLGXM2hK4+lylZyrDUu5aI1CKooBJmHg/6MeMbBjYxr3w7639qs3EeMiZ+r9z9lixz/JTs56siF7N3Ep/VVQ6Kv3Xi2xNOdPhIMQC7sgG4Vnnk2OsTXSGitE9CPlhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743068310; c=relaxed/simple;
	bh=hXjAPFrEm6g0Zx8qm9hJGyjV1JomIaQsolkTA0hkEvY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=h3FM+1O7B4ZuJNOblwuxRuuMIrHW6pn9+GGavGn5w1vAl+ilaWfzULswyPXwJW52OAc/Orqk8my9oLDe6TlecpoRBTCL+Mgjh/GhEcvquLNMfIruxfXZlXUysHp4hfFnrhUgGZeVpczszQrx57GawTtO0YgyYiIRbJM8smSK4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.159.108.242])
	by sina.net (10.185.250.29) with ESMTP
	id 67E51C8B00005989; Thu, 27 Mar 2025 17:38:20 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: EA3D3A9DBD6743E6AFDA933E0A47562C
X-SMAIL-UIID: EA3D3A9DBD6743E6AFDA933E0A47562C-20250327-173820
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org
Cc: amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org
Subject: RE: [PATCH v6 1/2] ASoC: codecs: add support for ES8389
Date: Thu, 27 Mar 2025 17:38:18 +0800
Message-Id: <20250327093818.48050-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> >   	imply SND_SOC_ES8316
> >   	imply SND_SOC_ES8323
> >   	imply SND_SOC_ES8326
> > +	imply SND_SOC_ES8389
> >   	imply SND_SOC_ES8328_SPI
> >   	imply SND_SOC_ES8328_I2C
> >   	imply SND_SOC_ES7134
> 
> Add it in alphabetical order?

I'll fix the issue about the order of this couple of places.

> > diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c new 
> > file mode 100644 index 000000000000..73c1966c30be
> > --- /dev/null
> > +++ b/sound/soc/codecs/es8389.c
> > @@ -0,0 +1,966 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * es8389.c  --  ES8389/ES8390 ALSA SoC Audio Codec
> 
> The only place that mentions ES8390? Is this correct?

Actually ES8389 and ES8390 are the same chip.I'll drop the ES8390 in this place
to avoid any misunderstandings.

> > +	{50, 400000, 8000, 0x00, 0x75, 0x05, 0xC8, 0x01, 0xC1, 0x90, 0x10, 0x00, 0x18, 0xC7, 0xD0, 0xC0, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
> > +	{600, 4800000, 8000, 0x05, 0x65, 0x25, 0xF9, 0x00, 0xD1, 0x90, 0x10, 0x00, 0x18, 0xC7, 0xD0, 0xC0, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
> > +	{1500, 12000000, 8000, 0x0E, 0x25, 0x25, 0xE8, 0x00, 0xD1, 0x90, 0x40, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
> > +	{2400, 19200000, 8000, 0x0B, 0x01, 0x00, 0xD0, 0x00, 0xD1, 0x80, 0x90, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0xC7, 0xC7, 0x00, 0x12, 0x00, 0x09, 0x19, 0x07},
> > +	{3000, 24000000, 8000, 0x0E, 0x24, 0x05, 0xD0, 0x00, 0xC2, 0x80, 0xC0, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
> > +	{3250, 26000000, 8000, 0x40, 0x05, 0xA4, 0xC0, 0x00, 0xD1, 0x80, 
> > +0xD0, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0xC7, 0xC7, 0x00, 0x12, 0x00, 
> > +0x09, 0x19, 0x07},
> > +
> > +};
> 
> Missing new line between array above and below function? I think checkpatch warns about this?

I'll fix it

> > +
> > +static int es8389_probe(struct snd_soc_component *codec) {
> > +	int ret = 0;
> > +	struct es8389_private *es8389 = 
> > +snd_soc_component_get_drvdata(codec);
> 
> Use "reverse christmas tree" notation for declaring variables? Also ret gets overwritten below, so it is useless to set it.

I'll fix it

> > +static const struct regmap_config es8389_regmap = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +
> > +	.max_register = ES8389_MAX_REGISTER,
> > +
> > +	.volatile_reg = es8389_volatile_register,
> > +	.cache_type = REGCACHE_MAPLE,
> > +};
> > +
> > +static void es8389_i2c_shutdown(struct i2c_client *i2c) {
> > +	struct snd_soc_component *component;
> > +	struct es8389_private *es8389;
> > +
> > +	es8389 = i2c_get_clientdata(i2c);
> > +	component = es8389->component;
> 
> Unused variable? And while you are removing it, you can also remove it from 'struct es8389_private', as this place seems to be the only user.

Yes, I'll drop them

> > +
> > +	regmap_write(es8389->regmap, ES8389_MASTER_MODE, 0x28);
> > +	regmap_write(es8389->regmap, ES8389_HPSW, 0x00);
> > +	regmap_write(es8389->regmap, ES8389_VMID, 0x00);
> > +	regmap_write(es8389->regmap, ES8389_RESET, 0x00);
> > +	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xCC);
> > +	usleep_range(500000, 550000);//500MS
> > +	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0x00);
> > +	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x08);
> > +	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0xC1);
> > +	regmap_write(es8389->regmap, ES8389_PULL_DOWN, 0x00); }
> > +
> > +static int es8389_i2c_probe(struct i2c_client *i2c_client) {
> > +	struct es8389_private *es8389;
> > +	int ret = -1;
> 
> No need to set ret as it will be overwritten anyway, and '-1' is not considered a proper value. Use some error code if you must.

Ok
