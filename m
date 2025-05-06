Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DED621A44D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565614; cv=none; b=BYQpQJVDOP0VetfGEdlVZ/GFCzCL519EJSUESUZCyfR7YLM4byDkS9WOYwS98jD1HWzMJtb5JbYcXJCU9uu/NN9EToikr5gjNDuYHiUFS6zdfWHkpPFaDqGhPY6yxxmm64Ku0amvLa4wPjAzTLFGDT24hHxk5CuqKEn/hzTjjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565614; c=relaxed/simple;
	bh=DjfsqH6niK9AVdZVSLESiMTovzwVko5bY5GY/GZAV8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tt9W8kAhxOdXwY6QyWF3modGRc7CdFjIJGTrTYXqcYykmpNNS9ybdolGYvK7GCZ02wB9nIxrgMbQ6zKx1PF+u9OQNoOr4yIm5ISt/Bi3PphJ1HryOSnmqkq2Cov7vgFqawiyzmRRkpWAx4RbdVLJ9+ZSshseIbrnGuXvFosg0lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=d4YQbsxT; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="d4YQbsxT"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86192b64d0bso562898839f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565610; x=1747170410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z0K4kzFPsp/sHcESObbMXkE8E8lHogVd3HcemJwitc=;
        b=d4YQbsxTKzYlNDEwPUgxxjAUJyy2ffcWXyVjlu31mLfgikMXn1Iyme4u2xOTYpaWYt
         cYYY23qKxmobCcyjBxJI+wKnG/6SZz6ClstSiWRH+Jv/fTVHXCN5WwN72f1nJBA5HM8Z
         AaacJ9kaYF3b8oTBccmERZq7/tiZVArcwyvGdiwV9tPHLBzP4E9krXvE1tT2nnrvH6qa
         uoAIOZPRGpUbpJxGeky0WIZufY6bKwBPAT5nez3qIm9ZlsmYnjbMZ3CyURMSYFJZywp1
         HHorBeHFmtCg5Ddwe9KsrY0SWcUVIolpBB1lnxQ/Hiom8ef2IPuN/hSS2P/SokeF1qRY
         qJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565610; x=1747170410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4z0K4kzFPsp/sHcESObbMXkE8E8lHogVd3HcemJwitc=;
        b=T8at7GTh+o+u11QvDHE8WfnTcuw7nT2oEcXvMZ4UpTvDYo6MJNAFFCeexZaah07ZOK
         prm7QTf/EzJFlx3FInYHNxNeBPhPANf+2KAVyuWHu87Lra/VcTyMaBFv2SnBM1uj/5oK
         RNcqH4hgGDL0rIUkeBL2aJ8L49Pptb6SjBhhsovcTov5l1VuI7ZhH4DU5jvnIF1DLXDa
         krs/S6ZtAC3Lec8DGQ1FJvBditbdKIM+rmZujI4m5Z5NK15afCbk4iaLuXnLJgMxyrmh
         lP81ZnFtkBVUByXVHFWK/20SdSudA0fhbb3E2RGPk6VSiTHk7LEL22gtkzxILUCaY4zQ
         joQA==
X-Forwarded-Encrypted: i=1; AJvYcCUm7Lgk4vSOBxbyEeBLCWiN2W9mXD1AG7Ry+xphc1+49NC0R2qdtp1kZxaGKMbt0WslluJRGl/RgB9MhaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNXxP9CvxUBTLdkUK2pvb76JYl3Gi5JbaormWlivO3Co5j+zXT
	jyjoqbbNSWMd1YMCqBTruzHfGGDXEG8InvJ9e4UQ5SPeGhTnMsI6Bd41WnRJsr4=
X-Gm-Gg: ASbGncuNEpocSWsvlKDvEG0V/ckshcBHWJbD4mGv1UzxuDMRKCnelnvN1Mippis+9aO
	whPEwxBjlJboDTZNKuxzbHUJm8offTaTdM6vF4P3RQuFfJg8o56dHKs1v4kAFbEL2eLJdk077Oy
	As5Umxagl1RPw+j2sv2niXjvGh8Phb7IEG7jqdZWpWEdhKS2tYeqaVZLx/dgPxpcoCCz3o9Um/G
	MEtLqglgAzDz36ihBulmBVGudv05MLoatSpajM/un14F+pPws3T6X1QpN1WxvTCKZBvHcTglG8H
	SqF0WJ5T2VXcL8YK3dVVyHcTl5RTzh90Nz9+ZrZxhHiSBySfgO9R6PmuXgRHNC6zJ12QNQYCDHE
	rpkXXE4yd9JwJ+eoZR8YJ8weY
X-Google-Smtp-Source: AGHT+IFGjQEF7fCThICgu4hR6t0NNc2NV3Tvj+Q6GZuc4V+JgASwbCj93Air8LG5cMU+hgkWkJJxKQ==
X-Received: by 2002:a05:6602:6c18:b0:85c:c7f9:9a1c with SMTP id ca18e2360f4ac-8674744e2f4mr118536739f.13.1746565610279;
        Tue, 06 May 2025 14:06:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:49 -0700 (PDT)
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
Subject: [PATCH v6 5/6] reset: spacemit: define three more CCUs
Date: Tue,  6 May 2025 16:06:36 -0500
Message-ID: <20250506210638.2800228-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
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
 drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
 drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
 include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
 3 files changed, 108 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 6b1845e899e5f..bddc83aff23cd 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
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
@@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
index 19a34f151b214..27434a1928261 100644
--- a/drivers/reset/spacemit/k1.c
+++ b/drivers/reset/spacemit/k1.c
@@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
 	.count		= ARRAY_SIZE(apmu_resets),
 };
 
+static const struct ccu_reset_data rcpu_resets[] = {
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
+	/* No clocks in the RCPU CCU */
+	.reset_data	= rcpu_resets,
+	.count		= ARRAY_SIZE(rcpu_resets),
+};
+
+static const struct ccu_reset_data rcpu2_resets[] = {
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
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= rcpu2_resets,
+	.count		= ARRAY_SIZE(rcpu2_resets),
+};
+
+static const struct ccu_reset_data apbc2_resets[] = {
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
+	/* No clocks in the APBC2 CCU */
+	.reset_data	= apbc2_resets,
+	.count		= ARRAY_SIZE(apbc2_resets),
+};
+
 static int spacemit_k1_reset_probe(struct auxiliary_device *adev,
 				   const struct auxiliary_device_id *id)
 {
@@ -164,6 +215,9 @@ static const struct auxiliary_device_id spacemit_k1_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
+	K1_AUX_DEV_ID(rcpu),
+	K1_AUX_DEV_ID(rcpu2),
+	K1_AUX_DEV_ID(apbc2),
 	{ },
 };
 MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
diff --git a/include/soc/spacemit/ccu_k1.h b/include/soc/spacemit/ccu_k1.h
index 8b2581fb3055d..66035012317c9 100644
--- a/include/soc/spacemit/ccu_k1.h
+++ b/include/soc/spacemit/ccu_k1.h
@@ -123,3 +123,33 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
 #define APMU_PCIE_CLK_RES_CTRL_2	0x3dc
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
+
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
-- 
2.45.2

