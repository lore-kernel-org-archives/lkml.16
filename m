Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A4329552F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558810; cv=none; b=VvICarr9wUN07cNKJFlFWhFaVUK6YcK/89yviakmICi8zO3LEX101WfSSXO2e0EVMyJ5FqwouFWl8XB9gWANSPqjfnL2/NDf4EZHNfaeOkzhPHLAGgEVJyj+i3Us57qtoCECydcAgwccKVEeOdSlv7Hz9rUl2zbOZ7bL5Nae4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558810; c=relaxed/simple;
	bh=+bezkCQDk9Fjy2lBXrNyfPFPBRevDeE7ACPep1dR+ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsIjziJXTJlwsvoFQNlmz7k5Ut4dRrmlupQd5cxzO6KBcKduxMP0rgMmof8XmIGQczbG2NdeXndc6rgmFR+9RNiASfl3oqMIHL58w/8TsMeP1VPxQpp9bPk17GMyUFiBgnnfDv7iAyMWSqWYf4umLvkEtaIIQunNCwFglk12W4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BOzdJiGN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BOzdJiGN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so61925225e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558807; x=1750163607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=;
        b=BOzdJiGNNo46+fqsw2p5w4t+IYzxELt7b1VuKMq7IC0oUixZB8rIFqa7G/aaeDe7Nw
         4vrBnqk2oU3cAcV9GJutUR5C46JMYyDCvGbVP9grHUHZ2lnlQDRIYHGv5yoYGxuF2mbu
         syInQSGqnVWGYjaeDJ68OVuJCwB1OfKhxKSeOHGT2VNNzbVfPdBpVtVbj+Glx88PdI6h
         oHJEB20xPXId+s9eRtW7fNZEI+WV6vZZqlJx+p/XPNNccnTm0kUI0NGGmO1cCs/0QOJC
         +2VT+Tfyzn2qbRW5dc+HFze3BnX11uzZ6WQijwTedzh1SVdXF57e83AVphu2NUBjO+hT
         iwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558807; x=1750163607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=;
        b=uRrb7UbplQz96kqZ+BJJXF0JpE/BkALjmZUGv/L1NxD0OTizz6htsnlJ/51wnDl+Eo
         F0glwDQ00V62e6liLvwDGdphOGtVQE2Zy9HTs+QH9kRcNaLFIof6gUTIwlZXTifhm0s3
         acQthFwKYaRUgwSftqbFCQBYAqOb4/pamFXUnOYdJ6xZ4ttdFcKVFocq/cqaKm+tZmf/
         oMCTIAmhs+yc1+H44rYAosJpPBptBoiCOadn6W5sWF22L9mNYrNmiJ7+aC3dgKi88ORV
         jZtUXOj5LymCdHWkQBbt0T21kyNOfnVAgpGs0zoa4HWMCXrjIG7jOgvf0OmvCTQSKYEL
         9M8A==
X-Forwarded-Encrypted: i=1; AJvYcCUlpKPrFcgPFktd8LgoMXBbD3QLa3j2jVy6QuZVJhj5xZO/jgJKvgMFijXt2Vumtjggh7GcofCujpMQOwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CdS/mGeO6HkZke77WcZKGAuwbLKFyXl3MtoP7iYe8DfnStRw
	0OmSisOImw7yIgLeXPni90wsqI+N8x7kp3Key6lDnKZ2bYCZR9fphtGaxaYFrS3r6eg=
X-Gm-Gg: ASbGncs7FeNmtuusGcJWuNzsKn1vQA+IikQ3hJEOePMt5Vf2QI2AHyLkwPrpXpw719v
	1deJsHNjUEGeDoRmxXXaVVoMeKXJp5kdFSfaKQvWHkdVR3feWe+D8wc6o5AGT+mCwYPOJ7yYnzw
	fuwdbyFGEClsq2C23aUiwbrtls9olOhOeukUR55QwEuylRI1T7AWk+paLZiEausseCtpphGUPLJ
	Ysa/loaHVEb+8e8WMUwFc4bEHfCzBxIMKRmQJl2zYkjjcxEk3WwUEywboPScJQE8vgc/8pAv5wt
	DzjT4OlNV3Oi0cuTv33LRD3h4RIB9F8jScN3/USjRiA2ZT8Ms6L5ow==
