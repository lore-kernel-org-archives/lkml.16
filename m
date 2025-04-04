Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DFF18B494;
	Fri,  4 Apr 2025 20:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797121; cv=none; b=BpLekwJo/F/CENbaNoiQjuviK7BYTx4SrjBQyf4Jz2KsaSTPp8gZVhwRzK9bcqGnV09Bzjv3rmRMXmJHg+zsQFHiRNFZOmuoZfkLao2GGeUZc3ZnCiUNR5nx62lE+wheSeMQFPNhb69o0lJDlNyAfiNftG6juHLt68ZISFQ874U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797121; c=relaxed/simple;
	bh=GMCfGIgOJjz961NHnxEEdClQb5C3/47hhGB/CNUCJTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbfTCdYa+tnlKT3v1E+ffLbPVLCjL8yFhbJUxkLLzSCkNWgeA7Men+bppRnpaf6Q05/Mx1rWVZtsilQsA43qLHILDc7NZ0YA1pGiP+dCWxaXouQ7G/klbjSFfkNgeYK7Vkap5PBtJNYdke8KHs4TP1OanOesUlkXEfOF3/MifIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZsxJU/i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZsxJU/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD0DC4CEDD;
	Fri,  4 Apr 2025 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743797120;
	bh=GMCfGIgOJjz961NHnxEEdClQb5C3/47hhGB/CNUCJTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZsxJU/ibkUpFtrAwJ3jYKNR1R6qfnuuyI2rfGYCVlL4kq7SCowZvHnlpga98ja8W
	 mPbTGk22CHvTtppR4GuF34C5AH58V6r/NjtvEV3b0J4HoC9cpipRhEM7/XxmQDnw2A
	 p035DU8YqscCUvo2oVYWXPFsPOMRnACVlc+NR1jsnq5YD8vEYu19HXPpuSc1w+Djkb
	 Ym0WU2XVD4aJhij2vNplXJhXq7C698CcTGZF7dfXjpjdXHkWJp40uyau5UYKKBiyw5
	 dGXMN/JRBUPG7GrC/BC/KOKh4AnwMSD5LEuPxZ9uDPgMle2bH/iy9kDGh3Qzfm+OHO
	 oJ/5uxNypPf0w==
Date: Fri, 4 Apr 2025 15:05:19 -0500
From: Rob Herring <robh@kernel.org>
To: cy_huang@richtek.com
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: codecs: Add support for Richtek rt9123p
Message-ID: <20250404200519.GA198531-robh@kernel.org>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <27583d8f9bb07351e5c9ea78ed286ca6daa74a8d.1743774849.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27583d8f9bb07351e5c9ea78ed286ca6daa74a8d.1743774849.git.cy_huang@richtek.com>

