Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C651F462E;
	Sat,  5 Apr 2025 23:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894994; cv=none; b=LbdEzmCRTqNJkvMMEcc6e+MTrtf8oNDHf/ufsi4NeK8FG4eptGAAEfUUyFAeQW2O0AJa60FwezlZ1qd8Z1ttYI9ZmPHdMGtgTYdGNk8tG+9mhPalRV0zz+g9ZDC0WQuzLDBGOrwcdqh6an5Xb9Euc0F+XSDlMJ0+AGApabNVUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894994; c=relaxed/simple;
	bh=5Z9X682HZUgLJ1v6uu51TGEAsXE/8Sre+u8dfgEfwT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bHfOjLiJWrkTGFF/QLUhgUe1GEN+gXxAiAnL5zmJvc+dNwoVvSNN5CCaJFSS0DsqVI5g1pDdrQvWmMmOlhTNgMDTuPz253wKMxnD6bwmpn98U+bLclofzX1oDLsAn2gk0JIcnd7JlI4kSeUbC1pj67VQU8/nGKWEFqqsLLp0s4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUVPpccP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUVPpccP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3147358a12.2;
        Sat, 05 Apr 2025 16:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894992; x=1744499792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBN7lJc+bnC3l4ET99fupuYYeHLn5bLfe23gswQ1Cp8=;
        b=PUVPpccPdcUfMWXtkcChmJujd2QjVX6+6wewDqNW9s16kO2mhwGY/kcJIeqFJ9ubOI
         8n5y3luorl+gUHVed38JcMuYQPgZ19arW4e5Nqcaw/peFfsb7MWWWade9KNHDBcxj0hL
         XP1uWlpswbpcvNIzF8cQBlB/W570SsBdszToxjbk1ukq2SOHyct1RkMizcWAnA5ZLZCd
         Fsmx9UdClqVtfJlKtiOVUUQqsywYieK/AW77Q507akm4FvTUxEncMm9N7tGAeXHxGkoX
         EpfbH5rkLjCVIECipYapFpHh5KpK3nOLgPl4hlb8e5fjXaUaSwnAaE9ADWy/7qOtcseL
         aicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894992; x=1744499792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBN7lJc+bnC3l4ET99fupuYYeHLn5bLfe23gswQ1Cp8=;
        b=dDG3nF25MI8eXl2107HlQ5ouLxG3whsgAPmSzJkttgoH6GJbEB+W1RqSfsOjOqUF3P
         UtdAr/JI4JrSyPoG25Lu1oqlnhCLxmhOIsW18+BeDAKLZv5dDuRkBIdze1KaayUu2X4Y
         3FGyxi0qQ2+MLFYQCqPmrdogGEdoJtKJHmJ8zxyUsoJt8luhF6O6xt0wZDFDArWnDYn9
         wm6zpJNva7zn74+riGJ6NXPSQZxqTsVyM8Z3nPdReyVDYY7EjWWLQMJy96QqRYAEeHIe
         wcFsgZ/4IZQYWZiNs3Z0OtKaw83l1sAn/uDipr1IbfkPi/BEcMPqzYHldg4wBJGyu2Q0
         5OZA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Q+hZkHTvrCKTr+N1rdengp7XgSKtzzc3jjkpqmGcWGY26EuuslVCuoABwuHzvsG4FufvuQgvYSc6ybg=@vger.kernel.org, AJvYcCWJLco+Tv0qs+k0INOzqQfFhCQ8AxEKv8KYFblBF2tZuI4y9TM1LiZlM0eqw/Kl681wqPsA7NHOHa0ZxYc=@vger.kernel.org, AJvYcCWKy+bS2Js0Ms3x0MvU4yKlxHHvr2e67rAVQ740b5Pgyneux1geBHmFU7XeWjVrauGsj3mbevpnn9r2@vger.kernel.org, AJvYcCXk4dAUPcvzGOuYZMobQ3OJOlGVpkk2rWoRuAgTtM6BXXOSpeZPURaChuuROrA5+mP+KoM43dcw0/gewHwN@vger.kernel.org
X-Gm-Message-State: AOJu0YygF94viy3XM1qrn/VVGO3nc72A6vKQvuoUJpSsbp9kmqMRbI0S
	ZF1uP6pXGw+twiw3/EYcr/dr/XFrFIGWqmviBmek4EVO93bVTND1fvIqDOTe
X-Gm-Gg: ASbGncv1SJfZkEnjW93pESEgsASKn/fvpfpgJ1oD7nQREHDFMIKRmQ2TgfD3uKL3XYI
	e1hn/FMWl7W1CDA5pGEG35LuFtaz1cXjvfKuakJAEYKsbV4nJOvecl0KLb5UNrVGzjlGPYYyJ0p
	yOnEuLfR7Grl8xnh+wPsrqpfp7V9VmpUMI/fHdRZAgLCFRG7lwVFuIRdQaPt3I6zIf5pORfCDRZ
	22vqYJ0UkRmeA9ryArBMRyON/QS6qt9ANVNLzqA72xR+wPhaZy1elS1JzD81O5tAEULfqDsXNlz
	qLF06jqNxTOWWJQADVF7iHvRJCyQgNp96OzFuouySHe74PxLs8BNN9T46CCjlMBUltTg+ee2kCt
	tjOghcw3cN35k6TcDpRu5VtPY/j/uGk/Vd54PFRV16ikFiXEsRA==
