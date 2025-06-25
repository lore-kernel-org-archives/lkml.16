Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072F2284671
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847622; cv=none; b=BTCBjKoI1RNxP1P39xTtkyd+XD66BmT9PlIRngEzKb6tFsDxMhxWoTZg0uBfHsf0A/euD5mhLw9uvgXSN3ZQN6cmEei9NYl5Intyj3O1K8t6gQNy8uc4nTg/PN422bLvWFDHh6ku5jvRQEMEzxzxXuTMT18A4oPWAzvrHyKjOrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847622; c=relaxed/simple;
	bh=L076hmic3ZFiAv3xcr6OkGb7q6sA0X7ZsRn/aHUmDrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFzpEzx5X9/dNin4DCYHweYqLtq7Squioe+vceUBcYiWoOOljsmUOEw57Ok6TpgCwSXEemwPMPwE4roJ8GVjh6hU4AFq2dQ8UPq5+RCdWyRroPAtVHa8lvk+b7L3lQaRJjrNrkaMZiqv2ezICW4hkuyLyuIxmn0v8fnjezRSSqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NTJOb2Wu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NTJOb2Wu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453398e90e9so43232885e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847619; x=1751452419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BY+Lz6lKMiwYrbR7KuHJ26zaicwVAsUkFljRs2T1XQE=;
        b=NTJOb2Wurg/X30eWHjXNfNW59QnJwLAPqXmfcf9xhV+cYX2LMRoelG9o8udGqWsQXn
         UA82cuH1lWWXC6Ilp+nJD7VwCZoyciNsU28JHFwUQC20banG7Uh1EMPb/sn8hWpbBfik
         gBZdGmO0BtePsK2/FPuA9p7JYn0/8tnWnGBqgQkauBPMkaj6gRGUndqlRUW8emhgt/vm
         Pp6559jywo8fC3NVUWLb5XGfp5uWtIoHwWGjGluvnhmCGwD7GoqfenvnxdnIFHAKeR/6
         SbvRPPvn6HPgjmGxF6g+B22UR/DrcEepNYfdGV/miwF9uHChFG8q+DbD1xf61aPhf8ou
         REaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847619; x=1751452419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY+Lz6lKMiwYrbR7KuHJ26zaicwVAsUkFljRs2T1XQE=;
        b=C/bdwBx7O3xFOHv5KXNZ1qtBPanbWBYY9E2vCc3t+veLhbF9HDTNSLlQOeBM3C9032
         PNEDPwaoXc+yJzLmNQKmUerHFSeSkSxy4dumIwQ8kNuadHI5EpEWB1QSR0ytgqMLwfx7
         29hhpetQlhnwNOPthXCONjw50Iln/Xa2ad20L0l6npEiQPZr7np/TMCA2pqCI23w9LCW
         HLL4ghvZg4+V7B9qS8vqd9sSLmM+o0KJOXBxvtYsmUXodZZl4Lk9G5AO2qR4Dv373oLs
         ulMxuFAA3Omlo7Atq/MeyYT38TTE8+HK4vWK3TSw6rsNJdz9g1kJ3Lhe+py1B7yf7wsm
         xjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGbEf9t+mODmutl+e3Ocan561lzWyI58Q5DR8phCN9BVQtgUibgE6pDorRRta8vFVvwUQ+kQl8qD/fHpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQt0QjnBiaP8pXVE9INRMjYudqsGYYPCsloi9WqEajTVm+tvRm
	nEhfO+/8QkgelnTsmEVeCO3RfA7r6sRdimFFbje/fxvzIRzwAUyeGWHZ5N0rdGwaerY=
X-Gm-Gg: ASbGncv/OTN4fQ7/nZpKwEkfhdfxoOh6VS13XBlLDMqiBAqvLPLNZKbbtBdG5kFordy
	3joeHvbLcWG1Rk2DyB0wc2lQRT1sPbv/1sH7qwnWAiG5wPJLOE7+JkghpxjkHf2+aA9Wrc0gRbg
	wdiMjLAaZp8t3feq94QzS6wg3nboPIn7KVcJByQqNl2L3vpQVyYBzl89IQtZM/Bec7XFCYR9Q6H
	HtuPhW5wA6y4as+CIKsFQkH5K6tr9XhHRVCVIvTNtyKiUu+x9zeAFX1cAuH+fSxZZL6o/skhSzl
	U5yMJUxSPymp98fSuORI/RigaXqhmjYcbgQAaRK98Q4S28Vb7qIQi0xw
