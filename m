Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0928D8C6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925422; cv=none; b=dAl/qVWdiwsUkSUkAvHN7D3QyzPatNJka4v/pOmImsvS3vG6DFnkJDxwuPRTuNawvCfojGwK0MFP3IQY9hRnZyG0lyYDBIZJDw/TWs2+7o777wKw2NDbREw6Es2ozswUsoX83qpNwW67HbS306PxhpOHabtOcMJucxriSdo/HdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925422; c=relaxed/simple;
	bh=sXRC5GBdbR1xq0omdJDO7+tBD5Mtdml522M758LFtkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHuU0pfwwyMYaGMyfQg4xALZi0E7L56ekg27FP7Ta/f6EhWFvF0oDe/+JFwvugAbI0pjSyZsRP/GpcHLYEWZcHf4XQ/2doBYfkuKRyTOuW0i/n9fZZW+Fbi82698wc/S7/7jAys7U+7qqpaXiMDwJny8xVlDrS2/Yml7InDs1ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bfk0cAC+; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bfk0cAC+"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-401f6513cb2so5271464b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747925420; x=1748530220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6ZkUlmfGYsEKHoNq/aO4trzwxMGuni+kLirX4lGnNU=;
        b=bfk0cAC+dCFtm8sKFTg3YxkoDbumVHFdRZ3bnUlGgI28nSJ8iBkhnPitsTdH1PRdSg
         0lwqnNKV7AkcutIA36lZI8kF+W9yWIzyAFKb4xy/e4iz62Y31jPHrLROxM4Of/yv96gE
         HeY9J2AeAlKFOb98VY7o442odwUQqp0zKT54u3PE0acE/iwd29HowQrNKM51nMigIcX5
         7QqBO4Cd/Hn+NTVAwBnFz1rfpjMOOeCvVrntL9+6yzMQcDWXzPlBis7sh9c+CQ8bww76
         q+uCmaLleLU9dpQT5bWBranaGqCsb+56ovCFhv8nNuZisDTCQNJMEI2BnLLfkGLUtcFP
         +jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925420; x=1748530220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6ZkUlmfGYsEKHoNq/aO4trzwxMGuni+kLirX4lGnNU=;
        b=OwGmYBZWnqan3kSkPLZuuRuZOIw9chfhgBsq6BN5DWiLv1en60WfL+YpJVU9hA32h9
         HgbmKS5qcwTJ/qIuEL2YBQPu18sLYXPSbvaAJ5pZ6DYyD7Cxwp5ZS96D8LUVt73oThUP
         Zx+Z/DYtbWWNBo2VIP8y7BM+8o+UdzCGFXfFxnisefdB3Bpzp2GwL+jdJvWFHFDk1ucT
         uA1NIRQiXYskQey8ZkbHcz+mAQ8k4rmPSfEP3pAP4a6/np0K98eSzmPxSTpCGGfEgk9O
         7uj/8HlGTwTIvSV98lP23Q62dLG9kt5tSwud2fIeACZd6MG3y2jV0gAEwfgLSO/Qkt4a
         fCqw==
X-Forwarded-Encrypted: i=1; AJvYcCUfsNLkIVc7HAt8ZKZ462/myeXTBcOe1W0C3U41fpiA9vsY0bj6p/RrNmB54ouKCTT/OjLd1T0tkybDSz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzt8HbCSyATQgrNWDWTsclnDjma1mnpKZ3v1zGi7V1K1i3udb
	LiQQrTARyR5gs68Nc0thslA3RfOyZwt2Qca0GIeZ1FEAhOoctlzgRKBxQhusFJKjkcE=
X-Gm-Gg: ASbGnctJ4/qjyclJp4Nnc/F1L9D2bplF+e7uviWd0U5PbQgBrdsSj9qtRrwTCRCP1SB
	kMvUx6ZZ1hCnqbbmEvnYAx/5pcsnyWoNjd1nxwPzYymSwPrs+PlyG0lPEg5RsXDAY9/ugpUYDtn
	047Zk2H97DdjKF5g3Qj7P32sU4WZhShS7m+yf+3pw+YyUgJB2eyuEUBcgtMPAO1QzGILO2de57+
	tyn4o98ZKp8YNK8pyZolYUdgzWf0BORuHS4wW7coXOk15X9j7GwuUu0a5k2H724NhlstOlbPPmb
	jmBtrzjp7ox4KD4mVurvshYGA9FM6uqFFdRyOsdFEaPKSZE9yo+DkjJSDA==
