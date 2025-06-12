Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com [209.85.218.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECA2417F0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738830; cv=none; b=Cp/321PLOHvu7afA/qy/hA/eAeitGHaIad7XC6jYdRWyxgbYv9f8Squ7fBl+FsQJ2oW6sXtF0wRcOlTNwwcOrb4JP6BFx621grLgJ5e3kg80qOhA40UQBZPU87eiHSsMpmVP1rfcZqq79BULvOtJXnLhJfpEZLG/uVp3gQUQpdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738830; c=relaxed/simple;
	bh=YSUbtUuizklExpnzU8VpfcNv0fngsTJdsERQci1RWp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y0x8hTXG4X1X0tUdt44c8ReUIMCMteeBJ/gzR7luFrNTJtNgGivn0QYC/cHDzijhXQ6BE0LQSThCbiUBKnBey9NIQeWyhH3YKX015kkF3Pdb3QCwe4qDI91PxaXiW0FiSd/50aJ3rS19mSb7Q74jv9nrLqyHgUx/bRouaAVxNPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc; spf=pass smtp.mailfrom=sferalabs.cc; dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b=Do0VcHHd; arc=none smtp.client-ip=209.85.218.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b="Do0VcHHd"
Received: by mail-ej1-f97.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso190552766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sferalabs.cc; s=google; t=1749738824; x=1750343624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkFa1Jh0hAp7VXFgDt4c5m6aT1cILx31aOxZ9A4iZ3Q=;
        b=Do0VcHHdwB3mogd0mPbdmhVLLjHHpGY15RIHUCRRjNfRWuzl2gPeDz45UkPCdO0p3f
         ED5hNaB2967Ptt1Spu5kA19Rps6cVEp+NLycDL4iH52RhxNBzlVkKs6PlWejtYvO7uv0
         EmgarXU1KdrI1EbLyRUeMBu/3CeCq6dCs6F/BKPGbd/qgCzyyBxmY4QqmDs6P/091Fik
         0USQ8+Va7hKxFwIAgVqLI1J0m+Dzvd3yPZRpUG8SWNOif0nQCqEhOJlF3eLWuCk3aHGe
         rkUEqvLEnEN3ubvAXdSEK5jPrGtQPEo2qG3B7gsZfZeqGBNbovQMlD+fbvlRLp5k6Mu8
         6qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738824; x=1750343624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkFa1Jh0hAp7VXFgDt4c5m6aT1cILx31aOxZ9A4iZ3Q=;
        b=DV4zl+mGnxQaKPXCYWvlWHGgSR3YVhd+gfLyAzAzqUtB5PxY18joWUT+XUS3FPhhI5
         fVhJMLy2LyiYlIlHZKzyPayXrqr58FlYxNdypBg6C3LUnMMrK9IwQFQ7i/MmE9+P7Btb
         KpYRLjWCHO9tf86NOzgJozFV9Cdb8w/Qw6O3qmb2ojSWUiJOW0LbXL+yzEGKQuHpz+2d
         /X778YH7PZvweyDxlthZ9eKL3YSTiy1RN4FoMGkS+rfU2MnHpJoW3iX01M7owq/poy0i
         LCrCH+R9cceORFeI/4zP3p6hHb7uNyC5Kf/XT8HSynbXYoUvbiH4e6D8G7qLcoxITRmf
         F4hw==
X-Forwarded-Encrypted: i=1; AJvYcCWk2GPNWDG0xqn81+glORbvs0Mt9Z6U9yVbbXyYkwDpjI2dC8A4IvFJH4O8kBObPp6ETWYR2hvcQIfxaxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnpn1fhnmfWjnj3Mr3/gR/VWbu8j/fhbQRvJuzxsr7tGjsIZT
	KnnTC3FuvBvZsj2lybAmZFVaY/u/5TSDGYH52tWXwBfW2kLOwwlbEIxOIXNuWh6+tWvpXr5Jv61
	nojjv3GUPTPRwiYd6s28IID6f8y7lqe1uv0OQ
X-Gm-Gg: ASbGnctRzvrz6z/dOym4qFXfb0NVqIc9j5BE0CJsOK4r+bwnu0WAENvh6ATMFEn1n5c
	ov6YKk3/YceK/yB0gJ/IV/rlheHwjHzPERCoBAsvkEgVT+uLCcZvK3oWeFqlSjKX6wkrVCaH9Gy
	OvFTKSfO8QSlzWKyc0n/1igbwPaiavBOdh61kcMRigx5UnrSuAxrrnbRpaOmoA2HQZRrL3XDDHS
	qB/8IE2Swn6dqEk/3J8t+YyxjZ6N1ohiKy88OTclRjcjx+A8gVlyi9WhWOwF6TgW6d5Tq0jGJDF
	lzq73mHGxg+hxKIcfbq6Afuv8rl6mq8q84N2WefA8dZiFjYNBH73sCPw5ah2HCxJKtV3SMJJLbK
	ficM=
X-Google-Smtp-Source: AGHT+IGnhKK23yR1xHZZWzF61fUpeG2TlhMWsxzXLzc1dL1xHOAteivntPVBueKnIToEoqjGc4A6kecpFjzD
X-Received: by 2002:a17:907:e895:b0:ad1:fa48:da0a with SMTP id a640c23a62f3a-adea9410734mr337093666b.35.1749738824090;
        Thu, 12 Jun 2025 07:33:44 -0700 (PDT)
Received: from giampiero.localdomain (net-5-89-7-58.cust.vodafonedsl.it. [5.89.7.58])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-adeadb636acsm9220266b.183.2025.06.12.07.33.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Jun 2025 07:33:44 -0700 (PDT)
X-Relaying-Domain: sferalabs.cc
From: Giampiero Baggiani <giampiero@sferalabs.cc>
To: alexandre.belloni@bootlin.com
Cc: Giampiero Baggiani <giampiero@sferalabs.cc>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: add power management device properties
Date: Thu, 12 Jun 2025 16:33:38 +0200
Message-Id: <20250612143338.45943-1-giampiero@sferalabs.cc>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the "backup-switchover-mode" and the "battery-low-detection-set"
device properties.
Especially relevant for PCF2131 which comes with BSM and BLD disabled
by default.
If the properties are not specified the driver behaves as before, keeping
the configuration unchanged.
The "battery-low-detection-set" property solves the current issue of BLD
config lost when switching between BSMs.
The RTC_FEATURE_BACKUP_SWITCH_MODE is also set.

Signed-off-by: Giampiero Baggiani <giampiero@sferalabs.cc>
---
 drivers/rtc/rtc-pcf2127.c | 206 ++++++++++++++++++++++++++++++--------
 1 file changed, 163 insertions(+), 43 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 31c7dca8f469..b381b31b6d20 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -182,6 +182,12 @@ struct pcf21xx_ts_config {
 	u8 ie_bit; /* Interrupt enable bit. */
 };
 
+struct pcf21xx_pwrmng_config {
+	int bsm;
+	bool bld;
+	bool pfd;
+};
+
 struct pcf21xx_config {
 	int type; /* IC variant */
 	int max_register;
@@ -209,6 +215,7 @@ struct pcf2127 {
 	bool irq_enabled;
 	time64_t ts[PCF2127_MAX_TS_SUPPORTED]; /* Timestamp values. */
 	bool ts_valid[PCF2127_MAX_TS_SUPPORTED];  /* Timestamp valid indication. */
+	bool bld_set;
 };
 
 /*
@@ -333,26 +340,130 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
+static int pcf2127_rtc_get_pwrmng(struct device *dev,
+				  struct pcf21xx_pwrmng_config *cfg)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	u32 value;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+	if (ret < 0)
+		return ret;
+
+	value = FIELD_GET(PCF2127_CTRL3_PM, value);
+
+	switch (value) {
+	case 0:
+		cfg->bsm = RTC_BSM_LEVEL;
+		cfg->bld = true;
+		cfg->pfd = true;
+		break;
+
+	case 1:
+		cfg->bsm = RTC_BSM_LEVEL;
+		cfg->bld = false;
+		cfg->pfd = true;
+		break;
+
+	case 2:
+		cfg->bsm = RTC_BSM_LEVEL;
+		cfg->bld = false;
+		cfg->pfd = false;
+		break;
+
+	case 3:
+		cfg->bsm = RTC_BSM_DIRECT;
+		cfg->bld = true;
+		cfg->pfd = true;
+		break;
+
+	case 4:
+		cfg->bsm = RTC_BSM_DIRECT;
+		cfg->bld = false;
+		cfg->pfd = true;
+		break;
+
+	case 5:
+		cfg->bsm = RTC_BSM_DIRECT;
+		cfg->bld = false;
+		cfg->pfd = false;
+		break;
+
+	case 6:
+		cfg->bsm = RTC_BSM_DISABLED;
+		cfg->bld = false;
+		cfg->pfd = true;
+		break;
+
+	default:
+		cfg->bsm = RTC_BSM_DISABLED;
+		cfg->bld = false;
+		cfg->pfd = false;
+		break;
+	}
+
+	return 0;
+}
+
+static int pcf2127_rtc_set_pwrmng(struct device *dev,
+				  struct pcf21xx_pwrmng_config *cfg)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int value;
+
+	if (cfg->bld)
+		cfg->pfd = true;
+
+	switch (cfg->bsm) {
+	case RTC_BSM_LEVEL:
+		if (cfg->bld)
+			value = 0;
+		else if (cfg->pfd)
+			value = 1;
+		else
+			value = 2;
+		break;
+
+	case RTC_BSM_DIRECT:
+		if (cfg->bld)
+			value = 3;
+		else if (cfg->pfd)
+			value = 4;
+		else
+			value = 5;
+		break;
+
+	case RTC_BSM_DISABLED:
+		if (cfg->bld)
+			return -EINVAL;
+		else if (cfg->pfd)
+			value = 6;
+		else
+			value = 7;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				  PCF2127_CTRL3_PM,
+				  FIELD_PREP(PCF2127_CTRL3_PM, value));
+}
+
+static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct pcf21xx_pwrmng_config cfg;
 	int ret;
 
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		ret = pcf2127_rtc_get_pwrmng(dev, &cfg);
 		if (ret < 0)
 			return ret;
 
-		value = FIELD_GET(PCF2127_CTRL3_PM, value);
-
-		if (value < 0x3)
-			param->uvalue = RTC_BSM_LEVEL;
-		else if (value < 0x6)
-			param->uvalue = RTC_BSM_DIRECT;
-		else
-			param->uvalue = RTC_BSM_DISABLED;
+		param->uvalue = cfg.bsm;
 
 		break;
 
@@ -366,49 +477,23 @@ static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
 static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	u8 mode = 0;
-	u32 value;
+	struct pcf21xx_pwrmng_config cfg;
 	int ret;
 
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		ret = pcf2127_rtc_get_pwrmng(dev, &cfg);
 		if (ret < 0)
 			return ret;
 
-		value = FIELD_GET(PCF2127_CTRL3_PM, value);
-
-		if (value > 5)
-			value -= 5;
-		else if (value > 2)
-			value -= 3;
-
-		switch (param->uvalue) {
-		case RTC_BSM_LEVEL:
-			break;
-		case RTC_BSM_DIRECT:
-			mode = 3;
-			break;
-		case RTC_BSM_DISABLED:
-			if (value == 0)
-				value = 1;
-			mode = 5;
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
-					  PCF2127_CTRL3_PM,
-					  FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
-
-		break;
+		cfg.bsm = param->uvalue;
+		if (pcf2127->bld_set && cfg.bsm != RTC_BSM_DISABLED)
+			cfg.bld = true;
+		return pcf2127_rtc_set_pwrmng(dev, &cfg);
 
 	default:
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static int pcf2127_rtc_ioctl(struct device *dev,
@@ -1181,6 +1266,8 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	struct pcf2127 *pcf2127;
 	int ret = 0;
 	unsigned int val;
+	struct pcf21xx_pwrmng_config pm_cfg;
+	bool pm_cfg_write = false;
 
 	dev_dbg(dev, "%s\n", __func__);
 
@@ -1323,6 +1410,39 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	ret = pcf2127_rtc_get_pwrmng(dev, &pm_cfg);
+	if (ret) {
+		dev_err(dev,
+			"%s: power management config (ctrl3) read failed\n",
+			__func__);
+		return ret;
+	}
+
+	if (!device_property_read_u32(dev, "backup-switchover-mode",
+				      &pm_cfg.bsm)) {
+		pm_cfg_write = true;
+	}
+
+	pcf2127->bld_set = device_property_read_bool(dev,
+					"battery-low-detection-set");
+	if (pcf2127->bld_set) {
+		if (pm_cfg.bsm != RTC_BSM_DISABLED)
+			pm_cfg.bld = true;
+		pm_cfg_write = true;
+	}
+
+	if (pm_cfg_write) {
+		ret = pcf2127_rtc_set_pwrmng(dev, &pm_cfg);
+		if (ret) {
+			dev_err(dev,
+				"%s: power management config (ctrl3) failed\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, pcf2127->rtc->features);
+
 	/*
 	 * Enable timestamp functions 1 to 4.
 	 */
-- 
2.39.2 (Apple Git-143)

