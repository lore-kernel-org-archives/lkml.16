Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801426E16F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522124; cv=none; b=JA4qPLOzMVnmH0RfLjUz1MO/wCuOOEsfHBVSL9qtTDkoZzyfsJNF5x7aCtsL0GbLMSMX452aebBw8CYfGqbiNr7OikR+NhwkKwObHNbbpN4Ewb03Dwceqrn7Ys875zTmytrrD2p6eGycsyGzvaPNnoDhgDw6MF3Z61wC2xJPn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522124; c=relaxed/simple;
	bh=XH/0XVuO7qOBuaRm9fMchaz5m5bawJAXac5HMn3Z4GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A80kjJWEr8+jzyfWyIscCVjV7QAsDIw/sDtcKSGBjSLBq/zCNfoe1UYUYSjoi67WWtlqg87dhm020G+i+E02uogC7q6xh21mhk3UbUYQD04zwdIeIIkYOXvKCXeAHbo1UMgauc7D66ZsUnjOa5mlgjvzLfeXZ9oaNexoWp7i7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XHbTKbQZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XHbTKbQZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3488241f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522121; x=1747126921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO0TStYciJkxVrEVhFTekbwNrwQKqZ04D9RRPnQx4NI=;
        b=XHbTKbQZj8k89p++tV5ogn8czxk10OCH4nJ+ZLSdK3PZMdirktdcuNAOZizMheyWdZ
         kUDPbuNiEJQvT/Ia3xMDCPPHutUXHikdp8YILDVK0kXMwX+YTqvmTCgex0nAJ7VIsL4i
         PowY8NYHBcV368CDi+d6xUF8PjovrBy6aYkhj2svDHE/Yu+KdpmRHO2K87ECI0+pvzRo
         mj27xXq2dedUswOaLrJLfDrwtolKgkHO1iUiH0QDhlCzPZPRHYYCXlccxsdiCSH7VLg5
         8uvnCud3fH6LwSXOBuDwM54UlFJ/2QxknbS443rE7hk3tAUNzxK9/7N9KKGujSreFOYb
         918g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522121; x=1747126921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO0TStYciJkxVrEVhFTekbwNrwQKqZ04D9RRPnQx4NI=;
        b=V/tqBTxDUlKkiLCmxfNq3hdbImui2IO4Plsbm3UAlEhlNGD0WY+KQrfHaedOUtWTMc
         wrGAPurJRTKFSy4SSIzzNeRWLilVvVHnDCw2/eGEfarQNvHpz+9DOiKKEu+Tme7tOIiO
         i8reDPVhyru50cbBx7h7QGqeg7DM/knun3RK4JQ5Ea8jktvF1uxlYvma85Vwxqym5KxK
         oyXpOkF+G2LXzM5DGtehFNdMDorRzB1K5OqDuBmX27AbdZB/5cEoeW5vK0hPRZ6g+R2k
         9jbLc+1ZMhlnz98DH9CFLSq4wkNljYgd35acviZ2gwnqbzJfgFRS6n7p+Sa+pwpaHIzl
         u6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTN9BugZZaLM1+8wXmgU6i3WeHyvBbCfHSHCT447kMYdJOheswPwxKnptpim2z5XXnrNAP0KvDIlHbu1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpXCmtfE07jsvcvMfDtHLRWtuJwzImEXvkmYWLJa4T9sN6v3J
	K/J7bhCGC8UGf0sU/mKTxyOCpZ2os95WUy6JeL3Y7oMaZaemYUwcFgP7COtTGbc0uv9SqiBDKQJ
	e
X-Gm-Gg: ASbGncvuj2TgvtQ3drPuiHGgGInPg74x7MQooR3FELlgNFoKMohiq8Vd1N/V2laP/ng
	7pfTLAiInyMKshl4vNSnCk7P8kjw9qYpLvoWv/yYUJT3ZmAxf353Ryvl637I/GLfBIoH5TfKMlc
	Xxr1JwpwI1WRrq5yLLSkbRbtzlfEDQTSWsTxTPuZghqR3/Tdm98cIbp9yfy20XfK9Nbs+jTBGZP
	cCDvRoNumIIwm6hGI1EUCM1arbCDer6GwAghXvgPf07uyWqQA1UOBnOld5GxQvb46+NFwy7cETZ
	gdQdBBYE+ij7/mwxokTEY44mHFjMyMdDADc=
