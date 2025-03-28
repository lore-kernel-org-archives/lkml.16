Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4E51F0985
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195765; cv=none; b=ho1xAbNZpMvwZxedp/arYNY8RnzFZx6dLqykNVUNKV12Bg6iaGnE153YB5D+WMStk/rYiM+rFaW3/N7FXLZFdAC0WTfe0qlZD2QTvHWs2ArRcQDDtK0QeoewmiwcozMBOLDJ7uhIVrl9P0FoY4CASanornJZPebcQWm4QSsxCbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195765; c=relaxed/simple;
	bh=9zUPWZeOQ/R1eTEpGXSpH3rIudE06VzuWBvwIDMYYc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jvd40iN+AAgejWsG7GEYPr9yZYEPiKOHUgLI08L82Az42ASBaBomJkQhV6bfKdrgh/cVKvq2H1RC6HKzAPdopH/aZDRPUGgiP8ZEWyU9Q5BuE+mkiTvYy+s5U3fRfLLA051tlqibJxEN8107SWAYMIUD15BmkwsUOQtfKId9R9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1qtBhR06; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1qtBhR06"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d57143ee39so22426755ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195763; x=1743800563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndQqR2MnSXfwHsDu2XmXqV7CwtML+mkAPgKOSkm6+Z8=;
        b=1qtBhR06uYUfdRHvnoSFR41v9ab7EdJ+7XB3v0eIvgDl0zfO2znEYMwKoooXiCjBgq
         hINQS/j+a4HZ65IGuw/sxfQrH6ahrbY0LsFKNhNfaG/Rzrgz+YnHlzuYSA+1Zm9PxkQA
         YR/SrxPfTn1iZMCFAd2p7jDpCzqqvPxp6fMo+353zQDbjWOLzwOZ8F31mllreKjUtaMo
         9YXRELYotdZ2Rphm0MrXxkZvoy88khvBkLpXMRKPI/88d2MQGDfKFbwHBQwFVU1Zt4ue
         IRFV3VjR6yvxwEK7cd1eMp4BnJd7yDl1u3jQF5RdAeo6auFh0fEl2+UzMTnxzwihFkCz
         ggaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195763; x=1743800563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndQqR2MnSXfwHsDu2XmXqV7CwtML+mkAPgKOSkm6+Z8=;
        b=ThFJQv5Mp2quzp75+lHpazzrldNfR7sJdbDoXxlS/oDUHKs5ZRdQS1JMeZcWsfT/IT
         ky3WIfuWAMT6Yh+6YGhywJ2nnqTdKR/5PAjU/Sjsqa9208mAjz4qpiJDcwLMAig/jiHq
         8dDhyX8UHzm22eDVr7Fi9iFYliF6TRBTrWkFgrEbHvG8nMekai0Bws97oeKQ2nasi6KY
         rhmH2OzY+pHJzGRzxZoGuyvMyQiJLmjlI5sivkpCIIrBfAXvHqWtZ/w5Wu2/5PffzPMs
         N5/gNoX+qI17kjH022vFZ2O6ASC8QuAYKjpXTr2klEQ/jU8hnccuUXgYu0sjyCIQedI8
         3JfA==
X-Forwarded-Encrypted: i=1; AJvYcCUBgCW/jOh6+fkP3jl5tzyksfgRGgVTDCH9tnUQ6D7y6yPUfgCnTI+yAOfc0p8bLZB+SGdC63yjICUt6YY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCbxRV7nA11amRRUp7DbyOfEioHCvJFvbYkaTEWUx/7xS5K8V
	SjzBQHVAdb48ZCdUTguFZ7FsUOjDHp1ahi++rUIGoKaiqubfzb04yx9BeVK+eH+XnaJL4OcbhA6
	oCVyQsA==
X-Gm-Gg: ASbGncuwwoggNgMkzdRfraNa2Qf7s+634lBjw+eak5sHq8Dgz74WFQnwqNmVLlSJhiA
	NW3y4DME90/M4Sll47o8zFSwkhulMKPYugC9XV3f0lN2IKxXfSRfNHM8meVL7JrpoRfwwR++haq
	im3KTw2i7oKgFtgWVRi0JkDP4gptVahVwdZc4FzKzmMYBLIypr6ftS4INGLVuffs2HqVWkZAByV
	63zxxhYkw5vAKf55VmET11TzG2D/UMpOpc9zSgzGesUZ3K2zUraQtSr/82x4SzsPlV7cbcsS39P
	tDV/UFzRvY6T/6RqRLB71XHom2Sg1QvtQ4d7Ek9zBSw0aOfhSr5Mgs/eUPP1xUv14yGRX/Q0ViK
	MiEv4iHDKzcQ/WuDiXA==
