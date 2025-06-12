Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670131865EB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730805; cv=none; b=Vz1HJpM9M0BhHUGAbcBoonRn53a2V+Px5ofk8AIvn0sjNcCuEvX1dJ7U/RuGI0Yxage0qUItn8WJya566kAZh3SJhi8/qx6DmKq3tA/8g/dlaW4fKOaViGLosNZL7UqbkxA3RJNgA/lYAxDXD2fBmG2HC86sSRfm1c7UjoLr4kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730805; c=relaxed/simple;
	bh=MV7WWD7aP8zFL9/6zwq/QPgx9aLD7ksdtanRoWWcMBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYeAuWTZ9whj1Sg6NnUT/PmDeBbgp+G53jPlX+o4I+GgeBd0XEOcgSr996biwzaH9S/O5pSX9ugFerKWeaK/ILOLD+TP13mMGByQa18ndBUlkeunHu8mAQoNRrpnkzywI13e8ynvl19CRj1jcKrAaTXxV/T878TpscDCSetrHq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w9z3Chpc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w9z3Chpc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb79177so4956175e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749730801; x=1750335601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slXKp62oEtgpENi4ky0sxbAPYZFOc+4308ih6+B94Jk=;
        b=w9z3ChpcvibKFmibGw8M1aBpntXSuT/9Oakxq6Tjgde9SPioNoMGeD9nFt3afHRBif
         ZYcnqEjgljXcnG5hbI2DKTR/vSLPylEpdMRh2gwuvHNrxPaWTjmXmj7q5LDk32kI57Xg
         oFRectMypS+w/Wra4NmbEdF4d8Y89g33/3h/MuoiTxZrSgHGx6AVAjbGRQKMM9oM5bqj
         HUkYz4BsmZeJp5rcxuxWppx01XiIwIXCca17Bw4CNXb3GrJnmOjDlmNZaNHIkfbed2at
         aPjcsqrwEI7e/PM8lGudKsX0Tk5v3CQ1VREsh/qv6BNLnYcpM4W2svg9E8cMDQqkw9ne
         qpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730801; x=1750335601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slXKp62oEtgpENi4ky0sxbAPYZFOc+4308ih6+B94Jk=;
        b=sGAu3G0jxmSnTMNQplh4xaYK6MVcr2hNJGvtNaIUjFxRXmxrYC/WBpI0zsjF0yuCTt
         ujmj7oCJHHB44j05Ea27/u7WwW/TpPeu7l23V0Rgt5RAYleTyM65e7saJT2h8MTFF5mx
         b9HMePHB9vZtbFpMYg1qJ+f2DJPXRwkmyQt1ClvllmZxo/oxq6Vz96VBF5q4hawZ0Xy+
         W5ySNHsDYcFEkFjR012uvCQ3BsnZ7uhgrTaMhdy8Uu/p2/a0RQMgFRTKRDijNOb15KtW
         bxwqYTLYoAaMIZQMmSys1RueIL2JwB4gp0D5wP0E5xGnEj4cCh5kJEDCJfQkORCPVhc8
         dBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1pSq5gleQhqQVYHmbDpsXk29aEfwRngw67HxEVJ4BoabO04BQHfgRbiIAjLZzYWcbX+kMnAWHkli+Am0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqXUHPN5gXn0nbE+vzg116uejADNvx2KIsG4GgmioTgqeUT8l
	wHmj0YOl5cvkJyjOXiozkdrmLNf+ItvZf43VFcvyYMWYAs5aIugPFBV2mL6YZ1mYB8w=
X-Gm-Gg: ASbGncsPkLpWQ3Rsmb63sm/C6BFw/2alZKeIBNN+bDE/2p+HLQm7RYLC6bRcL9f3RiY
	6zHORwmq97rQbdL8jLFbWNUNGdmrc3nOSVXgMqn2gfUEj0TT1N8QOo1TywWM0nE69nIdF03jTXW
	V9q/EarRgHPPlWg4uOoz/3NoaSUWTdRpYMfcNiwi7FAacC1bqQbyZzZP7H0h3hGQphaKsXHKYQl
	+j48lUfPsI1BO5Ad//f1SO55CjZYrGwNUZCEhSZ/WLnUnZ5qOLn1nU3TINU60piDg/7Iav1wcer
	4EAOIqvoaW9EqVFCwNy2g14316k0waHnksGwD8SmxpQ3fuT6nde4pDuN
