Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA166244694
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322009; cv=none; b=Xy1iuqqLlYCO4PPONYuTZMTYbnxFBOwguBEebX2yT3/uMH7y3+RRRCO9cxXRHkLNFz0GWVcPumsFcXFNPrgFHUKexB97jtprhlU8fYqXYZtbyPEOrbCl10H5S+iPBugpPrH7E+oQqL0vyyCDT5Z7MfrKkGNQsW9cCudcDtY9Yv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322009; c=relaxed/simple;
	bh=RPhkT3IzDcFi1m3smXl28iMPiZa62xWz+n4q9CIoNU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTNbagkB+j4LY3xUDGTWkYwq1GfYWbR/PI+VmIvWjArB8YDunyti7tv0gQhcw5UTsD9NV1KF2+YuoWsm6dC3koABmeTlWbXVlyz6hxWLcPyTb4ZlEa8GIw4MumaRfHs+OkTWllkCeB9o6W6/RlPyx4yJfUqRN4AbtzyxDzXijxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=22qiFnFa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="22qiFnFa"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f71831abso461615f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322006; x=1750926806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=22qiFnFaH+7yYTD1WPpTHi25yDE8TMFCzdlMQGwxA9/uqj+5xdwK+e/xqNfUMPjsSR
         xfFihPDRfOYrkWrUI986FYZPR9/3hoj65DjfOeEDYuLAU6OmuBgH2QneGL/Ti9cRPvDO
         6B3NBKyZkcrXrnhGNPEvq+upQJXLsCHmv3btLAALo6oUlj0KO2A1CWl+3gyD8vGPpwyU
         P3N2uqD1rOTxdXZFj/t9WvbL4JX97CXG6Gr/cYm2eLoiBPHS6MYrjjB83gzEaOfM/HA0
         E8zNCP+DJGQuo2/vbVB6q/UQIB7Fv+q0EmtW+aSu9pz9vMN1HCpKFjM56v6OXjIGAY4M
         TCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322006; x=1750926806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=D5NonV/aM0nDK81tXJvkRv4xJAwZCaBOatAXP5Q2ZLmaMEKimgd8Mm807+8NHloarz
         x/8n+B4blys9bGNKekkaS/2bdRrXCIXr/Pg/dn2qZTFZtfSeesnhBNPFUBKdWQgBBMqq
         RMA9TUda7Zx6CjDkc8jNF5cRMyE0ZMe7gHQOJGxdJIcumGYECv2cZ5YWaevdKU3LNFGt
         RZgXfhjeFWIgf2fNsSL/y4W81L+y/O5IsoOHK7g3dC737qSr6BXvf0ZfeoDQ1M+YWJju
         MrfEwaq1Q77hNb1oxul2CQ4hibbH3By1lh6Y6ct0wk2u57/dvOSs1iUrSvJTBsgMszjZ
         qLOw==
X-Forwarded-Encrypted: i=1; AJvYcCWdXY/oQOKHR0yQ0T3mvGTjNrNHueIGx5sgqYR6aKz0MQAqTYsnW2hHoyNC3Dr8GBh0TGavebR5iWxsG3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZhx/SBDNMV3JJfTJsRkoE4UxIbxE8vAWTx7iKzZTxem6gHqI
	GUgwGu7075COCDv6DRTjNNNrp1kmVrfpk8y+Vsq4TQsru0Jg+9zbgf7yZXkPQOeZ9eQ=
X-Gm-Gg: ASbGncvqyriR7/Fotec2j9N4Rjgq7X5tHunpcPSl3A3tV8yYY4/tTfrUXQeyW7mgnVG
	qh00xT3DGg870zmB+X9tbcUs7U9G6y2645sLgjp5HTIffRmHCnbf7d+t0w1Is8iG6RXI3qaPQKn
	1tqQBtLBXgML1W/TuvRsaVqfc2j6eCXQQpP8x21D+h69q1c2AbADQQcV9dh171gZnLpnLK+eBob
	aabYBOjgNWxtIoORUs/SFk0wKDEDaODar4U6bg6HeJUQxP16I5lzKQq9PjZHzT8yeuM7DlvJMz/
	QvP1zT6vQSohHt59XiKK9tGRlPOGZPDOtN9X0NkOtEkcNQslWOi8x7MJ