X-Google-Smtp-Source: AGHT+IEdqE6obzQ0r91rq5/9sVRV62ic+mGWPgZ9kpAvQRK93m9+mk42tvkQf7w4cr4mvwdKkSbm0w==
X-Received: by 2002:a05:6808:640b:b0:3ec:bf55:e33f with SMTP id 5614622812f47-404d9651549mr18206233b6e.9.1747925419913;
        Thu, 22 May 2025 07:50:19 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3407:53d5:68cd:400d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404e303ffcasm2228234b6e.4.2025.05.22.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:50:19 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 22 May 2025 09:49:41 -0500
Subject: [PATCH v2 3/3] pwm: axi-pwmgen: fix missing separate external
 clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pwm-axi-pwmgen-add-external-clock-v2-3-086ea9e6ecf0@baylibre.com>
References: <20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com>
In-Reply-To: <20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2789; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=sXRC5GBdbR1xq0omdJDO7+tBD5Mtdml522M758LFtkQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoLzmaAz4MV5QcXQNIWs9SGAm4Wi6RdWJWDMs/d
 +lRx+Bhl/yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaC85mgAKCRDCzCAB/wGP
 wLlsB/0d6G2N462oRCT5nDwdSOnex5PqYCM7p383tBLgpJdLIIgUZxeXxwXrgNis2oCvyKivXlc
 iReHwpKrBjkmAWPCKO2+nyu9M86kSso95epNGHeZbcl1HKzSrmx9p+RoN0hmx6W6uaimhiDzuEx
 Nwgw/toXrzRHnTWicceOjxEM5ccisvVER3n4+2TS1UQApiOtOU4tm0o84RyafugFHD1YH5CDTCU
 1LV1XlOo6zbWdYSn5rKdisFzFMNlt43n6HXCl76amEGVzG9ybjZcxIYRmqDf5YB8SzvkEp8Vlwq
 s1URPrlmqH0qPQPYlJEda45LpW89hVRAoRkot56qje5OdDE9
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add proper support for external clock to the AXI PWM generator driver.

In most cases, the HDL for this IP block is compiled with the default
ASYNC_CLK_EN=1. With this option, there is a separate external clock
that drives the PWM output separate from the peripheral clock. So the
driver should be enabling the "axi" clock to power the peripheral and
the "ext" clock to drive the PWM output.

When ASYNC_CLK_EN=0, the "axi" clock is also used to drive the PWM
output and there is no "ext" clock.

Previously, if there was a separate external clock, users had to specify
only the external clock and (incorrectly) omit the AXI clock in order
to get the correct operating frequency for the PWM output.

The devicetree bindings are updated to fix this shortcoming and this
patch changes the driver to match the new bindings. To preserve
compatibility with any existing dtbs that specify only one clock, we
don't require the clock name on the first clock.

Fixes: 41814fe5c782 ("pwm: Add driver for AXI PWM generator")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/pwm/pwm-axi-pwmgen.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-axi-pwmgen.c b/drivers/pwm/pwm-axi-pwmgen.c
index 4337c8f5acf055fc87dc134f2a70b99b0cb5ede6..60dcd354237316bced2d951b7f0b116c8291bb0d 100644
--- a/drivers/pwm/pwm-axi-pwmgen.c
+++ b/drivers/pwm/pwm-axi-pwmgen.c
@@ -257,7 +257,7 @@ static int axi_pwmgen_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct pwm_chip *chip;
 	struct axi_pwmgen_ddata *ddata;
-	struct clk *clk;
+	struct clk *axi_clk, *clk;
 	void __iomem *io_base;
 	int ret;
 
@@ -280,9 +280,26 @@ static int axi_pwmgen_probe(struct platform_device *pdev)
 	ddata = pwmchip_get_drvdata(chip);
 	ddata->regmap = regmap;
 
-	clk = devm_clk_get_enabled(dev, NULL);
+	/*
+	 * Using NULL here instead of "axi" for backwards compatibility. There
+	 * are some dtbs that don't give clock-names and have the "ext" clock
+	 * as the one and only clock (due to mistake in the original bindings).
+	 */
+	axi_clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(axi_clk))
+		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get axi clock\n");
+
+	clk = devm_clk_get_optional_enabled(dev, "ext");
 	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get ext clock\n");
+
+	/*
+	 * If there is no "ext" clock, it means the HDL was compiled with
+	 * ASYNC_CLK_EN=0. In this case, the AXI clock is also used for the
+	 * PWM output clock.
+	 */
+	if (!clk)
+		clk = axi_clk;
 
 	ret = devm_clk_rate_exclusive_get(dev, clk);
 	if (ret)

-- 
2.43.0

