Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820071DFDAE;
	Sat,  5 Apr 2025 23:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894987; cv=none; b=t5bKtOsLrQayC1enh4whZm8SpCX95lrp9/wGLrB0kQyOcnpDzGAga8FyoxZBO8meVqoCB0zIySI7VuBrWo4w9LtVqO3dBwtJalnEfaruY6qMozhmtcfQFuTDZCChHAJPhnKgAr5et55hYTyO2tU5Iu/gU+60bl+hs/nXOoN0mhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894987; c=relaxed/simple;
	bh=HzPCNCOaGfHJ1SZafUSoMYOx1UbS0RK4HV+uhmMxEog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAEHsajNec+AhObmCybq4fDUpdivlv82ZE2k1CGnxUshYsNtRBtlpv63m+ZNXRWJZiY50VuVevN0YygkRqsFVaETZDqMBzDO/IPjd2uFJXZPrFmUI/Qooz8dFQ2MANJey3STIySrkZnX6gPAjaHECL4UMKH/wJNeaeTLaUG3dtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdV1l83f; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdV1l83f"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22403cbb47fso32889405ad.0;
        Sat, 05 Apr 2025 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894985; x=1744499785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJgUl+Lri83Oq+9zJGLqwIEzCS7Ndje3xSETbGABjZc=;
        b=QdV1l83fcAcs5HIb+CfPN+5ql0QNDYGugIjUTaaBzIi3qf9CQwh3Z8zLYCMxmi46zP
         LovEVsg9bMIIuKstzX3tWTtVW5N5yNk5Eh+GLebEmkUYlpWaZHY46HsLHW3hZ/KPM46X
         kIIagHZ4THtPVJ94qyHNTvVFugmA785WnGjh6atCpRDkzp+JmYzf3PbiF+8Uf1LOkSSg
         rJ62zL+PAtimK8wE5AW6CbIDuiZGO8OfCq650M3V/6Gq10+Koqg4/dsOmhhOK95lvecO
         Ic8/XRGcgO/ryLww0QM3qwb6mcurepK79qc9epX4kLQoBBiWObIsxr+NwMje5ybA+OGH
         SCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894985; x=1744499785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJgUl+Lri83Oq+9zJGLqwIEzCS7Ndje3xSETbGABjZc=;
        b=I3mobKIb6FrlW32UF43EOasPSiP5EIY7Fx7xnYz/dIytpwmY4GgxH/XDKCHxtE5jB3
         0Y/R4aoMcMEMoXwba4qb0W51EFq92+YDXWrHw1c4fyXG6VrYZ2ZWOq0OstR7ti4TMXPa
         gunBjQUkpq4XXUctkEoOydmHmQvgAB5GtSjeGY+EpZkCyrkcTwZc/263egrfvrZKLkum
         q2PcaeSHT8sQn3ptdLHddVIvgC7BgA7DaDFjrjdroCXBt2kkkQkm9RSCZ3enQZS6BmRn
         tdEzduwffu/zBhhZx8TlDf1I6ptlEser/duxV3afZov3fkj8/DIcc+Hr0tHT/NJOZXJa
         ytjg==
X-Forwarded-Encrypted: i=1; AJvYcCVQBLYeRgyn/jdmkDJuJm/qJ0KfHvpcQsF2CaoWgi+cZTedCqR6lpsozD3y3cwC5DJtalrtjui7bFkfNN8L@vger.kernel.org, AJvYcCWSoPPFNUJJDi1MUIcSIRphJKzgdCYb+OndPnvTEbANGogLD9FvUmdkWnXp+U7iEVP5mnuFM9Hz82b2@vger.kernel.org, AJvYcCWz0PP7r6QOLBJVynmHPwf5ubTmhYpHxbmQIn4KpUB2Kb7k8TvZV5I8tLwH7ezFwDxlwzSLcCWQWKW8G6M=@vger.kernel.org, AJvYcCXTEuuI2lVp2+/AJmwuPjmF9IuCn4LnNvFrxiNz1ozxEQ3AEcioGIHIUpd2a0k6d+aeDZIt1z+1GmZ9xQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQOMp0hSdyWY7ai2HJ0DN2xRhkgBkewHbdnVd9mnuRc0yTUcWD
	NFZRFhfC/rZLvu8kxGglutE1hz5mdu+njcvdgUPM3ptb03wok2iR
X-Gm-Gg: ASbGncutcx1UT00+EVNvq8fx6oicqn4MoL4z4bGc0omg5Nx7nDJbJj4ZZrFp2HCxP27
	TAZjdKOmJUH79KSYY1WjRXyg/R8CrgMG0Uh2YPmg+1Ms5fti7vl/wwqo5FUsjEPzcRN4LVc+jv4
	mXxmGkVPOZb6An5WRvU1C4b3sUko6D2nyaUFbRX1xPn5qqMUpMVst7W3ql5sAjedFD7EaGi8eTl
	UVEXmxHmRqX3W9dEkF8vTdbXp8WtbHfdtQyPK/cRBLoQru6vQfEnO7R5Ckxr/lGPhFGvjlMH1G3
	ysqsLlVlViG8Ig5tXasvi1Ei9IbkxEYmSFdB6lKN2MSd2G+12XPKvQcw+cK4vSonaQpevoJRnSM
	ulXlldE7Ehd4qREUo5x8YZNUbYWq4hMckzINDwLM=
