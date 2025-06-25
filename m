Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0491329E10D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847625; cv=none; b=TNZu1zvYZIRcgFet87x6ZnlG5+waj3GT/MbzE1vOxtiXhi5tyBpXu2L2QKQVUOXCB4Lj4eFm7RF67eC5CdHhwAl04jUiAMWXTY2V8Mq5G5b0RtT2LaWDcRAa9VLYVzZxo15gxbet55ys5PjdW3TKfG323Im3yC7O2nwCwbpw7bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847625; c=relaxed/simple;
	bh=Gydu2m6m/KVmNNXd3cOIFdF4KT78S2aE5lznLFI/X1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWmdTbzOr+pOThZFm9/0rf9hOWG1s+UsDvgZLZWq4z0eBzGxh4bFrNccxK4ow5ZWRU/3o1teu3m9yASArqcykMKEjR7Z5rwWpcrm+yrH7bZn+SwfV4iDqbZh0RB8xxffzJsyCk0lbchZj5yj3NzCS9jt0TNjwQlzTpC3M7qYm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Avdt/dq1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Avdt/dq1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453398e90e9so43233285e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847622; x=1751452422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fds2MhNytSCnzKU0jjInhjpfsALDR8PAilLtpJ78pio=;
        b=Avdt/dq1Upq3bcukhtAqlLjz7aLem+AFSOMTVR9Ki1qDQhI4plBRcCAbSqLeG9W5f/
         HFDecfkifiKO0Djsri/AYdLBSXcYbYRnXiETTp/93nHo2UX7QGWHWNRDOrWJd+mYc9lY
         WnaQwTDac6a7xy6nGlaSCQZQbMojJev57CKmzE5bTBYiy/GhFqykiJ3V9C6TIuW1Tc8+
         LoriDYFve57P6NiOY2DO2IrZWuu2K+JniBTPcEGYgPaI4QX+M89q8GziOdWZpSFrSciu
         U9xvJYQApHZAFnkg/v8NvgN78q3w3rOD/Q8dSRQorRTvwTCRG3MRD/oQR314ZpD/zaJH
         eLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847622; x=1751452422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fds2MhNytSCnzKU0jjInhjpfsALDR8PAilLtpJ78pio=;
        b=pNVZuMQl3MyYIjjEW+iOJqEmi3tM+u9VW9B2VLdDjD/qLiJFTLpV+m4llU1yASfW7a
         2nnbK/cM6fKKH2RkqLbln24LyvySXA1Uiogz9updRI2ZlETW1+/3xeDw1nRIe65XKi5s
         8TGQwDIs24sCOTREcuDHPC1n+wDVyNz5Kt4HzulLl8IJJwvCL+6/RlJlHZ2NOvWrD7X3
         4KaF1N2lZqo504ZogsrAt8lZNyi4olGdZbAgJyhsJpOXT3oIRO3mds/qWenHWLhD9Ls7
         1jUZqLXtXgZrdgGAW1AcHNCND7ibqUI+Jf6UlEvOqou29x2QsVDXepYLy6Gdi1sgX6I5
         lVqg==
X-Forwarded-Encrypted: i=1; AJvYcCUjUmWgiTcJpgje3sVy1i+Jn4uYUJRs/fx9KTriy8h6dlYNVbUAcYV/3rJqVMv71TPEfY/O203KRfkbGyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0LNtbtwNpb8sP1oHoKvW4RVQZhOTaSMsaCROMnMCKiCtaz7Y
	QymZEm0+xA+CWMNu1lZW+hyOGKXbQC1Bysh+6xHViwCZP7hLHdn7r6kz9JeZv0YZMvo=
X-Gm-Gg: ASbGncsPUX93tjt6w3x0OYUU4O5N6xcsitl539vsBI1qyqarN7MxWcg51LErH4Ht3Jm
	MY1+07se+kn6r/YPFWITP9fH6sI4jZoPkogWS1ZN3Ar6ypibqItr/K9qsEIMTGqPmn1V3NNd6yf
	m4vpyhiVviB++B0JcaA4OLD8R3chcyrs5Hf/aF2Rqa/FsrRM7dyK+E3g/+6Oi8M/LfZng+iSTZt
	JcsvDo8EIeygP62zTvE7JmuA5n3hpnG9UD35JKMzMB9BCpK/j1dCt/kfGCnkCfGo8RmCoJPXVT0
	ggmUKOkmmQhhwHQO+p+IG9x/2kVrhnI07Bjz/uw7saULQ8+iwJjC5lxp
