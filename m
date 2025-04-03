Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FF248896
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670757; cv=none; b=UUFpttZhaPEeowygjoJRShyyrkznsiiWf6QIvkGU/DgF6mKYeSQaIm67zoK/6rgK3+9+l1EJoaMwfhlA4xzYVARVXSgIi91UhdBw5Pn9RaDh0gKqkTFSGbyxu3j94QzN7Ne7ZAI87nrYMO2uruSTfrpPZgSQ+DopNMwQrGeA1rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670757; c=relaxed/simple;
	bh=G2VDOjAPimv/kPRtxt/LX8SDH6NDkA0IsfX7EDPKEaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8DNqdKNlZyKB4acRrReV4CvRJpajxzW4d/PH3/Uv+kJ/41B47byr4j57q2UdmAlFPRQv27CZ4rfqTm9ROBK0e8TSa4JcfQrEVF+XrDycnpqTLdiLggWCY9qmuZS/X4NLQRXFCFFttEcPpunXX9KxKAdgQjwNovEBWoHd9ZpwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLk3EfJW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLk3EfJW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so946662a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=kLk3EfJWTjU2iYikUQe+drlwEuNkbxBQ97uf6xS+cs5zxyJJCuNPPxKtI6KgboUVRB
         hUx/NaLTndbrIG7BXMT5d+8FLxjSDuBFGqP0ElQ4ENIBHfpKL01ZyzUfH0dxgsYQAazv
         Mftq+n10tP0TxIubR7wRbi7BzHIq+v/FimHjsSb7b5Ip3A4poiQcB7FO9P7DqOTTDN9n
         g4GP0pIIXrSekkrHAvpWMQ868+Frmwxfp/Ycmy/cMsNhUbk7acgZ/YNXYVQ2P+tFxNPO
         IWGT/9VYZLNh4nngk/j3Ir58K82dR+zIVYzGL9H3KgcI8ZtdHuxlEw3kxZhxWt4FXGja
         d+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=kEolWY2KrT8iEwiq5n4UWJQQk63JvIOuqOs5VNLDSStHdz/Jw1pE7EVXq5pq7eZ1jC
         B7f32a2BZQNGCfqzd1DFnZIfp7wsZr4ADxrYEq2KUaX6tZeq+/hg6wlxBh1owie4SG9J
         GI4va/jcvj8kU3SHPnlz7f/Gt+Urh9UqWdUTWFXh2gJTf+AeEQmT80XtUp1X6jFEgeQZ
         mxLSSohjx+iLuthkRw1/X1UkbA8DdO4T7PraPFsDm8JxM9wGDyoYkbj99vj4bYkA7oL3
         gyNvX+KdX3emZoLyjGzkZoLI/aDwVJ/qwWWhlIEoaoa8WAjGz/ihMqwT30UYXITAtojP
         e6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW51ZnXyaPXkrS7GnQ5Nlv1vQavs3R/vtH5nTvenh+/8Elcor+vNNeMCHZibm+E54TUF2+RG1bKeBtkUKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuu+8a8V3C6Fgt/FMmKKXpZY5ptSD9a/kwyJY31xwbkccufxLk
	67xpj8vxLWD7ovLXISldb12qWFrMjr+bYottRdgdC2k6ukx7NEZscUvez4FhG8M=
X-Gm-Gg: ASbGncsIdn9uz74JBoCdxvIcgu6qNKnHLpU6LY/BzV0SwjmqLLpj1YPxVLJrG31pCIH
	FwoeMvtIJ2dt0XLr7UbVbIJ1MZw/hzaQpPDq7BK3K4M8ay5xwe5KBqtwzhx9PFSJ1WDLRgKJjZi
	JvF4bgySUsI2/yohUzJaXBjIaYHbo22CVd6GNzpO0AWoEqCkOocQkupPPrpiXjbH7Brrtf0fgXS
	QPmgcD0LoDPeAKIAx6xyTyuFQrUcGQaOZrYG3O9F++zObtCGr7Se7zgKp9bcDduwEYjFnmSHS6A
	EvOoI6FH0RMVSsFd1jG+qiO9S0OT6fkU5C3UCTAXi51JLpsDBRYL+6KLTB2He9CXcCejYMTcY49
	MooFWLdQcQVnVlMdIM3IhMMWVAMyT
X-Google-Smtp-Source: AGHT+IHqq5xE17qMmS1fs14R51Ih6MAYPGlP5NH+CbKlyAqH2jZK+FRszx7kpSpBogd0Ourruy0TcQ==
X-Received: by 2002:a05:6402:40cc:b0:5ed:1444:7914 with SMTP id 4fb4d7f45d1cf-5edfdd23b76mr19122813a12.28.1743670749730;
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:07 +0100
Subject: [PATCH v3 15/32] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-15-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 9f0173c48b0c8186a2cdc1d2179db081ef2e09c4..79a3b33441fa5ab48b4b233eb8d89b4c20c142ed 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -452,16 +452,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	if (!sec_pmic->irq) {
-		dev_warn(sec_pmic->dev,
-			 "No interrupt specified, no interrupts\n");
-		return 0;
-	}
-
 	switch (type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2DOS05:
+		return 0;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -492,6 +488,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 				     sec_pmic->device_type);
 	}
 
+	if (!sec_pmic->irq) {
+		dev_warn(sec_pmic->dev,
+			 "No interrupt specified, no interrupts\n");
+		return 0;
+	}
+
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);

-- 
2.49.0.472.ge94155a9ec-goog

