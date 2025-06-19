Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1790265CAD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322014; cv=none; b=OibgaU39FZD9tpWi9RobOrYp3ZgK33j10QBuoIwZH4+e4sBpKDusAxRAO7LYY+y8uM0OouIdy7aLSxsLwprzzqS1T47eV+EmP/RJgcRDoP4WZi2eBoNl3LlgOs7R2kFQt10lZIbo4e8QdAR/SUoyk4Vz92MN3ztpAH1gmMtsODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322014; c=relaxed/simple;
	bh=J4/swX60dxFNnGyRxMTrvcRjJzp/EsyWsznOiUYARZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igjlxD/QYP0xZrnAsA+G7ulkzg+/I7V9z9EOKzNvEfsU37iYJXXBSph0mZXMtrT46hZvl+SyuVhRpJouG1ki4N+exBpsSAVjvkV9MDmxvsYLbMXJzWu4u5Rny2wMLn2XGf1RueWi+mqlk0XqjDu7pdTW67GRelhaTTQJB2JnvLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DRY0YGc1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DRY0YGc1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a36748920cso510379f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322011; x=1750926811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=DRY0YGc1RcRmMF/IgUeFFp5B4NzPzcoN+oo+oTdcpQdNkX84NHePGFxti1rW0Wdf8e
         pMolJq58RVrHYJL7WzjMiES5VRtBWww8oN2RF7v3hyH2MPSc5r1bzDM2mD0wptTuxkuk
         KZFSTuy3dXnuJUIeBo2QbNxswuADAHXpVEzEQNON5i5qttxVZmZrpS+KttHw1AAhp4C9
         zBk2Z+eEk4GWKsz62/XD7UtazxDDbs0xlPr3vPMEFAmv/5kRpcRgLhuqGh1ptbQ0aIAN
         pr3ErQ6f0PeBy2o/wOS2DnEzEE1RewU6f1zKGeKB6RSTV3QmrYMyNcYwImYxNeHFzFg9
         8ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322011; x=1750926811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=uXHiSqgPBaR3QphvOwoBtBGaNLPL0YfLKYXtm3IOMG/Rfzjq0odK6ogygUTHyy54pw
         GDL+L2R63ZGs3U3ppv4/kagPDXZ3Rm9sl2u5pplK/e6edFrcDq3NjNKdOAHZhAlkBUqc
         I7xIFq7bKqmVxR67T7lehYMl1Lvf8XxpbmpHkwuNDJZv1UlboAWTV+Hdifj0hdG0h5Ri
         8L1ANPezg0BkIJbarA12HaWJ94Zmefzw3zOTbdGp+NlwRTfDm45fsmHmTIIFUFOA9c3A
         b0QYWM8n3/20HC0XhtmwNe1p/rvPsALRyojiiaoLQQgHn3aBz3bQ1L5vWC+ophJks80X
         X9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrPgouf5F/SC/JsFLS7iZEjdvObTTAfAUvK43OHFe05Rh52wDwYZjj1rpzjDsa4CLkBe6ly5Tlpr7ZWGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vnjJZBP2Y/LLl/he4p51rFnFvEOZewrWJFuO0Gi6AogltE0O
	TLWk6nZNcwGVgZQIhDc+cFkPDTislZmTYXWS97G/ReB9y2rK6AbW4pVurS+ybTO+L0A=
X-Gm-Gg: ASbGncv9hzJe9GzrSla3EVrwmQua0mE8KiF0PXv8Rf3EYccONGUUGtQMaF0RosH4rmm
	Z3J7Q68d8MuMCfCwM1lCacWIK/2kZBqVXjOcRFZeruIVbaTiFkQfRMdj2zkYoelnZAvcNMJSHTQ
	s1fL2tHw1klbfMV5ljGBc2RMQB/yiRwAxne6IQoP3bxR+I1qAkQb6nHCdccdgUP6C5deZQMUVbe
	+ICQnaK+l20Pqj1FVYxdnvs6iY13DB+/60X2f7HxiJbtg4AOJ8IPH6yiG8i/GZIt1nA6s5vDsQt
	QZtAoyZI61QGWksMsAtPTH5DfpprASWN6tIacTQgaBC4T8BD1yAsqyZR8FdqM3Am9HQ=
