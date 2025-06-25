Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1A29C353
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847623; cv=none; b=edWUnWCEu02fOPYkvukkjumlI1G/HIewu8cSG61mpOjmonolAG8MSbndTGLBk+EpICIFeCOF+g0P5APzDUS+tOR+4enQcW9hRtwhmGd3jDa5PyCJT9vp1cKdiigInFhpq45G1/cL46YcobgApyzE0GOzQeuj1nurmhrgZYCKOKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847623; c=relaxed/simple;
	bh=lbfrKKYsx0Jcx3ahPDZ+tIZDH/lZK6F58WKU5pGoFjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMHGi5IcbCB5aM4vzcMX6KZ1TCls5+tB19YCPYO9InDWAn0JA5RGYAQ8wkFwaNDRPAdWbKFLeXKsfawejCU1rkzRMItZuhtO8GjHqd6hBPVRbBQVYyMdjb2C1bhad/+G3skkL/OG1jOOpoTF8kUqD7xajWSspGZZHJRfJp9ERtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I1AGmqNH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I1AGmqNH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so5476025e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847621; x=1751452421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyMmalZdJ6pbvGscU3TgFwWkO4BumQObBVQ5qABdz2w=;
        b=I1AGmqNHQj63DL/FQ6I8HIaN5Ch6JWYwSi7IfmQrmHEhXHr5uPt5OpC5dpbnq+3Uyg
         FjuHnvUAAHc0427NklJmBHEHSKGfmyRR9Sg2ZffcAqWGz4vToxmm9XgfOjLvwL3Efg0R
         ZRsNxC7ZR5bK7nTxzMyt9d3BJEyad8j0jkGkrsqd1BTCpP7bnuXfLMbkYZ3Jz53ZKrHD
         gXCq+KEEPjcaDnlFAQi06Fxj8PKHfR67zWmerlGlDwQ7tlA1WJKkZDlsgmgenfC5nM8v
         V5KWSc3Hm4aZJ3d0ZR4cpBhBxCRNtSXtCOEVD/Znf2YW7C08PrLUYUXzIKlKo+4BGvlH
         A6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847621; x=1751452421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyMmalZdJ6pbvGscU3TgFwWkO4BumQObBVQ5qABdz2w=;
        b=mdebvDGRMlDeZCAOU16YPOrfEdmMmJj9S7tm5fSZikFHffURAAPtBKjCEMwc5jfYfj
         VBr53dzofTJbHyAwxF7Q8mVXsmRDkZVfD6Yr/qy9q8b4lo+nSc0muEn8tTfWpCnyGVv5
         UpeBrqS22/iEvgulMjz0dTjftbjrzo8MoYQF2NI26+/0+SsDBRJ82kFX13cSHGY9pFA2
         HeBJY3tqI6orOE/yhmtlj1BxD0phE73cy1lKH2OBk8wN2S1LKZ/DRfnbYmNsfEdhYDzu
         AsSf6Ev7DSjetU3lSlvVJaTOsVSyqMs0VKnYDn6c4NP3qKmwsbBCmbSQkgGT6unzQ34/
         Je1A==
X-Forwarded-Encrypted: i=1; AJvYcCVLrMJY/KFzFlhKKcVXZ6jHn2P/Vn978dRqp7OpSPv50Y8V7k8iwO+d18lCoFdrKC3EJzaSerbz4kqgHEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDvhxNy0C60HyEObbAqV7+xviXtRI/azG21/txB8ZbPTgxIVgi
	2YmL/OgH4CiUClphiY2ZJKGQ07zme3q8+QFrrpuXrtk1UrCE9lO03dMZmUMajb9fCwQ=
