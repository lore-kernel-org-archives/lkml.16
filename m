Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58B29A2;
	Wed,  9 Apr 2025 01:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744160762; cv=none; b=lNidV3PpXiaUQgKMROn8uMCA6+Q4yLdl6vNG0bq2Vo5JcnaHs3pz6gXEObMvjx/m5En6cKGPce2wARRDKaws98okA660ZN1aUZpkDjB/ai+GfShd8LbvAVdvCqAvHMl9fxGpCrbU8oOoOPp4/9yCQTS+lbq4jxYvCJq81qPf5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744160762; c=relaxed/simple;
	bh=6Drd4TB17uLprwCcpm3PqHESp01tKrojy6WHIWwNFJA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ht6CvJumCLDQentUymVyuqwwEUw2YkVFc2XlN+JeB9QYV/4GaZRGCu8e5r2N5PjWebrK8lYjtxQTTZhG0Rdwj0NmnkluUUHZDg/ZhkRm9nDCvRNBAwG7jfwRYkv3GkDPDSqDoMcIQ3F5Wgh58dP40MenNJUz9IGHWi+O4EdSP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=eP5ie3Ho; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="eP5ie3Ho"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1744160755;
	bh=JrRgcz0jk0p5CxI5j739Foq1vk1QG0/X59VRPjZ61vI=; l=7949;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=eP5ie3HoYd4gkd47BN5pHdICZ+rg0VakBGzkrvjRVvXJeGIZ7FO1fzqbOjIM0NW9u
	 alykx3zn8mdQq3ts8B9Eg+IXgH/rGSvJKpAziFpi3NHOfl15IWx8h/q7P6UTD/Teer
	 d3PCTvhQRZ30ZS9Qvee590li62N1oRUpcFF2HTl6fYoKLt3YG3dAQwZYLe6H6LgLn8
	 xxtMK9LgCAzUE7OPWHnWf3wJHVzQdAodcMQOkpHQgzOjD9GVpSJN29FY/m+wxOd9QY
	 nS1kIuprzFKtB4kG+twCrj2MOoVqunglPj/fro8bigALZCNOH3HLpkJNofXch3arln
	 m1cVish2QhMnw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2132241:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Wed, 09 Apr 2025 09:05:30 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 9 Apr
 2025 09:05:30 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Wed, 9 Apr 2025 09:05:30 +0800
Date: Wed, 9 Apr 2025 09:06:52 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Otto lin
	<otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] ASoC: codecs: Add support for Richtek rt9123p
Message-ID: <Z/XILJ8YRt905whu@git-send.richtek.com>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <27583d8f9bb07351e5c9ea78ed286ca6daa74a8d.1743774849.git.cy_huang@richtek.com>
 <20250404200519.GA198531-robh@kernel.org>
 <Z/Mh8JEHqYohvcfL@git-send.richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z/Mh8JEHqYohvcfL@git-send.richtek.com>