X-Google-Smtp-Source: AGHT+IEVN5VB9kZvBYQ0TjCkqo4Wt7GleWXD5XDgrsFGv91UONf5YKT42TApbq/Y0lwjk+7IjZk+Mg==
X-Received: by 2002:a17:903:1cc:b0:224:1e7a:43fe with SMTP id d9443c01a7336-22a8a8ddc27mr89469255ad.46.1743894984690;
        Sat, 05 Apr 2025 16:16:24 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:16:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:11 +1000
Subject: [PATCH v5 7/8] ASoC: tas2770: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250406-apple-codec-changes-v5-7-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4412;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HzPCNCOaGfHJ1SZafUSoMYOx1UbS0RK4HV+uhmMxEog=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3a9FRTbd79/3ka+ZWv6g3MjFB5rpcw8M+NjWMn13
 q8pTByJHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzk3VWG/z5Nr94WLd8RJsYe
 6Nr5XPx44Ke9Kj43PflyDjSdiFho4MDw37+lImpP1j9h/rgP7+8s2LFbff2uhcyf70lPD/NftUx
 iNRMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 includes an ADC which reports the chip's die temperature.
As per the datasheet, the temperature in degrees Celsius is derived
by taking the raw value stored in the ADC's registers, dividing by 16,
then subtracting 93.

Create and register a hwmon device to expose the chip's die temperature
to the hwmon interface.

The ADC is shut down during software shutdown mode, and its registers
are initialised to 0 on reset. This means that the die temperature will
read -93 *C until the chip has been fully powered up at least once (e.g.
the PCM its attached to is opened). Once the chip is put into software
shutdown again, the ADC will also shut down. The last value sampled
before this happens will persist in the ADC's registers.

Co-developed-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 96 +++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 55e4723044044338bd941763240d24ccfef6e8f3..6f878b01716f728724a00ba3e1ce7afe3a420eda 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/hwmon.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/gpio/consumer.h>
@@ -530,6 +531,88 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
 	},
 };
 
+static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
+{
+	int ret = 0;
+	int reading, msb, lsb;
+
+	ret = regmap_read(tas2770->regmap, TAS2770_TEMP_MSB, &msb);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(tas2770->regmap, TAS2770_TEMP_LSB, &lsb);
+	if (ret)
+		return ret;
+
+	reading = (msb << 4) | (lsb >> 4);
+
+	/*
+	 * As per datasheet: divide register by 16 and subtract 93 to get
+	 * degrees Celsius. hwmon requires millidegrees. Let's avoid rounding
+	 * errors by subtracting 93 * 16 then multiplying by 1000 / 16.
+	 *
+	 * NOTE: The ADC registers are initialised to 0 on reset. This means
+	 * that the temperature will read -93 *C until the chip is brought out
+	 * of software shutdown (e.g. the PCM it's attached to is opened). The
+	 * ADC is also shut down in software shutdown/low-power mode, so the
+	 * value read back from its registers will be the last value sampled
+	 * before entering software shutdown.
+	 */
+	*result = (reading - (93 * 16)) * (1000 / 16);
+	return 0;
+}
+
+static umode_t tas2770_hwmon_is_visible(const void *data,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel)
+{
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int tas2770_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct tas2770_priv *tas2770 = dev_get_drvdata(dev);
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = tas2770_read_die_temp(tas2770, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct hwmon_channel_info *const tas2770_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops tas2770_hwmon_ops = {
+	.is_visible	= tas2770_hwmon_is_visible,
+	.read		= tas2770_hwmon_read,
+};
+
+static const struct hwmon_chip_info tas2770_hwmon_chip_info = {
+	.ops	= &tas2770_hwmon_ops,
+	.info	= tas2770_hwmon_info,
+};
+
 static const struct regmap_config tas2770_i2c_regmap;
 
 static int tas2770_codec_probe(struct snd_soc_component *component)
@@ -758,6 +841,19 @@ static int tas2770_i2c_probe(struct i2c_client *client)
 		}
 	}
 
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon;
+
+		hwmon = devm_hwmon_device_register_with_info(&client->dev, "tas2770",
+							tas2770,
+							&tas2770_hwmon_chip_info,
+							NULL);
+		if (IS_ERR(hwmon)) {
+			return dev_err_probe(&client->dev, PTR_ERR(hwmon),
+					     "Failed to register temp sensor\n");
+		}
+	}
+
 	result = tas2770_register_codec(tas2770);
 	if (result)
 		dev_err(tas2770->dev, "Register codec failed.\n");

-- 
2.49.0

