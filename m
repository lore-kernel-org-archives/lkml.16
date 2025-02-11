Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1DB3C3C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288897; cv=none; b=QvI+Aw4b6PH+AQgoXi7zZr9j7eSNUyhToKFQIttvakUIEt3MYi7rA4p8+lZR/Gt2tl3+5LecCafxWLJL5yT0TAH2mFKcjnuwm2I4Ihuny3SOw2hQwuAPFfIaKiiUfOXjblyyt99ObMoPJXGktuQSCEiOLI7FibhAukCw/MAqYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288897; c=relaxed/simple;
	bh=jzrLZBgSObfjpurw6pJgeZw4vFobh9lvMNpnis4EvRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GCoM/Y0o5VD8kdN/0Ul0G305/2C2p6ePbHQP1jHJkIHyvI/skF1SYSvAHz3qjm8VpS4ZX0Sn/OCivIqo4h/eqZ9LDugmATEEsmLAXIKawfdMRD/jx3hWk8lZeW3BoV1OTkpBIa8sGoUabV+5GAszzA94jYk+mkqw3S5prMcZepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gZgD9l4K; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gZgD9l4K"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c05f3da684so214838285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739288894; x=1739893694; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrgJl4jxZYx1hO1HuVz8mNt2vWWM7DDFw9iXZvWXNbA=;
        b=gZgD9l4K/0nr++5GPTVIWanUh+f/HbU22TXEvG5x8ERR3/lywLpAcyMIwDwCRsjHPf
         5dCul46Ap1U/SD0rYF7vzHR2t0++fcrm0VoMmwLSsf1+sHinSGMUKgzz7SOxbp+ZS6z0
         VBcSF6GdVI76vM/2oIWeovWOjx+mqqhdk93DHtPExy3IGgz2fMMhf6Z97wWeB7irjGeK
         GsZg5IaFWuEIevCnwteTcvTpj8DtV8R308R//OVp2FwDD8fE+fcwZjkync+5aqlEj+mu
         sfFSg6w9ZGMxWYTxYJpkYoRssNMNqx6v+UBIO99w2ZdlB0y1prl2TweZbUJmuJhLUT8x
         vDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288894; x=1739893694;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrgJl4jxZYx1hO1HuVz8mNt2vWWM7DDFw9iXZvWXNbA=;
        b=Ku3VSAvTXhcsrXOBOH14kWTuhkZhp7lcsBE+9hSVrbidcFWZ13GuUpMjAiU8BnYlxg
         67oCsLtGM1DD1no7koqWUDUiy3fqqHGcDPjYKirsDRsgDPOksscan1WdJ8tuWiZhde0E
         mc6BJDNAvTMHkXZQqAU7yvGephYH74HSlmcoawKMh7WzrhfwiG42yu9483/j4Yn+Aioy
         4EiNavR/8NEBx2AXOuR18PRpRGKIK4ewJDfPTj+RVA+CT/h0uZBKoDRYQu1LAHuO/iue
         hDZx7JBLyRCyZUpEbLiwEcRD/a3WE9RSw+TvgX6rPtvT17pLTpiUGXUMj+Y7YFZ27cVr
         VY6g==
X-Gm-Message-State: AOJu0YwVTj0hewlkh64QuLRs0QJGQHLlNFC1VXZZ5b5Ffs6R2V44xhK2
	l/Kkl4/gLTkUABZjaoCLoJGn+AR17bX17ZlztaSK3mfQ1cv0F0c9crhYOWogpkY=
X-Gm-Gg: ASbGncstDocFtHNunob8UyThA6Gt2fDZL+sQE8r1g706DYsroAsJKi63dmKo4u5R4JZ
	EQqjFu66emiF8vu1E+m1SqdXtvTnXQtKOC9rLo9lMw8VGRqKi1KgozaJ3mee0S/tFyFQSRTiN9H
	FTmOqPB68K/1RB/QgzLvrRaAw4BAtCA4rcvkG27EIifE9zLNk8PTBL3aT4xO8qmq76cwQCIZ8rp
	Ol+sig22YrJ4fC9AaL5sKyeok15uacKvt18g4oGvUhpa9M6Vq7F+rfSjkzs+TT4fH7kk6keY/L+
	0ar1XBqUrbR1GQBzhh+jh3kWI2JO8w==
X-Google-Smtp-Source: AGHT+IGybw8+zebWsXes48CsMNpXiWWU7fuRj8+3WeM8t8EI7EtsnrjrjLkOfUka3MgnmX1PYtDRcA==
X-Received: by 2002:a05:620a:29d4:b0:79d:759d:4016 with SMTP id af79cd13be357-7c0686d2af1mr603629385a.11.1739288893609;
        Tue, 11 Feb 2025 07:48:13 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7c06989dfd5sm123788785a.112.2025.02.11.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:48:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 11 Feb 2025 16:48:06 +0100
Subject: [PATCH] regulator: core: let dt properties override driver
 init_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-regulator-init-data-fixup-v1-1-5ce1c6cff990@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADVxq2cC/x2MQQqAIBAAvxJ7biENE/pKdDBbayEsVosg+nvSc
 RhmHkgkTAn66gGhixPvsYCqK/Criwshz4VBN9o0WikUWs7N5V2QI2ecXXYY+D4PpNBNprWTt9Z
 D6Q+hIv73ML7vB7hJsMlrAAAA