X-Google-Smtp-Source: AGHT+IEhHGnha6NVSEl35o0rcxk3G2qeby289KOBjHmyRRKU5aBeCt1UnijYGnoa4QSN8RfsoiCifA==
X-Received: by 2002:a05:6000:18a9:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a531cdd3e7mr11294329f8f.41.1749558806845;
        Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:14 +0200
Subject: [PATCH 04/12] gpio: mpc5200: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-4-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=90+8j4aZT4JRMp0EAthBl2BT59DR0EH3kEZp8VxRIWQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPjrlNqxPQXfktePA9fMZKYXcc5Gcy3lEpY
 DiBORdvdEaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cis/D/oDqQbp1iJ/pMrCws3WboSyUKCzDK6Dz2mNVa9MCgOCF8w2qEn77E5kO3REG58Iy8rBevx
 M+rxL411dBx+ddz6YfndpV+vRX8eo+xmA9GhmW+ZYP0QL/6LVN4U81PwhG/h3iXUS7i5XJZn2h2
 aJ70PUm/8zQWSgA2WTs9k92eWe8PaU5791laRMJaZUS+h1tjqQxPywAnfYf0XCHRtPmJ4nXDrPu
 W2NtUQ0DFUxaKw7vs+WkjRRUHWCfKbyguo4jCedPSMQl2nxxTlX1WhFlNQRNUvqLLn4zk6lRfLq
 GbxmNkhls3uxeoFAB2rtvpoD2ti0oeT6dNbmi7Pptx5o3NZ4HCwBEidKmfUghK7L+Q0XPv+f7Dc
 xOOo2HyNAyc8OGoSRG1tEBELuh0ngmvNjU7ad5jlOxts2Kh4l5VuhylUyGCrqsRfY+1EEvWMP3a
 Ns3DoU/3KBau2OAHispj2VLP8s5w3Zbbqf9JC5EBfW946W4x6609uYvF0VX1sjSxkCaq89hLZSF
 Zv2Qm8n5VEeYOHl6sAN7+dY4UB0M+dNgwcVV+Exta6JSnaoAkZSolRXj0z+G3z/5tB1rjuXwUFv
 nb2okeSy3qeLWCX/LEwjSPEtgSGH/EXRfvakYUCD1aUpMjEJT5jrDXFC+BomXspRo+F+w1rOlaN
 n3rbpR6MDIGhl5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpc5200.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 091d96f2d682941378d251e95eed88ff16bd39c2..40d587176a754a6277b87b760f562ed5304b6eef 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -69,7 +69,7 @@ __mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	out_8(&regs->wkup_dvo, chip->shadow_dvo);
 }
 
-static void
+static int
 mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
@@ -81,6 +81,8 @@ mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int mpc52xx_wkup_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -151,7 +153,7 @@ static int mpc52xx_wkup_gpiochip_probe(struct platform_device *ofdev)
 	gc->direction_input  = mpc52xx_wkup_gpio_dir_in;
 	gc->direction_output = mpc52xx_wkup_gpio_dir_out;
 	gc->get              = mpc52xx_wkup_gpio_get;
-	gc->set              = mpc52xx_wkup_gpio_set;
+	gc->set_rv           = mpc52xx_wkup_gpio_set;
 
 	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)
@@ -228,7 +230,7 @@ __mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	out_be32(&regs->simple_dvo, chip->shadow_dvo);
 }
 
-static void
+static int
 mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
@@ -240,6 +242,8 @@ mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int mpc52xx_simple_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -311,7 +315,7 @@ static int mpc52xx_simple_gpiochip_probe(struct platform_device *ofdev)
 	gc->direction_input  = mpc52xx_simple_gpio_dir_in;
 	gc->direction_output = mpc52xx_simple_gpio_dir_out;
 	gc->get              = mpc52xx_simple_gpio_get;
-	gc->set              = mpc52xx_simple_gpio_set;
+	gc->set_rv           = mpc52xx_simple_gpio_set;
 
 	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)

-- 
2.48.1

