Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A022EA47B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163096; cv=none; b=ieEHwKzRxj3307VJS44DZmYns0oOpH8ONG2BghFtnNVoKDHNqwBxw/ALn/MjTJ75O5mwyjJr+4gMY8vPdcWVJV8Vg0DIlP/b4vBfi3OWJiRB0vHvklS1K77Gu8VgIcoSv7P/qUBRQI3UKYSaSbPB2UE0p56uDuC+JNFkQPUd9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163096; c=relaxed/simple;
	bh=3QvoiOFdKV8vnY8Kgna8S7pQjfH/iy2iYWkuJQ55SWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQIBp2TG7Yk86Uy6pMTjONwtMEd+8t3akLkDa0qqj98kVvWsTWwMQ/XHcKJCLqsru+qyCc7hV0UvUWLe7Pd2Qs+YoRvOK89S08gpnmZj57j0o2boo7XIA2DhkcxOcQVrcrkdQt/8fWCXTzyyspx603EnuZM6r0Ph6UCHYASrcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2XKrKV12; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2XKrKV12"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3814221f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163093; x=1750767893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=2XKrKV12QgkkKnozExFqvj91aJ89+ulCoVpmkf96jwsBpMAJH5UGgjCjND4mEWGabM
         Fnhy7Bub7X2cih6njlasAhvWvwuvHfsPDNZGVL/hgBdcogGW+rghb5JpWkM9dy9qtpnv
         nHvERnG1j+W+hplPHg4fZezNNOvYOsi8YACRcbGQBCo7NX7/CZ82t1OlP5wnVWf7SSkK
         eLuNCpHntEez3D8H9IxlefrVZpjKuQPLR4H6jbJDsWKui+XDnQpVPjY5CDYPgIy12sjF
         u2Hut3XMA1wY2lE/u9vn/2EyaCmWQh9FAOfEyrDzHKQRIp3f0cfuLnNdeWuL51aXBush
         ROEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163093; x=1750767893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=DVH2bGsyMkUfM6heDSqDgw8nfm9qD8vKe03OtTteH4fkHwXZ3iSlhYZJv3Iko03NI1
         gt6NAWqXkb1bvQH5NFzD3dNtDp6JpJzcRItFGwLWQgyHasJ6jHhuY7t0Y8UP4fAqhNzx
         SNokDU9SGPSKnjqMMGBk2JLBwRG7bjjJo0r2EHipXEr5dUMWKU1+omcfVVBTXQNbdjTO
         K/1e5JGWbvT5fMC2/l6WaDVYpYSApT028Cu00ccUom6dujba43mkHkHxd6opIaE/OJN2
         AmxK1v1ZMkdD29bVsQWaY2Oh9B0fSsbEmK5r8XmxKJieHnAhumz3UXiQSu1L3Bhlpg20
         ng+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnjahK1WARddDfHWrr/OLh1br2qZeD3qZNmmukiHcvYevvw4Ctar4njVhu8N4J7W8UZGM9wUnYop/Sl7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG3C6p93mx9B3mrcalxQp3L8xTDmGGD47tXbxLfx9nLNuUU9Wf
	WbInHm+17Xd/dSu5Br0b9yfAVey1aZun8HV9X1Z38pRYWt8K1gLjhX3TQndeOCuT3xgrJdUdgaW
	TSc/ctRI=
X-Gm-Gg: ASbGncs8NFeUfZDcrEsF7yTTquA06xtqAbDIpYP+q3NtSkuPsBhzK51e4MWzw3/h9B+
	/HzGi1zj8qnwRdTMo/q03X0SEkXbFTH4L6wBJ5HIx9Za6VSU4yt2KBEyYVjhDeO/MNg/svdmudA
	Uoxu2spJnYR0pv4LydkH0YKmTewrwShuJqovzqW+N9ivPvYU/gqzNGv26JfSVX9qnpIckcfTnHD
	Q2Tdo6ZNbV6cXDPGr8lxc649xMq3aFmuEWf9IpoRNmYkWPSn//Is3IxmYHOfowVdkW/Gj3FZ3X4
	6Edt1j13WECwJyHFT8Uoy1t+B9fmAe/Mf+5ZGpPgYSiaYPCZQOaLINPF