X-Google-Smtp-Source: AGHT+IEB1bVGz7jSwt+k7RvQZQqq75gx1fKExWgNrY0BLqhaHS3PlIlRuoRf4PgDZVjFqYg82xBLcg==
X-Received: by 2002:a05:600c:3b22:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-45381aaf86amr22139135e9.7.1750847622277;
        Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:26 +0200
Subject: [PATCH 03/12] gpio: sch: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=20ZB+p91W6AfddlrDokTU/tosMerfgooAW4ezeKuNp8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+lAJkN7YZV3SHnrEA4WiRFC3HboXlPuB0c
 SAVrMYCTUWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 cjpIEADH4hG5lCY0NvrLOQRwNpAisiacV4oow9swqvnZ0QQ+EIPY/iPgJ79MDLQsc360Yyjf2VP
 pMSesR959pD69DRYDL9pgyWkzI2Y6hbZGuSCWrpj2tJBvkg3shRC0HY3f9ljTAoXb6tI/6RlqXF
 EjP93T8flceHpQNlgbcDnp4AaTQZ44/woZVIVN9ysdatwAZBj3KBJKVlrwfFhAgvwcNTuYrtyYA
 Sdbq9REuMsneZMleAT7M2kT3ApJ6SNwnBaDL1RSTgWYY4IifB5lLMi45T8VFFBD9Jix4s9BKpfs
 znIXj0AsnGPpCUD1Bw+SgThvSu4JrBwe0GMYCGYWveGGx3EKSzE6RA9tSZJUtXU8WYK0wSIjbFe
 tdke11pUAIH8ejvEZQF+hDEaMO40lBLlI0XsBwXqGmDdjw9pmT8sGpzfxafxLLIHLdwGoBblGeI
 eldYCbtvZK+0WqYln1XRUAFItEiuW3YDTVneQ+rF+SUguZBdPZY6y94ABnxWjEyZZNWaTvk22Ho
 gFLWeaiHMBwGuvJFUsaVzFIo720p4+YVtajCYePpl+0hO6NxwpVyeeKjoWAXZTixsyeLCFPKEF8
 4NPYbZvIQEC3yJVwhXQOQVt0JiSHb1YvcC4IzUGwzsjxcHMB0+ech5K0UC62OdKnCdW/lxCyp0B
 hJ4tw3aa8/cNsSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index ff0341b1222f7ec2ea0df56b004222946d2418c4..833ffdd98d744948cddc32fd8039a9489a654ab4 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -117,7 +117,7 @@ static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 	return sch_gpio_reg_get(sch, gpio_num, GLV);
 }
 
-static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
+static int sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -125,6 +125,8 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 	spin_lock_irqsave(&sch->lock, flags);
 	sch_gpio_reg_set(sch, gpio_num, GLV, val);
 	spin_unlock_irqrestore(&sch->lock, flags);
+
+	return 0;
 }
 
 static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
@@ -146,8 +148,7 @@ static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
 	 * But we cannot prevent a short low pulse if direction is set to high
 	 * and an external pull-up is connected.
 	 */
-	sch_gpio_set(gc, gpio_num, val);
-	return 0;
+	return sch_gpio_set(gc, gpio_num, val);
 }
 
 static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio_num)
@@ -166,7 +167,7 @@ static const struct gpio_chip sch_gpio_chip = {
 	.direction_input	= sch_gpio_direction_in,
 	.get			= sch_gpio_get,
 	.direction_output	= sch_gpio_direction_out,
-	.set			= sch_gpio_set,
+	.set_rv			= sch_gpio_set,
 	.get_direction		= sch_gpio_get_direction,
 };
 

-- 
2.48.1

