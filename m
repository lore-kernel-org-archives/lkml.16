Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F23263F2C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101667; cv=none; b=ljt/7EOJO3+mtNydeSNhVh4v32wy3QVX2bXFxA2CV2UXm86KJghyrJbiNvcZXTwFwEvv4tF4wGwRo+euof8xa4bk8QuCOHHpX54zo5ekRQbW/vbhYSMsQ0iawppDV9oiAOztbSb1EIJjg7ZXwTJ8rOFR+8J4X62zyjxhfxuHaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101667; c=relaxed/simple;
	bh=HHjVPooPghWZo3ILRG9A5aix/QJ9AoiqyE9/CoCMg24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VYmQENDBiaac87nFvLy42nLLtcCJdeXKLfxY3WqCrXDhO7CLzghkzRSwC9MxtbVDj5vlowV31DzGgruGRb1uIcmKq8+k0/ssjMITbbReKF+GmY+6GcAzoikK+qd6c4LsfaXjByjAfxiuvAHKxLngBOA3gm8nlWWwweEAXE3d9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ayG+zew+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ayG+zew+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3116845f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744101663; x=1744706463; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5l/JX2uj1f+6tFDGUnl+gWENA+yeC4c9BhqC6pMEVSA=;
        b=ayG+zew+8UeU4eVbpb0yJKBhI9uLmlYq/E5oPXWdkmgx2+2cuzEIOV3f3GkdeONSNh
         O68OtGsh1unsP2uUOpmv+1XJoP96fsnxhhmWktI94HyNOOkItlwCpJArSycbEQ/NtwsQ
         p//EJl+4zvHNW8QMEOZul2S2YGMQf6p4MwKSsjrobJGij7W54XREE08NvlOiWuUiHnQ7
         /pmOe70swcQt7fHLWwA/slgShiZ/ZBthY3Ixw5k37/7B/M7MwtuRTpjxfn/WgqlsdPsY
         SEcql/hA+VOBlJnb59dsq7rah+eUnVGUN1RxVc5l9tr+ubENTp2Ja3HDG2xeBZdQbY2U
         NHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101663; x=1744706463;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5l/JX2uj1f+6tFDGUnl+gWENA+yeC4c9BhqC6pMEVSA=;
        b=ibxVCldlJezZP5p6INN11ZxBzUlOYVVRpdyS4ZKl6wa2tW0h1bguJ4pCLMlihbDg0q
         ARMkMqPmqYhFyJzUTr1/w8jFlgq27G0vMEiUKm6FtfnDfY8W/JXxXdzaBPS7CUuR1U28
         fP3m8iEkYnqccyC2XL1dD0D6gKveEO0DfyFaFCY0VHM9hWRYCQV0hG7xvi5nGDB/TCf7
         HDs/+MtMVC3Z7/Ruf/iWPDX747I5A4N/eTrQxLuSNJeGdtawhuZQW83UVn3T4SfIoUy1
         1JP8ySy5lYT4fPjPmGBtAXkZ6WctbgIJ848LW9F+YJtyAUDW5ec2AqO+JyEyAE2/NNLG
         zVnA==
X-Forwarded-Encrypted: i=1; AJvYcCWBz7v69ZC46rgy5oOgNp3QjVejmVh3gbDIJcYTirM+lDHY8cfkURquspYdwfIzQVbtCbhA9eXxE/GQ9hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkN2XJTSZhTiN257S/f52WsX5sWeYhzwIklk71EaWflaPmyUiM
	NJwDgMKM274CRtjIn0WVbFd47aX8Sv7QYwDWm0O2HZ5JtCKz50hcf36eJqu0fr0=
X-Gm-Gg: ASbGncvtERfnI1ZN81/jCT6KzJyBV2BFO9ojvHQ283uvrNJeoGLGyYnwqifoUA9EEcF
	wW3/qIpWynogGQjsR3eZyxOftnXM2yTl4gtosKtGSar8qVdpEDYWEA/GU1lhURNPw3kSALeDPTi
	xsT4rQpJ4FZFRqMMtyEdknulkugmEeTJxQcsgvDIX3EOzGi+vRm3QQR1LgqT0ccKWUFBU8umZZk
	AGdcZbyLR84s5ITiH8AfVgXUui4Sbm33JnxyK+LZuWladYm7pRi36NNNg29IyBGsvUptq6c81xE
	W+b4+mwlB+MY/Ew/5renL/QNoqyT8bk7EJeeYA==
