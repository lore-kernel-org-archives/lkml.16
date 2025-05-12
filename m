Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D8297A63
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074746; cv=none; b=OHhNJKCJC3h3b967KgyycRNKktJ1omA7WWLhwfm/eEGcEzemg96Uc2wBpET7dulIj8Lfur/9Rl8h4XySbJ47x5mlo/Vuw5QhOQ/yPXXqR8Gkqp1YoiyhA/yB5bqJiVIEq4msAPaWRs5+QlkaTT3VYDOmkUrwsTtcUWdPGJ8eqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074746; c=relaxed/simple;
	bh=wsd3TY07LqgO10EHh0yZM1H92WqxEiQ50mWj8kZiMkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeipPATG8b2Gslj057wuL527vHMzMLuswMydiiEkz+qb9ULjyaupHzTUxfTsQG7Gu+HY79WMFqZKlwNdEnZXNKL8WFQwxPDy7ynCCZzd3kpGWGIeE0MXncl6S7hImGlgahU0JG2qecQ4Xz5O5YVye0/7R0kJGLDnRuaDdaOpr+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Hn+xEcYo; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Hn+xEcYo"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86192b64d0bso385412339f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074743; x=1747679543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQXCM0rzq2AjpYhvu6QGM7rUdeLPiqP7J4a3LgsGC08=;
        b=Hn+xEcYo6lpIDMVZKMqbzb/srFS4LqghV+AmQv6RSNiLYaVN13Xmsn7ngexm6RfRgO
         qGXm8HvLAxOinUG0WrBjm8vEJNnNN4A5rCghlTvkImseaWkN+KMSghHjBu0f7n86rF0b
         pj1tOiNruu1p4N77ysRBmBodNF4dXxDJO3fwN79Gu6pcYExxxI4ykynPWSFZhtll9/le
         QC//MhjENLgyANUqDhcD5ZulmG38XQG1bhf1y1Hkq8lar3ZTqDEenV1iLrmFdM2Hb8sQ
         +26PqpP5yuAmnGz6y4hvPAmK28urO2IFiNyKilAihLsdU009a7FtYRojbQBuHGBCoVJV
         OXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074743; x=1747679543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQXCM0rzq2AjpYhvu6QGM7rUdeLPiqP7J4a3LgsGC08=;
        b=RHpGMyV/uHcaH/1EkUsOYk5+AVKmWYuUvrHmb5MdSw0px7y4Qvuo3PsethNXhyqAMp
         wGNx28hbuv1lF4n/mdkcaXX/2Y4aqM1tcKebC5NJG7na20QRjvFETIbmra2T3CBUbpL5
         a0rFz9uUHvyvL2mYZUOtLJ9DmjdTcqdv66tzCVqDokZLsQnnPAUVbpkMga2jBcGHwJ6u
         yS1Fa96l6SMGjzB4LLGn2XvRjbqQN/gdjIXY6IgkmRAP0QzkL7hEum89RtOEcBJNQVnA
         RY6BoqVd3Ut5dg2oZXBeYBaVoj5x4LjeH3+HmQjdSl/DXAnzlSJN4GkVGKSEHbYzMBVF
         a2eA==
X-Forwarded-Encrypted: i=1; AJvYcCX8hba00dxrq+XzHna+++Ug7IRn7u9JNx+Y3mgTOHWQmQTKa0WVNCbpcnAIwNPAX0lU32bgp0QV7wgOqnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHZYEJky43ffVsB4SQbdB7RgaMuLDrhpMZBHUTDWqUuBZfPlEJ
	OS2IM0ELLfE60BI+YjlBDj4VHuyvz4xa9PrR4aAuRI8L9NzwjSGPt7yLX3QrUSU=