X-Google-Smtp-Source: AGHT+IFZVpd5SwvZHQ4okUJl1+kNStWK8IPREbWyVuykBKixK1maYyY1mYCnG8ZMwjAexY1NUKEBVQ==
X-Received: by 2002:a05:600c:8b24:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-4532b89f9d3mr37876645e9.4.1749730800576;
        Thu, 12 Jun 2025 05:20:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm19636035e9.6.2025.06.12.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:19:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:19:54 +0200
Subject: [PATCH 2/2] pinctrl: cirrus: cs42l43: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-2-2d45c1f92557@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tmlGLFVmhKjDpoU/ZmO0d5G9GS9wdTU82foN7cuVU5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsXtu3oZc0ggE1YHtNR4R3YGb7xFBvTHq9kYc
 14My9ZeF/KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErF7QAKCRARpy6gFHHX
 ct97D/4qhEmc4z/89NnKEQrPpK8Fy8UnbOlTAiCKLbzWSAEAizaZZZ/Adgu1Juld+LTarpSOq3S
 o8yk6FrwEkCtAjm/ihdwG7DLfVqfM8/nCtArkQDUl5lK8jeKAfczaC+cXvgXf92i+HHAIFWY2ad
 o7BgDUSTcBKE//9ZlgqqZmtgMne/9pAnmrMXSi7D7a4WoRb2WJiWTHKuTdT/aX8ZuBMkuX7wTIg
 WLCjf13ASOtlVK3A+/XTAY/BMCqdA5f8y1gy5MEet3jygXtRoDzQWT1ooGvX6p+n2WRs9lKd1X4
 GFWwtOKiQIvHk5Ob0rN3DRno///+snNx+Ec/aPVANt34nqOq5YL7q8rxpt11cyJCRTY1shK278o
 64F1FML+G1swIkLjfCnosjVhgSIbRBNmS7iQ+teIKDmTtGutdHlwvDtlU3aP/k/MwdCX3jyoLmR
 6ma3LOofueXY2b+S+jSHtTL7D+Mr9pa4jP0DbTdqUrEcGr1JiMOTfAL0S0tPCN6NSbkfccly6Wz
 AloSFmnvIlmmRkp+cMn7R30cStcJkxUasvfL18vgs5RHl/wkTw7WTDcyXd8FkW7POLgsP03KMwA
 6GceY3eVSLwIuMOy3/08U93k4oU7AdLxrCOVTDQvgrWUXNM7emBHylRYvEvNnWEZOmsgM9i+ymq
 K7dmCSKqqsLuquw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 628b60ccc2b07dc77e36da8919436fa348749e0c..29ed985273eb47d06f6cf5e6e41078deae4cc2bb 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -483,7 +483,8 @@ static int cs42l43_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct cs42l43_pin *priv = gpiochip_get_data(chip);
 	unsigned int shift = offset + CS42L43_GPIO1_LVL_SHIFT;
@@ -493,23 +494,27 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 		offset + 1, str_high_low(value));
 
 	ret = pm_runtime_resume_and_get(priv->dev);
-	if (ret) {
-		dev_err(priv->dev, "Failed to resume for set: %d\n", ret);
-		return;
-	}
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL1,
 				 BIT(shift), value << shift);
 	if (ret)
-		dev_err(priv->dev, "Failed to set gpio%d: %d\n", offset + 1, ret);
+		return ret;
 
 	pm_runtime_put(priv->dev);
+
+	return 0;
 }
 
 static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
 				      unsigned int offset, int value)
 {
-	cs42l43_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = cs42l43_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, offset);
 }
@@ -550,7 +555,7 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 	priv->gpio_chip.direction_output = cs42l43_gpio_direction_out;
 	priv->gpio_chip.add_pin_ranges = cs42l43_gpio_add_pin_ranges;
 	priv->gpio_chip.get = cs42l43_gpio_get;
-	priv->gpio_chip.set = cs42l43_gpio_set;
+	priv->gpio_chip.set_rv = cs42l43_gpio_set;
 	priv->gpio_chip.label = dev_name(priv->dev);
 	priv->gpio_chip.parent = priv->dev;
 	priv->gpio_chip.can_sleep = true;

-- 
2.48.1

