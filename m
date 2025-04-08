Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497026461C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097914; cv=none; b=d1uDrX93uAkiSPHh+bnYR8Y0/GinShJKORncz0bwTcRJ5M2OiABo7HzHKDI1X6NOm1Lx0/Ga6BKn7Oh3r9Rnt/UQaeG0a6gB6n6+dioDtX+hQ13Oy2FGVbEVEPWP3Qcr+tq5iPIW9/L9mOKBqExIdAcf41ADrgPC42EuNLOgApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097914; c=relaxed/simple;
	bh=gnxLULCAyuh9NQsbezqTT7XeAICs/jSdAV8dBui03AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ud2gWwR2w0EJLDVfJttKK2xY52ELiCLLhDVOT639yaJzLdbIIhuFqeFpdIF8s7blloByYPLsjaYmMquqJ7nHy9w0Lkd3ZyvN0dS5sGD1tdWgUktnUk5IWypEtQTCrKEgABC09PUJVERyXMgYhSU+Ovklvbt4hRRGayxLPNhlQL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zz8ItODr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zz8ItODr"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3037574f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097911; x=1744702711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDax3Ws05YZ8zmDA6rC1tfgqVxvQ1cnKk2mOaqzS1/I=;
        b=Zz8ItODr+iek7sistyaWm9uOHGLFGzwiCzZqY6h698pvEiBDAA69ZRpP+4SXCizoKg
         /C/TKZ3zMZRaSuENpRx1K55P0MXim1OLralrQYVtqwXruZdAoE+vzfEWAaJJq2Ux5pWY
         1OGSznWL1t4ykOzYE7BA0GR3fbovH+jDJ6PJlc4q9quO5htqnyS5M6gZRZpD3jduci3n
         NQClzZhf+cbGyxWrGImXHddpv2kkE0o6iMcUQmjW7CYHQN21ne/RKSI4eeqi0clWPdk1
         MQD/C7MOquBdTVQgRWT/Wq8FnClbEvpZrJrEMoTPrrKOAX4t/fv/U9AjtfWZGiD/JRrT
         xGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097911; x=1744702711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDax3Ws05YZ8zmDA6rC1tfgqVxvQ1cnKk2mOaqzS1/I=;
        b=U9D0zPXw0Uvt4GVdlGAl/0GA7hgjsQ+1KwNwQv3bgf7wKcYzBykuqhiL+EEkAwQU70
         Y8D8BEkgGC+pwHUiMMcDnKX9l8PFTMZS0644ozge895XeVNe7dPfco0KwqIbb94+SDQE
         U7oPC020Xfurv8Y6VoWb6kKlYbh58JfpC4Vs8MzcJWW3pUPRpKN9jdShgP5uP+E8iJqB
         J4V1Hvy0h4zNwiTEhBJ8T6jX1z5/ZdFt4A5FmtArP6LSsT8g5I5UAOzZ4pbczFQ7MT9N
         11NgtwbP1PH4287QzNyBbsyBLr3vBfSGsYYwzCqZ3NBPbyZOCIWe/YP0AeUT40m2552e
         94yg==
X-Forwarded-Encrypted: i=1; AJvYcCVSmRDgZqRNAIK/KLHB5kk2JyjEmUL9H4KSus84FaDImaxTK5q3JULPtRkW5B6grc5WyiQaodfYLMR/d6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfTwCd7vCdb+HBnlbxC4lJlAEUpSr0YcxlY5PtBmy4kOGFdfI
	bacLeSUmWaWOiFFmtNSzSLQirH6KrBezbOT/91wp5v47kNxjjbrB9cm25poUE5s=
X-Gm-Gg: ASbGncuaKnMKd7TCILc7CDRByHF+yOViFOnoMrR1nisb1BocJ63SsHtkEJowqCCgje5
	qEDxnp6aAqY7ZHKje8nGXPcLAxExDxbc67cJP+Za2JTj8o+PsxFXTyAzit1Ijm07tvZyP54zVmc
	W2KCbBQk7kZQvpW21T+iLmWoM0ia6r4IBhBCUBCVW3XiGYOZdTpXY8H/OsJulrChRH58GPU1vDz
	KdGKamWdvb0G1kEHGxAUfEDLveXyMUexJThWjUOQuQHaEZjP0WGFmbyFgwYPnPCWi0HwYf4DmDN
	2bowRJvD7DHjq6wa+whOWFwqyTbIP/urJpO47A==
