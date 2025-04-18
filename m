Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00DC1E1A20
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988059; cv=none; b=MVHzySiN8fXa+tJ5a8pc8PCWov31yOMALFgPAQrkJy5gCpQtdFyqOZqSp11zes5OSuRqOFZfxITjKvr9mIXFiXuJ9KVXkpxAa8yrODk04cPTxaKeG1NjuaJiPNmNYvwCbUdy17wdfOXydRROUQh2UeULoGUq5sUDWTt4nNUEZMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988059; c=relaxed/simple;
	bh=1F34qDzbOBgZWjj44Ovy/IXKH75/2OQIapTNrAIWX6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftBOpEa2Bc4GBrceP7+8nQSdLcl42zSZ+GJUKxaghX7CEgRIw+vuVvNZeTUT0ef7/CdlDEdABojh866BFFUfoLTsF6T/9mJdsBM9x9xjWgoghDhqp+PdvvUZAsJHoBevtXAIYzgt5RCmHDqGy0BmrnjtcFY+fyJc5zL4oGvqaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Cgb465JW; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Cgb465JW"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47691d82bfbso34992011cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988054; x=1745592854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkMtzn7N02RmrS0PJQFbrGZioeU0O7QBuxxi4LcB8Zs=;
        b=Cgb465JWM3m5f+Og7eRPFQirnMgrNC4faR4iusLbeUmvRhzpUcVNIdy+NI4zuSKM0t
         lagLK7POR65mP4aDeFuCbMENEZb8o1KdKNiC4KHAyd9vsJrnK3d6MD37gbrvYpOfa/UE
         jDfZb4Kx1BxCGt0o7ubLpQxGXK61ujkunyl+DaY9SSJacutP6s5eeBpU7C4qr3tEOMNt
         +Lzr2lzYLyakOOHzC/EQTJnOn+eJ+ylS+rQYQ85t4nrqFpEtzmINcNOsMJMdtSeUTKEm
         njKus12ink/SNZghqNF9j16kZzgmkh56JAe2WrXToFeiMVSqOypI68TpSMXTpgD/03Z6
         Kyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988054; x=1745592854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkMtzn7N02RmrS0PJQFbrGZioeU0O7QBuxxi4LcB8Zs=;
        b=Rc+XbLuXyiXfqXbtS9FXeAszTB3nytSOm7dN/32vcm296dgrbHabkspRiHJVZFI9ak
         L6ZpJPD8VLGwhU6rDnaNuYU8+H9YHNkmZuVpBW71AaK2Bw/yrBaa2sGa7GWMcJJnOfYc
         nUEqxL/ZQ5YsPoKk4759sovOiOSuoEuGLHsyQiS9wc7KdZiziuIBnKz8uxWAz803Ozv3
         TRsn+ON6b4L6wCdaNidGoOC/boF4IRpVtFdUCWFusWt1ucfmiTOuMXm45FDZHFuT/Tbz
         CsKPGxVf9aE2xBK6/XbH+ZlM3x7mLUMsO6hTONxiW02fMU45AWDP4saiZT24ayaHdQRj
         ttxA==
X-Forwarded-Encrypted: i=1; AJvYcCWI/07blNXyB+k6Vg2akWQuLArA/W3Pyhw1oy6TT84XeUZVFKMWH5dRonwWs07HEPRylwAktKo1Q3/xIVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy48R0pIeMrwvx37mYnD3YV4QTywyaEP1EX/vmk3rzcjdUX6Na0
	evyBwu6SH2FvM2MFyFMIPtWbZGklWj0ofuRCYExJQNoAphFhrS1qfnhXDFzDuBk=
X-Gm-Gg: ASbGncsIBhaVoA+S+AIi23cnXmto2O/iu00wMEheJBI2hxb/T2u8KBTY5yCyCmrHJax
	RVXx5P4VEJEbPPkuZylpBeTVD8B5pzKd95RzpQWp265bMo6E5XMMmrHSQraQFR7+ia1/5lM1tJx
	gvz710PiQFSXRF1aC1ibTcN8/AAzSXGmmwih0Qn40jafLDyzdGAoIrqemrlvHv6KxFB+4TYUc5B
	P4Km9NzNsymoSEv4fd0BSG3pC5QBSmO68FVk2C3hUamWPzvBEhFEx2Wzr9Aa3Ww5O/8zud3Jn3S
	b0aawaonp820XNh41L1SBFE7ZeophSHlAAeoahDqRB6P/1EBuHxi5vWzHBJ39nhmEMASOdjenNm
	gaevTQysnyIvzhA==
X-Google-Smtp-Source: AGHT+IExljy5N60XbU6MXOLtCevb/N4vBZAyZbbO0mx88RZ5LF09j7uagInSYJoa9ykOQI9BYFdHuw==
X-Received: by 2002:ac8:7d0d:0:b0:476:7199:4da1 with SMTP id d75a77b69052e-47aec4c378cmr46007231cf.46.1744988054558;
        Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
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
Subject: [PATCH v5 6/7] clk: spacemit: define new syscons with only resets
Date: Fri, 18 Apr 2025 09:53:58 -0500
Message-ID: <20250418145401.2603648-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
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
index dfc8aa60d4345..c2f057aecb705 100644
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
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
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
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= rcpu2_reset_data,
+	.reset_num	= ARRAY_SIZE(rcpu2_reset_data),
+};
+
+static const struct ccu_reset_data apbc2_reset_data[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), 0),
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
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