X-Change-ID: 20250211-regulator-init-data-fixup-ef6b537bc77c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3862; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=jzrLZBgSObfjpurw6pJgeZw4vFobh9lvMNpnis4EvRo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq3E7T3B2lEdwS4xEjvdbEbMGZSvblvsgI5g9H
 FJ5L8/J4ceJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6txOwAKCRDm/A8cN/La
 hSCUD/wOExCfIV/9yjy0eiVuKnMHCIYB9YjJ7kxtkW+tLRLlPDogybN/6XjtBDi73YDgmhMasF3
 da2qCQyNfYK0AyF/JZU1tHugrSvQHtfgF7Sba2cDcvFBb04CwjUlmo1Wnb4/9uGUDbf3nv6qBaA
 +p5gWpIsoO49SP+l+Y6H80QPUog0vk9ypwKML126WjvjVJVBEZIA3yuYuPtuFBCzApGb9AByCYm
 lqf8XqPBgVpzqDlEKad4pdmH8tQ8CKropXsB7jJ9GKAOobdCzmHevkvzLDWXaiIcLkX772AEywn
 AfbYC63RYHNeRH6FdDH0Hry0PbCRd18qubfE/UK2eGjD6gpZhb46WK/ZzKq/KaBX0Y38WB2/b+I
 LT/qJwL8JfX+59iM7y3fyKHkhtEQ/T4wh9c+HaCKs5i6ufeDfPT4A4v8H4M0+sI2u+YNJYAIH1r
 6gzkfhwqPuaDcaL2NBvPMAOZC/DMdFD8fR2+shCJ36SM66hGHYNIW/Nvr0CNLlXKs7K2Xh1S0PE
 LhX0w7ng/RbKjYY4O/hfB3yRvIqb2OFCvKp5jGk+n0UFOXeZVKQimE6F562zkSsRk/qWZPehVQ1
 XgH/R6M5uUkcv3hqxG6u7jKgXKOqMYhllMzVLCeciFPd6M6uzjCTyTSJ9TbqlrkXkvJQs+c8X+/
 Q3/X9l26JaJ3WMQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This reverts commit cd7a38c40b231350a3cd0fd774f4e6bb68c4b411.

When submitting the change above, it was thought that the origin of the
init_data should be a clear choice, from the driver or from DT but not
both.

It turns out some devices, such as qcom-msm8974-lge-nexus5-hammerhead,
relied on the old behaviour to override the init_data provided by the
driver, making it some kind of default if none is provided by the platform.

Using the init_data provided by the driver when it is present broke these
devices so revert the change to fixup the situation and add a comment
to make things a bit more clear

Reported-by: Luca Weiss <luca@lucaweiss.eu>
Closes: https://lore.kernel.org/lkml/5857103.DvuYhMxLoT@lucaweiss.eu
Fixes: cd7a38c40b23 ("regulator: core: do not silently ignore provided init_data")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/regulator/core.c | 61 +++++++++++++++++++++---------------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 89578b91c4680c0c2d63eee46cbf31ded8549189..4ddf0efead682fd006657cdad1dc335f08f1da3e 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5774,43 +5774,36 @@ regulator_register(struct device *dev,
 		goto clean;
 	}
 
-	if (config->init_data) {
-		/*
-		 * Providing of_match means the framework is expected to parse
-		 * DT to get the init_data. This would conflict with provided
-		 * init_data, if set. Warn if it happens.
-		 */
-		if (regulator_desc->of_match)
-			dev_warn(dev, "Using provided init data - OF match ignored\n");
+	/*
+	 * DT may override the config->init_data provided if the platform
+	 * needs to do so. If so, config->init_data is completely ignored.
+	 */
+	init_data = regulator_of_get_init_data(dev, regulator_desc, config,
+					       &rdev->dev.of_node);
 
+	/*
+	 * Sometimes not all resources are probed already so we need to take
+	 * that into account. This happens most the time if the ena_gpiod comes
+	 * from a gpio extender or something else.
+	 */
+	if (PTR_ERR(init_data) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto clean;
+	}
+
+	/*
+	 * We need to keep track of any GPIO descriptor coming from the
+	 * device tree until we have handled it over to the core. If the
+	 * config that was passed in to this function DOES NOT contain
+	 * a descriptor, and the config after this call DOES contain
+	 * a descriptor, we definitely got one from parsing the device
+	 * tree.
+	 */
+	if (!cfg->ena_gpiod && config->ena_gpiod)
+		dangling_of_gpiod = true;
+	if (!init_data) {
 		init_data = config->init_data;
 		rdev->dev.of_node = of_node_get(config->of_node);
-
-	} else {
-		init_data = regulator_of_get_init_data(dev, regulator_desc,
-						       config,
-						       &rdev->dev.of_node);
-
-		/*
-		 * Sometimes not all resources are probed already so we need to
-		 * take that into account. This happens most the time if the
-		 * ena_gpiod comes from a gpio extender or something else.
-		 */
-		if (PTR_ERR(init_data) == -EPROBE_DEFER) {
-			ret = -EPROBE_DEFER;
-			goto clean;
-		}
-
-		/*
-		 * We need to keep track of any GPIO descriptor coming from the
-		 * device tree until we have handled it over to the core. If the
-		 * config that was passed in to this function DOES NOT contain a
-		 * descriptor, and the config after this call DOES contain a
-		 * descriptor, we definitely got one from parsing the device
-		 * tree.
-		 */
-		if (!cfg->ena_gpiod && config->ena_gpiod)
-			dangling_of_gpiod = true;
 	}
 
 	ww_mutex_init(&rdev->mutex, &regulator_ww_class);

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-regulator-init-data-fixup-ef6b537bc77c

Best regards,
-- 
Jerome

