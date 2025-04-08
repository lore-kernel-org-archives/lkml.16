Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D883265CDA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097921; cv=none; b=UbJ3KJzHS1CgcrYr2ldwdEj7oPWroOYu+orvsy2oFFHNs80rtTU5SnSlH1OEqlZTg1tnyf37vBfJ3Qte7W9hl9MfiIJkrqZyOHBE8Hab9QpqmqDmNxB54LGYs7Vi1TeL8pBWxRJO1/siHIYfUF9ALi3wprU0HdllTtOKvGvV7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097921; c=relaxed/simple;
	bh=ilNZkKiACmLQieG1b72vG128/Zk6q84worNVpRUdsuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uyUtOskJt0K7897QzK4YGicC10WZXvsgRmyjZkBXNZuiS1/M+0E5nh++87FvcHeGoMfivG14gbxQO9JSQzj7ViKiCL9Kc00oLvKh9Nx6hL7gPVY/IT0CdEiquYbyeBOGH9G9FNFGkwky+v2fgObngsz2yB/p26gNzo8E7W9IOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DIL4ieaC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DIL4ieaC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so29508585e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097917; x=1744702717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ycPhCwkmIeN+6silmLpioRHga2dgaX99hgp4Vd22jM=;
        b=DIL4ieaCv/C16PFDMEPaLGH6a/pJGBAOSuxnyh/gfzK2gAvZ5G9fkK6H8Y2yHstYnm
         /yC0jbMQdbHNt+KSxqRuov9Evt+w38RlCfjib7gkU71Q5e8rZ3d46oMDsiHqVLle6+cc
         6G3HW3J41qZUTxP87BtNw6yaQNwEFckoR57iCRBXEh25R5DLHSUyHqvLEhAPvO+6TEB4
         S0JpgCTsavQcwHhpQEOCFngQHvqo0BPMTUkeuectkeVI8KVvCeY6sanAoSvhh+ePw3Bz
         rYxPgryLLQHZXMdAzooNC8S7cblw4LIOh97WJY6kct4FqUPyQxA0lFjQF9BHPx8Qhg7d
         eefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097917; x=1744702717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ycPhCwkmIeN+6silmLpioRHga2dgaX99hgp4Vd22jM=;
        b=cXGI+hWzpJvMHJ+MRaO0/kcCrLj+N5ax5JURBFfEvmPb0IgtyClBz6+e+QbY/IxbyF
         nlCvBjhVY39bt1YMMqHIrbLtJBLMKI0W7tpWMZc84X1sXeKbxd184oSxPt0YZ9c2oEDZ
         gMqzTqu3/Li+HEn08W91kGuMM7osBsBd4SfMdPj6QPh/G5WP3dRPg5u5iPASu8JJKGDq
         79y5q5ISNv1vxpyjUHWLP36K14+h9Zy9HckhPeerxxtNuA7XvyykS0+qj5ESB2FWxt14
         T0b0qPLilxSCdtnBUYPwkWP0GVgN8TCr+4zq8HcnatY1THrUMNURp2si/ZU0dHY5UlAs
         SRXw==
X-Forwarded-Encrypted: i=1; AJvYcCUKS8Mn38NSZrUyRohjMH0YXnX9UW3PPqDElbZxekchNPa151EkMjcf1wcXRBQEFdWd3pRqi6O3YaH9LjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPr4gc/4RHUmAWCtljDQSzaDbuONwdqgpLFIkwov5w5uHFVYLo
	wwEUlydr6tatdNp2Sfn6Vr3zDBIN1A/BkentVuM2628mFaNUJHMUup3kJi9hu4c=
X-Gm-Gg: ASbGncuXRKUROyEf9hqAF5qcXWoGP/tG3vX6lMlLlN2qbkm/YCAah5YoVCajTid4LVb
	GOFF1gOKISlLkTMSALiHF2TFajEG4e0x84GqvqBrpqzgf6GWpmXzB6jjniIgD4IYvqQIo+Dyetk
	+EWzY6tKw9VIjMj4dnkl1/rGrlKtgkompQDH4fgJtcFh5MMLU8yQBD2mKrMhurGATl1VpmGGaRs
	mPh4Wc0h/iEUyU/S5bgLBoRw8jUPfnfgO/zR9Gll1+UXipEfXloDg0iuOWTpJoiCW6ak8bbsFD7
	AvZW++9PufZ+Aa8VY7JJmjDAOxG+MLj8goGQhw==
