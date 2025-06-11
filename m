Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AEF283141
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646460; cv=none; b=tQem8CvBL5jZUq6QyQk8kZ1hu2hc0/p9pbe4703i0CfbLRs7d3PtgkMsHAgZTyI28spJke7srTZh4+WDefvu9y8Qsq4APcZuHqs/+VgdzcgVC9kelqOP01mEzAb2+OpozzlpMau7fpyUaRZu3nOGKZEk0MmTEkFtnJ5EpzTiPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646460; c=relaxed/simple;
	bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4G0hEDc7P3k1EQ4y6jdz2+qwmBrL5W2x44ZXwFjFgupJ9Mp1t47+lp2jRO7N9sBN9pgJCOxowYf5pLnvA/NEfhU39RcF9UVJUbIsS2DO5yTDJi4YrZzb+yZ3nkeScTW+sXBMcplPuD9iwKu005iRaCZeLrhJVhMBD7dgJcf6dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zZypCxPm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zZypCxPm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442ea341570so44051785e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646456; x=1750251256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=zZypCxPmbOj+AYdhYZaTBdz1yzlk63Y5cw0pP1/IcJBfrU9gKZLrhL2Ka1G9d9ZQia
         ohzkt+EAwz4rujF9WGN2V+QTUUh0yR8/NuRWkngzFiseaGgSoa8hBufBlJ6X+SMcby2Q
         w5NJt6oxPXhGIEnuPq2HUHgFK6/gjdkkMTuhkVTnKfJ3iXP4L6xd3kLb8ajDikqvUQVY
         IwZuucMo/WdNKXXcavQSTTOn8k4enHsT7laRG/HzQzstYVx/SdVXCJZAuQ+HCcZI5fDe
         i8IezpOajE/5TDUg8N6AdFsPGVeLiO+ZHxi9jz+tPrkZ3lyd8P8gUaTGbI67JQncK2am
         f4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646456; x=1750251256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=bYtRcZGTyqozFca0B2ygWqgkUVprUj7LKraYmK6O2ummGkkl10WDy7G7a4ieRD0WQg
         PcStjW+9SdoOD5wikb4EskNGkd0GIf7pW+O87fkhNIeY/VQRwB78gh6/c28BxctLSO8/
         bSBtqri+bAsvUOMh8MVvme5flPuQFhvH/5jo2hPPAecM/x+AporgDBcAzFjQB7Pxr3SD
         I8d+5fapkls0quXvf4HvuNOa1b+7DBcQEnn2IgsTpYMEHguWLy9Hiuv+wnL6mhAdmOFA
         X9DMYKSCY0ekvtkWJjBLYPQlJbo+EFQUkhTeYHBgpiMoGe2DeNqr4GFaTooeaBwbe9Zw
         fdtA==
X-Forwarded-Encrypted: i=1; AJvYcCWxt7ZJuUsY4STkaebU684uML57F2NArT8m2sPUzBL62Jmxk2YcqnaxZUJME2/SEafiedVsT+pQmXvKdbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCsQVG9yOqvrSJoFPgpTYAWnUZryeLEPJP0iUJpyy3jK6+aw2d
	w8pl8M92fOjSSWecrVpldSySOjcFYxmtBFbHbKdCrI7oWReXdmFDR411UoXSX5e/Gx8=
X-Gm-Gg: ASbGnctSsGZqBn+crun/9yi12oeRW/pHeURkUQU8hnXjEiyOHe7HE5WSu64xQ/+fOwm
	QRjzY3Qta7butMf31NNIsxn5qzCXJzy7T3OY6ECiJsHynh03nKl4Fp7B5+W7e3YFoqf0X1T8wvO
	zwYvbExzv7XWw6ZtII6djcj0I7cNgpWShcK/5XkejThat/mwVtUguUMzH97NnE0FdCIAlylTlka
	tVABgNOkhLUwwfohCVbUWTu15APVgzHndahmP0bw16qqZE51iFWhv9Rg3uTCazCKTrNwVDM0Nmx
	BDqh6+YQXFpu1LlUWpn6gFIGCqPYhrCEh51GdLN5lzaKBRWyKW3PLBqUfkFI3UsqJ482xsmIbyc
	+gnbRQ89UFuA=
