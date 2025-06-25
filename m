Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984562D1F72
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847635; cv=none; b=UnH+397pMTvLl1HvE9MvRihNXyZIhWk/F41Xnboy06UEsknBw/BpCZ7q6O9EL5WcEJqlVuzY0PbQLGhCGbEO5lyNAe0adLU50JvgpaBWCaSkMK7ZVvny0CNvzdZhsgtsrJH7fQ6wOVcOyZ8ogVpnC3Oz+2yljWG1MfOZiwoU6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847635; c=relaxed/simple;
	bh=/R5v1/odu4+g59x92l+r8Nz1efWq5aExO8tpI+Nyoc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JibmPfwCo5iMzSfQBBoOs4j4UWENhiCMHojCobvhuV9RuSVD1WjQ0zjSJu2MRdXg/LEwvX/UrbSnF8D8aEZnwLUNaRDAJ3SKQAX/Wzo1lQ6lB5XY7cSqjRpVMqZv+29fapCfWo/Tgjc47Mkdh97nvF5/p8gUKk7EBtRf4ueZ/aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V/TJAhTH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V/TJAhTH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so506577f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847631; x=1751452431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
        b=V/TJAhTHTv84GoEU5sFBIi5SB5XrT/yZyyTRv6i+UBbLSFvylfEKOL4wxeTfRt+qHb
         VXt1LlcnkuPDDFmfHilHB+Q1rLhMKDFbxQn3qz3RMawU5CaYK4dMtamV3TgdcJilO3AG
         rQVKarckTgBqPbZ+XaseNoL2tyljQRhqWp82zR5CnnRstwwyyOvOd1L0R4ukN4Y5PKq0
         fBrhzbP8osYCG6kDOUWt8yA0dJ4UEuef3K/oJqAgv79h0NBsC1pJCuJVJpq/YQOquqrD
         tE14srabErRJMbws1PaSnzQ/IOUqJHFM5Ky0iiRCmTTawOMzNtU7Kio4zZkKzNU4mdot
         2RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847631; x=1751452431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
        b=UW8LWDIIZPnI8+Q30smuSNF71j5C/sJhXj2pyFGFz9YEJ1yG9fznlUELfPuZ/8Jv6t
         dE/FIkHK9iLh8pfzXdNw3l7b53l5Yrl9Uj16DysUNAtrxd0xa8xqAVbixkmbXWqRyEYm
         RbDdL43HAMvwfOhqTcQu3lYfQTvjdfO/QC6J9+1MQarcXU+CRSpPn0MB1rQ1rFIYP6Eh
         /e5FElPxmgkexygxlfFKdS594hbzgKH4uQKDbYrQpC+irUcowzunA6c8DuwjfQKEv/k8
         iFy+0gt2ZwoG/RjTDOsgnYt6eSnRJ7pnvS8bwEt+PUP7hI203T2ICQ+JYElNHXfxzsde
         T91A==
X-Forwarded-Encrypted: i=1; AJvYcCVUa6V1RqMwXE/dRH/tlDoUWjeaR86aDSqeChE97+Vk8FoGtne6lG5SPMu/M5AQSwqDniRmgxbbfmFM0rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKEaKHWHlYn1tQBYpP3AKi6SSPWgQuM0xHCm0HsvyXeseDGnK
	oKfGg9uOKXXv27dxsRxIgDWtAKo2tCdb/YUS1Cc7D6ommQMyjyXSxsGfg73eob7XxtY=
X-Gm-Gg: ASbGncvcmT+1pHyqEFW7qUqZf411/XEwq5yprQliBr3KXuqPkKc/Tu/2jn0ZoZPf+vn
	zhfKsLIYZ2qZfAokimkZevvvMfFrSRr1WAegN9T9b3lV2ke3qXSH7KKUcMKQTnkgd4Y2UxyhcvJ
	UyQkAoO5UVwABKMbXgbsKvD5KYoqrwo41+O4F/4hn+JUZpGYEg4tJpRovQcvESTWxU/6SHSl3/H
	Uu1BRTZ8BZe2KYH6Z1Jtls+aP+XbqNzE3IrSdoXwQZ2v3THlWDE3Xj4YoKFbn4qwXlHh7OHq6Ac
	md6xLLXdo4nKGYnxK7JOOlVzuFl9raaNFHM6qucmGqxboNezELspwkDm
X-Google-Smtp-Source: AGHT+IHVlfqB4inzXZzLgekCnTIjuihgVCYxGd7tprEn7YokvX3NE5HXPw4UxnDwuCjQPML6+E/5Fg==
X-Received: by 2002:a5d:5f92:0:b0:3a5:25e2:6129 with SMTP id ffacd0b85a97d-3a6e7206741mr6336631f8f.21.1750847630882;
        Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:33 +0200