X-Google-Smtp-Source: AGHT+IGYNBFx2dcGbCxvROlSnCzW59gk5DbZ/q57cPod8CZTD46n3GkkkCO+ZAW+eAHPbibdDHNAZA==
X-Received: by 2002:a05:6e02:184e:b0:3d4:35d3:87d3 with SMTP id e9e14a558f8ab-3d5e08e994fmr12120515ab.4.1743195763096;
        Fri, 28 Mar 2025 14:02:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:42 -0700 (PDT)
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
Subject: [PATCH v2 4/7] clk: spacemit: define existing syscon resets
Date: Fri, 28 Mar 2025 16:02:29 -0500
Message-ID: <20250328210233.1077035-5-elder@riscstar.com>
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

Define reset controls associated with the MPMU, APBC, and APMU
SpacemiT K1 CCUs.  These already have clocks associated with them.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Symbols are named RESET* and reset* rather than RST* and rst*

 drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 9c7c7108cfe38..f837d2c2f31fc 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -151,6 +151,13 @@ struct spacemit_ccu_data {
 	const struct ccu_reset_controller_data *reset_data;
 };
 
+#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{							\
+		.offset		= (_offset),			\
+		.assert_mask	= (_assert_mask),		\
+		.deassert_mask	= (_deassert_mask),		\
+	}
+
 struct ccu_reset_controller {
 	struct regmap *regmap;
 	const struct ccu_reset_controller_data *data;
@@ -1428,6 +1435,7 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
 
 static const struct spacemit_ccu_data k1_ccu_apbs_data = {
 	.clk		= k1_ccu_apbs_clks,
+	/* No resets in the APBS CCU */
 };
 
 static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
@@ -1467,8 +1475,18 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data mpmu_reset_data[] = {
+	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data mpmu_reset_controller_data = {
+	.count		= ARRAY_SIZE(mpmu_reset_data),
+	.data		= mpmu_reset_data,
+};
+
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
 	.clk		= k1_ccu_mpmu_clks,
+	.reset_data	= &mpmu_reset_controller_data,
 };
 
 static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
@@ -1575,8 +1593,68 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data apbc_reset_data[] = {
+	[RESET_UART0]	= RESET_DATA(APBC_UART1_CLK_RST,	BIT(2),	0),
+	[RESET_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2), 0),
+	[RESET_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RESET_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_SSP3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RESET_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2), 0),
+	[RESET_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
+	[RESET_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RESET_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RESET_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RESET_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
+	[RESET_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RESET_IR]	= RESET_DATA(APBC_IR_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
+	[RESET_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI7]	= RESET_DATA(APBC_TWSI7_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
+	[RESET_IPC_AP2AUD] = RESET_DATA(APBC_IPC_AP2AUD_CLK_RST, BIT(2), 0),
+	[RESET_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2), 0),
+	[RESET_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2), 0),
+	[RESET_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2), 0),
+	[RESET_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2), 0),
+	[RESET_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2), 0),
+	[RESET_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2), 0),
+	[RESET_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data apbc_reset_controller_data = {
+	.count		= ARRAY_SIZE(apbc_reset_data),
+	.data		= apbc_reset_data,
+};
+
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
 	.clk		= k1_ccu_apbc_clks,
+	.reset_data	= &apbc_reset_controller_data,
 };
 
 static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
@@ -1645,8 +1723,62 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data apmu_reset_data[] = {
+	[RESET_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_CCIC1_PHY] = RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_USBP1_AXI] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_USB_AXI]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_USB3_0]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				      BIT(11) | BIT(10) | BIT(9)),
+	[RESET_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_QSPI_BUS] = RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AES]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC_X]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AUDIO]	= RESET_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
+				   BIT(3) | BIT(2) | BIT(0)),
+	[RESET_HDMI]	= RESET_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
+	[RESET_PCIE0]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE1]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE2]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_JPG]	= RESET_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_CCIC2PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_CCIC3PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(29)),
+	[RESET_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(1)),
+	[RESET_ISP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_ISP_CPP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
+	[RESET_ISP_BUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
+	[RESET_ISP_CI]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
+	[RESET_DPU_MCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RESET_DPU_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RESET_DPU_HCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RESET_DPU_SPIBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(4)),
+	[RESET_DPU_SPI_HBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RESET_MIPI]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
+	[RESET_MC]	= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data apmu_reset_controller_data = {
+	.count		= ARRAY_SIZE(apmu_reset_data),
+	.data		= apmu_reset_data,
+};
+
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
+	.reset_data	= &apmu_reset_controller_data,
 };
 
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
-- 
2.45.2

