Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6384723F417
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571673; cv=none; b=jQ+NTyD5yw85BTCBXSEEAhkym36I6npBbDmz236yAgifjIlQlfk7SbOpsulBo6GkA8AFYO6iCNsEbph8ewXCVzpWNHR7Lnsw0kLNx3L/aXc0YqfgyT8yFxVx6WnRgkqfRcdVdpibBcs+lsPVYl4c3bs228oaF9gg1UrXxKhYcWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571673; c=relaxed/simple;
	bh=hZpJKZ+GQSZQ/UbnOT9RImA04jIADFnimUHfJV9B/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9eZSi3OLmfyFXhR2oT1JEbOHTIty6aF9QaEgPuMsGd7r76R6f+0edNaG0x/tN/WAQdT2s5JuL+jr1+c//44CdqAbAc0K1WCxcVlIYyTZSCUxAK9f6W3NHCz2lFIwjogFmrSWHtUJNaBNl4eN+A6MR8M1105SoVe5aXH7qC16KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bYLXZY9C; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bYLXZY9C"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1458001f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571670; x=1746176470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8UXZTozvJzjGLspnxEWNqMkDpoXY67SelwpGY/ZF58=;
        b=bYLXZY9CuiVXj8Us5c1WRqxgD5GTi/OOkqRyuI+EldJ5ZIjP8tNz22AgNlr3Xd0Mi8
         +Rc/KEcVzziz0cekDdVFOybWwfcui27vF5Jtikl404bZlGO63VMyCw+AQ/H+75Z99w+0
         nQjqTqDK9IO9DquYZ/N09LxsDm505MdS0M8PoFoVIrbL28gujszBapWqrULRclflApVj
         3zkqiRV1BafuVTAYD7FUqpv7Z9d7+2k77Pds6sYnLCzFHl4PDmErKlcXS6Qj8Ugxi4IL
         Y0VxtpgvkT85PfuRGpXiOQ1ay9QHMrHhtzUBIJsnX4S6ogMFL/6+Gc9p7LkRPnIl0SAB
         YiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571670; x=1746176470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8UXZTozvJzjGLspnxEWNqMkDpoXY67SelwpGY/ZF58=;
        b=VUveKdWP1aA0c9AAEh6yUSlOYm03SbYt58Fu/eP4xGnsALHxuG4XmC+CY0L0SbXRiW
         cB5I1Sy8gD0Z4NuDuC0G3UrZCbXbDXcYTYkgqll8o5rYUIZfyV8WWJPjsJkt2Lo2D8TI
         8hVjUZnsiHwvleRmjeUu8oR2KmKkiiKB98VJOAlATWNhplOJ/OEyPEYQqgfeewxzvt3s
         GNuE2JKbPIz+Y28c/LvelYgMPRYeZCAA+uBe8pfX4N2BCfQYjDFlh7N4eWXwlhg6C5dF
         wHxx2OWCIQsZgTcMysC99XlYetPfRE9jfxtRUoBTTOQkArtSkeqcfsDGACncVQuCQRTc
         /nFg==
X-Forwarded-Encrypted: i=1; AJvYcCX31Xn1OEwp+oYQeRfADt2ESwo5lOns6XKiuYe2PkaUOLmWt/VqpeT9nGmuH7VGY97kEXht2PeZAYHTFZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpbrIIedaoGfN754MnVc+XEt/ahXIybidXAo6IqA41ZGk7nhM6
	F/EzkdIj/2cmy8RMlqkWsLq/qpdKYhXW0LVvnlj4XnCmrQssUtlAyOo857dCfM0=
X-Gm-Gg: ASbGnctfyZ6vfjwaYvY0Mo4TN0RnYTZAN2bWgMszlRKyubhr2wJbnbLK+9urmmZrmjb
	PZGhm/hGPR5RJotNMDz7IrgIxhiusPUojelocvFoN1Gpcug2+mx2wuC/zKmrcQIauHVcQdY64HU
	oKpvygbdumQOZ4J9yghLhx+LdSmYUxO7fXf6OEyhfoGMyghv4ThO0C1/W8pePQlZ3VW9aoz8svE
	xim7zT2v0D4tYTHmdmjFLSrgVPSUARq2eAoHh6URQHZO1YxafwwyyoQPG3qhATzfixoMMDICzPc
	vNWGMIZTKBVperWH34cSsagt4ta7p1DLiA==
X-Google-Smtp-Source: AGHT+IFckeNXXJag89Vd0W7MAUKrj0/boKLVXA4/ZToJROXBMZJpIxWvphXkHztSufJCbS1p52tVAQ==
X-Received: by 2002:a5d:5985:0:b0:39f:ed8:d6c2 with SMTP id ffacd0b85a97d-3a074e102fdmr1039852f8f.4.1745571669412;
        Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:59 +0200
Subject: [PATCH 3/5] pinctrl: mediatek: paris: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-3-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+GvjQy682fLtJAVRTMRFy+x8ClXiXcJ5yyuJiL29z1g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09QDlA6V2iktjKbxY3hklKfAJlA4oT2QZrGX
 wXC06aDqWGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 crgBEACWxWgAT8cG/mDkoN2QVfPEWbfVWtvWFRQXv54q2Iw67Mow6zOgHOghjKXpL3F5MmAovsN
 Emfn+onAMvQI68zegwOSkt/BV8B29JP7kvYn09WEGSYg54V3sn6V+gzho2WzN8WwpHFitzxdeL6
 Qx75OBSlRSQvM+Rg1YOIAUNDCafWhbA7KAotx2YJeIM4T5h62okSwaTplWDAP41WFDFywwRjVl9
 JWhc1fGWSZTNrBtbeVHe6xKZSSt2qBQhoVl2Uz8o9q73DJ9+O3SyHomy3YVbvwRKj8aUWohlijR
 gTwN+ZQx3IFj6xoEwrdToBSusDzy5MU8LcOU0qoT8Q1BpWnmY9hHxECr/NFdbSrgKZRQhVqR6Py
 4vImpttpgKXrFDj0vYJdQ49exEqOj16V32VGbfcZOHEzXrfDn3kMlVS0NPDYG2pTmPYuCFjQ84E
 9PrGPAeGq3KesqBih6WbmwMKCV99lt2ob3xvDv2odYaXvG5O6t0SXtxGr1JAdpZg+X+d/SAZuLm
 pQnTg6IlkT0SZDoyNLTglOknViI/mBGdUzsBxWXmEHR5Agu+A49WHMihKIIWUrHlTjO6biMlilg
 kRA4CWZLI4Sl9xJA7CRIYu8fuqexaPEA6/o4taqQurhZlhFor6vIh5fXZePJsdudZx5Xj4k5wHF
 pyKFfkhYSs1PzCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 852ce0ac7ff9..89ef4e530fcc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -874,14 +874,14 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return !!value;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
-	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
@@ -892,7 +892,11 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	mtk_gpio_set(chip, gpio, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, gpio, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
@@ -945,7 +949,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->direction_input	= mtk_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-	chip->set		= mtk_gpio_set;
+	chip->set_rv		= mtk_gpio_set;
 	chip->to_irq		= mtk_gpio_to_irq;
 	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;

-- 
2.45.2

