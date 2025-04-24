Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6591422128B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483756; cv=none; b=HybSjUaI6IEOwsYiQ+2pGqKiTtlEJuRmzvTxPeGAUcWKhJR0x4uX9V3OXMHi+NHE8LfQ7rZTkRXy+JaQ4TYO/ze6/pRJ4QVlj9Nal3RniAv3PawlHW3kUCxt4berpVjCGZWd9pg31vS1OGQHLzHcfcNO5FJorePkJQl0cTEGg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483756; c=relaxed/simple;
	bh=Vc8/dFLnJclUSR5DvqNgincJOCQZ249gAvpGo88KgB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfVf+zFn2kppqXaz8GtWlQmqC8uzwFv0ErLCjaK2lSv+GWK5wpMcsoqU8WzuNXYeUxojOtDO3drMFYQMCrEUdvPzRQCppxmpE880nECEUI2ZFURUQUckXyqNJ3bQ8/FivYB3/jWq4xVPv62kOhFkPpi9ryndGq095Qnvdz8IObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G+qkZ69r; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G+qkZ69r"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac56756f6so674191f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483753; x=1746088553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=;
        b=G+qkZ69rNjZL+qiG0Jm6yawRqwoXVRyfxTeTyTxmHU3wXAuGz11E+Lbtpbwe0Skcsh
         11bvwFfxF9dGFZ00u5l/ke3Jd+E5w6ki5/WUBAegQo8jmqSIdYD7AZJp8PfdkXPxcPA9
         lIGq82a7fYhXYiTUuK9nbrZhuh6apLTgrmep4ELWLMuIoEVTqZa2kYhRZOAWkAsyRLPJ
         PQ+uEu3zRkAd1YjVc++e7dx5RTfpZuhtXBItVaLf6BrWXRS8xhYm1pyIBetvBBhVTMPJ
         8unUJmeHx4AnqZK7jqSF7Z8cGJkI3bLNSNayMNAk2uz1lHUoxVXcRrjchrf/EfuJcesY
         FYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483753; x=1746088553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=;
        b=LPbV/XzZ0tPpAnip2d+Brw6pLt3I9bld5aKPaqhJKJiYdtAXgXVVC0FDzsxqQpMFsR
         Oe5U4KJOMVFK28+pIsJep4yC3X6Yqib3KZLx3kqDjYj+U7UN89JOBQMXb0FV3cTv72l4
         ioEFAM1p7/lRTRPpXjPGXEfiBabp7gS4+Y7W8mgsCccBELKg9WTx8q6t19KkeVYv0lxg
         9fyCEF52L+E04tHJ4BPtvLZ+RoCJGKn1jZMVYyrrVqJ8pFstiGN22PdNTMcg3+En8LU+
         1WG/pSq7/8EFSiqxUQe0Az4povHApTuSrdIT56WlaBqGbC6zXoY+3G/QcLq0bBea1NTo
         R0BA==
X-Forwarded-Encrypted: i=1; AJvYcCVSnCO8n2u2SWEvkATpaTsh7TY9iDZtyulsmA/1kynAwMbl1J/BIXUC9A8JJhpX9OtheBqGi+oqB6kA5aI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Yljvyh8FwPCzKMNJ2OumDfMCuskK5Y7a9nUalx922LmzTyXR
	maG2hZ/hQ66TVVXnNsWQ7k+Ix6AjMa5+udzrb1zFB7a6R0vU5/+od91TWTnOiAQ=
X-Gm-Gg: ASbGncscicSxynfMqcJCTWWCWOFpNksqzwWAMlvfzm+J2rMmnTuJkApvvZUByGNz5Ac
	X21i4xhaxIwrPaKj8r5ZKEs1CLBq+cQ2hwNWgMTqn3pAniFxV4cabT7f2dARxn4EbGpRUfImEM9
	cVAQL3jNWfKffPmM/z+uGkBQF5ujs0Jkg1QVJASdPTnMH8do5YIKvzRfU6jsr6TQrALPJOulG21
	uk+961Y1B2rqrrzFGqO0tdmegP+l6AYMESmDVPC1sqJEjZnA5GJb2NMOVAkh6SJJHgJ1KFrKXBD
	1aWxqEUiRK0WkyMV1uKxBs9a1xpYLPPQFg==