X-Google-Smtp-Source: AGHT+IEWN9bYde/xMBfOkHQNa6HTYyFDHb28eVaUUMXpnBBVvhESil1QEAAwJj+1rOSrQNH6YQ+0zg==
X-Received: by 2002:a05:6000:1867:b0:39c:2688:6edd with SMTP id ffacd0b85a97d-39cb3595c48mr12927726f8f.15.1744097910752;
        Tue, 08 Apr 2025 00:38:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:23 +0200
Subject: [PATCH 05/12] ASoC: codecs: rt5677: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-5-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zqMzTD4a9F77NzTYV5GJminLBgRVL2t9zDj4XQHtrdg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJuPhUyJQBxaca+q9M4yYolMhou4yTpNTZ4z
 bBZeOmVg++JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbgAKCRARpy6gFHHX
 cjTPEAC1m5Nhh2RvAgn2Pdst2uBxBgbujINKZhSTjhjkRq2GEmSbijkEPVPhf3lTtSgh831MbWY
 /u0gfFdKiH205VrjCt/8wzP2IL4IMpSaWYwt2Q2JAIHbbCVfDnJRL7y3hwEnoxArxbkJytcOKis
 FzezC8j6QX/iHLKZT/aBdX0ldbqSsKmyQYRMVMKm8sJjAS3ytnxsrKtuvjXt39QjGz+9/rJ6U3X
 +P5nukSNs+yzFNVyFIk6iGrXCC8UEmzVdAe+D1naSqPiirI7nnYt5fcie0iR04GoHq2IDEJaDRu
 6hJZJJNBBiLZLIcEQMSs45Xwts0A+SrnEbcXOBgrs+JdkQTJ8zwWppLPWPfbBfdtUDAzOwF9nhR
 a1fMazH4gjgsVO5GQboxTzs12sAQyUyBKTsWmU/6C1koEFip2C6I7oJJnmqTMtnUgbL1RWHYQ2k
 dUwigXx6LBL7gN59RUhnnViGXAWoWdibP7VWrZ0YCm+zXd+Kqeoli3saaMek+mza0XqWSyZgcL4
 G2KDLyBbxTUWfHj3Wvybh8SBenScb9aaAyCfnFFl43VlOsRbnOieVGSaFPQ6UMTbjj4spNmsfEn
 qHnY6WkI0X1nN5hEOof8Ym1FX5XGI6rpQDm8qDZ2Sj5QCuCNSeCkDbUvPsjK80aWka4sZj5El99
 62Jw0Pdii81VBAA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/rt5677.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 6e4774148566..69a0fb8d7f77 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4725,13 +4725,14 @@ static int rt5677_update_gpio_bits(struct rt5677_priv *rt5677, unsigned offset,
 }
 
 #ifdef CONFIG_GPIOLIB
-static void rt5677_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int rt5677_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
 	int level = value ? RT5677_GPIOx_OUT_HI : RT5677_GPIOx_OUT_LO;
 	int m = RT5677_GPIOx_OUT_MASK;
 
-	rt5677_update_gpio_bits(rt5677, offset, m, level);
+	return rt5677_update_gpio_bits(rt5677, offset, m, level);
 }
 
 static int rt5677_gpio_direction_out(struct gpio_chip *chip,
@@ -4834,7 +4835,7 @@ static const struct gpio_chip rt5677_template_chip = {
 	.label			= RT5677_DRV_NAME,
 	.owner			= THIS_MODULE,
 	.direction_output	= rt5677_gpio_direction_out,
-	.set			= rt5677_gpio_set,
+	.set_rv			= rt5677_gpio_set,
 	.direction_input	= rt5677_gpio_direction_in,
 	.get			= rt5677_gpio_get,
 	.to_irq			= rt5677_to_irq,

-- 
2.45.2