On Mon, Apr 07, 2025 at 08:53:04AM +0800, ChiYuan Huang wrote:
> On Fri, Apr 04, 2025 at 03:05:19PM -0500, Rob Herring wrote:
> > On Fri, Apr 04, 2025 at 10:22:14PM +0800, cy_huang@richtek.com wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > 
> > > Add codec driver for Richtek rt9123p.
> > > 
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > >  sound/soc/codecs/Kconfig   |   6 ++
> > >  sound/soc/codecs/Makefile  |   2 +
> > >  sound/soc/codecs/rt9123p.c | 171 +++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 179 insertions(+)
> > >  create mode 100644 sound/soc/codecs/rt9123p.c
> > > 
> > > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > > index c61b2d3cf284..b0fa935846c0 100644
> > > --- a/sound/soc/codecs/Kconfig
> > > +++ b/sound/soc/codecs/Kconfig
> > > @@ -1832,6 +1832,12 @@ config SND_SOC_RT9123
> > >  	  Enable support for the I2C control mode of Richtek RT9123 3.2W mono
> > >  	  Class-D audio amplifier.
> > >  
> > > +config SND_SOC_RT9123P
> > > +	tristate "Richtek RT9123P Mono Class-D Amplifier"
> > > +	help
> > > +	  Enable support for the HW control mode of Richtek RT9123P 3.2W mono
> > > +	  Class-D audio amplifier.
> > > +
> > >  config SND_SOC_RTQ9128
> > >  	tristate "Richtek RTQ9128 45W Digital Input Amplifier"
> > >  	depends on I2C
> > > diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> > > index d8d0bc367af8..fba699701804 100644
> > > --- a/sound/soc/codecs/Makefile
> > > +++ b/sound/soc/codecs/Makefile
> > > @@ -271,6 +271,7 @@ snd-soc-rt721-sdca-y := rt721-sdca.o rt721-sdca-sdw.o
> > >  snd-soc-rt722-sdca-y := rt722-sdca.o rt722-sdca-sdw.o
> > >  snd-soc-rt9120-y := rt9120.o
> > >  snd-soc-rt9123-y := rt9123.o
> > > +snd-soc-rt9123p-y := rt9123p.o
> > >  snd-soc-rtq9128-y := rtq9128.o
> > >  snd-soc-sdw-mockup-y := sdw-mockup.o
> > >  snd-soc-sgtl5000-y := sgtl5000.o
> > > @@ -686,6 +687,7 @@ obj-$(CONFIG_SND_SOC_RT721_SDCA_SDW)     += snd-soc-rt721-sdca.o
> > >  obj-$(CONFIG_SND_SOC_RT722_SDCA_SDW)     += snd-soc-rt722-sdca.o
> > >  obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
> > >  obj-$(CONFIG_SND_SOC_RT9123)	+= snd-soc-rt9123.o
> > > +obj-$(CONFIG_SND_SOC_RT9123P)	+= snd-soc-rt9123p.o
> > >  obj-$(CONFIG_SND_SOC_RTQ9128)	+= snd-soc-rtq9128.o
> > >  obj-$(CONFIG_SND_SOC_SDW_MOCKUP)     += snd-soc-sdw-mockup.o
> > >  obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
> > > diff --git a/sound/soc/codecs/rt9123p.c b/sound/soc/codecs/rt9123p.c
> > > new file mode 100644
> > > index 000000000000..b0ff5f856e4c
> > > --- /dev/null
> > > +++ b/sound/soc/codecs/rt9123p.c
> > > @@ -0,0 +1,171 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +//
> > > +// rt9123p.c -- RT9123 (HW Mode) ALSA SoC Codec driver
> > > +//
> > > +// Author: ChiYuan Huang <cy_huang@richtek.com>
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/err.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <sound/pcm.h>
> > > +#include <sound/soc.h>
> > > +#include <sound/soc-dai.h>
> > > +#include <sound/soc-dapm.h>
> > > +
> > > +struct rt9123p_priv {
> > > +	struct gpio_desc *enable;
> > > +	unsigned int enable_delay;
> > > +	int enable_switch;
> > > +};
> > > +
> > > +static int rt9123p_daiops_trigger(struct snd_pcm_substream *substream, int cmd,
> > > +				  struct snd_soc_dai *dai)
> > > +{
> > > +	struct snd_soc_component *comp = dai->component;
> > > +	struct rt9123p_priv *rt9123p = snd_soc_component_get_drvdata(comp);
> > > +
> > > +	if (!rt9123p->enable)
> > > +		return 0;
> > > +
> > > +	switch (cmd) {
> > > +	case SNDRV_PCM_TRIGGER_START:
> > > +	case SNDRV_PCM_TRIGGER_RESUME:
> > > +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > > +		mdelay(rt9123p->enable_delay);
> > > +		if (rt9123p->enable_switch) {
> > > +			gpiod_set_value(rt9123p->enable, 1);
> > > +			dev_dbg(comp->dev, "set enable to 1");
> > > +		}
> > > +		break;
> > > +	case SNDRV_PCM_TRIGGER_STOP:
> > > +	case SNDRV_PCM_TRIGGER_SUSPEND:
> > > +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> > > +		gpiod_set_value(rt9123p->enable, 0);
> > > +		dev_dbg(comp->dev, "set enable to 0");
> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rt9123p_enable_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
> > > +				int event)
> > > +{
> > > +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> > > +	struct rt9123p_priv *rt9123p = snd_soc_component_get_drvdata(comp);
> > > +
> > > +	if (event & SND_SOC_DAPM_POST_PMU)
> > > +		rt9123p->enable_switch = 1;
> > > +	else if (event & SND_SOC_DAPM_POST_PMD)
> > > +		rt9123p->enable_switch = 0;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct snd_soc_dapm_widget rt9123p_dapm_widgets[] = {
> > > +	SND_SOC_DAPM_OUTPUT("SPK"),
> > > +	SND_SOC_DAPM_OUT_DRV_E("Amp Drv", SND_SOC_NOPM, 0, 0, NULL, 0, rt9123p_enable_event,
> > > +			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
> > > +};
> > > +
> > > +static const struct snd_soc_dapm_route rt9123p_dapm_routes[] = {
> > > +	{"Amp Drv", NULL, "HiFi Playback"},
> > > +	{"SPK", NULL, "Amp Drv"},
> > > +};
> > > +
> > > +static const struct snd_soc_component_driver rt9123p_comp_driver = {
> > > +	.dapm_widgets		= rt9123p_dapm_widgets,
> > > +	.num_dapm_widgets	= ARRAY_SIZE(rt9123p_dapm_widgets),
> > > +	.dapm_routes		= rt9123p_dapm_routes,
> > > +	.num_dapm_routes	= ARRAY_SIZE(rt9123p_dapm_routes),
> > > +	.idle_bias_on		= 1,
> > > +	.use_pmdown_time	= 1,
> > > +	.endianness		= 1,
> > > +};
> > > +
> > > +static const struct snd_soc_dai_ops rt9123p_dai_ops = {
> > > +	.trigger        = rt9123p_daiops_trigger,
> > > +};
> > > +
> > > +static struct snd_soc_dai_driver rt9123p_dai_driver = {
> > > +	.name = "HiFi",
> > > +	.playback = {
> > > +		.stream_name	= "HiFi Playback",
> > > +		.formats	= SNDRV_PCM_FMTBIT_S16 | SNDRV_PCM_FMTBIT_S24 |
> > > +				  SNDRV_PCM_FMTBIT_S32,
> > > +		.rates		= SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
> > > +				  SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_24000 |
> > > +				  SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> > > +				  SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
> > > +				  SNDRV_PCM_RATE_96000,
> > > +		.rate_min	= 8000,
> > > +		.rate_max	= 96000,
> > > +		.channels_min	= 1,
> > > +		.channels_max	= 2,
> > > +	},
> > > +	.ops    = &rt9123p_dai_ops,
> > > +};
> > > +
> > > +static int rt9123p_platform_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct rt9123p_priv *rt9123p;
> > > +	int ret;
> > > +
> > > +	rt9123p = devm_kzalloc(dev, sizeof(*rt9123p), GFP_KERNEL);
> > > +	if (!rt9123p)
> > > +		return -ENOMEM;
> > > +
> > > +	rt9123p->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> > > +	if (IS_ERR(rt9123p->enable))
> > > +		return PTR_ERR(rt9123p->enable);
> > > +
> > > +	ret = device_property_read_u32(dev, "enable-delay", &rt9123p->enable_delay);
> > 
> > Not documented. You have a single GPIO for any sort of control. What is 
> > this delay relative to? Why does it need to be tuned per board? 
> > Properties with units have unit suffix.
> > 
> Like as the property desciption in the document, to wait clock or data
> to be ready. Sometimes, there's unknown jitter signal while clock or
> data starts. It'll be better to have a delay for this. That's why it's
> optional.
> 
Hi, Rob:
  I'm sorting out all the changes needed for v2.

In last mail, I have already described what the delay for.

Another question is for this property name 'enable-delay'. Should I add a
suffix like as 'enable-delay-ms'?
> Thanks.
> > Rob