X-Google-Smtp-Source: AGHT+IH5n3V2Wm0P6CUxi1gveb6IoGY767ZKTPjsevskpMmy1m5PrdgebUCMcoB8UkSLHfSDVjT+Rg==
X-Received: by 2002:a05:600c:4513:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-45381abd384mr23901585e9.15.1750847619098;
        Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:24 +0200
Subject: [PATCH 01/12] gpio: sama5d2-piobu: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-1-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OsKwI/13W1loEUCyUkai3/g1YYcKJASkK3JSsvIY/ec=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+9KzJ70ZY+HOhiE4zfGY1VbgsiKidRlYmK
 Rv3Gzq8LI2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 coFpD/96Zq597g3aZF9Cd8f0q6z9n1kK7v0Gd/AF1oaMMmqa2jvOdxjxS46OrtOECQVVOyuQ95t
 f7XeyYeGiRy18XEWjZ/0Uuw9OmpXhmjr+pxJE0xgvpMdSdB8cR1UiHRZyeiRPCuQ0lnkRx2Z3RO
 WuCDT4rXFYkiwkXXncVox+JetZFiI1TMVTZtKIXXH7bLPembV88ZHrP7cWAa4WSEL6rJg5UUq+r
 LppO5ug+0t6xsRwuaJmcQPx4UxMZmXhPF88VklWn8VagD45ej5ypqtnGBzSj44t1eogzEDGTMTe
 Zy0yyjYw6Jcd0fZE6Vh/dcNZFx1gHvwxHwFlhg3GtcWI0quHZdD2nQBBA6zVFeI73okPfaiON97
 DOnHi0E8m4d1mDRVSJtw+Ct7AbPkTJJhyUQKxnKvUPnDSBpsAi1FWgdu9UA+o4bMAy1/CiqZaT0
 BubNZ3V5K/sSLUCdVY4c9fpxJH0lsrGmLG1KqYn67nB1LR81iT85PSRvA2fsptCGUH4dbnh7d+3
 jecoaH+kkmqYURLUmE3znM4Z8q5+60nvqU5SAj+M9AiLSAMMNj59Z8wDPE1K4r4hrOR9yjrdwwZ
 jk93GzPN+Xo67157cGFkbmMSGgD2gvq83xOMW3ChasZQfvwXittXuovyJArX7alaEWz8hoHIXGX
 xjhSKJU/QASErwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sama5d2-piobu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index d770a6f3d846640d8ab4c9ae387635118b82cf51..c31244cf5e89108b5a21ff6ff58569dbef4bf972 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -169,15 +169,15 @@ static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
 /*
  * sama5d2_piobu_set() - gpiochip set
  */
-static void sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
-			      int value)
+static int sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
+			     int value)
 {
 	if (!value)
 		value = PIOBU_LOW;
 	else
 		value = PIOBU_HIGH;
 
-	sama5d2_piobu_write_value(chip, pin, PIOBU_SOD, value);
+	return sama5d2_piobu_write_value(chip, pin, PIOBU_SOD, value);
 }
 
 static int sama5d2_piobu_probe(struct platform_device *pdev)
@@ -196,7 +196,7 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 	piobu->chip.direction_input = sama5d2_piobu_direction_input;
 	piobu->chip.direction_output = sama5d2_piobu_direction_output;
 	piobu->chip.get = sama5d2_piobu_get;
-	piobu->chip.set = sama5d2_piobu_set;
+	piobu->chip.set_rv = sama5d2_piobu_set;
 	piobu->chip.base = -1;
 	piobu->chip.ngpio = PIOBU_NUM;
 	piobu->chip.can_sleep = 0;

-- 
2.48.1