X-Gm-Gg: ASbGncv/HbZMrN6mtjpWE2oazC81bUSFdeHQGSrl27/GHFuXnFSLgi/ltd3nFJdUZIH
	zFwi/aQ++sqK3b3mJeljALrZtn+TUOHaZZj5LH8DTHbe3i8aruUe520IhHeE5qFCURnG+y+Qj66
	Zs47aANA/uRZe2ximinMk+8//xyhQo9/kvfHQG2rRFqi38/Blb2KpxMNHaqa3u/N5jAL1cr/km5
	glcXWTsVrtWy2bVif3YnJutsQk0Ut9vdaSRs5wFzafQVCe7tFaSJhLukc8bVd7Y1D/St5tJPWW1
	bwXE0ap0Q2wNSqKSa3Q/fwoTC3q06XifQxzLNzgA8hsbOcrwtodBNp+g8IRwV8AmBQ2YxtUjJ0w
	AmabBQe5nioEtj7ET8zfmyO2d
X-Google-Smtp-Source: AGHT+IFOxzv764nHHyT3D3TfI3ajf5K30FAne2X00+zGIBd6bGfjC2OadvzehU1ckhwS1ZoivaaoZw==
X-Received: by 2002:a05:6602:2c87:b0:867:9af:812e with SMTP id ca18e2360f4ac-8676356a14emr1591532439f.5.1747074743299;
        Mon, 12 May 2025 11:32:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/6] reset: spacemit: define three more CCUs
Date: Mon, 12 May 2025 13:32:10 -0500
Message-ID: <20250512183212.3465963-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define these resets so they can be used.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
 drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 1c9ed434ae93e..f9e2200d1fd04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -943,6 +943,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1121,6 +1133,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index eff67bdc8adba..4137f4f8352d3 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -158,6 +158,54 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
 	.count		= ARRAY_SIZE(k1_apmu_resets),
 };
 
+static const struct ccu_reset_data k1_rcpu_resets[] = {
+	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
+	.reset_data	= k1_rcpu_resets,
+	.count		= ARRAY_SIZE(k1_rcpu_resets),
+};
+
+static const struct ccu_reset_data k1_rcpu2_resets[] = {
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu2_reset_data = {
+	.reset_data	= k1_rcpu2_resets,
+	.count		= ARRAY_SIZE(k1_rcpu2_resets),
+};
+
+static const struct ccu_reset_data k1_apbc2_resets[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
+	.reset_data	= k1_apbc2_resets,
+	.count		= ARRAY_SIZE(k1_apbc2_resets),
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -231,6 +279,9 @@ static const struct auxiliary_device_id spacemit_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
+	K1_AUX_DEV_ID(rcpu),
+	K1_AUX_DEV_ID(rcpu2),
+	K1_AUX_DEV_ID(apbc2),
 	{ },
 };
 MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 53eff7691f33d..c59bd7a38e5b4 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -127,4 +127,34 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+/* RCPU register offsets */
+#define RCPU_SSP0_CLK_RST		0x0028
+#define RCPU_I2C0_CLK_RST		0x0030
+#define RCPU_UART1_CLK_RST		0x003c
+#define RCPU_CAN_CLK_RST		0x0048
+#define RCPU_IR_CLK_RST			0x004c
+#define RCPU_UART0_CLK_RST		0x00d8
+#define AUDIO_HDMI_CLK_CTRL		0x2044
+
+/* RCPU2 register offsets */
+#define RCPU2_PWM0_CLK_RST		0x0000
+#define RCPU2_PWM1_CLK_RST		0x0004
+#define RCPU2_PWM2_CLK_RST		0x0008
+#define RCPU2_PWM3_CLK_RST		0x000c
+#define RCPU2_PWM4_CLK_RST		0x0010
+#define RCPU2_PWM5_CLK_RST		0x0014
+#define RCPU2_PWM6_CLK_RST		0x0018
+#define RCPU2_PWM7_CLK_RST		0x001c
+#define RCPU2_PWM8_CLK_RST		0x0020
+#define RCPU2_PWM9_CLK_RST		0x0024
+
+/* APBC2 register offsets */
+#define APBC2_UART1_CLK_RST		0x0000
+#define APBC2_SSP2_CLK_RST		0x0004
+#define APBC2_TWSI3_CLK_RST		0x0008
+#define APBC2_RTC_CLK_RST		0x000c
+#define APBC2_TIMERS0_CLK_RST		0x0010
+#define APBC2_KPC_CLK_RST		0x0014
+#define APBC2_GPIO_CLK_RST		0x001c
+
 #endif /* __SOC_K1_SYSCON_H__ */
-- 
2.45.2

