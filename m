Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E011DE4E6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050762; cv=none; b=L1TGbLSmrCGAtAvoGwFO/eIyPMGfsf1DCDsNjbiv8iheeawSCs0TsSoAlkuXqdlKpKmCqymNNTWiJWyXsBd5tbHh6hYrCje6GJbrKwRgrHUA2JiT/riWzvnXo+UuFcdnlXuj8XgyP5+BA6FuANn3O6JlRAFg4lfVtp5rDdwOv3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050762; c=relaxed/simple;
	bh=38iyypFvEIDDo+XViI83hfrn7fp3ROVaa2JyQWVHtXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBqc0x/OGLwVKmntNeLSzQKQJVYfBLIW4gEfsEVK5G/55GJy8L2Wzx9IGRJDY+0uSFxs55hhKlqR/qa2BfzGV1naH3eGvMvhZKUtc6OdMhHUfYSDV1JHMmujjXfckcw7HJKbwpJhrv0Z6pRbIUEKJYInw6ODDKRLeYBWMbBbSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/3wSDI2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/3wSDI2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so3193872a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050755; x=1749655555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHL3sUIzhoW/yqDxEI2huZEz7k/6gYpbh53sq2QOYGk=;
        b=u/3wSDI20VetYzJBc0CaJdFq5W42zu+a5LNRj4z0kHkGckg00rVca3cQOl5nPmSfSr
         bW+S+zUmlhp+0T24YBXIfkzPdEjM2d5J0qdOdaJHwcbFUPC3I2jOZ8TSR0nWrMXs05Pl
         ZcynzZnVRH6btyyKRlDBgS6G+dptTK39xt8lq3EU0LOH+le1PWzI9z8WR8Rtrjly01Dr
         yEsJGISZs13eStjyQwFtTMgR7Zwb1ekeQo4UZ+ViijMuDoE1MA6G27uNtolX7LPttC75
         BkMQwq2LydaxTiBppH/0AB5s+sGko1FwGuBR5Dpm1YexdMDud76f/pP0t4nYFGqf8I47
         RAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050755; x=1749655555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHL3sUIzhoW/yqDxEI2huZEz7k/6gYpbh53sq2QOYGk=;
        b=MyA+dgPXVidyZIxWwgkHmX7ZBxLRoaZO89rFHBcgxS6JI3KJNqjN8njF1UFJTunWbM
         u/LbPV0PDgu+2FvwG62CKuikqRF72BgeVKzfuIpO9ved/dR9BGxCseWjaHn0050oFGVV
         7qZGKddQbPpP9k0O8uUIkg1a2FviqVkuWRF6o16brYFTgAsDxwtRWYYQ1bebw3+5uxre
         z6hbZkBtDC2LpWyqz8IRXaFPTW/yeNJUMlcZmZIzkvefFQNXW+xnyMz3PjdaOPxSgSpM
         Q5lTrp0/KF5ZhuyLQjo940Tp7WxIVij4Pyc3TAAQDVp9k/FeCqS6U7OQCL3mhAs30Y0b
         iBLg==
X-Forwarded-Encrypted: i=1; AJvYcCX279+P8bcfgZ+cCFst40clRtmmSH+Al8s2VnuE3HwGNRiaLsh8gFkIECcvuh3ZkYw7PFtkEaJMppEq7N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkRhVcCGGWVvbTXKFXUcAxe5ng8+Er2cEPdFJzE8F+0PmAhIan
	95DbJo25XPhuGt1Sor8+16iRlj3owtn/x9SSR6KEYjqXvKcaubJuUoXwSfseMRJYrks=
X-Gm-Gg: ASbGncuLZbJlJHzfs8dan+4ksFsKrkEPmC204HA7TKUh8CCWDaJ1dbTrR0fqMbrwA5m
	dOASm+RQpaTozD5IP2aEY8j9aSmbgHhoA2ODqRTXId6jkn4ltoyR/XJiXaKjKQ4PdU0HbpOzrgb
	ogQ3zycUZbeSkVfyuqqzHvU1OykQ4DPa12qaulAu/31XclrhYFdtSBZSmdaPDCqQsozTndSalr/
	IZQncx8n/9aJnJN02EEj+gc/BOmR8EnG3xsHXxWi9pQIPuaIdB6EM2GiQI3LVXCFaCTTfABXIpy
	iFJNTf8tfha/JV7ymuWqEcK2s3GA/lAQjdeq4YZg23nptF6c8uZVa4vAdX9I0bV/BDeOicLpLDB
	BsgUQYpSGtxe/TnI4olGKwLkp8O4HBjoW710=
X-Google-Smtp-Source: AGHT+IE5xsg7Femx+fxJUmqis3En5XL3tdeKdVoLZHO6BHxnqgQt3JKQXfamnwt6W3l2CrMDnwEtNA==
X-Received: by 2002:a05:6402:348d:b0:5fb:c126:12c9 with SMTP id 4fb4d7f45d1cf-606ea17d2c0mr3262215a12.25.1749050755202;
        Wed, 04 Jun 2025 08:25:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:56 +0100
Subject: [PATCH 17/17] regulator: s2mps11: more descriptive gpio consumer
 name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-17-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
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

Currently, gpios claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 3b5f6f2f2b11be81f27bc39d5d48005da4afeace..a1bb4e420acf23ed048c356004930c586d21b39f 100644
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
2.49.0.1204.g71687c7c1d-goog