X-Google-Smtp-Source: AGHT+IEndovK5i60dXofmzfCQEmqHj9LiO/Bu6tcHs2EUY63JiHkYLaL474UbWr6R/p7cwzGJjwkKA==
X-Received: by 2002:a05:6000:4202:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a558aff029mr2487239f8f.46.1749646455662;
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:56 +0200
Subject: [PATCH 1/4] clk: eyeq: use the auxiliary device creation helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-clk-aux-v1-1-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxyS4LF2NgHh6lDt4HtpPg68/w9OJYyIIHRQ
 pbd31+wpYGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cgAKCRDm/A8cN/La
 ha5hD/wLniXN/Wdk0lE+moFPoRY5SqMESsaeB9W5MEi4ILxdPOGqiWLOjtZpsU9xfWIUaT0GO8I
 402HkOAnI8/gcBsBz7Xo663TN8FIChB/+plsclM8Yx4h0wjbZGA7O8FWT5mqDZkJ6QAKCtxftz8
 Y9JTHm7P2e4hGrVO+P6xiUkSQj8QZx9CRlcqpXA2JLlWA8t0WY6f3/5Q5ikgkK9AQpxmg3d/SbI
 F4eykgdy83+m7Sar8XsrSvwnbQMQ/eJU5PQewYVOOnkDHjss7jsdCU7aTxJHcD8WrrcnjzrqlSX
 pNybSBpRETU1JpLH9FOuV+dXTP5hBw3WB9whiYRoSWNjOdGuyk52zeSbNbmR1KK4Kp0Qx7kJ4hx
 CNFIDJ8/oBf3MMRjVa8TWO6zYa4ZvuH854db0sOivyrMS6Xxml3if+HpTAqQ6R+McVG0j4sBxec
 OzQ+QOTvaGsyZ/vuvnIT9ymNpzYNW2X4eqZOim4IFhXWs03rm+/9BKSMAj+WpwQT1SKIB2+/BHM
 Z1syPc2I4UnlAheE2uHP1Tkuo6SBUbfIvs3+43BU/e72C0UdNSQ+Ec2aGSdqiR/+Epsi0IZhKcE
 sMWbJC6gfc1WYr4Ua9VFkaoa+EOU2aYylmYQpq0CRPCmNfYsfOKs0KfHY/2e7Z7TAAGyb59FQ36
 LgtNe3dkZbYLE/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Tested-by: Théo Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ5
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-eyeq.c | 57 +++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 640c25788487f8cf6fb4431ed6fb612cf099f114..4094f34af05b488545cc87043fb3352968515a78 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -322,38 +322,18 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 	}
 }
 
-static void eqc_auxdev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int eqc_auxdev_create(struct device *dev, void __iomem *base,
-			     const char *name, u32 id)
+static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
+				       const char *name)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->dev.parent = dev;
-	adev->dev.platform_data = (void __force *)base;
-	adev->dev.release = eqc_auxdev_release;
-	adev->id = id;
 
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret)
-		auxiliary_device_uninit(adev);
-
-	return ret;
+	if (name) {
+		adev = devm_auxiliary_device_create(dev, name,
+						    (void __force *)base);
+		if (!adev)
+			dev_warn(dev, "failed creating auxiliary device %s.%s\n",
+				 KBUILD_MODNAME, name);
+	}
 }
 
 static int eqc_probe(struct platform_device *pdev)
@@ -365,7 +345,6 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -379,21 +358,9 @@ static int eqc_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	/* Init optional reset auxiliary device. */
-	if (data->reset_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
-	}
-
-	/* Init optional pinctrl auxiliary device. */
-	if (data->pinctrl_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
-	}
+	/* Init optional auxiliary devices. */
+	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */

-- 
2.47.2

