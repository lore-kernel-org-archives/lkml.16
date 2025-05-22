Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AF28DF5D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925574; cv=none; b=ep1SM1BqHRKP8kUTH8FQGqWPnU3sRM3zeFy0uBjL9pFErjdjK89w1CSvqG6hA5PK9pKa6gVpMqMLqJtMVOjNKpaQQSO1C3IkfSoL2bccgdeDnSrekllvac9CoenNLeQtj7ZztB4qCMeL8cXwDI+kXb1kL9ZLyzS3E9l2GdtAUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925574; c=relaxed/simple;
	bh=0e0G7GONBUQeocyCnkkONaSF+xI1QoW7NjnPoRRusIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8BJ9Zg4E7ZQ1u+HyCtOTfBjWTeASnPYwesPUfA7moXZ9Rtc8nLzmi0OYPhBRkAOyQ8E9m5GBLZIufPwjdbnnHgGrtnsCkrJN10znTeNkLncWgkNPVlcoYjoPHuzFTGtpXBV4BS7pBp9Y36lzWce8pgPQlmZHJXy42QxjFLcJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZgNiAQm8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZgNiAQm8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-440685d6afcso86312375e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925571; x=1748530371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4sEJM+871Hq7BueZc9qSjjVinOO/X+0tYY6aaq4Jkg=;
        b=ZgNiAQm8a9BNLT9LZfOQCKWPb6DA+EevGOGOGdOgk+ze3aypACKwK5YHsVGT2urfyB
         YqwFW2gHAuAVD76fjkTqccUhFXAKlfF0fxd9joOjNqk43E/UvAt+sZD8VqOllb4eHY/o
         1ga9wtzEkMq1FjtgDG+gvZwHWwYnPokoeXgF1B7ZHqHWcOkI8WL+lOSQP9WgKwzraXHc
         Qa1Ut2zqkGYxSqj4vMHw4FqQXTfLBGKkRy94Om2vVIcx3g5zCN0luLYBiRacYljxXT8U
         9Xu5/n4DjYGOqKwimcpmyLBzqmjGera0LvDubtsWuJm752n4soVFJA2jsF2bxJbAQNhI
         qoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925571; x=1748530371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4sEJM+871Hq7BueZc9qSjjVinOO/X+0tYY6aaq4Jkg=;
        b=vs0avSNxPolHvDBVwwAZZzyVENVrdzTkstpmb8+s4GRLNfhQ6gf7ciSLq+A/o0viWT
         bSZoJDBkIL8OPyGlaZLSPcBBxf/UCONq4a8kNPjy9L6dlyeEedqUmjwL/Xt3G5mlWDc9
         kcZkRYq1iZ6Vy3R/UZJsLVkmtnkXAU8TIgawThSRjBglyrt3URLVRiM4pZ8MhKfs8rai
         H63qj/tGjFV2Az2tDwm6Ers1x9Nx/cLF5qP85ZQ3T5n5X0bJznePhPFanoLfHEB0f4UV
         YtGC4/hGY4ZLQv6ypE8zSx1iKCi+ngMO7MW7bdQJWwCWL8UQPufOnZUfHN3NG58N5GYA
         d+zA==
X-Forwarded-Encrypted: i=1; AJvYcCW81o443ahrm9BeKizpUHYfRIfU4rcH9RtMB8g6y8gObM9mRkgKFyTM2AWS/b0aqRXjtbHVbMpjKNQzQgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMusN6oD5eRa/WzhRgJdkiinl1BNkxbH3Q+IueF2/AMNWlEtW
	LBWkYOL9mEYxQBP5MMIyHv4Exnr5+QNTuiUdyan5siuZ0MEsWccoKeFQNcTju0eRa7M=
X-Gm-Gg: ASbGncvSwD+Ml9yVcr1/piYSHsfxUxVtAYtx782HO+rK1BJKJw8N+0Q2kiNUUO5h336
	41sbzJ0HxCH/W5X6aLdoEsO2ile/Zt/syKOlPCHvHMqvLfLY7KbZDSFT9vsnVsfSQQnRl8OLfw2
	GaktDhar19zR9tsJy0RdJdnz8mf0qpvDiVlBPmA2Q4G7CuZgyac48IybnXWEfoOwGeWFiGXzm+k
	dtGDbHooLgnbu+hepEhyhhIwM/q/tdy+GFA2gpyrQ8UPwPm9V0cFLjXquFBXerM0uN5Rqc+2jpx
	QhRAvFFAsHlSE0twbdB01BhijNk7J+6aVFPLaiYSlXdo8i7HEQcXiU+kw2cP
X-Google-Smtp-Source: AGHT+IF7HwvFx4mEXB3EyW4Q7v2VjPs8dvE+4oPy+CvCTPqUtNiIogBefTp2+DWncfUrub+h4prcpg==
X-Received: by 2002:a05:600c:3d8e:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442ff031845mr220598755e9.21.1747925570681;
        Thu, 22 May 2025 07:52:50 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:36 +0100
Subject: [PATCH v2 07/14] spi: spi-fsl-dspi: Use spi_alloc_target for
 target
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-7-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Marius Trifu <marius.trifu@nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Marius Trifu <marius.trifu@nxp.com>

spi_alloc_target should be used for target devices. This also sets
ctlr->target automatically so delete that line.

Signed-off-by: Marius Trifu <marius.trifu@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 10e511ba1cd8..814a92b8064e 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1366,7 +1366,10 @@ static int dspi_probe(struct platform_device *pdev)
 	if (!dspi)
 		return -ENOMEM;
 
-	ctlr = spi_alloc_host(&pdev->dev, 0);
+	if (of_property_read_bool(np, "spi-slave"))
+		ctlr = spi_alloc_target(&pdev->dev, 0);
+	else
+		ctlr = spi_alloc_host(&pdev->dev, 0);
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -1405,9 +1408,6 @@ static int dspi_probe(struct platform_device *pdev)
 		of_property_read_u32(np, "bus-num", &bus_num);
 		ctlr->bus_num = bus_num;
 
-		if (of_property_read_bool(np, "spi-slave"))
-			ctlr->target = true;
-
 		dspi->devtype_data = of_device_get_match_data(&pdev->dev);
 		if (!dspi->devtype_data) {
 			dev_err(&pdev->dev, "can't get devtype_data\n");

-- 
2.34.1

