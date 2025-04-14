Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBCB1D6193
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658251; cv=none; b=krGUYySaFGupERFq1FudvFynl2QkzmpOQYpsaAOsczpJCRczVudQBp+LC9eb8q9F1Tjq7b1DVIXLqfF4l1Mis6N2UaWZQ6qhdI/nq3i6bF/DyeG8LH2UYY785bnKh5JOpsATkyuA7cFWJZvvni0ifyoW7Uo+0nswyvZIbxiGtqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658251; c=relaxed/simple;
	bh=Ton9zULQiLlzQm1bS0I8+M483y6C5NEkcC2ETII9FFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F32Lg9XjsC+n7Vl6nOcYeHufisp3bvDGWD8D61zg6OJijYgMZ8ZRcjORajjWpREnIwB9DdMjOlWK2szkp7LxRq3ondtoqYAwZsh8zepk8LpjbaDsinKTBD8CLzFzSfcs5EogNZTBfxKoYe2Pg0bRYkCy+DM13/Shyli11q3OQoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fb1MCaYg; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fb1MCaYg"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d7f111e9e1so29189455ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658249; x=1745263049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwdVaBETwxDWpM+5yDsk4U+9VwHFz4zWoTYQSSEXcvE=;
        b=fb1MCaYgXbuIOE2f6P5I65h+8MzCw6eQ3ELcZhHB42vd6+KVQBKKtgf+vPr4TskjH4
         iJ0C8pt4+53PekCEq5EiWmivpY81ZeNI4vRjnD1RkkP1GXiGidGYNm2IBax+g36amK6+
         IqPAgAI9HxKYK4M3FuHcsJI4KRd7ted0kiO+jNQxzJt+p9/ejl7uuHgIUFSawtARgiuT
         xXjtXw9Y4tcwAZZIbxst8pH0oYVuPQgwv7rUHzin1URTogbqA1DO5CP21sWjh7N9C095
         1IPnZhD7Y5s5zxcUFwj+h9F7SmL2NFNF71xXHBazJx5RvcSd+xwhoj6rS8Nb5Og8EsgJ
         ly0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658249; x=1745263049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwdVaBETwxDWpM+5yDsk4U+9VwHFz4zWoTYQSSEXcvE=;
        b=JkwMF9l9fm9POfE2vMHrGrMO+6inSRqOY0mWvP/shs84iWfgn33yNLJM4Bs7IPQcqQ
         BgxSIJie0g/j3WySSIIWfhve1gFXpZG7GS1fWTTKeyjCL8E6KPSiSp4ouRiLPocbdlyX
         awH21fRgU0Mod7tsCC4Mkr7WEVVBtCmuc++q1bnavfP+jYRfcsM49nmTkEZqmCejtnE3
         qUJiCfD4REyRWGYo7JxEyYYqN2RQuh9MfnSvDS5f7+Yq09qmRMRsnq3VQg6d1cfeU/Qo
         ODF4Ca+2T684fxiWtfpbYNiGHVUuKxVtdeQKuKE2v6A1ywOfDU/JdoFCXaRFg5J73Fhf
         4Dag==
X-Forwarded-Encrypted: i=1; AJvYcCXi3one2Ao9g+8mXQhC8l0LH0ZNa/MDAUHSK93+sa/rBzcKi90PE95pnTnQYyxHdqziV+3rjOd5pFqGTXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR4Gqh5Mhz8ohbeME+uzw+keDUSHl4i72gQwwcT5S/SDWVeQDe
	uBynbCID8hdO53B6PpdT8vaw0efBEgAlmhOZy3ql0xSvBsM048yOF4yGRH/i2SQ=
X-Gm-Gg: ASbGnctg94iUY+iTt8Zf3GqsKTkeZcdcPA4RWnS0MfV2UYUdsk+PhjhyaKvjWCpP4x5
	MJf78JCsSnMFPdGOxRY74YKYzQYVF228CxyIweqfSSSgxQNVdckrjq5dcPFfDRnaH4+KEWwDydE
	fo9PwDvaz3Hi/rUjhdX5SJnPWvmG4s5JTY0ePfC9r+Z6jUK7stCEr6CcjpylD4gxl6nm5YIcx8r
	is6I87UzMxWZjnDHmvBss9IcXsf/TxVq2E2rTkcwqQovuznFypXJUHUJ7VWcLD7JQHh7vEXclGn
	XqzJo6EaCsebVKQqGqepzFLHgyKRrMAFHqbiOilQICzprAWIcDaBmILpECl93VFXZuIeocuhhgt
	xrn4c6iaP2j3dzynI6w7mzUpH
X-Google-Smtp-Source: AGHT+IGALOK7ig51+oL4dJYMMU7C6xF63EBGCVneXzwZOXrq7mBo4YaHe/qyW+GSY33q0r700Y9bnQ==
X-Received: by 2002:a05:6e02:2191:b0:3d4:38a4:388e with SMTP id e9e14a558f8ab-3d7ec1ec47dmr151224735ab.1.1744658248748;
        Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
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
Subject: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
Date: Mon, 14 Apr 2025 14:17:13 -0500
Message-ID: <20250414191715.2264758-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
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
 drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 7494c97c3c7ec..cd1a0668bd203 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,6 +130,36 @@
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
 struct ccu_reset_data {
 	u32 offset;
 	u32 assert_mask;
@@ -1177,6 +1207,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.reset_num	= ARRAY_SIZE(apmu_reset_data),
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
+static struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	/* No clocks in the RCPU CCU */
+	.reset_data	= rcpu_reset_data,
+	.reset_num	= ARRAY_SIZE(rcpu_reset_data),
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
+static struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= rcpu2_reset_data,
+	.reset_num	= ARRAY_SIZE(rcpu2_reset_data),
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
+static struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	/* No clocks in the APBC2 CCU */
+	.reset_data	= apbc2_reset_data,
+	.reset_num	= ARRAY_SIZE(apbc2_reset_data),
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -1351,6 +1432,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
-- 
2.45.2

