Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3EA28A707
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222207; cv=none; b=Amw2Z2aqKu8gu7RVdl2ou65GV7AdCdo1Hf1hKbctx4UAc8m99K5P2jrj6LqGvF357YQ5hbgUj3REzfjqen/Lrl3XoPxNJrqz7Nw60wOs/gM4EDl7Gd6KbpAnbVM3a1yQrF/5rL/kQOfOQRuXk7E+1Ws6TgOVZMkk4BwXjynJnW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222207; c=relaxed/simple;
	bh=qolkrs3g9m1XRitO5lnJhgwGXH80xlE9UKZOEGY5QLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxEY1OoI7a0OCRXwxuLJLjt9RAUGn8GHS7QyCSYjcDH5k2NUeBxGrQntQnVJOZLNP2h+UmUkAW7gCVrOUYES1JcJCcpPZwI18MdantY3b++axn1LyPNo49hzePEuDgdHbzSYzCtG9oH3f1chzfpkhE9kzpSFG2HmNtrSB0N4UwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C53/AjF8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C53/AjF8"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso352327266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222203; x=1749827003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23HNY0T10kbJEBdypFT8EdO6lJ8vGZTGFp43/u8D8EQ=;
        b=C53/AjF826WB5HRT+muLZF6Kljdh7MIkySoy4kKeqKvUZCnx1f0BKpDfm4UYFQZitB
         9OZl0B8l+YA97xSWlSVEeL8JVsK/8/wUhAbvgCCx02zL3ZBdlBlxGdU1JMMI0WIhJ5OV
         YFvyodgN1mDPLgNwBvZGCLyuifRV5bMSeQxaFCcs3sxuyq5fvpKLlwNIuoMPdotee1gN
         SzYFOL41CXtBJ/Y3+D9xDK4VOWPiUOa3kihLWLuQeLurfNN1M0sFOEIep1rzVqoJoXP5
         1pppoNcwqgeAvRBeBPnyuOJHx1/piw+y1M4cKSUNfsxrG5LtFQqhZu1RLNLJHXLQYlu0
         O2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222203; x=1749827003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23HNY0T10kbJEBdypFT8EdO6lJ8vGZTGFp43/u8D8EQ=;
        b=jf7zQK1t2NDhIQkFyuHq+LRDaDml69QbqHwx1Eu5k+RElfmhIt+15xh/45lBE94Uvm
         AC9vPpX5KKfZrL//plxey5U64GNaBx7U0L0luIz6aV1vV9pGDY48ZplPg7usJQYoGW/M
         k6gqaMuSsn1PYtx8KrZi0tI5eXzrnJV8yVRGncpizDCQlc5UpQ4LmOml77oZgLS6x/3f
         4wncurmJ9CEL18Qrt9KsX5o+V8Q6CZwo8KrrGJW91kh0ZxZTVFP3LSg2FRBjKd/eWpe2
         xb8WxdOG8Bmu7elPal7/UCPvVvd+4ALxvTfOIE2HqbsCJTi0Lugqj0TUzCp6hToWUgaH
         PbMw==
X-Forwarded-Encrypted: i=1; AJvYcCWtQ3o8kr7MnGN/ZufwxxxeVGmVmctJUiiSqDOWuDZ6SEvRKC1cokjM+Rh5qesJngzVJA8uZCZqkeOxw8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEWIM68RJHFUko2lF2N4sAtBGFQmxG8mXGheeukWiy1SBQRrVG
	I76oLyDuZ/EPLzrm8keIkZr30nuJA/6dWUrYM26jyv5nbBPR0ocmzG1BM8QpR1GKMzM=
X-Gm-Gg: ASbGncuIuCo7MWxUzxQiwnMlpMlyWb8uKUnfHqNaFAhOYS9z7DAsw45OlzFOpI2z4aY
	nXzkjorU0XLzkax5FuTDXtnddiD9LZSplx1GFzGpZICDdMel6NotxyCvHR9gDHtsJ5z9u1l//7E
	R/BNOM6Ibopt97dczRoEmzTRnP/cldKlPzkI57CLsyX0ak0n1ilOQ49pKk1um0j5qB3tFQ+VoR0
	is1Y+FPVnNJSECr011KmKfgG34BZ2Lk81KC8E/Bh3ty/9I8cD2IUdwRbJudXviCE9VN5UP/+/lX
	8Vgcax8TTLOinqfSH/Y6/noboeEJq77C579eFGL8QUu5DzRMVJQ8DneU6/j8mJd2MLjRwoPLAEG
	pHnL9HXPDe3LuyscniRdzn7G1/9OmbYhf3Ac=
X-Google-Smtp-Source: AGHT+IEyyt1ZlOm5xokwecrQZlojNukMbOCRBHPGSyCxVc6nJs9ihRs3pxSxkqbDaVo1utFTbV4JCg==
X-Received: by 2002:a17:906:c109:b0:adb:2db9:b0b0 with SMTP id a640c23a62f3a-ade1a978ddamr329710166b.35.1749222201191;
        Fri, 06 Jun 2025 08:03:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:13 +0100
Subject: [PATCH v2 17/17] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-17-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index d46b743d4c6f5e745e101d054581a74e992fbaea..dcb813461e6d68505c21aa7deabfd03b450e1d3c 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -357,7 +357,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 					   "samsung,ext-control", 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