Subject: [PATCH 10/12] gpio: syscon: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-10-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4222;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sjfHOc+5FIElw6Tn67jgDQmefJjmNImROrNF3EFqBFg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CA83SVJti9vEV1Z0Jj0mn5RsqIkTfAL4+Q6
 qHpliBjLBKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 cmakD/0bM1j6L2o30Tp+dbPHedW5MlBncI7X9OnpYlO059zCAtX6weW1EA7auFfb0pdgDrfc8ju
 9P5nzipoqm1g9uh5EW5ZdT7ZJoaL0KAOfmZNC9NMTIotgDYZkC/9K7W7ZJtXNYQiofJYV47yCOZ
 kL4vOnVBZPiaEyKO0xFm5x7OUnV3dVCovfICjZ96PuxIInIlToYVDkR0g30XRN2sigYYgNdtCIE
 kerUi0WQNQt5yS4+00WCichtEFr2W/q6AlgHPAoQ/WLm2q1Fs+eUj6D2HCIVFCfNXrMepgTYmHZ
 FdAGaF9VjhyPnlgQ0zSGcbmIXVlYkf6+/iicvTtJDzo69K4mh1b17ZLpIqg5UMIqOx7LjhijbfO
 JyQfwsyWY2rZafQjfgE5FrfPlKPGbzs+EiYzCdlYrO0mlbq4/UByZXeNRZ3LOOWOcou8CZQ74kd
 XPDPaP07F2vdEPMHkbRs2gfZ9dfQdnayC0IIQnzR13Sh5nrdUW2YtalxOl12QBXSWNfkCsDRNfW
 +F2WqxK7s67FsSnl+Id/m4j6wu+PqYDnwxHKdTXsaXCw6dCmHAF8J2qY3udEZcemFhsuR3Kwc/g
 2RQ1p2buy65m4uB9eJE9W4PHCBI/Z8niJDMCY/e9NZMH9aqqOAj44pwau4RDrH9m96Q+0L7S2pJ
 vIUv+bZN/Ve660A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-syscon.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 5ab394ec81e69beae2080a3ca7ecf35868e79abf..f86f78655c2420ef91f1248653b4943b5d8ed1c0 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -40,8 +40,8 @@ struct syscon_gpio_data {
 	unsigned int	bit_count;
 	unsigned int	dat_bit_offset;
 	unsigned int	dir_bit_offset;
-	void		(*set)(struct gpio_chip *chip,
-			       unsigned offset, int value);
+	int		(*set)(struct gpio_chip *chip, unsigned int offset,
+			       int value);
 };
 
 struct syscon_gpio_priv {
@@ -68,17 +68,17 @@ static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offs % SYSCON_REG_BITS));
 }
 
-static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int syscon_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
 
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
-	regmap_update_bits(priv->syscon,
-			   (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
-			   BIT(offs % SYSCON_REG_BITS),
-			   val ? BIT(offs % SYSCON_REG_BITS) : 0);
+	return regmap_update_bits(priv->syscon,
+				  (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
+				  BIT(offs % SYSCON_REG_BITS),
+				  val ? BIT(offs % SYSCON_REG_BITS) : 0);
 }
 
 static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
@@ -115,9 +115,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 				   BIT(offs % SYSCON_REG_BITS));
 	}
 
-	chip->set(chip, offset, val);
-
-	return 0;
+	return chip->set_rv(chip, offset, val);
 }
 
 static const struct syscon_gpio_data clps711x_mctrl_gpio = {
@@ -127,8 +125,8 @@ static const struct syscon_gpio_data clps711x_mctrl_gpio = {
 	.dat_bit_offset	= 0x40 * 8 + 8,
 };
 
-static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			      int val)
+static int rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -144,6 +142,8 @@ static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			   data);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
@@ -156,7 +156,8 @@ static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
 
 #define KEYSTONE_LOCK_BIT BIT(0)
 
-static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int keystone_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -165,7 +166,7 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
 	if (!val)
-		return;
+		return 0;
 
 	ret = regmap_update_bits(
 			priv->syscon,
@@ -174,6 +175,8 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 			BIT(offs % SYSCON_REG_BITS) | KEYSTONE_LOCK_BIT);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data keystone_dsp_gpio = {
@@ -248,7 +251,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
 		priv->chip.direction_input = syscon_gpio_dir_in;
 	if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
-		priv->chip.set = priv->data->set ? : syscon_gpio_set;
+		priv->chip.set_rv = priv->data->set ? : syscon_gpio_set;
 		priv->chip.direction_output = syscon_gpio_dir_out;
 	}
 

-- 
2.48.1

