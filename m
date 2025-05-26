Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986411F9F70
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256611; cv=none; b=f+XwBSNtojk/9NMAQzA33A0H2Vu7cgDzs8IR3U5BBlSEIxhp7aKr02JJobBvxpRJpVjFKdhJ16tYGbxRjWxWaw4XSsamzwnoKT6hpvmOj036rky2zqNh7u0gxw8waI+M4p1JmIzDQs6w1HI5uLLG1254BJpKwHm5CD6Q9Z36Ibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256611; c=relaxed/simple;
	bh=T1UmHGMEhh+HGHkTKffRpGf8EB6LiXyuaermIIJZ7Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2P4wQoDw2z/O/k010Jhh0MRZI0tm9nBqG9D7SsR34yn9vG8jJE8zY/X4B51NQEd9w3GOFMkdHZmGD1pOSDGaKfpv6WvWK9Kp+R/+uSex24ZMsSKXa4NbYrYzZwkHtUE8Jov1sn08zfUWxFIqoJQxeZs6X6lExmgT5HJm80NB8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Neju5nb2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Neju5nb2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4d855bed3so31972f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256607; x=1748861407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxdjNywcZoPk9rUuL+juhOPpZUTe7YyKpdPGQqOg0oU=;
        b=Neju5nb2tZOt+SIozvcHzX4RASBKqLNxYtLICyFhceHiRRFtr94xmrbQngzJLdvB6Z
         VEon1oQtLSS9j2Jldt0DZfonizB5BcoPQwxXjlkjuPB93VMoZSQNbpPtIYszg6R/iPS6
         k/R+tb42ETk5ZI45EWJURNlMbXUhA+qDhUfDBSMF6P1AfKWqSfgjbzBoz84auxGsuKnD
         MIfbuGwTuoOxnxG/Td0s+O+UCQ6BYpMHPNz/Uxe3ORtkuGCuEYbcOTqTboOtHeQ/BLvD
         1xaAT9A0mu9KziLV3dCvzwUCtnNItMjogBEjJsTWvDTEM+7O5G4Er3bLZs6bqCtSDWmU
         scjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256607; x=1748861407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxdjNywcZoPk9rUuL+juhOPpZUTe7YyKpdPGQqOg0oU=;
        b=Ikjy5srlI6JDiit2Ckgio71BqXmHRt6pxTTUVrk5u7Yo0bVCDqVrUU4c35jBgvOO43
         7TDHbeT55cA9sDMqfmyB1PnOWlVZUaTGqowCyBiN2BkneluwPgvrheS1Pyt2NRRNBWA5
         e9xWWwThcyFNpc1eUjyuWUzU7jrlTKH1daAQwkbvsR+wAZprf0s/r1vTH4PENB8dr4Eq
         YCyMbmI0l4tnXFnU9i6h3UcdtDHiMPZjrXE/gvrsImFFz+KAUhc5H4G7DtQ64pQvcfSm
         l77A/9tXDORUloC/CiBGHr9TKOagoKZZb5jcg60TFhvy5GhBaYWEWGQQPaQo2zze+tic
         +8mg==
X-Forwarded-Encrypted: i=1; AJvYcCVAhJ1UzcIKu57ZV8ao+1RZpRIzwQ53zIRILw1A4qho3mnBPqI/VJV5xE6u2dhMr8PzClt/Hq/08yJzNn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtuINVJDrkAYzVfCPDP/cI/ELdSb0uU+As4mLDf1En7FnCC8Wy
	0bFPf/tn/9YeJRx+6NAQO231ec2f2ENSQM3Jv4ZjPahu80DtlC3k4G6YHhTqXNaPpKDK5+fOjty
	jJ6wj
X-Gm-Gg: ASbGnctlhzhHTX+IDIu/xgFRp1yIZCVxxeUjBmUImLPOeNLQAksa/He7vAH80uuM4Yj
	hKbbWyD/ba6h6W18MP7w+XJlyh/JCXoNtztxP9xS9XfD12m7pb1IA4HiDE9q946RmuudpsAFWUF
	5I5txnnN2Y7bivAlGLpjTeGGTB3DBgHbLj3p2aJPilbJhiZyiAK4D5Zcou18hGzQ6NiqbGv20Ub
	d1ADCrx1IAdL9VJSFUhOAlpqYvKdofkWODkggZDpyGB0hBqj1ubU9RMcVVtXIBbI9UPwhM6OuFv
	IY6gzL7rCHy0oYTkYikoI+hXA6uwcPDcp5nwdfrGeqCtUn0x0eqXyb7ulUWLsFj/5W7qBIU=
X-Google-Smtp-Source: AGHT+IGkrJ9NILdheV9RaN0QoLBtP4gK+AfGXmY1/vtQ2GjEgvHeVOK+paC1IUjYwHzNeti95HpQHQ==
X-Received: by 2002:a05:600c:c0c3:10b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-44c90f4ccb1mr16989275e9.0.1748256607476;
        Mon, 26 May 2025 03:50:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 12:49:52 +0200
