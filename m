Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30826460D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097798; cv=none; b=Q/STs8yT07INkf73MCJsRybq135qmmBB4cZh6PLLEs7xQ+zrDlXDFxLCHi59E2Mc7fY2Z0t3w7ch9FBpDO8PZzDWcTV55wCTFKl3zMOeSRYWqxqG1Y6nDynxop3qs/DAkZZEWeHWqlvtGoBZr0G8VS8nieEsRaK1b3c9EGpPTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097798; c=relaxed/simple;
	bh=05zU1Ccr9yOLMj2iUNDMrlJo9Ujt7vNHa1DQZ+YdkO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEHtgNaXDIUXQnfpcN68nAvoMpPQLrngFifdPSWEsz0vstnsvidfAzvhn5xS9RolbQOSmf9QIaFG/lhxiicFYvV2gBdHR9lG/TEXt0qqR/9YlMR2bbZHa6MMjnfNUmrcSVcaA2O783zH7N1ExkplwOpC0V0RerHsRd6yBymhNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DxPvCY+z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DxPvCY+z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so32949225e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097795; x=1744702595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kM096SgLF/xDM5ehediIIVzZvU9OMbppluTe8DVRK4k=;
        b=DxPvCY+zw82SJfXyxD4GU16qqay1Rp68SQB3hNSfawfTNfyIPntS3hlb70HXYGpf/K
         ykQJRNHjdQBeGVXH+ptB/k/wOnmqCR/9bSh9zEDFDI3u3cJ7mmCZ6G9WLOiiE30JFODl
         8aY1Lxf61BgxGz7/j5gs0r3ALJ0F6HifnXCsVzdJ9OUNya9fxjP9DZvbck4AV5rHJTOn
         oSCVf288LJWpF/x+vs1OALsvZTj/euVg8iS50abvnVUfHTDNVcIo0s9P08UlMb3MofiC
         fITX1TRo8UNI5Z0iHM+6PFmxyrdc9YqN4xi97WvUsKZkkqwCsJs3a7azsyLYWrpZfSh9
         0RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097795; x=1744702595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM096SgLF/xDM5ehediIIVzZvU9OMbppluTe8DVRK4k=;
        b=p59fUXOx1dhVlkk32niFNJgD+clm4POWlxlNH+trhapVZVBE2oNAIn3I0IdudExSag
         N2NT9GfCbYYDunzuui91uWZFHHffPHHOkp6eFlH11aoMkdyMMAMuBPttEHxS+4D7An9b
         dovOLA8/+Kph9quQJ8CE4QiET6BuC70vEmmPyhqXA+LORWd5gUqEN8hOIY3oWOQPIgtz
         UPw3Ddkc41pqMztxDGHdkynMASVRl80Dys53tAsgELHQXSCvlnn7CPIN7CDCU58qoAC0
         NSzdhj1JrW9r9s3Fv7G6nGr4t1ACiHr/1VvuatMV3XJ58yBpgiFFiKnekQgTaSsoiLDQ
         jXkQ==
X-Gm-Message-State: AOJu0YzyB1yHyxACZ63jspQ1YteFrVlUgQvBzIMUi7sbgAGwbJ2QFMah
	n5ZC+6Jtyx+aL7N0kXsUH39HzKrivxQFa2YM/F+QlgRAKTvfHGvlMobGOsNT0xg=
X-Gm-Gg: ASbGnctu9ldid2ErMe/lx85KkDsdASLAQDbW1P2uZ908JnBTt2yn9Xt9QbPY8rqEB6F
	t5JbPwX1+dXWLaiHS/JPAdYd6ZzbfWTJo4ED9hA0lgXcIRRaQpZMId9gAD4diBWrP0Q3Uoe5tzb
	SFVKEWHyCjpiiA9WweIb+y7fCVdINZnl43+Xx6CgJYKLMRvH60BBqAGK1BlzyQELq/bpVfc0AH5
	Tm9cXlootXfZzlW7Gcas07FIyET7bmlsrnvUWwtJPI7Ky9zk+qcOalFH2Cyrij1loOmjbRsEMIK
	JB3Nz31ApXIrfyQL3nG+TQa7cDAFHjL8jmAeNQ==
X-Google-Smtp-Source: AGHT+IGqAZNwvkkT66aidmtMFAuZ998J7V83w2RRytOg8jUYiK+eL0Qx5YxjhhMuBaNCr8BVDL2iRg==
X-Received: by 2002:a05:600c:6a8e:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-43f0e4169ecmr17353035e9.0.1744097795460;
        Tue, 08 Apr 2025 00:36:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm14287627f8f.61.2025.04.08.00.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:36:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:36:31 +0200
Subject: [PATCH 4/4] regulator: rpi-panel-attiny: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-regulator-v1-4-a18b6154b31a@linaro.org>
References: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tGoxqy++nkqQRXjGhwwXyr6+v2LydOiiKnIqwmxDNvw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NH9ULUrSeUEZg78nVRcumLJX94S2Ad77IrOO
 t0AeKHmR1OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TR/QAKCRARpy6gFHHX
 cjziD/wNd0mAvA0YYUakqeiIb5oRbeS/vBhhpnkYDPNtzT/+nGw7l1BWGaMFfhRiRas8BwKvLuv
 n99DWRXcxYdY7NGxE7+4mXz4URzMgHztn0FHb9G4Gedhl6tj3jo0bO8FBAXdfvDKsiXEfC5HFU2
 yVhAHKQAEABPwuFnhLIVKREohBTkLskPsoZUrT8Vq014TT1TYpAE5qn2N3q6JdTFS0z5qtVRzTE
 yFftUUlpiH2Dl36GbTtvoJoCWg6QRMxC52KT42nL+7FV2SufUr0ouTZvNBwIwMG15JJN1yYn0Mp
 YQzSBTiRpmzew/SR4xbvp6vxMsKQtMpyRKOEhRQCNqPNGMZygBftmKJCfZYVQapED+keq2eSf7d
 lMWMzDAia+/CYAOeyRH6d0L8yxNzSt/Hj0DBdLPlgQa7h+qMhBHkQapEEZTnVXkQRuTZpACA1ON
 WFhdXL5acJaqjYqMdg7wENAbQrXG7hXdfCOcgXtLPaMc/8R4goa/9ZK2y8Hbgo/5xk9hHM9Nu/W
 8IPnlOH+52WE/ctkRfIYMqxynqm7pScYKX2YRO3I5urf08n7AfUYPzzdu2oHVkj1ROUxhMfLtE7
 Hbg+JkkNoGVEPtcpnMSUP7TiMrlBk/0V0Tg4kJxSA0Eiu/hVB4J+Hn2g9RSWF7lHpe3OyKgp8fz
 2vWBI/S9O9bMJWw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 43a7c4737cb4..58dbf8bffa5d 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -205,7 +205,7 @@ static int attiny_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
+static int attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 {
 	struct attiny_lcd *state = gpiochip_get_data(gc);
 	u8 last_val;
@@ -232,6 +232,8 @@ static void attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 
 		msleep(100);
 	}
+
+	return 0;
 }
 
 static int attiny_i2c_read(struct i2c_client *client, u8 reg, unsigned int *buf)
@@ -349,7 +351,7 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 	state->gc.base = -1;
 	state->gc.ngpio = NUM_GPIO;
 
-	state->gc.set = attiny_gpio_set;
+	state->gc.set_rv = attiny_gpio_set;
 	state->gc.get_direction = attiny_gpio_get_direction;
 	state->gc.can_sleep = true;
 

-- 
2.45.2

