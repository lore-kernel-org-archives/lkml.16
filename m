Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8C25B683
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734147; cv=none; b=PQYgLLTI3rCNuM1ks10bW8wxpA4Xsvd6UjVFpTWcLr6t65+kGhyoLA3bpdvWA+tcFzm7jmgS11zwJl657kiyI4masRSEk+u7lbDMKQtqcZA5KWxInQP7yNsbMfBTVuU5++ffeYVIR+dDB0tIWL6vPH5aO0MV+/3yHOl4/RwJOgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734147; c=relaxed/simple;
	bh=IWzffuaXPTlvob8B44ZyI57c1fGd+CDDEQUCn3zwQG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqHnxj2Dgg4chZEDi7ju3nCHMclDgs7A2O0XXVrjx9MIOJmlh0GHrsj+rK5sNdEkaEoWCEANffdYIw19D39mQXoyD9Jkp2N9Al5DgukltUjd1tS7o3yX0tHnAzVZ19+MSlcc1qJo911kh+zlq4cYuEEi3V936hXqvPKQPOqUYYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jwZBGck3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jwZBGck3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so7044975e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734143; x=1750338943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeMSlNL5v7plT+CdY2CAH8xRYdEmWgOgE7l1ThlWmy8=;
        b=jwZBGck3QiGQeRKkTtBppjgmqbB6O8uaZV39PuQZsoRJuEQEYYLsgd4xDpRdsC+WZA
         Jem2I9PYzsbpfdk1v50S48zsq0Ga0BH1Gop4vfUDuAX3ld1a83ZBqHE+mV4BR0pKPuNc
         MSWGlQg6pSvcSrAicZ3VXoVfaxr6IrMaxU9h4l/ddEyFMhoyww0+jnaywhSGZObRZTNT
         AZHCBHyROU+nUZ0ikiFCmAggOVweq79cdcm0xEArK4k/nGikiMne7JFokwWLfUJs0kL4
         Q2PQzweeu+zGpeMbpCiSA9mlBLgSMQkbxxBdvNkgrY2vr4gDA7KZPMiFicCnjRWv4g+m
         T0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734143; x=1750338943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeMSlNL5v7plT+CdY2CAH8xRYdEmWgOgE7l1ThlWmy8=;
        b=gWIyIXnBObiDlu7sBRAN2m6OqI9GauxUHdc0gHKO3AEk2zKgEDOnHoR/SZD6ya04++
         b4/FIbPadnS1YMJytIrZEVgUg+1AY27nJo8scpLhGhrxwoGZaRbT776gOdMlax988Q+Q
         R9atWBEJ3+dr7uFFmv+iZkMB9l8WEtckRUpgf8GeVydnnsePA2/8qi6lCjS6hCE1Ssir
         UM+aUvwCrUvHByp0bumADHpO81ZBMva42PnjG2IYf3zbMnCx9xcAathwiPVFRX2AFXoY
         /qpRYLwUFxoL6fm68FYIy9lpDZCx4iFdfN7pjRogA/Fp+nBf/IqRVytS/kw6XElxCc5v
         HLzg==
X-Forwarded-Encrypted: i=1; AJvYcCV94ZblkfFwgReAJDTBYWAvH+qsMB/JrKaUz4KBaB03Co3EVajzQGszT0DcKSfzic5vLJzPRz5s4Anjg4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqDKK28Z9HQ3MoD3rYysMU4B1Hp0NJlythy8FiP0lSsBiyQ8U
	wBhbBDAf67Hov+MqmSsiMDmJM2GQeuQC/BlLh/wvXbp6nuE3O/OfA7++8rZx9HFKlII=
X-Gm-Gg: ASbGncuG/pWd/TPT+VfBue3udiguzk3Ge1NJVwcPZwZ2fyqQ3dr5rVx5SKJFwjC15FD
	GrKyICvSnWS40eXLehwfByzTDOKGbLlbS+AT1m5OLBLWPzmR8e7q+HFDwhRjFIj8KD4kjMQyZII
	yY9Xfh0EJAmsjqA58zu32ezpC2yf0OXztJ0Z5S2ZFZ5OFVKcU84yeOtHvWIXfvCVzqogFZ4zHBK
	EQG21arOLGb8wO+jVLg8YEda6uZvuDxRlmzJrLD6DX4Uycp/8GaL4sGQagwtEeZLQQKouFJo76j
	VOOtm+th9HQ7L9Bt5Rv12wisVu3eKkKA0BzhA0I3y/0wwPvef6hSGds=