X-Google-Smtp-Source: AGHT+IHONac7vF0smanIwJjC1sSegxVSDSxo0Fao4YOZkxOMnAFYYlxFn+VI5ZwK/8z6s0d03LQBFQ==
X-Received: by 2002:a5d:64ce:0:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-39cba932351mr13076929f8f.24.1744097917408;
        Tue, 08 Apr 2025 00:38:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:29 +0200
Subject: [PATCH 11/12] ASoC: codecs: zl38060: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-11-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Y8rStYn67bqY0zwEQqMRWDBXvlszYOOAybVWufsDq9Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJwjVac6Z72dKQybQpKKwEA8WZHYgRpIphxa
 hSaGL3tAZGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TScAAKCRARpy6gFHHX
 ci2DEADVfFybRaZ92cQ7oOBFVA2hFlExzCCKSpX2hgCoSJtma3DxeUAAs2clk7piMxfEW6givsf
 Cq0sMl26CVRSXlohi+7FPbI0GkLdeAgiSz/MYFu5np4Aovvhw1wpWDvGCTQTvo4jpIdWfl1A6Wy
 I8aJQ1KDGInzUw5taXC4KYwtLO0GVBF7CuZdj1ruiBK8tj/+TO1J4NOkKFUygI/kPG32HPMrFqL
 XaOp8+UTr4N+cCbKUU2xKyY8ZhCZIwQ/nAoQzdLpgtMSpGEx4ZFUJoJq+QVJgo2FZcbUqOUPwG9
 xJMU9UPLPhJzDxg3+mM0wEd6PU4MeIK63ve0Ea4ntwQ16w8iwB5Y0GpjdhFOQMAXr4LLUVW5QKr
 2TnRV+MlZPW/PvPfYH4c0YUpFlNXyFW7Zv8zUD+TPpuQp+/s+BAqESXZj+2aZuFGA1NIxgFroaL
 yJfjasFFcxtr46w9GYibs8PCbGzHyUtzyAIfop8qXKBa9tx0GHFaDLkAHdoqnP36eNIfqJOxSVC
 h86HqUN0RcsuA7AglqIzpB5dt4RaofwsHA5artyBNr73MmgeXi7STl6x+Ozqql/iiQkLsj6ZJ+B
 xmOyZodI4alClQu56OtC0tzpjJ9qeE+aPF2Mziv1oxbV4vIrPYfkqJD/HKTp2uuDR6FouW3pb5Y
 DzegeJg7vkf9ljw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/zl38060.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 28c92d90299e..180d45a349ac 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -387,12 +387,12 @@ static const struct snd_soc_component_driver zl38_component_dev = {
 	.endianness		= 1,
 };
 
-static void chip_gpio_set(struct gpio_chip *c, unsigned int offset, int val)
+static int chip_gpio_set(struct gpio_chip *c, unsigned int offset, int val)
 {
 	struct regmap *regmap = gpiochip_get_data(c);
 	unsigned int mask = BIT(offset);
 
-	regmap_update_bits(regmap, REG_GPIO_DAT, mask, val ? mask : 0);
+	return regmap_update_bits(regmap, REG_GPIO_DAT, mask, val ? mask : 0);
 }
 
 static int chip_gpio_get(struct gpio_chip *c, unsigned int offset)
@@ -422,8 +422,12 @@ chip_direction_output(struct gpio_chip *c, unsigned int offset, int val)
 {
 	struct regmap *regmap = gpiochip_get_data(c);
 	unsigned int mask = BIT(offset);
+	int ret;
+
+	ret = chip_gpio_set(c, offset, val);
+	if (ret)
+		return ret;
 
-	chip_gpio_set(c, offset, val);
 	return regmap_update_bits(regmap, REG_GPIO_DIR, mask, mask);
 }
 
@@ -436,7 +440,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input = chip_direction_input,
 	.direction_output = chip_direction_output,
 	.get = chip_gpio_get,
-	.set = chip_gpio_set,
+	.set_rv = chip_gpio_set,
 
 	.can_sleep = true,
 };

-- 
2.45.2