X-Google-Smtp-Source: AGHT+IElhv2wXvdZWe2BSaVQF6FOWYHmUMWsGXgp9L0VyKZ+PRC8C1pEa8f8v6TOsPJ2duwzmaV3Gg==
X-Received: by 2002:a5d:47c7:0:b0:39d:724f:a8ae with SMTP id ffacd0b85a97d-3a09fd9a77cmr8078099f8f.33.1746522120559;
        Tue, 06 May 2025 02:02:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:50 +0200
Subject: [PATCH 07/12] gpio: max730x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-7-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=C5mTxUoTZPoD+BYVxin9KA6rS3qrIxYM91GYOHN0blw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+9uVpoftEKtklCkxpA9QpLMSMlQ3zO+VCP
 JvYVtcusGyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 crEqEACZiG048DnwbwoC7fKykT2HjmLlxGLUX+fOdkrVU4deU6eW5TBlgxOQkJPjFJiyoH62ZmB
 C/K/BY0xA2mtQYv0bhFzB+feuOq987JHl/stxocmaMoovOFz/uHyGOcAa2SfN5Lpfyw1XGIiFsB
 Io9NBYkF1Mv24CWFZlJcmu+Sf+GxeocPLW8Uab+Y1zQ8gqs8RuhnT2r+MzDpEEqX5cui+zkHFIf
 MiaMheSndz0bOIZJAgqzwVZADh3BBUG19tkWHT8S024LjDJ0mFn+ozP7n/f+N6d5soMTwhbbg+A
 QSW3JGZUtwrOnoT48SHITN6E+4QTNPWoG9bVpgpI9OrwQ6H56XnzswAsrpxdsElw9FNoiwpo56+
 IW7Iannd1gMlFBAmcDb9maEt2zD8MDdhv7IHV6g0BtJ+UvGgYrVETOjMYJpVJfqepWEwXWB1hvb
 jqtDvVu11/h44dejZHJKC7wouv3+oPEimede/G9wLY1CLX9UwMj24m6gAKpNbQ7/y/2Yi+UmiqY
 3pQFKze/tDjxRP3DycPAFPAv5ndpCC0t+oESotdZ2V7lMKGbFFdFg12/FQwGSBQJClCMa4IiTHA
 hiGrXFn5gFnbgXm5UJRga7lUvJscYCjwKSyRhuQidCfq+Uf9vnR8KpSELqboZrtwKj9ax0nWL10
 f4/nsoY5wR+SYgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max730x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index e688c13c8cc32..75d414d8c992a 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -143,18 +143,21 @@ static int max7301_get(struct gpio_chip *chip, unsigned offset)
 	return level;
 }
 
-static void max7301_set(struct gpio_chip *chip, unsigned offset, int value)
+static int max7301_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct max7301 *ts = gpiochip_get_data(chip);
+	int ret;
 
 	/* First 4 pins are unused in the controller */
 	offset += 4;
 
 	mutex_lock(&ts->lock);
 
-	__max7301_set(ts, offset, value);
+	ret = __max7301_set(ts, offset, value);
 
 	mutex_unlock(&ts->lock);
+
+	return ret;
 }
 
 int __max730x_probe(struct max7301 *ts)
@@ -185,7 +188,7 @@ int __max730x_probe(struct max7301 *ts)
 	ts->chip.direction_input = max7301_direction_input;
 	ts->chip.get = max7301_get;
 	ts->chip.direction_output = max7301_direction_output;
-	ts->chip.set = max7301_set;
+	ts->chip.set_rv = max7301_set;
 
 	ts->chip.ngpio = PIN_NUMBER;
 	ts->chip.can_sleep = true;

-- 
2.45.2

