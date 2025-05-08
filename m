Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726228C2CE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734064; cv=none; b=sm/UynkuTcHlwTXy2UDQfsct3dL6ytQDIx7Tr6T1LL/wocs4bYcWsXIn+6xD7NhAheJqgX/pceEQQrAO/6JDOYK3ny5FYM5DQRht8JBXMvi1+XIapXRlE/cOTwkPvqezpOTt9qQ8knwmpo4BmSdEFWQqrkbg3B9k+gvnRw/UMDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734064; c=relaxed/simple;
	bh=FAeZQx1DF1YFFGItqVSv62P6dO9wF2Bb0xkTzSlInZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaFT+qob8v/9Rc9VEGukAea97W6Y/LlTH7Sw6YCL1YVFhfB4xn8KXbAgx09/dEezIeGQyFieioHypH5zcd4eMGHekxovSDYEYx9ClacIoK4I5MApVmRYyF2XP/lHaF/V5R3fYhK4D86QKebMrbzkjh4LCzwWPacRZvCvzcfqlCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AWcO9HGO; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AWcO9HGO"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d93deba52fso3997485ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734061; x=1747338861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBjgP82oB8RJahq8T8A4o8pB1J1W5AQMcKd/UTcdoyE=;
        b=AWcO9HGOP6y2qd3tEYVU3XKZVYiYpMloVkT6D5Wi21h7QuXdt9lAW3/b4gywadMJQX
         Ubjs2nIG3UIUv+YNGiqLk2IUdrPqOs1BGwxXHEvkQuvFOpZ8zfbAUIOMPvPXIsMSd2gE
         iDBQc7/u35G42Lxx1z/L8gzEckObuMST/7GWknNqb0JmIw/QRGcMAmH7g93ASXLw63Q9
         IbrYEsY+iXZD860lW5OXKSfY+36NWQ0thgAyMYopEu7W4IoAl7W1OdvxHCfId/zvG5UR
         AaHY6BhQQvpzZsC2KhPhsVziVfgTx30n10sfK4uc0UP4mrRbvWLq1XgkNJZ0kX/k5uF8
         Xvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734061; x=1747338861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBjgP82oB8RJahq8T8A4o8pB1J1W5AQMcKd/UTcdoyE=;
        b=uzdZ1xis/s57ZgoWBV5R/my9rFqZIYiial75QUYVcHzmmUeJNbEmg+DitzofqzuX94
         biWpAwoQwSTKjlMmTUmiSt/V0EBt0fNn2sQRxuJqhCtJmfBU8NVonsD5Glv247dc1+83
         Dm0Qtlt5GNpWeTtyQ0+pDnvkJd3hmlZR4TL0rDSDLugEp1g6uCqzV8iHfYxL0Oz4uTTr
         w2Tg07GW/s9dLT5qA2AteAjl8m7lh/yyhBE0wt0siTYDGsFse1P/BtGpaVmsEzEaxS/6
         GYk2ER6FWxv7VhwCWF1NQmNYjjNCuguGOtB3q3C9KXBtEntyOSqIigyuOfuX/kEC8kMM
         QiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlFsAfwr2CeBqkM489+qChgJmAxdKIaF6RKuFqrPKK7bZ7mpYgYIA/T9+RLsHEWMQ4akYmHrVSOLKrZmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhWBZ42M1gzjnugzRDeg4y4CBcfBQL/CUp+HA9APWjKuXFcLi
	GQiIL7UQPEwBXvdsS8mPuknAb3oQsq9mpgt+ABgtuWyZxuLnJuc71wfJ18wK9zg=
X-Gm-Gg: ASbGncurizZCN1zHdFEgqeQcCIWA1cJxJ1GDhZ25mmrl+f3+Wdu9R7Ads6jiwoWRPWd
	zc9Ychc+FpDFG6LpZvm3hLoj2kfGBDEEBcgxXQCPEOa/xPs04pveiywDZIo/w1uBsbP3CBFengz
	hZ8VDpaZbNp32ICUBxjW6j59sxEq7DoUxyjQtNRy5/xAGyuq30bgIjeNDhiy8bHQL7HWCV0yIXe
	8hYmlW2sVXRVnoC7x9gYv3P8y+2dDR8I9450SBQHObajDuZDc/YloHVJVo1cWThuZOuVDocF0U/
	6M0O8cEtX3xNzvvtlss5e2/BHU+0+ubmcHRytgKOelfb2zFfXGcrTVClgVIg3R+6BDRwcGC2t1d
	4KkYonwt/KNgzxg==
X-Google-Smtp-Source: AGHT+IFqPpW9ZV56dgNGdAPO8AxfPep19nBaoJN7cldrZa2m1UBN8z5CblWaekx8UKOj1nkjLrqL6A==
X-Received: by 2002:a05:6e02:1fc6:b0:3d3:f27a:9101 with SMTP id e9e14a558f8ab-3da7e1e2b8amr11948415ab.1.1746734061498;
        Thu, 08 May 2025 12:54:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226850e1sm93983173.134.2025.05.08.12.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:54:21 -0700 (PDT)
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
Subject: [PATCH v7 5/6] reset: spacemit: define three more CCUs
Date: Thu,  8 May 2025 14:54:07 -0500
Message-ID: <20250508195409.2962633-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250508195409.2962633-1-elder@riscstar.com>
References: <20250508195409.2962633-1-elder@riscstar.com>
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
v7: - Some irrelevant comments are removed, as suggested by Philipp
    - The ccu_reset_data arrays now have a "k1_" prefix in their name

 drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
 drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index b9c574f9e0d7f..4bfc837ce79ff 100644
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