Subject: [PATCH 3/6] ASoC: codecs: wcd939x: Simplify with
 devm_regulator_bulk_get_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-3-64d3cb60313b@linaro.org>
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3822;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=T1UmHGMEhh+HGHkTKffRpGf8EB6LiXyuaermIIJZ7Uw=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGg0R1SjimkbkrXTp9xVvToa/7VuiXtcbsL/56oXOJnkwQ4nc
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJoNEdUAAoJEME3ZuaGi4PXRKkQAIfo
 lSkuJhxgpdvo/1nZJ+/ngiqYillnf6Sw/lcFW7C1/Q87Zfu/Xz/6BReObA9Ry6mYhUDatZX4xhb
 sRQeNiXUcaJXiB2iV0FK960+gkdAilI0tS93SBXKvjegzbE6eNHWeKb+RtPZZ1VdCJBiiM8PHdA
 jyEuR95vUrbKFKTM5F6XCsFyAj1qRaR9abB74bYOAHou2Yp/nt2C9nE3TnaXW0UIo1yZPOm3rxA
 d83a+uKrGctHpm9Zp4kYVpOdAnLTH1IXr3JrQD0vKJ5APqRjdxbih9t3gs3M2gzmSceUSXuYOke
 NBAimw2CTRr2nr9+HXZhcOLqqEq9kvsCAJU0BhGKU6XNR5662SGDQCuIwMpM8+rMtd6ewxqW9BJ
 eq8JZtqEdBztEQxBv3G9OpDuQhl2J81gVweESupWIOZq3/cT0PedZJO64okYIBeoVXG5haN9KgI
 XKRYjAWz6Bbzc7Myul8vH3kRZ6VW8aOd31xkzijIlmrgkCDnYHvl0iF//y2VybZZrsO4XUg5CnP
 lxzluqcLap6Yh5UN6VtarEzf8W2/B22KUyp8wf0sv/4lPWRbzE/uJNqLsCOKnf6P0xkpDXiABcF
 TIAkd+NaYv3aEqgCnVE0ukrdJPBMAiAivd1/APHPFJl4rn127OGN2Mvg+fwBOePwW6UprsP4cRg
 aLJa/
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop separate regulator get and enable in probe() path with
devm_regulator_bulk_get_enable(), which simplifies cleanup paths and
device remove().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 067d23c7ecf90ae06da1ad6cc89d273fb7f7f875..95cd88a37acb5ef455d4a40948284ae45e2dfb28 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -32,7 +32,6 @@
 #include "wcd939x.h"
 
 #define WCD939X_MAX_MICBIAS		(4)
-#define WCD939X_MAX_SUPPLY		(4)
 #define WCD939X_MBHC_MAX_BUTTONS	(8)
 #define TX_ADC_MAX			(4)
 #define WCD_MBHC_HS_V_MAX		1600
@@ -192,7 +191,6 @@ struct wcd939x_priv {
 	struct irq_domain *virq;
 	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
-	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
 	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD939X_MAX_MICBIAS];
@@ -213,6 +211,10 @@ struct wcd939x_priv {
 	bool ldoh;
 };
 
+static const char * const wcd939x_supplies[] = {
+	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias",
+};
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
 static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
 static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
@@ -3244,20 +3246,10 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 		return dev_err_probe(dev, ret, "Failed to get reset gpio\n");
 	}
 
-	wcd939x->supplies[0].supply = "vdd-rxtx";
-	wcd939x->supplies[1].supply = "vdd-io";
-	wcd939x->supplies[2].supply = "vdd-buck";
-	wcd939x->supplies[3].supply = "vdd-mic-bias";
-
-	ret = regulator_bulk_get(dev, WCD939X_MAX_SUPPLY, wcd939x->supplies);
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd939x_supplies),
+					     wcd939x_supplies);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get supplies\n");
-
-	ret = regulator_bulk_enable(WCD939X_MAX_SUPPLY, wcd939x->supplies);
-	if (ret) {
-		regulator_bulk_free(WCD939X_MAX_SUPPLY, wcd939x->supplies);
-		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
-	}
+		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
 
 	wcd939x_dt_parse_micbias_info(dev, wcd939x);
 
@@ -3629,17 +3621,17 @@ static int wcd939x_probe(struct platform_device *pdev)
 
 	ret = wcd939x_add_typec(wcd939x, dev);
 	if (ret)
-		goto err_disable_regulators;
+		return ret;
 
 	ret = wcd939x_add_slave_components(wcd939x, dev, &match);
 	if (ret)
-		goto err_disable_regulators;
+		return ret;
 
 	wcd939x_reset(wcd939x);
 
 	ret = component_master_add_with_match(dev, &wcd939x_comp_ops, match);
 	if (ret)
-		goto err_disable_regulators;
+		return ret;
 
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
@@ -3649,27 +3641,17 @@ static int wcd939x_probe(struct platform_device *pdev)
 	pm_runtime_idle(dev);
 
 	return 0;
-
-err_disable_regulators:
-	regulator_bulk_disable(WCD939X_MAX_SUPPLY, wcd939x->supplies);
-	regulator_bulk_free(WCD939X_MAX_SUPPLY, wcd939x->supplies);
-
-	return ret;
 }
 
 static void wcd939x_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct wcd939x_priv *wcd939x = dev_get_drvdata(dev);
 
 	component_master_del(dev, &wcd939x_comp_ops);
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 	pm_runtime_dont_use_autosuspend(dev);
-
-	regulator_bulk_disable(WCD939X_MAX_SUPPLY, wcd939x->supplies);
-	regulator_bulk_free(WCD939X_MAX_SUPPLY, wcd939x->supplies);
 }
 
 #if defined(CONFIG_OF)

-- 
2.45.2

