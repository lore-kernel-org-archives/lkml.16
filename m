Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63D26562E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097917; cv=none; b=fHBwl2ktPQZ6gffJ4uayKzR9AIXNEwyDPeb2OVkxK2Fwo3NZnuS9D3ToWojH2ZtJ7SjgpecnXRzihrvqZsyzVu6a8YN1WBhDPTGWfB/875FUTynzHOwsahKyqpVqiw8Xdrn3wk3LH44BhLNCQYL/SPeuc5mr4JcmVsa63NYi+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097917; c=relaxed/simple;
	bh=fY+pWVILXqb5/itiCqfMZP6GT1wrAGbxEdKCgLUSImI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeK1YBfbChoVV+5k2gfQFoiwbmLGK5RC1NdCa7J4A+pfFmxrzHdp7AHemBHKa23wjqkWyhmpYQgTC2HbcL6/wr9cQzq09itlbk+ImnsRSWtJZkfDxlkvPIJ3nR3V6xuefYsEO58RRKikW0g/i9dEv6Jf72rg5sfaULDNh8wQXg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pR1kh0jM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pR1kh0jM"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so4347890f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097914; x=1744702714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBoBUt087bpPfgkOHFFjzVkIh+yz5QA3imLs9YI01iA=;
        b=pR1kh0jMaSHRGOEu5hNXz0u+MAyf9MFYaUuYEX5V9gWwUla0RfLyQ/xPIob7bTdEo8
         90IY8VfLQNGKwBHONqlok3/gnmMFF2Ri481Ztq02+USCWKTO+iiBkRBlJ7LxxO3oUHbt
         /7M7mait8DxmbxihJUmxPSvBoFJ7OMl6IhOYaAngxXeOtrCivzusGB9Rk7s4P3FhUQs7
         8yYXUEeH8WSJvivxjfAFlCP6x1ud7geOdlQo29khNbzuptAqio3GeswnJR7S3hQz30es
         3257T+xsr7bPfikv3zwFj56mNAzzuwX4gSnpCdO8k0SXZkx/EV5ComDSbBogjsW6tf1S
         fJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097914; x=1744702714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBoBUt087bpPfgkOHFFjzVkIh+yz5QA3imLs9YI01iA=;
        b=Yw+JvN8HCSJ3m2AAsLmisYGvhtrL5Of+2knfemtQKDEdlLhmuNttydnFPOfLF5BU7U
         fflbLDswiXUhGqaYgnpmE+xZezx69ZgF/gNbpDxdSuPV0ef3t0Z4b4NBlgMZEi+AYnXx
         t3rAQtfteDamH1e6uZN9Qn9wLAaAMhZ9zpQ9V9h4TAMNY9iEO/J+xqL8A1dOixtH5pCq
         DW/DiyvreZeqisx/IglGP6mjXW1ncT0l6Alt6tM7EL9MzZkr+N7FqDXiByx+pqVfO0B4
         FrUH/qIqo/zNjE3WL71Z4mZIHfWdh+ZH8EWgom90mvDhIsntSSe1SLYQro10hometxB4
         1j1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUl6HY9I9xZq12z7CYrELummlcfm3P5Mo3eN03+BWl5ZOknAzeO7gMfjpcxs1NlDErn70t9hANnA8NXZ0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZ9V6T6Yla0NlLa/FRCVoOtx1z+fiatmW5vW7JX/3vb0ocOxe
	4mBA5/VG/4X+ldI4G1qtErps2Ooi/m5TxIyNDhBFvuXRDq6yKhMMVLQeeJ1Q9DA=
X-Gm-Gg: ASbGnctDWsdiuwtXY131+YJK1A/qzj6muJRfAMyTnUOH04Nv2OB0V1C2E9kAlitLV8u
	FJeGyNtWDh1XNc6HIQMcXnLwdNdUYf49hiuG3XyV/3bvSE5hO8ulWMLbHxZSxYwDCxJ1a+mE6nG
	SmsA7b7LkPcQ5J/N2JwM8J1DELUMRxEHHE2YgQMnSx3pZO+f/JFBxTL82d8OyRnV+NXZuP+ISnr
	aZfMVkHv97gzWhBZdAB25FqfC+RznPaanUnatvlJ/GWSgnqrMtwS+rul4x/LUb/JHBxmwmTUofz
	KHBNXpd+Ah+bkyxDtCQc9lSrryi0S9H9KGsj9Q==
