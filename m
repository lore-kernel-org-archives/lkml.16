Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1801F1F4168
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195769; cv=none; b=l0Ovi7ATJ9w8HtdpjIyxb1HH30ozTs7JfoBOGLAVlTCsChSpJtSX79b++Qnj6GPUsuXOTndm1Mqxiv2fPN7zbufIhyz8pWFe2uChkBu344eFBFh1K5SBzU8wCgPqANAqwjzMJixRctrC2O2qjQKfhF1khhOQZhdSeOB5DyMcoGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195769; c=relaxed/simple;
	bh=f+fFh2WfiMJsnv+eoWD0U+p9NbOTc5qVfCxB9KoRoxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNWrWEsDcEuy0IKd0Yr1BJ/B7D+m5ToiJlIApO+JZUgaDtzxokjl7DLz103vwAa+sizByn+dfL0N4vxfrACaywEgBZkhYQUV1Zzuj3hvZpHY5otNvZlh9JH7oqH/QlRGKlNGO7RXQQ+d0xYuv16S3w788jo/D38rfvLOAMRjvzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Q/+8gb74; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Q/+8gb74"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d45875d440so10749655ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195766; x=1743800566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKcJi20RveZcqY3Kh6Lr5ErkuA50pYogrDTUhueBa/I=;
        b=Q/+8gb741tijOdCQLjV22PAYBrWySdxgxbipDmu/UYsbutkcd7dLag/VnWyk2daNau
         xTj9gLsp2PaC27DeOmcQ8LFL65t2SY3BcgrnV7BFcT/IyNv2Czvb1ds296JyDsH60dTA
         OICy7vsnoGzHffQlJetm7BvuKQOiUU7UTcyJhd+IadvaNJmqtEk+g5KdFd/BTTG/QcDw
         3OEaGRxQfTv8N0X38yOeZv/HJwBUooktGajRWKk+p2g8PdFPCv2Tzbc4QHsk2o5QwrAz
         3cbEjzZPFxvmLtwjN2lmNWYE7JX+lTR4Nbak++lHIwW74r0S1CkkRdQJK6nIopWMyF99
         lcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195766; x=1743800566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKcJi20RveZcqY3Kh6Lr5ErkuA50pYogrDTUhueBa/I=;
        b=dw4QTVEWzwhAjXkPc0z4ofhBnquKiLzOVMo8bBrOOqazKO5b+SPOB5jH+3Q8dUpUe4
         YAOcITW8Arkk/wEHeFwRuRL5em8AvXTdX39bOIAeu61080yWUb45IY0ztXXUcXIwKFuR
         4aWia40uoe8Z+S/F2cmf9+KWrkAAD8hTmT2Rv4o17TeznIPyMfN5ajheosAbMmFwAxio
         pwvimm8OGkufWWKwSTOoPTaHPvNQwPWlIBClm5QT81dUV8kY5KJoukaG1sZbGx5Pmou8
         TEkKctcyMinXUFJVSa8XA5BgdxcAHF1h7HteMa9Fq3k7CjrNmFsXEWXMkX06VuO83Ayr
         2l3A==
X-Forwarded-Encrypted: i=1; AJvYcCU9t4dcMzOhDgkpCgyfgVR147y6EwjkFXtbLDD6fDY/qfuPZE7CVAW0Q8nCbY3pP3CUOS9UJXUZAstDFoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCM34BagYQ+H/egzhvNNOccURSUTVqIsO0PUMvCpOFXegZhPT
	cjUg3Z6OYR8VtANT/vWihyE0VrodskLODT8e+8g1N2Vi0UZTJZxzTvGD4cDzP/Q=
X-Gm-Gg: ASbGncu3EIo6rpP4Brd+Q3jNepQrkfWuQXXfuXBIcCOzpm2Ygfy+TZSuX7gLnwDeBIs
	yoiZwpro6q4iUWqSm71ImzKApNGdAAJqcgLR4RkP5uf0bHwMClJ6q8X7VNpCrwV4EqSKZuwR4GW
	gvsNWFFDwLktBkfg6pFsTly19lcOw+TbXlGCJpEkFPeN3T4OaSsDO+Pt/8Th5FfPXT0Kx7zEGfJ
	nYUZE+yZM7CNTMSqGoJr/fKO/YdDVdowelwTjBY/zXIQ/th+fefA9ojVCDXq4wzKDOZnGmH+eEE
	klGBvV8GdUU8PBX+2acObL0Ix7VnO0IPSML1GOxsLJplRWO+e2FbWKBjFhCrv1RU/pBVmXvKGDf
	VhuzIzNMU7rmQ+qo6Zg==
X-Google-Smtp-Source: AGHT+IG/x8CaSThai0eN9WMQXnI7Dn45SQl59K26R/GIHq+6R5kvoqka5yknMLoNMvorh3QxtBN6Vg==
X-Received: by 2002:a05:6e02:1d13:b0:3d3:dfc2:912c with SMTP id e9e14a558f8ab-3d5e09da039mr7944305ab.17.1743195766037;
        Fri, 28 Mar 2025 14:02:46 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] clk: spacemit: define new syscons with only resets
Date: Fri, 28 Mar 2025 16:02:31 -0500
Message-ID: <20250328210233.1077035-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for three additional syscon CCUs which support reset
controls but no clocks:  ARCPU, RCPU2, and APBC2.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Symbols are named RESET* and reset* rather than RST* and rst*

 drivers/clk/spacemit/ccu-k1.c | 106 ++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 6885fea81f6f3..c7c9580eab90b 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,6 +130,37 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+/* RCPU register offsets */
+#define RCPU_SSP0_CLK_RST		0x0028
+#define RCPU_I2C0_CLK_RST		0x0030
+#define RCPU_UART1_CLK_RST		0x003c
+#define RCPU_CAN_CLK_RST		0x0048
+#define RCPU_IR_CLK_RST			0x004c
+#define RCPU_UART0_CLK_RST		0x00d8
+/* XXX Next one is part of the AUD_AUDCLOCK region @ 0xc0882000 */
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
 struct spacemit_ccu_clk {
 	int id;
 	struct clk_hw *hw;
@@ -1781,6 +1812,69 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.reset_data	= &apmu_reset_controller_data,
 };
 
+static const struct ccu_reset_data rcpu_reset_data[] = {
+	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data rcpu_reset_controller_data = {
+	.count		= ARRAY_SIZE(rcpu_reset_data),
+	.data		= rcpu_reset_data,
+};
+
+static struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	/* No clocks in the RCPU CCU */
+	.reset_data	= &rcpu_reset_controller_data,
+};
+
+static const struct ccu_reset_data rcpu2_reset_data[] = {
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
+static const struct ccu_reset_controller_data rcpu2_reset_controller_data = {
+	.count		= ARRAY_SIZE(rcpu2_reset_data),
+	.data		= rcpu2_reset_data,
+};
+
+static struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= &rcpu2_reset_controller_data,
+};
+
+static const struct ccu_reset_data apbc2_reset_data[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
+};
+
+static const struct ccu_reset_controller_data apbc2_reset_controller_data = {
+	.count		= ARRAY_SIZE(apbc2_reset_data),
+	.data		= apbc2_reset_data,
+};
+
+static struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	/* No clocks in the APBC2 CCU */
+	.reset_data	= &apbc2_reset_controller_data,
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -1948,6 +2042,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
-- 
2.45.2

