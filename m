Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C170D1F3D55;
	Fri,  4 Apr 2025 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776832; cv=none; b=LsAq84SKBPJgnZIM/7uuf8f7r10DabpAMWkXsHTFPG49KK3gPjjmMtW1O6tEOaiCHc08ZUrH9BsadxkexfDHy6P3Lj1APLhkzu6c9oCfptXrN5ums10Rk7FGscVI/+BL+TlMAFoUo/4ts1v9HyzUUPEv9oSX1Ep15WQbGv2V1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776832; c=relaxed/simple;
	bh=kSn1yg38EPPKwat9rHZ24T+aY3mOmcN2L6M6PC+VPLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aq3yvD8HzFXDgzXv5aOINW9H+KhVUexzUjDYxYHdcNKBOQB1nerPtx6Lc7zItZcUkrO3TFdhQEQb5VapGtHjpWgHBt083W21rfwGTuk4kz2xMLuxqUrI6/9+dNsrsrIE3SDMkBK5ywJRxU/jVqYKLv4jmpFlXu7YOjuYeitjuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=avsnR5wY; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=j1N3QS7M; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="avsnR5wY";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="j1N3QS7M"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776827;
	bh=aglb5OHsTbp+0R4YChzcPhprli8y1VdJHrs6yV4O4qE=; l=7046;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=avsnR5wYkS+0EmVQaMV4KEpDiNzAYIqJjoX9eGH9SC4n7XGxoWPk3/sL2GAKaDTQw
	 iRX/DNEiwODEWqwE0+lNo9g65jsQjO33o0tUz3MlHapDUL8vZlpl3coFGM66GSI3PE
	 ON/Y6LXlEwroO4QP0uyiVu7014ZR0ufVmgUgSFaT9mZtwlDJgTWUn5MxZl1RM5uW91
	 xv2r9ROMl5NQ1sck8ylrg9zxgDZTcGWYwrGOWHP+cwOtJNNrtE+i7qMza0947SREYc
	 C263W1epku/XGhmUjRx5dUN9XObQX+u8Lz64L9dUlxBaBFnCzTHKTuHc2DoeMFktji
	 0IfksKa0ABXPA==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128084:0:AUTH_RELAY)
	(envelope-from <prvs=11846F16CF=cy_huang@richtek.com>); Fri, 04 Apr 2025 22:26:58 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776818;
	bh=aglb5OHsTbp+0R4YChzcPhprli8y1VdJHrs6yV4O4qE=; l=7046;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=j1N3QS7MDtJhNvO7Nm3251WoekJ3eTQNHHM1Za2zGx39vn8kNZEtdOyWsoeVZbAKl
	 VgMauaH/iTkq2fLDqpMfq8pxdypXocrFGsVw55LudHoSJIjqr5yjuGPj8zKR6RuYiI
	 WJk29/wjoVOh1qgwU595clxMQqh2c09plOd90sPhARGkwNzs1Iu+Vfr8s/NQndT3vK
	 mTYX1AUfQsR1nbznzVQIRBOntLVuWOjh/Qo9t4qsFfUH/FM/IUXEj94g+YSDRjGdd4
	 pTo8KCQho4+Rdz+2j98h/Sqik5KRJWtvAwZrsDsozkkPj8pNtaOoaVaZhRI7OH28EZ
	 kYdgKkysrsqWQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1629328:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 04 Apr 2025 22:21:09 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 4 Apr
 2025 22:21:09 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Fri, 4 Apr 2025 22:21:09 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ChiYuan
 Huang <cy_huang@richtek.com>, Otto lin <otto_lin@richtek.com>, Allen Lin
	<allen_lin@richtek.com>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] ASoC: codecs: Add support for Richtek rt9123p
Date: Fri, 4 Apr 2025 22:22:14 +0800
Message-ID: <27583d8f9bb07351e5c9ea78ed286ca6daa74a8d.1743774849.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1743774849.git.cy_huang@richtek.com>
References: <cover.1743774849.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Add codec driver for Richtek rt9123p.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/Kconfig   |   6 ++
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/rt9123p.c | 171 +++++++++++++++++++++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 sound/soc/codecs/rt9123p.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c61b2d3cf284..b0fa935846c0 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1832,6 +1832,12 @@ config SND_SOC_RT9123
 	  Enable support for the I2C control mode of Richtek RT9123 3.2W mono
 	  Class-D audio amplifier.
 
+config SND_SOC_RT9123P
+	tristate "Richtek RT9123P Mono Class-D Amplifier"
+	help
+	  Enable support for the HW control mode of Richtek RT9123P 3.2W mono
+	  Class-D audio amplifier.
+
 config SND_SOC_RTQ9128
 	tristate "Richtek RTQ9128 45W Digital Input Amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d8d0bc367af8..fba699701804 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -271,6 +271,7 @@ snd-soc-rt721-sdca-y := rt721-sdca.o rt721-sdca-sdw.o
 snd-soc-rt722-sdca-y := rt722-sdca.o rt722-sdca-sdw.o
 snd-soc-rt9120-y := rt9120.o
 snd-soc-rt9123-y := rt9123.o
+snd-soc-rt9123p-y := rt9123p.o
 snd-soc-rtq9128-y := rtq9128.o
 snd-soc-sdw-mockup-y := sdw-mockup.o
 snd-soc-sgtl5000-y := sgtl5000.o