X-Google-Smtp-Source: AGHT+IGZzWPqum+g/fh0DG9ZeMxuwA7hGhCymtHVGUiGXAbEqjqT2osxcevrD/xaQ1rQvP2TSbkLzQ==
X-Received: by 2002:a5d:6d8c:0:b0:39c:1429:fa57 with SMTP id ffacd0b85a97d-39cb36b2a54mr14794973f8f.3.1744097914304;
        Tue, 08 Apr 2025 00:38:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:26 +0200
Subject: [PATCH 08/12] ASoC: codecs: idt821034: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-8-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cgS6T7BQF961sKz8ax21RsHAauAs2dNcFyYRBwkQxTU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJvNVwa+w21sExX3reksODhxqsavG/ZikzPz
 C1DStlIuC6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbwAKCRARpy6gFHHX
 cqyvD/0dEy+efm6u6Nh8gozJACwedpwcG1L9GEZj2HrNlnETPemPzBV/eINPvN3vGDouJyJcQ+h
 mcVbVmQk1qeDyNm6vLLDdT7fOppv9yyEJiAEFI9tXbAw0wXoEDNO+wBH9n2Zw4IBmZ2eTn42seB
 MGZYb4bGFPo51kIYtzUQh4+w/XoX+0tH31w5jnWYEJwppxc5iaAVDC7HgtI+bBhx3cRKpKx5rlI
 TXQgDc0ixZEtE/VnxrBovtDsoOvcr7qG4xZHPBGk1zVtR+OBCmgattvW/xxMOwt8JCcv0N6mOPC
 n0GqgeKafgh61RwboTgtDYKpzOiS7TeDkQh422AbQeURJfjg7LK/PCJiluprXBhyn59bFJHFumW
 xWSwXLhBPwluM1Ku7BxyfUBYswwBcRDeUGaqKQMYyjBiw0dR4cNzMuaRmnRv0Tx+8SD3M8T3Cw3
 Nq64hJX/4LsjI2h8dO9xEJRNFMddYp8/NM+tNTdVW4DDN59cegxet9MPt2JVr6/zK3miWQWiBuS
 BI3lG6bP0W9ZIZnbD5vSAbA9SD5VOH3f93o9CWe5CODtOQs2SQ7w140dy8g4diVc3EMNwuqJk7Q
 SrCfeYdVjCV0Mpd9IlJ6TK+6WoQUQ286gbR/+GyuKZV0i+cC2uA8u/zt/rhxNlBB8tof79z2s5w
 b15sVZOUPaOJ/7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/idt821034.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index cb7a68c799f8..55e90604bbaa 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -957,7 +957,8 @@ static const struct snd_soc_component_driver idt821034_component_driver = {
 #define IDT821034_GPIO_OFFSET_TO_SLIC_CHANNEL(_offset) (((_offset) / 5) % 4)
 #define IDT821034_GPIO_OFFSET_TO_SLIC_MASK(_offset)    BIT((_offset) % 5)
 
-static void idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset, int val)
+static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
+				   int val)
 {
 	u8 ch = IDT821034_GPIO_OFFSET_TO_SLIC_CHANNEL(offset);
 	u8 mask = IDT821034_GPIO_OFFSET_TO_SLIC_MASK(offset);
@@ -973,12 +974,14 @@ static void idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset, in
 	else
 		slic_raw &= ~mask;
 	ret = idt821034_write_slic_raw(idt821034, ch, slic_raw);
-	if (ret) {
-		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
-			offset, ch, mask, ret);
-	}
 
 	mutex_unlock(&idt821034->mutex);
+
+	if (ret)
+		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
+			offset, ch, mask, ret);
+
+	return ret;
 }
 
 static int idt821034_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
@@ -1054,7 +1057,9 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 	u8 slic_conf;
 	int ret;
 
-	idt821034_chip_gpio_set(c, offset, val);
+	ret = idt821034_chip_gpio_set(c, offset, val);
+	if (ret)
+		return ret;
 
 	mutex_lock(&idt821034->mutex);
 
@@ -1112,7 +1117,7 @@ static int idt821034_gpio_init(struct idt821034 *idt821034)
 	idt821034->gpio_chip.direction_input = idt821034_chip_direction_input;
 	idt821034->gpio_chip.direction_output = idt821034_chip_direction_output;
 	idt821034->gpio_chip.get = idt821034_chip_gpio_get;
-	idt821034->gpio_chip.set = idt821034_chip_gpio_set;
+	idt821034->gpio_chip.set_rv = idt821034_chip_gpio_set;
 	idt821034->gpio_chip.can_sleep = true;
 
 	return devm_gpiochip_add_data(&idt821034->spi->dev, &idt821034->gpio_chip,

-- 
2.45.2

