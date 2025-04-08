Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B142265CC7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097920; cv=none; b=eNVu65vp1k9KeiE2ooFcBxse+xq294WqUVJvEy0aRkLSUJu+4opJae9K/ST2Oy13h7oqPGckaI0UFkQy6KMpNRlN4DomYlD0mGf+1+wfkZUHjfQoRmwCUtwfFFke56Ke/V1HobOzthScXVq4QbKq9Xro5ddosZhDDjcWfzMq2jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097920; c=relaxed/simple;
	bh=iHrkXe5h1z4tzTJGa40kk8YaEGYYX+YiF6Amd3et+z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QytYpM0acdH+1/QCMv/XWs1euosplDH8Y6PCggglBotFJ1u3W4gWhwH6hn1p4M9qoQO7pUaGcz19djdj2UFlgCiIOP65E5JHket1i61ZYFdKI1sI8j/LSbg2qcWz5npKUlasXRX/iGYhZjpMZSLgY66lD6y2m5Rv+oqlzWwSfco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Io6LPklX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Io6LPklX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so30149145e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097916; x=1744702716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvcUl+FgyXEa0lssAY7sah73iVwNMHdHEiWjXEgeur8=;
        b=Io6LPklXSugcHJXry6JkqK7vN5Vac9Q4znVUco4TN6pQboAViGk1XAsmeKDtM3V/9B
         O2UpwDIs9rupazFuHTayHUsN1sruvXY8YOdbPR6baXhJyVVnQJPtzIVbykSXjz+Pm5WC
         7o3p9AAuOlT51wNZS6KcMpKJ53hTMZsvyZLb19dz2/CUuThqlUzGk6Pu//AUNJqqCIp4
         M+WV9fh5Hnh3e2agcYxdbwlEXmWhGmjsKdTRXRgtIL/Yh4eBZhOu5LMUk3YzG4/YK5Bx
         y3lwU1ETZ2eJVeItTzsoNomggAVOYLgJ8OELKFGb2f9g5nFGIZJYvWGvmI6iCn/uovlo
         1/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097916; x=1744702716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvcUl+FgyXEa0lssAY7sah73iVwNMHdHEiWjXEgeur8=;
        b=w5j6DyvvRkroM9dX7hfTDSJUPQdOMWrbCL6UuSzG47BwCDFPl7hNsYQf5EXZEQ7pA4
         34AfWPNfKdKnZ4K9ejq10AQePj4CSA3To8YfyOJnM+0Si2jJsbsUY9OtzjGdvT4gXuH7
         0mz8EcFNr/wj3Is3ILzYumdlOsaz3dIsKlFuktgWNTMmRUSKnjYprI7yeohn/bRHMdzW
         XsSpz18Wp8dWd+AiSB0o9dky0I+SHV7tX4/+JCfH5QvWoEbakuPc2d/un8VVafXNvqhN
         Uef+p8Bry4hi07dwz8Qf0WOfMcXc6VsOYSPg1nb2VZZJiE+iwxH8JobM5WEPuE9I6+RQ
         YU5g==
X-Forwarded-Encrypted: i=1; AJvYcCX7SGuWpcoSX7ZUr3datJTxpDzPhOrT6mNR+71TksXLdFbjF1BQKcDOaCW529Y0LJsHttmYOXD3YZPYDss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc5BJOBNvXDcXZyf+OQeb8v8DKPEfEixT/QA5vnj1N/zA0fDSO
	19A8nprROa/BlS85nxCIWA+fpu6Cc5AbTBELYktC9Qfnpe2Wr02U+002d1OabyU=
X-Gm-Gg: ASbGnctvQDcASybK7sF2TO16EGRpFojPoSr14J5cfm12yAQlSxL0hm0hmdr323ZplIS
	TFn65Ldnt+NmrKyU3IVZbaLUeh615sWfqbf5Zpe7aLrpuA7LA6GUHDv3N/0ftfAR+7QZQwO9lbk
	vEkIi5ctXaSfcGGDPvf6CNdGu/OiyVjrGf3rFKiy0at00kONSAwPi5aZjkcY1zP9el0MkjK840A
	ucZ8DPGVUHofBxwp4olLpQBxVlkzGXUBI2jDauUIOBIuuzInZLiTLTNmpc8JlkhA8Y7/o2fI9m0
	h2TqHxVbXf9KcbiU1CXVFoHWZqxJ85nQF8dN5g==