X-Google-Smtp-Source: AGHT+IFrsPvQBcfdGkjODy+e3yqc3AHlIahKNReGa+rvtx4ektz8kpZyRE1e3BB7ON0JDvQ8oJpUfA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e75f:53f5 with SMTP id ffacd0b85a97d-3a5723a26f8mr17708250f8f.35.1750322011048;
        Thu, 19 Jun 2025 01:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:18 +0200
Subject: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set()
 callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U5ElyLmZBGysFJL9KcblCpbMCuSewiTUa3oGkohc5iA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tSNZDHMC4DZ4e94TG9I0QxUTJPp/knIHoLZ
 ngpzNeMrj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUgAKCRARpy6gFHHX
 cs7tEADbq0rtKcu0CtpTMbhplPaVXYghftiJVLjNx9ls/h6bpBkGrExc9GChQzG+Q7zhbcHnD9u
 C2jZn5ptHvOH7heEQ2vVjh6YD9YrwGECInonaAld8CaKlF9li75bIAu2EIPmnGHnkoeb9y9ejQq
 NUgqfirWA+Vn89x8JYkZ2yYQGn/kYHWSYvjad4y1//nWPlTQsQTXozhafHv/sEoqUlHxI1677x3
 jIxA8nZMpg+TK+DfjalolY+tMbGti6RYt/AYwK7k+OCERsizg+3znNQDgpF16dG4P+duDRsFTPN
 MTuBU+/nvuDmAsfzReY7qlQEGTMvKOap5VGUx2LAXRomlj28hOomYjrSVdQjjJIBgWiArZj57lT
 pIQVrc7vIj2UEAEmDBU6x/vJ+Ap7UpYTduZukAh+BNo+3g8RxfeW9DOcKE7HWjHODvU0Q8SDkVc
 vRkO4k+tvkcc/5lMLF0IalPGBX6AQCDCHOo0b9GoXWVdtsix33EFG9yqiQgu4C9PDP7IcCZfH7A
 K6MSIE73cXim8CvXAXfIpI2/PwV3RCv8jF1+NfxrIApruyfrgJb5uM7HA3n8LgjwoS+ZkywcvDW
 qnUfQrtyAii6SWW9aBhPa+wAwsHcGbgR/x4Mt7aS9QPZh3OKG4KVP3pWFxTBV80w1DGiFHsor0s
 +I4VtQeCui/0NNA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The lines on this chip are input-only. GPIO core can handle the missing
.set() callback so there's no need to implement a dummy here. Drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pmic-eic-sprd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index d9b228bea42eec53ba9d0d0945125f530a22946c..cb015fb5c9467484022723910354219e2c98d3c7 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -109,12 +109,6 @@ static int sprd_pmic_eic_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static void sprd_pmic_eic_set(struct gpio_chip *chip, unsigned int offset,
-			      int value)
-{
-	/* EICs are always input, nothing need to do here. */
-}
-
 static int sprd_pmic_eic_set_debounce(struct gpio_chip *chip,
 				      unsigned int offset,
 				      unsigned int debounce)
@@ -351,7 +345,6 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 	pmic_eic->chip.request = sprd_pmic_eic_request;
 	pmic_eic->chip.free = sprd_pmic_eic_free;
 	pmic_eic->chip.set_config = sprd_pmic_eic_set_config;
-	pmic_eic->chip.set = sprd_pmic_eic_set;
 	pmic_eic->chip.get = sprd_pmic_eic_get;
 	pmic_eic->chip.can_sleep = true;
 

-- 
2.48.1