X-Google-Smtp-Source: AGHT+IGboQXup/sgtzEmkEwk8oMDufzhXkatqPuP1Cmf7+D+uVwma1W1OUqGKi2mrfi+tqTDKqnBBw==
X-Received: by 2002:a17:90b:2e41:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-306a47c2d6amr11531890a91.2.1743894992161;
        Sat, 05 Apr 2025 16:16:32 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:16:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:12 +1000
Subject: [PATCH v5 8/8] ASoC: tas2764: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250406-apple-codec-changes-v5-8-50a00ec850a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4733;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5Z9X682HZUgLJ1v6uu51TGEAsXE/8Sre+u8dfgEfwT0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3Ydffj9fdjhS7FJN4MP3lQONy7btTkkfquglGhlp
 KdAlsaRjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACZys4HhF1OSiWzl0nUxlpJ9
 wea9roGCa6+2byjY0Rrm5LN27fLiDYwMW6dJu2v3uVa/3yfL+Lp0Y9H9iL1lj54qVVZt2/SYhYW
 NAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2764 contains an ADC that reports the chip's die temperature.
The temperature in degrees Celsius is yielded by subtracting 93
from the raw value reported by the ADC.

Expose the codec die temperature to the hwmon interface.

The chip will initialise the temperature register to 2.6 *C
to avoid triggering over temp protection. As the ADC is powered
down during software shutdown, this value will persist until the
chip is fully powered up (e.g. when the PCM it's attached to is
opened). When the chip is powered back down, the last value sampled
will persist in the register.

Co-developed-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 89 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h |  3 +
 2 files changed, 92 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 21c38b2394b71ef7d05b4c2e781fdf73926fec5b..97968ee3af42e8400b8cbcc23fe2184afc8c715c 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/hwmon.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/gpio/consumer.h>
@@ -577,6 +578,80 @@ static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
 	return 0;
 }
 
+static int tas2764_read_die_temp(struct tas2764_priv *tas2764, long *result)
+{
+	int ret, reg;
+
+	ret = regmap_read(tas2764->regmap, TAS2764_TEMP, &reg);
+	if (ret)
+		return ret;
+	/*
+	 * As per datasheet, subtract 93 from raw value to get degrees
+	 * Celsius. hwmon wants millidegrees.
+	 *
+	 * NOTE: The chip will initialise the TAS2764_TEMP register to
+	 * 2.6 *C to avoid triggering temperature protection. Since the
+	 * ADC is powered down during software shutdown, this value will
+	 * persist until the chip is fully powered up (e.g. the PCM it's
+	 * attached to is opened). The ADC will power down again when
+	 * the chip is put back into software shutdown, with the last
+	 * value sampled persisting in the ADC's register.
+	 */
+	*result = (reg - 93) * 1000;
+	return 0;
+}
+
+static umode_t tas2764_hwmon_is_visible(const void *data,
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
+static int tas2764_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct tas2764_priv *tas2764 = dev_get_drvdata(dev);
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = tas2764_read_die_temp(tas2764, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct hwmon_channel_info *const tas2764_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops tas2764_hwmon_ops = {
+	.is_visible	= tas2764_hwmon_is_visible,
+	.read		= tas2764_hwmon_read,
+};
+
+static const struct hwmon_chip_info tas2764_hwmon_chip_info = {
+	.ops	= &tas2764_hwmon_ops,
+	.info	= tas2764_hwmon_info,
+};
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -825,6 +900,20 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 		}
 	}
 
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon;
+
+		hwmon = devm_hwmon_device_register_with_info(&client->dev, "tas2764",
+							tas2764,
+							&tas2764_hwmon_chip_info,
+							NULL);
+		if (IS_ERR(hwmon)) {
+			return dev_err_probe(&client->dev, PTR_ERR(hwmon),
+					     "Failed to register temp sensor\n");
+		}
+	}
+
+
 	return devm_snd_soc_register_component(tas2764->dev,
 					       &soc_component_driver_tas2764,
 					       tas2764_dai_driver,
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 3251dc0106e07862dd69efd69fa0e40c3858ecb7..538290ed3d92acea3322240a3bd09edd63694e50 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -117,6 +117,9 @@
 #define TAS2764_INT_LTCH3               TAS2764_REG(0x0, 0x50)
 #define TAS2764_INT_LTCH4               TAS2764_REG(0x0, 0x51)
 
+/* Readout Registers */
+#define TAS2764_TEMP                    TAS2764_REG(0x0, 0x56)
+
 /* Clock/IRQ Settings */
 #define TAS2764_INT_CLK_CFG             TAS2764_REG(0x0, 0x5c)
 #define TAS2764_INT_CLK_CFG_IRQZ_CLR    BIT(2)

-- 
2.49.0