X-Google-Smtp-Source: AGHT+IFwk1uMRpy99nhOF3Kp9erADIpAQZph5aa+Q+sNUxD06YSbpujAM4xW5AbmmoVWHwdgDPwwGA==
X-Received: by 2002:a5d:64ee:0:b0:39c:30d8:a80 with SMTP id ffacd0b85a97d-39d6fc2930fmr8820700f8f.19.1744097916395;
        Tue, 08 Apr 2025 00:38:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:28 +0200
Subject: [PATCH 10/12] ASoC: codecs: wm8903: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-10-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=67o6fWDiy7sxHsZC8a8tfJBk/wPa39r3F5c7o3Lfqqk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJvb3n8ea2db0zLqYHLMw4MRqnN0dTR0v9Ef
 PN7HCdo4X2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbwAKCRARpy6gFHHX
 cpMOEACOXpEn9aiFqFFzE/amxKw6dFdd0eMSDL4VlZpE54imw2m94NgtJaISilSwMOJoaUHULns
 Odez60bWg3fnngDFhDz28Es3rfhxRUaXDKCjZ6lPtjMzk/CJsk0ebuTKn/vlo4lnhnwYW90X7YU
 CU/zzxqACpiUXCvIP7ObZ0WeRTd+rxAWrqVYnq2Cc2R5X+xlyfvKXsjT1PvZ5Xh10K9D/9jcB+/
 IUg/5kcvi/IqFiN0gVT6Yl5iU0Wdp+hGtHc4E80UDf7XKLh97Mrx6poWt7kbJ9bPtJ7jniDCm4H
 MUf5QsA4WKLI4tfEBdQFc+xSxtCgGs4KTuekaQ2s40WiiSB95BHRmVFYDRbaXieYdoZ2sPe3eRu
 9/BsiqGnfI0wbBAgevRi++UHWBKH1k47T7J14WTNYUIlHLy17vEEV8R+OIanuzPKndl6LSlHLPJ
 csJzpdG1Hyykh1/2Ez4g8kp8PR44Br/ZNds9QmNkCro8eeL6wtTNal+i5/igFKmFrnx5AjmKKHW
 S1MHXinniIrcJrXwyNTQpqg6UlSaQCP1/Bgh1fAqqzV9hoWdH7dOFLWBnQzcFcmx0j82fYhla9I
 zaHftq3mm42bh+SG40ju6EUw61ykIxjxf3iFlfXPu3C0NGtHP5sxZeH39wWaHkg5H0upzP1FNRG
 LHQAzzBMw0UN/4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wm8903.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 03902909f27e..2ed9f493d507 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1825,13 +1825,15 @@ static int wm8903_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static void wm8903_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8903_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8903_priv *wm8903 = gpiochip_get_data(chip);
 
-	regmap_update_bits(wm8903->regmap, WM8903_GPIO_CONTROL_1 + offset,
-			   WM8903_GP1_LVL_MASK,
-			   !!value << WM8903_GP1_LVL_SHIFT);
+	return regmap_update_bits(wm8903->regmap,
+				  WM8903_GPIO_CONTROL_1 + offset,
+				  WM8903_GP1_LVL_MASK,
+				  !!value << WM8903_GP1_LVL_SHIFT);
 }
 
 static const struct gpio_chip wm8903_template_chip = {
@@ -1841,7 +1843,7 @@ static const struct gpio_chip wm8903_template_chip = {
 	.direction_input	= wm8903_gpio_direction_in,
 	.get			= wm8903_gpio_get,
 	.direction_output	= wm8903_gpio_direction_out,
-	.set			= wm8903_gpio_set,
+	.set_rv			= wm8903_gpio_set,
 	.can_sleep		= 1,
 };
 

-- 
2.45.2