On Fri, Apr 04, 2025 at 10:22:14PM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add codec driver for Richtek rt9123p.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  sound/soc/codecs/Kconfig   |   6 ++
>  sound/soc/codecs/Makefile  |   2 +
>  sound/soc/codecs/rt9123p.c | 171 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 179 insertions(+)
>  create mode 100644 sound/soc/codecs/rt9123p.c
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index c61b2d3cf284..b0fa935846c0 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1832,6 +1832,12 @@ config SND_SOC_RT9123
>  	  Enable support for the I2C control mode of Richtek RT9123 3.2W mono
>  	  Class-D audio amplifier.
>  
> +config SND_SOC_RT9123P
> +	tristate "Richtek RT9123P Mono Class-D Amplifier"
> +	help
> +	  Enable support for the HW control mode of Richtek RT9123P 3.2W mono
> +	  Class-D audio amplifier.
> +
>  config SND_SOC_RTQ9128
>  	tristate "Richtek RTQ9128 45W Digital Input Amplifier"
>  	depends on I2C
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index d8d0bc367af8..fba699701804 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -271,6 +271,7 @@ snd-soc-rt721-sdca-y := rt721-sdca.o rt721-sdca-sdw.o
>  snd-soc-rt722-sdca-y := rt722-sdca.o rt722-sdca-sdw.o
>  snd-soc-rt9120-y := rt9120.o
>  snd-soc-rt9123-y := rt9123.o
> +snd-soc-rt9123p-y := rt9123p.o
>  snd-soc-rtq9128-y := rtq9128.o
>  snd-soc-sdw-mockup-y := sdw-mockup.o
>  snd-soc-sgtl5000-y := sgtl5000.o
> @@ -686,6 +687,7 @@ obj-$(CONFIG_SND_SOC_RT721_SDCA_SDW)     += snd-soc-rt721-sdca.o
>  obj-$(CONFIG_SND_SOC_RT722_SDCA_SDW)     += snd-soc-rt722-sdca.o
>  obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
>  obj-$(CONFIG_SND_SOC_RT9123)	+= snd-soc-rt9123.o
> +obj-$(CONFIG_SND_SOC_RT9123P)	+= snd-soc-rt9123p.o
>  obj-$(CONFIG_SND_SOC_RTQ9128)	+= snd-soc-rtq9128.o
>  obj-$(CONFIG_SND_SOC_SDW_MOCKUP)     += snd-soc-sdw-mockup.o
>  obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
> diff --git a/sound/soc/codecs/rt9123p.c b/sound/soc/codecs/rt9123p.c
> new file mode 100644
> index 000000000000..b0ff5f856e4c
> --- /dev/null
> +++ b/sound/soc/codecs/rt9123p.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// rt9123p.c -- RT9123 (HW Mode) ALSA SoC Codec driver
> +//
> +// Author: ChiYuan Huang <cy_huang@richtek.com>
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <sound/soc-dapm.h>
> +
> +struct rt9123p_priv {
> +	struct gpio_desc *enable;
> +	unsigned int enable_delay;
> +	int enable_switch;
> +};
> +
> +static int rt9123p_daiops_trigger(struct snd_pcm_substream *substream, int cmd,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *comp = dai->component;
> +	struct rt9123p_priv *rt9123p = snd_soc_component_get_drvdata(comp);
> +
> +	if (!rt9123p->enable)
> +		return 0;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		mdelay(rt9123p->enable_delay);
> +		if (rt9123p->enable_switch) {
> +			gpiod_set_value(rt9123p->enable, 1);
> +			dev_dbg(comp->dev, "set enable to 1");
> +		}
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		gpiod_set_value(rt9123p->enable, 0);
> +		dev_dbg(comp->dev, "set enable to 0");
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rt9123p_enable_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
> +				int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	struct rt9123p_priv *rt9123p = snd_soc_component_get_drvdata(comp);
> +
> +	if (event & SND_SOC_DAPM_POST_PMU)
> +		rt9123p->enable_switch = 1;
> +	else if (event & SND_SOC_DAPM_POST_PMD)
> +		rt9123p->enable_switch = 0;
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget rt9123p_dapm_widgets[] = {
> +	SND_SOC_DAPM_OUTPUT("SPK"),
> +	SND_SOC_DAPM_OUT_DRV_E("Amp Drv", SND_SOC_NOPM, 0, 0, NULL, 0, rt9123p_enable_event,
> +			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
> +};
> +
> +static const struct snd_soc_dapm_route rt9123p_dapm_routes[] = {
> +	{"Amp Drv", NULL, "HiFi Playback"},
> +	{"SPK", NULL, "Amp Drv"},
> +};
> +
> +static const struct snd_soc_component_driver rt9123p_comp_driver = {
> +	.dapm_widgets		= rt9123p_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(rt9123p_dapm_widgets),
> +	.dapm_routes		= rt9123p_dapm_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(rt9123p_dapm_routes),
> +	.idle_bias_on		= 1,
> +	.use_pmdown_time	= 1,
> +	.endianness		= 1,
> +};
> +
> +static const struct snd_soc_dai_ops rt9123p_dai_ops = {
> +	.trigger        = rt9123p_daiops_trigger,
> +};
> +
> +static struct snd_soc_dai_driver rt9123p_dai_driver = {
> +	.name = "HiFi",
> +	.playback = {
> +		.stream_name	= "HiFi Playback",
> +		.formats	= SNDRV_PCM_FMTBIT_S16 | SNDRV_PCM_FMTBIT_S24 |
> +				  SNDRV_PCM_FMTBIT_S32,
> +		.rates		= SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
> +				  SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_24000 |
> +				  SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> +				  SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
> +				  SNDRV_PCM_RATE_96000,
> +		.rate_min	= 8000,
> +		.rate_max	= 96000,
> +		.channels_min	= 1,
> +		.channels_max	= 2,
> +	},
> +	.ops    = &rt9123p_dai_ops,
> +};
> +
> +static int rt9123p_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rt9123p_priv *rt9123p;
> +	int ret;
> +
> +	rt9123p = devm_kzalloc(dev, sizeof(*rt9123p), GFP_KERNEL);
> +	if (!rt9123p)
> +		return -ENOMEM;
> +
> +	rt9123p->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(rt9123p->enable))
> +		return PTR_ERR(rt9123p->enable);
> +
> +	ret = device_property_read_u32(dev, "enable-delay", &rt9123p->enable_delay);

Not documented. You have a single GPIO for any sort of control. What is 
this delay relative to? Why does it need to be tuned per board? 
Properties with units have unit suffix.

Rob