X-Google-Smtp-Source: AGHT+IFFTs8qEaLD6lNpPGuy+vrOtX/G5FHp1cGs4X1wq9yEqxfxIVjgXVOG+dEYLbN9f/ov+1CCiw==
X-Received: by 2002:a5d:64e6:0:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-39d0de286fcmr13737229f8f.20.1744101663528;
        Tue, 08 Apr 2025 01:41:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14318281f8f.72.2025.04.08.01.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:41:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 10:40:57 +0200
Subject: [PATCH v2] gpio: ds4520: don't check the 'ngpios' property in the
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-regmap-ngpios-v2-1-26f254014f57@linaro.org>
X-B4-Tracking: v=1; b=H4sIABjh9GcC/23NwQ6CMAzG8VchPVuzDUHh5HsYDhPKaKIb6QzRk
 L27A68ef1/Sf1eIJEwR2mIFoYUjB59hDgX0k/WOkIdsMMpUqjQ1upkDCrmnndFviEi6tpb0qPr
 mAvlwFhr5vUdvXfbE8RXks/9Y9Lb+cid1/pdbNGqsyNbl2N8HKpvrg72VcAzioEspfQEPvS8Xt
 QAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rOqVoIaD6phSjWEitOWWg2WCfMxGn77E/og0f+Z1p+k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9OEaGrX5nZAh5c6b1XH5M40GBlSMvKLOvc5Zo
 zR66E8qBqWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/ThGgAKCRARpy6gFHHX
 csQnEACU/Cg40nGydr9zvG71is5qj5+a2EQnQBhHXXNfNq7rMtjlgxyBYh3q9aTDWlpbuxNiEzw
 b3npmNdpTO4/95LSmyO1y4g6zftWaGvR6JIiKzlKsiWGpC7QZRjFBRThE0VC7e/Dw6JsjVbE2y1
 dDuoGc0fK2oWlueqmzGneEDdZGr8jnIjcVoOh28lIScMkj5BfCKU6p/OfOTLIgLK2SGx5P6/m8K
 CA//3HzmHirRgokOnTCHxK9ct87bjD7EuW01iBYse3vdeTmSbR/whp0bvP+IsZKOoYOBngntn4T
 Nhta+eUyMMfmUuG1d97purd4kJtQhpMk8qEybGe+YUh/PvHsoCxO3nhe5I76Dxrp0jm3oD36eyy
 XkANxWfdnAlAsE6Wl0vxJCuJXfjwAgzpCcTZEdt3gZSoj7tDrkLKpWp2t1CjndjX2izzfpxhhXV
 upkcVB+iile4PTK4fNN4YBhAugjTReyMly3+F2Tq03vrwLa095B9wgKuEzM2fdBIIq1+WbZ12rw
 O7xwWAI6Q31t3y3nCEtpNLESyZL9sbY+n1E+N5XkvFOVfd7C7s98uZ9N5eygc4Uw5rZm08gAKb8
 kG5yPpZ+ynfZ69fBZcGirrcIfPkEec8qkF5y/7FEU7zUYlpoaPRoepGQvI3xf+bHPJTt/Z0V2cr
 RvGdJohV1498a8g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is already done by the gpio-regmap abstraction by calling
gpiochip_get_ngpios(). We don't need to do this at the driver level.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- remove the ngpios variable entirely
- Link to v1: https://lore.kernel.org/r/20250407-gpio-regmap-ngpios-v1-1-5ea63fcbde39@linaro.org
---
 drivers/gpio/gpio-ds4520.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-ds4520.c b/drivers/gpio/gpio-ds4520.c
index 1903deaef3e9..f52ecae382a4 100644
--- a/drivers/gpio/gpio-ds4520.c
+++ b/drivers/gpio/gpio-ds4520.c
@@ -25,7 +25,6 @@ static int ds4520_gpio_probe(struct i2c_client *client)
 	struct gpio_regmap_config config = { };
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
-	u32 ngpio;
 	u32 base;
 	int ret;
 
@@ -33,10 +32,6 @@ static int ds4520_gpio_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Missing 'reg' property.\n");
 
-	ret = device_property_read_u32(dev, "ngpios", &ngpio);
-	if (ret)
-		return dev_err_probe(dev, ret, "Missing 'ngpios' property.\n");
-
 	regmap = devm_regmap_init_i2c(client, &ds4520_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
@@ -44,7 +39,6 @@ static int ds4520_gpio_probe(struct i2c_client *client)
 
 	config.regmap = regmap;
 	config.parent = dev;
-	config.ngpio = ngpio;
 
 	config.reg_dat_base = base + DS4520_IO_STATUS0;
 	config.reg_set_base = base + DS4520_PULLUP0;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpio-regmap-ngpios-e16aae1f0c98

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