X-Google-Smtp-Source: AGHT+IH8xpEepUrAKy/suev+AiSpI+HMEadcjXJn3KnGCfb1V3r97zqr4NOUkjvPw/0XSg0h1ArV8A==
X-Received: by 2002:a05:6000:1886:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a5723af293mr10690095f8f.39.1750163093381;
        Tue, 17 Jun 2025 05:24:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:33 +0200
Subject: [PATCH 11/12] gpio: rtd: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-11-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v7M2Umlyn2cPSJSz3+M1vQ3MpPcGxR4ur24zUL3eZaA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6Ix+OY9qYUNs57XxRLpSefNPZMcuXRvrrwq
 in5+MyXCnGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 cgUcD/9a/NMO23UBM1PKONinHkaDzFJv6rspeSt3zyUyirrJTSC+YG9L7KQAy6EP8I14UVcZKtA
 lNgBgl7hfpD+zkk1mp4AwrMXPBeVx8WSSjf0FmO+MrjsITnI4Z0fbz5o0jDFE+lDn7xD2cL2auU
 947xCBF9+Ttxmotpuw9ArSMMBdVwMeIEhjD535k2QDvlUfURzxixpuWKVDuW/kJtMFSOIjhirXR
 NyY5cM5Y6hZc1PlNZvVmKEVRYX2iblKuwvO6aTogzr+j8DsAv9hWmlSFzuRR9P+0aO2XmvgGXg8
 1n6R5ZC1zPol+Zn7IZ7P9bmtLwmCbhtwH52ceHQw7VwuxKj6XyyYS5Islx9pCInqsAyOKDDHc5w
 sBCDnSCr9KRnoYUgVU0FtZUccsCkeSs7u2WVJt4OXTN/vaW6+jyp25w9AcT5j70W4I/sXnJyA4C
 RqboO/HC6SFaenrazVmKfvN+w+LsKTyh2ubg6Q33Cvl8SUHSuJhXPmmYEVJtMBoh9sAgCbbhtZD
 VBokjCltqacYpkmvjoqoa4oGIWdwNjsmEjshSlpcJbQEjPOwSC8OT+L5DEF3DPTETFARiOApkFE
 DZl/rN6G8ha/5RdhURKiwc3HANM9XFITHEtdw4xybhabqYeL+fl5ZjADtbwN8Rh9jmgSrioWfJq
 BY0Nu9ZHfizUkJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rtd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rtd.c b/drivers/gpio/gpio-rtd.c
index bf7f008f58d703347cba14f35c19f5798ee3a949..25bbd749b019bf8a272c173a3e7373a442f72350 100644
--- a/drivers/gpio/gpio-rtd.c
+++ b/drivers/gpio/gpio-rtd.c
@@ -275,7 +275,7 @@ static int rtd_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	}
 }
 
-static void rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct rtd_gpio *data = gpiochip_get_data(chip);
 	u32 mask = BIT(offset % 32);
@@ -292,6 +292,8 @@ static void rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	else
 		val &= ~mask;
 	writel_relaxed(val, data->base + dato_reg_offset);
+
+	return 0;
 }
 
 static int rtd_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -563,7 +565,7 @@ static int rtd_gpio_probe(struct platform_device *pdev)
 	data->gpio_chip.get_direction = rtd_gpio_get_direction;
 	data->gpio_chip.direction_input = rtd_gpio_direction_input;
 	data->gpio_chip.direction_output = rtd_gpio_direction_output;
-	data->gpio_chip.set = rtd_gpio_set;
+	data->gpio_chip.set_rv = rtd_gpio_set;
 	data->gpio_chip.get = rtd_gpio_get;
 	data->gpio_chip.set_config = rtd_gpio_set_config;
 	data->gpio_chip.parent = dev;

-- 
2.48.1