X-Google-Smtp-Source: AGHT+IFfk2JNW5+JEjAS4QGCHFxkYolSwpuwPG6mz1wRQQcTjF+58a/OlpyQ8Y8a8U04LXW/Ou6tzQ==
X-Received: by 2002:a05:600c:c04e:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-453249a1500mr45370855e9.15.1749734142562;
        Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:24 +0200
Subject: [PATCH 15/16] pinctrl: as3722: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-15-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fTmHKsEYrKTNyxoNVzmb5kuSXiJl4noseL2AUv0JQqs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLnJzYKUbqVxOzi9/0Npp9vPvP9vlYV0ANF5
 rwLBnERYbWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 coSBEADHmODbD8gx++i43lj29SdaYhpz3ZGxHPtzCbpJM8Weriq+nhM6eLcP4+WvjNqshPbwg/Z
 n20SACuNZZz+S0+l9KGgSHzYrmCVuUEiF3DNl2mICCeEspJAxClBAGUA2y0Q2TpEV2SLxz2I4dv
 EtAY+a2ESleqNVnppDCes+DFZ5n5aP6K5VD8Hg7J2DLFYtNp6qHprkyCqcTsOnSb/nuo86E8kZF
 zDRkzeByIrj4z71f8Y4fLKzDGxq8krDXvhm9SD73b2UCvw6QXQosqznLheEz4+Z9CPrd1jKbE7r
 cDjRGZ920JYxOSVQHMaipi7GJZsBW/MOU8qI7Ox3HnQbMfHtmliB1rwYB4AhffpcWWuFNw/64se
 CQfZuf3MI8WBKHUHreGVFrkLIfa/dDyNdag0niMoHvtUfXOc5gdwfyduPuuRAwPEoy/gflanzKJ
 W/ZDOKFh3IPWI9cbeaKRzvYbJ4CV2OjtB5/gz+V9t7+aIOwlEnHvNhmcYT47t9LDEBkuOasfyVx
 HOartloAzNYSN3ytVG9SxzobpHzoH5MHqHi1q6l1kLVt8GWdw//Pyxa4Mi/53e/YSBADF7E5j/d
 icL7N29K4WriyHwptsCLWDZn/Wh/0d2q55xgK3Mjnea9jsemXZ7KgCgdZb4MJD9JsUi+EPUMeDp
 qq668JcQgjxm84g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..0c7777a7669fe60d7ffd15263261a9f4d5d7b659 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -471,8 +471,8 @@ static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (invert_enable) ? !val : val;
 }
 
-static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
-		int value)
+static int as3722_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct as3722_pctrl_info *as_pci = gpiochip_get_data(chip);
 	struct as3722 *as3722 = as_pci->as3722;
@@ -484,7 +484,7 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 	if (ret < 0) {
 		dev_err(as_pci->dev,
 			"GPIO_CONTROL%d_REG read failed: %d\n", offset, ret);
-		return;
+		return ret;
 	}
 	en_invert = !!(val & AS3722_GPIO_INV);
 
@@ -498,12 +498,19 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 	if (ret < 0)
 		dev_err(as_pci->dev,
 			"GPIO_SIGNAL_OUT_REG update failed: %d\n", ret);
+
+	return ret;
 }
 
 static int as3722_gpio_direction_output(struct gpio_chip *chip,
-		unsigned offset, int value)
+					unsigned int offset, int value)
 {
-	as3722_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = as3722_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -520,7 +527,7 @@ static const struct gpio_chip as3722_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get			= as3722_gpio_get,
-	.set			= as3722_gpio_set,
+	.set_rv			= as3722_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= as3722_gpio_direction_output,
 	.to_irq			= as3722_gpio_to_irq,

-- 
2.48.1

