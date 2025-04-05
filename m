Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0CC2576;
	Sat,  5 Apr 2025 00:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812061; cv=none; b=jy17qeMppjXO7kHRT+lvyqE5ubJfx+Y8+BMH6I5E/7VwKB+ReqM6x4GXjO4Cwahloy4dTR4MFOs5m9ya/MsZAsKWcPklfKennnVLdtfCnAtDFbUkKcVbvG38ztokggio8GkKccSZ2ZiCMaHDJRXfd/3oaH4YAttu0Nkt7H/kLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812061; c=relaxed/simple;
	bh=ImA9e8Vws4XKPSu4pYoGIMJVwD0Z9+nohE4Whtn2W5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwxKodHniJV6k/2as2QWIXEMQSYq0JYCbx4qFvvgJZ0win5IcCRLNXwWKXUDy8Da+m4L7KrzQE5HrVINimEeFtXOn50QXcS3I4mXjbIX6jkuksyuN5fNgTUyrsU6T1em2A1S8lEOTR6PiwSUfkKKJXFYPKYAuEe7IxhyV0isuMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLt9g99S; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLt9g99S"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3011737dda0so1896077a91.1;
        Fri, 04 Apr 2025 17:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812059; x=1744416859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRCE2dnF02x0/kEyW0hycp8x5K9VlVZ2SMA4g24GomA=;
        b=QLt9g99SgVMMtDHRq6v7rJJMt/30XOJ5B1SKXp3y2/Ece5GauwLKasfqwgwn10e+eJ
         KPOecLT5kWruVWXVRdqTa52qkOUwXv48fFHV9ga2TQSzfAPD6Y3FMEfZM47N90MshMKc
         67TFZBQU2bX0sU64rtECsQ12aFrd1ZdVGK+FlZjIJ3nMd3BDfN51iWLN41Nsq8LKsiSz
         WOfxcqVKVaztTqy6V6VIJ8deZMXAkGrrOFcHmhnPpaQOg9LT7r2o50EQnysMDh9qXTZE
         1M5nOTojXKVLvntOPahjO0La/txfv2Q14uGqyZWaiNsVf8qFS/3yjf31n+gig2mba74u
         +B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812059; x=1744416859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRCE2dnF02x0/kEyW0hycp8x5K9VlVZ2SMA4g24GomA=;
        b=LIPeJbcHtBOWH/bJNqpHdpW4Qtq1/A4JSADJLcTC7niKwCsdtFoMPugoL8kr5MzUSg
         5eZftifLD4cY+GjKwutrkbHOEdoiD7baoYTV8y5jgWa7U6mv6S6+CQC3zScAZ5Q9kUFV
         Zx/LW+TBsRwzJiQQqJY89ZUk6oBSG0oUFFqFgDLWALmM1kBg79csKKhBONMi1OLPu3gL
         wE7TNu/hRqwdzxtF7xd0EWM7jURZP/5xrcswXOY4FqYpaRttzXtjJqhZqJyvyn4y6Q3D
         I8psd/LhkEUO7frm9UuEL0LvXGECibh3CU8ejtpe/9JodbAW7vLjZOF/VrAMO/0M1UGh
         Ny4g==
X-Forwarded-Encrypted: i=1; AJvYcCUnr/c/kydYrcx9eJQPmrWSnw/JaK5UBrBZaAqljpRDo941TrginYqvY2qASDb4JplHMXJTEojApPCnsQsS@vger.kernel.org, AJvYcCW+aDOGSPmxfvZODBSQT2ME6Q+7ViryBp6ywqr5/aA/y5RXy3lNvV68m5VPu+TrVdZL0URBZzX3whzlIKE=@vger.kernel.org, AJvYcCW0DDFJP6uNbSPFxujKCkOvHZMrQs8XFBb9zCaz6PJyV/xbybfbHeYXROTW2I0YtazyjHjWo+OeClgA@vger.kernel.org, AJvYcCXcYV5LlYRKgYU+P/2fqyn6g7hj9TV9CrHOx6VDHgyu2rEVvZAVKO157H8vL/btHPPU0yEBsZs5fWobXoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ9TI4Z2O7mUoid5MdGMfM6+fhZDZ7qcoNg82aPO+g3ow2ORMv
	aLbK8s92s82X4bxPMdwMaj3UMcaGJaAy10PF+yokZnUedj8eYKB+axA5xAaP
X-Gm-Gg: ASbGncv4JXDq8JGOzPt5YBrdVpCw1/MR+ew80Kh3Qx9R34TlIo3O7y5zRwMLwsbTujS
	nG8vIU5+pKi/fpkBb2pF52zFWJTnclk+kqR92JJpDYjcTEnlv6BaEYcvut6aV+MVZitAExIdtnB
	2/yVof32fW4s2ADAc5yaMVzTjeiMSBJEc/Sls+BY6wptVeOqz90q3fKelclVgiQjJZtXoJscM+T
	c9YbD84hHDf0bX6QpbldQ5sqN0Vq6at9lVTEUiNnm32n5lvv1O9vOr6TXkbusLW9V/X8pe+bkZd
	TIDLyo92AGHbhJ1HzHXgB6Sp1Gj3NkaTXrh+wccncCyhLM1ASxFen7DU7SD087OmjhJe1hnGG1I
	+5CjV0r+3GSTpnduisvr+kBenenLsN4UeVwFiLdU=
X-Google-Smtp-Source: AGHT+IGH5ZAq8VYyxXEWxigH8Q9NiVVkr4yfN0slCdqRIn+Rvtn+MXHj4ndcYsTaq2kbqgblUW3FdA==
X-Received: by 2002:a17:90b:534f:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-306a4899cb8mr7165481a91.21.1743812058739;
        Fri, 04 Apr 2025 17:14:18 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:14:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:47 +1000
Subject: [PATCH v4 10/10] ASoC: tas2764: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-10-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
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
 bh=ImA9e8Vws4XKPSu4pYoGIMJVwD0Z9+nohE4Whtn2W5c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStvUfPuPsT7xyzbbcGlSVa/X9cT/mu9SDGZv+vTCx
 k+5wlK9o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIkY6zMyTJ2ovn/2N5YMjzeJ
 M71dhQ4szTlZbqUplbB+bcT3zQ1TTjH8lbqw3fPEtV0HvhldrVnjq/w8K9yQcdlH79I/DJwcy/s
 uMAEA
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
index e45b34fe4ffd4ffb902e33783e9655e858ce5bb1..45c692db7da5a79f725c3b25c3b523aa5f4e4f44 100644
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
@@ -616,6 +617,80 @@ static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
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
@@ -864,6 +939,20 @@ static int tas2764_i2c_probe(struct i2c_client *client)
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

