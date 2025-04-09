Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC221C9F0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233476; cv=none; b=IxagYXSILf7eNswol56wJcBSTHvNNAKdxaAjMp1QjpJoIf14zhJIR21L83PdUGQnm9Fx/yUsKCVBpS4SovQDYal6ct1U9cRk+XDrXvjvDc3ZRe/3UWS4bc80HGTpVJesA5/c1mc1g8O/p96QWL8weUxjCRtmrcGJfK3VfSP8br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233476; c=relaxed/simple;
	bh=ev/Y1EpiqmR72r+rtwsAxVYC9D2rE3/iwCgjzpX39E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDSbjJCDqIVJnJ0OOY891D28nvD3Bd/63xyP7p5YSSAw7EuZ53SPZNmfP1KFnIdrBjOcRWl4Sx/ZAmTI0BRNJ+MeY88xBxZ2Qq0kKN0qAMEffGc5vGA5g0KuqyHEYKpv9/UVaI6wlF8Pns05+GeUlMc+TEF8XhJxb1PUbFnJTGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0ThEZqys; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0ThEZqys"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85517db52a2so3355639f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233473; x=1744838273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfE4mi5+bRUs0mrTReAl+0YmCoZERibd/nax2bqxg4E=;
        b=0ThEZqysjVUqfIRlBwgAZKDpWzj1fbNIsQhVg1JtH3WYvOG0xe+24YP1RT0Hp1NX5T
         jitFC2h64aWXR9cV7CI+buRm2K6zbEM4FP2734mikuL8RFi8O8nJBB2V994hQyGdd4uF
         lTyorhBfzykT8ib/2yLEgGCUAp4D4nEKdB/aJ4mTsk3wnOXeCCbpsUIjqEZ/yupdBB+L
         8I41PnTLVB/jk9KEbP5+FnKoaS94p1zB9pUNUgJRklrVdmt2U2hnK+k+57pLux7S04ya
         WSuD6CVpuchPjZbWmsgwHrM8uSdP5F+GniwkxB6fSShK6L9vxJYiA0/mcYy8ODI2EamO
         SS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233473; x=1744838273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfE4mi5+bRUs0mrTReAl+0YmCoZERibd/nax2bqxg4E=;
        b=sLg2dVZJcLMFddIfaE3KgarUkNxRfguR+F353tP6o2T4sxWqFD2pO+8riOgOP7Hpug
         du1WVm1YpKTKCB7A4LAWsgQqEBSKuF8MHzzkywTJLFGUNCMo6gn7J3xWD5Lc7Ha8XOPs
         XGgxp57g/VeDwiSRrTADRv03jux06AFTTvHt3FZwOFTnG4tt1nBUl5YAWudpYl/zl+p2
         VRc5aUjyeuqhMH4GUUZFslIyABt3QAF2w/MqY+rjK6VYc6LIa9Dyn+hIhVmMtD6KX2+6
         dkIGXkEKoZbnyVmWC1KztPJgvSYOyXBOLP3+kERk+URGAyBkCJDkh53/KDttPVaD69pw
         JPHw==
X-Forwarded-Encrypted: i=1; AJvYcCX6pFkTN+74IAqAYlG1TAGAZiNL0ReDVWWrk+F7n644YyP1W/Pb2MAVdy9mFGYgNoDhlRiWgr4yFQWgsrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyYiP0kLbf4dQzEIMbk1aCY8F4p+Oq7nYFu1w+QqOozaTL33xb
	zMuR/vHFp/Vd7qhRG7lW/hzobA/dHBRCs4tQjIVQDxYPk533104E1TVTP5haCEQ=
X-Gm-Gg: ASbGnct+9DjYr9YktmC5U93G3qhqk67mAoaehrGN6j8w6RcjiuIYSFN7o6GUgWqgapy
	/QjF+pjFyT4X8Yrex+uvcR7zxxNNOxEY+L+zL02GDBh/PW4Uvr7g1mv4OlvAHTT+ypzeQ/bhuTB
	BSGp+pKW73WYGIevOHwJMhjZfVCwIue4du3UuxS1alriEcjQcLArRzoovxHOMVirHfvScSE5wdU
	D+/ZHMen2819H2tVfcyW7/2GN0ZqPCcKICpF3YhmdLanWDhHQ0ntM2fvQz9iBmVigmTNMhxKALz
	rQxbdDY2n+q92kaSbPyqwnEZNzDUOLq70L42g0vgGmJSlzBDZRp0VTSnP4JLs/ec3W6/jQvUBqv
	lv/ei8LLeqf8DEQ==
X-Google-Smtp-Source: AGHT+IGepTLDmm9Rfr0ee7fqbtpW9YuD3P3suUA/S/vIPpQUicibU6m7hkQiWRlxFLi/scRRsus8qw==
X-Received: by 2002:a05:6e02:3e8e:b0:3d5:e002:b8ac with SMTP id e9e14a558f8ab-3d7e46f931bmr5992695ab.9.1744233473418;
        Wed, 09 Apr 2025 14:17:53 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:52 -0700 (PDT)
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
Subject: [PATCH v3 6/7] clk: spacemit: define new syscons with only resets
Date: Wed,  9 Apr 2025 16:17:39 -0500
Message-ID: <20250409211741.1171584-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
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
 drivers/clk/spacemit/ccu-k1.c | 94 +++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 201ffefa5fa9f..3c1ce9ec42908 100644
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
 struct ccu_reset_data {
 	u32 offset;
 	u32 assert_mask;
@@ -1335,6 +1366,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
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
@@ -1509,6 +1591,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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