@@ -686,6 +687,7 @@ obj-$(CONFIG_SND_SOC_RT721_SDCA_SDW)     += snd-soc-rt721-sdca.o
 obj-$(CONFIG_SND_SOC_RT722_SDCA_SDW)     += snd-soc-rt722-sdca.o
 obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
 obj-$(CONFIG_SND_SOC_RT9123)	+= snd-soc-rt9123.o
+obj-$(CONFIG_SND_SOC_RT9123P)	+= snd-soc-rt9123p.o
 obj-$(CONFIG_SND_SOC_RTQ9128)	+= snd-soc-rtq9128.o
 obj-$(CONFIG_SND_SOC_SDW_MOCKUP)     += snd-soc-sdw-mockup.o
 obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
diff --git a/sound/soc/codecs/rt9123p.c b/sound/soc/codecs/rt9123p.c
new file mode 100644
index 000000000000..b0ff5f856e4c
--- /dev/null
+++ b/sound/soc/codecs/rt9123p.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt9123p.c -- RT9123 (HW Mode) ALSA SoC Codec driver
+//
+// Author: ChiYuan Huang <cy_huang@richtek.com>
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+
+struct rt9123p_priv {
+	struct gpio_desc *enable;
+	unsigned int enable_delay;
+	int enable_switch;
+};
+
+static int rt9123p_daiops_trigger(struct snd_pcm_substream *substream, int cmd,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *comp = dai->component;
+	struct rt9123p_priv *rt9123p = snd_soc_component_get_drvdata(comp);
+
+	if (!rt9123p->enable)
+		return 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		mdelay(rt9123p->enable_delay);
+		if (rt9123p->enable_switch) {
+			gpiod_set_value(rt9123p->enable, 1);
+			dev_dbg(comp->dev, "set enable to 1");
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		gpiod_set_value(rt9123p->enable, 0);
+		dev_dbg(comp->dev, "set enable to 0");
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int rt9123p_enable_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
+				int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct rt9123p_priv *rt9123p = snd_soc_component_get_drvdata(comp);
+
+	if (event & SND_SOC_DAPM_POST_PMU)
+		rt9123p->enable_switch = 1;
+	else if (event & SND_SOC_DAPM_POST_PMD)
+		rt9123p->enable_switch = 0;
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt9123p_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("SPK"),
+	SND_SOC_DAPM_OUT_DRV_E("Amp Drv", SND_SOC_NOPM, 0, 0, NULL, 0, rt9123p_enable_event,
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route rt9123p_dapm_routes[] = {
+	{"Amp Drv", NULL, "HiFi Playback"},
+	{"SPK", NULL, "Amp Drv"},
+};
+
+static const struct snd_soc_component_driver rt9123p_comp_driver = {
+	.dapm_widgets		= rt9123p_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(rt9123p_dapm_widgets),
+	.dapm_routes		= rt9123p_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(rt9123p_dapm_routes),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+};
+
+static const struct snd_soc_dai_ops rt9123p_dai_ops = {
+	.trigger        = rt9123p_daiops_trigger,
+};
+
+static struct snd_soc_dai_driver rt9123p_dai_driver = {
+	.name = "HiFi",
+	.playback = {
+		.stream_name	= "HiFi Playback",
+		.formats	= SNDRV_PCM_FMTBIT_S16 | SNDRV_PCM_FMTBIT_S24 |
+				  SNDRV_PCM_FMTBIT_S32,
+		.rates		= SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				  SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_24000 |
+				  SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
+				  SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
+				  SNDRV_PCM_RATE_96000,
+		.rate_min	= 8000,
+		.rate_max	= 96000,
+		.channels_min	= 1,
+		.channels_max	= 2,
+	},
+	.ops    = &rt9123p_dai_ops,
+};
+
+static int rt9123p_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rt9123p_priv *rt9123p;
+	int ret;
+
+	rt9123p = devm_kzalloc(dev, sizeof(*rt9123p), GFP_KERNEL);
+	if (!rt9123p)
+		return -ENOMEM;
+
+	rt9123p->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(rt9123p->enable))
+		return PTR_ERR(rt9123p->enable);
+
+	ret = device_property_read_u32(dev, "enable-delay", &rt9123p->enable_delay);
+	if (ret) {
+		rt9123p->enable_delay = 0;
+		dev_dbg(dev, "no optional property 'enable-delay' found, default: no delay\n");
+	}
+
+	platform_set_drvdata(pdev, rt9123p);
+
+	return devm_snd_soc_register_component(dev, &rt9123p_comp_driver, &rt9123p_dai_driver, 1);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id rt9123p_device_id[] = {
+	{ .compatible = "richtek,rt9123p" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt9123p_device_id);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id rt9123p_acpi_match[] = {
+	{ "RT9123P", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, rt9123p_acpi_match);
+#endif
+
+static struct platform_driver rt9123p_platform_driver = {
+	.driver = {
+		.name = "rt9123p",
+		.of_match_table = of_match_ptr(rt9123p_device_id),
+		.acpi_match_table = ACPI_PTR(rt9123p_acpi_match),
+	},
+	.probe	= rt9123p_platform_probe,
+};
+module_platform_driver(rt9123p_platform_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("ASoC rt9123p Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