X-Google-Smtp-Source: AGHT+IEiED0mQ4+a32MGCQhlzyMcTjNqSc3s2m6eXgPGOeUaueHu67jN6I+lpA1Wnn2Ut5FCEP2y+w==
X-Received: by 2002:a05:6000:25e9:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a572367d55mr15222705f8f.1.1750322006052;
        Thu, 19 Jun 2025 01:33:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:14 +0200
Subject: [PATCH v2 01/12] gpio: pca9570: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-1-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=t5r7nMPMOl/Fqhu7blFrjnyYOcc5SoneVJWT0UVvyG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRTHJhon1ZuCnCenmO49z6Bq3Wu3wOrzICX
 o4RpZQLMR+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 cq8LD/sF6228YfnMmyZbE3tlZK1iFMNVyr5c67b6FoDsGs8zrAd40Lx5oCbTsP4Im25mpNB9Nly
 Ezf6/TpCHbwpLVGeCuUl8xunzUEtaXQU56bxevMxjgvc+/QmaDQbQ5ZOn8xBHc6cLHLZt5AfqLr
 Kc76zQB/jux76D480JbJMZM4S6zFEpAn2Ey3LfaBXrNnIRgIWFHce7Rb9DS/+MJDbjWF7tjUlg3
 SxGymF06crmm6xMLbzkAYcozsGRun/1XntMRwG00CcswvE9JuR67I2SDFHFRchOJXDVYhjaaZhF
 PI3R0uPx6ZoQ4Nj6GyULy2Wg6l5am+JImsMhwb8P7hjA+eGiZJVi1kcyvSPXBaDy2n/bf/VlA8t
 j507rlA7XprBb2k+4iBSv9Uf46wUQ8FOudWqHDC8M4BcqiVEzgOLfQcdB7Brhz/6Q1EBGbXQW+/
 N5GPOEY87jwj4jlXUe7NvKnmk2eC79EAeWoS63elxYg7bDZuoG7n+26/J4V2iNOY1jyfQRpPRri
 d81T4MjJp0IRjO5TzN492JN8CLSFWVt/6OkZvduQ8LYmqx6NDXoN/v1Tt4KUNFZERDEZ+UWlko8
 OmZfykAWqmgKXLrp5PTD3mov5S6owsGQzcDGn9zirpSQ9Vxz4NrxjvMVwAhjmewsTMV/QCC+aXB
 E//DPkJ2ybu9CIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pca9570.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d37ba404936835bca160822ee361604827976e9b..a33246f20fd838a57abeedbbd7e58259bf073a86 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -88,7 +88,7 @@ static int pca9570_get(struct gpio_chip *chip, unsigned offset)
 	return !!(buffer & BIT(offset));
 }
 
-static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pca9570 *gpio = gpiochip_get_data(chip);
 	u8 buffer;
@@ -110,6 +110,7 @@ static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
 
 out:
 	mutex_unlock(&gpio->lock);
+	return ret;
 }
 
 static int pca9570_probe(struct i2c_client *client)
@@ -125,7 +126,7 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.owner = THIS_MODULE;
 	gpio->chip.get_direction = pca9570_get_direction;
 	gpio->chip.get = pca9570_get;
-	gpio->chip.set = pca9570_set;
+	gpio->chip.set_rv = pca9570_set;
 	gpio->chip.base = -1;
 	gpio->chip_data = device_get_match_data(&client->dev);
 	gpio->chip.ngpio = gpio->chip_data->ngpio;

-- 
2.48.1

