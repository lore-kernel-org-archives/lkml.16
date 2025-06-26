Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4A28507F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947518; cv=none; b=OgdbngP8Iv4tm47JO7Lhj6Q1cW/tFlUcggQ3Hbs6Q1Og7owBaoo2cR4IgcclZLW/spB39d35O2AMq6ey8LSAznkxP7wsvk/GFN2V72JDKLFQp7vQwh5SfvajuG1uW4+1IieXrUl2feQTQKqx0Gh2ZC11P93hbqxerP7IgU0G7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947518; c=relaxed/simple;
	bh=TOD13ffTPElASni26XgeRgQdq0G/4M0LdcwD2Hv4v24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLNcbHCEHiLE9Baabu4OVu5YYsXeTGEojGe376bfBOPJlSOU09d3VtRPi3ww8Rt9aEywEF+FLmikOEcKrLN4AW8kNa+7pIIp5XqkXATdx4p22dIeG0dCUCKhf+3SeJNXVaKCD7PbasLIyo0Lt3lAp37CMM1MxmmxhW8GN5xy42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3C8beXfi; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3C8beXfi"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a77ea7ed49so23114691cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947515; x=1751552315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ5hZb53byMy6O+kgnQ/7o78O0jkXDe0+NDrOq4Do84=;
        b=3C8beXfiYtoH2RD0dunn7LWiq83bel9cr9NMbrfjMD7gi7tVig4eTvhU52eAZ4YVBy
         OckcO+MzdYJK8tZBfUUEakvJvUIDSIlvrcoVFNd/aNv0OK6EGll81erY6ChDStPlPjsh
         wE4VGcscqPensB1Sl11Zcxi4S13Yv8UX7rZLPrxF4VVGD54/Eq7eofF7mgssx6CReEQU
         ZWV/B1zbNmkZ9qDPprahaJqzPY6QoJsMiRIFkzc1Si6z48YxnReuw7VUZEnrJ753I5Pt
         EdSLoVTGUvyj1n/gbjAn464bITfbYEZUAiLABt4Y+kNzbINUodSt60J/ktSrtJAzMhs4
         EYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947515; x=1751552315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ5hZb53byMy6O+kgnQ/7o78O0jkXDe0+NDrOq4Do84=;
        b=vpqWOU8BOT1HAOexcr8Y77FiwRgRZqFGxoEsf56h7bkFhi0zHw9//wTRHETeoDWS8Z
         kG2bZlgaseBg7tRclNoymgAIXq5NNspR3Dl81IdvqUhL1hK5gFSsDRr9h5f3NyKVwFKu
         LqkbkTp+EWByO3xO/PwgxzrOl+WyLlHNyx56sJTMc9NzFqqqXMkhw2/XZfF0tRxx53Ku
         GmrsQGr2loxemdQNFXj5pi6fI6+DDj664RTEuNFB5CFKxMvc0haICL8jBxSniuRSFIHO
         VXXtqKw3bVOcFJMrYhXFMno2Hh8JSKhE1nbmhm219NMU9lepZquj4rRORdjurI3ciyBQ
         1Diw==
X-Forwarded-Encrypted: i=1; AJvYcCUnPRZWlEY0afi1Y4ZdJpoj4uQJNDL2joSnjVfIX0Yg/ks0+UhFZaSfe1x+VKUQ5Lj0FTgKnaB//FiIHgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1RCZMp3RVmTyYb84li68jEw8wal39sg57NP0OCIkaJ1GoQqh
	H656D4hg6AtRxajr189CzR0oFb231S1yJYKokFCsQgkr47kOdxe4RDbx7Avgb79xX8Y=
X-Gm-Gg: ASbGnctuM0vGPaiBA8iXK92KjNMVzrFeoYR5IYfsoM/9qpAZj+PI3ZS/Lf+GoWGRWnh
	XCsrC4FcJfIbD8yh/6QU3i5qcX9m6+PnQ3Ta/gzI4IvtYyhpWUamcsImPPV29XAeZfHezlV0Qu9
	1dm4Eu9OKTH1do3ekDwdDaRHdFBhYn0ctigR09ZIJAkbKY+ZUnhYVRJbqByM45d59GQNY55j6w1
	2Q2GNmKUxON5FokdzoJzOTzut4sFZ5JoQVuigeejBBmSvD5msg2JBAiF30BvWJ5MA9RnGfAObwa
	uLWLQRxan6KCyMHaR/KFU4OxQq4Rv5U6DHP1Kz8j5RLfOnprP0VN9SWNtK1bcLzt37QHnVOC2hj
	fj5moO5fo9fKqzcl7ZMlD+7zch7nzFJi2PaKF+/kxqaR5rw==
X-Google-Smtp-Source: AGHT+IEo5qUjncPNNeJ4vUf95+jNv5wrktztcnKidKdsP+7iFgU5PUhhf5ynIvp3aZOcL04L/dj9Dw==
X-Received: by 2002:a05:622a:400e:b0:4a4:3475:d882 with SMTP id d75a77b69052e-4a7f2de0d53mr56801981cf.6.1750947515077;
        Thu, 26 Jun 2025 07:18:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 26 Jun 2025 09:18:21 -0500
Message-ID: <20250626141827.1140403-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for the RTC and regulators found in the SpacemiT P1
PMIC.  Support is implemented by the simple I2C MFD driver.

The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
PMIC provides 6 buck converters and 12 LDO regulators.  It also
implements a switch, watchdog timer, real-time clock, and more.
Initially its RTC and regulators are supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..01805c3eec57d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
+	depends on I2C
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  This option supports the I2C-based SpacemiT P1 PMIC, which
+	  contains regulators, a power switch, GPIOs, an RTC, and more.
+	  This option is selected when any of the supported sub-devices
+	  is configured.  The basic functionality is implemented by the
+	  simple MFD I2C driver.
+
 config MFD_SPMI_PMIC
 	tristate "Qualcomm SPMI PMICs"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..026cd92e20ad3 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct regmap_config spacemit_p1_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xaa,
+};
+
+static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-regulator", },
+	{ .name = "spacemit-p1-rtc", },
+};
+
+static const struct simple_mfd_data spacemit_p1 = {
+	.regmap_config = &spacemit_p1_regmap_config,
+	.mfd_cell = spacemit_p1_cells,
+	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
+};
+
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
 	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.45.2