X-Gm-Gg: ASbGncta0mcZFXJw9SyqsSaoKrh1KAnNC/uNf7XeR7YyMBb2w5kqINwdgFSIkSw4api
	LiYONvOwNxAfDCs0MUNmlexqDgfipz4BmOVG5R1afu0rx2dYzWiKfhw0LPs5QyTfwuNf2ffQftC
	7Tl9ROEGNKVu5/DSgs1JM/tR3MHX9i+ga/aFrw6aGCWpxC/fyYa/no5Y+ZK9bedhhFumK20LfzN
	DgmhnGk4+A4c9z5qv1AIpFAB8o5N8EWZhJiRjdBXFMNflKsoL506gRo11zyqcJD7XhfrFgZaXbo
	v8gGmUwPvr0MgeD1TGHIT5q79iXdo70ZVGKvu2Khlpoq+9CwMWdCFOEk
X-Google-Smtp-Source: AGHT+IGX5kkHK6/RlQAQGngBXm2j4mrTrpDdNI6ZtxmGUqgETkm/4NoVqdH01dVxDSht4AUXDDia+g==
X-Received: by 2002:a05:600c:1c1f:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4537b784539mr66449965e9.11.1750847620649;
        Wed, 25 Jun 2025 03:33:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:25 +0200
Subject: [PATCH 02/12] gpio: sch311x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-2-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Bm1ZmDU3+64z2/g6/pZk48jzwRhypNvi/L59y0B0Rkc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+9/4Ewmd+YvX9HPVEYmxBAdnKtB6+FINBn
 JAEQO8cyCyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 ciqYD/921ph5itXKEOUqDoyuMmmgJkixfw98VW/OgdyKVZj1uo+9vDhgAOVGkD/krekgRzgxW4i
 tGuZFW3nq9IKvvScXoxHU24f/6dqGeijpan24o3x9lA6p2ToC05dRWgl2gPydwhTbOjf/yiGrJg
 eXiCiQnsto2fqjl17KdY4sLcN+vPguhIT295R6kSncA1df414q1shuAnrXlPaxo5dNi5xcY1Q58
 lLXtaeLwJiHFyhTk/nByGZAFlB0B3QS8y5UuImWgevMv2TJ7JY2ucndXH6YWUdhsAta/iwAWMAe
 O0xWo/AD2N+AUW0jy9smE3pvLoF7MadWEb/A+/U+KUD+T1i7RtZJjIjyym9rmucanI6Vl3aB1TK
 VjU0tyG5TR/Ih8+YTi/84SBv6imCmwGopVzWS0y0gYE/imeqPb89kCdNXMwOuLSPYPB/w/CyQgX
 vjOFwLlS2UPEJWOP+t8+9wYxyut+zWUX/ydGxXsnLvXz3oMJPNEusb1siZI7ubyeVc1YwZZe8Yi
 QIzCICpYNSOY/xzKxdbvA9b/q8KyfuvRden2qr6OQm++gLpzyNhzwIvtAO8KJqLqTHP5fxrX/c/
 o91d6WX5k0vnrzu2a5/zFDqLlr+WsqxxVjvBq7Utv9bXVV6Dy0UEnA4hktRgLxR1y+7k1l9nAiY
 n49AHM8TfJKjUQQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sch311x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index ba4fccf3cc94f108f036936bc2d5006fb4d060a3..44fb5fc21fb8aaa7a4edde5605e3e23c79ab806e 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -178,14 +178,16 @@ static void __sch311x_gpio_set(struct sch311x_gpio_block *block,
 	outb(data, block->runtime_reg + block->data_reg);
 }
 
-static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
-			     int value)
+static int sch311x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	spin_lock(&block->lock);
 	__sch311x_gpio_set(block, offset, value);
 	spin_unlock(&block->lock);
+
+	return 0;
 }
 
 static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
@@ -295,7 +297,7 @@ static int sch311x_gpio_probe(struct platform_device *pdev)
 		block->chip.get_direction = sch311x_gpio_get_direction;
 		block->chip.set_config = sch311x_gpio_set_config;
 		block->chip.get = sch311x_gpio_get;
-		block->chip.set = sch311x_gpio_set;
+		block->chip.set_rv = sch311x_gpio_set;
 		block->chip.ngpio = 8;
 		block->chip.parent = &pdev->dev;
 		block->chip.base = sch311x_gpio_blocks[i].base;

-- 
2.48.1