X-Google-Smtp-Source: AGHT+IG3o1AaNixTqoPOuTrDe4rgeHySd5Wl85X8/9jI990OIrHcrjGyGtt6SlYJ5x6wKjhdeetSOw==
X-Received: by 2002:a5d:6da2:0:b0:39e:cbde:8889 with SMTP id ffacd0b85a97d-3a06cf4b8b1mr1481072f8f.6.1745483752816;
        Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:30 +0200
Subject: [PATCH 07/12] pinctrl: microchip-sgpio: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-7-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hcMZFoYnI5hp40Tp/W2N8GmsL+thERqAp1Vv3XxYVkU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcYmgESeviEGOC5kHsGWpr6OnT8URHaFb3d
 S3spkaFecqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 clPXD/9J5MN41zDFuquWy4Q6I9uR28p6IAtPRR7LXz/y6HhRCZs0LiWF/a9Sp531rqlTtvTqIVW
 /jA+xhxcVsKGb1W9fkqBRjICm2Ro/34KgxGJHlAGa5wi4Vq91hNc35+VMd6FGA4b0ebusHqdncD
 hYR8+ONdpy7mHPSADm8ug9QuRpbU9ky8cTjhHh8jeqte3aiuHmSqbSmIhpOBSYhR4dfGErwJNLO
 jEiuhnPpjfz3zljaEzY1fOlKYEFP8/pAPybaVYYoKJr3wgwTbBA15A7YuZfbP8rFhh2/KZWMQQ+
 uXhHsAZ1AQC5oK6kC8WXp32lW4yifh/SOlhzrWpfYxWuYChMUvtajzoVHFm1z1BrEJSdzbk8vRN
 p9cyMn5hIFnEjKLIeO7uPhGHDoO6TF17grr7KtAZmGXyBIn8YjGxOneARfBuAAeQLSJZd0UZwLJ
 cZCsOL20W4CWvm9QEpN/1pqEeDhmKbfeLcLzp6L+7rXYY7svai881XdGofNDKcPcNeb1V/duhU2
 80cdHROxrw73r++hg/wNu/mmN2vphTUl8itNAfqGeeX2O2xYuR4sOjiSQdDl630ZSkaX+yNSj45
 jbMZ31t07JG4dRdHKbDYchFFKBRNmcdFGW3pLEvQbRONExRLMzgRerFYuekH06n73jTmA7sOosx
 cr77n7M0nryK/Gw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index a60db93b61b1..88c2f14cfc6b 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -555,10 +555,10 @@ static int microchip_sgpio_get_direction(struct gpio_chip *gc, unsigned int gpio
 	return bank->is_input ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
-static void microchip_sgpio_set_value(struct gpio_chip *gc,
-				unsigned int gpio, int value)
+static int microchip_sgpio_set_value(struct gpio_chip *gc, unsigned int gpio,
+				     int value)
 {
-	microchip_sgpio_direction_output(gc, gpio, value);
+	return microchip_sgpio_direction_output(gc, gpio, value);
 }
 
 static int microchip_sgpio_get_value(struct gpio_chip *gc, unsigned int gpio)
@@ -858,7 +858,7 @@ static int microchip_sgpio_register_bank(struct device *dev,
 	gc->direction_input	= microchip_sgpio_direction_input;
 	gc->direction_output	= microchip_sgpio_direction_output;
 	gc->get			= microchip_sgpio_get_value;
-	gc->set			= microchip_sgpio_set_value;
+	gc->set_rv		= microchip_sgpio_set_value;
 	gc->request		= gpiochip_generic_request;
 	gc->free		= gpiochip_generic_free;
 	gc->of_xlate		= microchip_sgpio_of_xlate;

-- 
2.45.2

