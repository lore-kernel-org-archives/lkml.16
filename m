Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B81F0990;
	Wed, 30 Apr 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995806; cv=none; b=fDV+WMIIjKvRg0I3uX+zNVvnrqdKDEjYSnthIG2amCrE4NBRfT4mvSAb/pVmG+/bRISQUOizOusjp6TP4SF2FEN4OaNex8gcQnqL019FoWh4PMhdUVnFunytYbBCDhzEZv33BhV155CjwPKgt4aiq35xAwc/otUBVYWXHyOceXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995806; c=relaxed/simple;
	bh=o7X/4GECjENDH1ijH4aYrFFLIfNbwXyik12NQU8Zssg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ellNxiJhWbkKOisJ6ngDt5t6PDxbu41yrdr9nz4v1R1myyY43ovLKile3PpGpKhQahPjSFZOGvZlYBTbKEqXvdkmsE+VTCuQaLjYWgwpdNcWzysH14J+AZFEp6gvgBMvnJAKbTrVVSDP8+EBYfZb5Cp/xxnertPKkb41ZuskAoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8FpuQKG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8FpuQKG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so11470362a12.2;
        Tue, 29 Apr 2025 23:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995802; x=1746600602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvJx3UmzS8dVjptlRaiQbYqyjCdjDtmMrhIbcXQbz5s=;
        b=H8FpuQKG/T/UbWqGkigFogOqKwLti+vZQwbZMFjO4rReWpio8BKpJHf5ELY3D2c/LL
         4fvW3RhInkFQH1CxQVTKCXbb3qmXxvghaPMJJ5moJn8Oqq/8XC82U5Ta7OOhaFWG+p5n
         xkY/JCN9pwmyw7dx+ILEnc7F01p22OAEDnJasL4SiN0XC3kQW72OTbVYNXdWOE8HffId
         WaeoicoiTLTDhXThcLvesloS5SMrm9kGd9bmPfgEmlRtvyA//lPE5EwkOBcgiC/j1m6R
         UdwsJyW0yKCU1OeeJyFetaz3M5vRArHzWlPSS0hgVhzytn9ULIgMk1botbCXx6zYNJQ+
         EZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995802; x=1746600602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvJx3UmzS8dVjptlRaiQbYqyjCdjDtmMrhIbcXQbz5s=;
        b=dkU+Qx+cwQjY5qGiOywlcHLBybkbPYTi3hOjpEQCknLl3JzBy8wSTPmGhQG1IiP4kU
         6lKTORBXGm4WYeD6lDvHHCrjmuHErQM/aJsY50TZIQ3ByA1/O8GVgLffwAvPZWvonn0x
         z6I5jlLAy1CaTvndNDSWqx5Y2TKsoEZNz5KTudyqTLwCqme2IO+Jnk1dPK+iKEeW6Azd
         6lPPKIFWql9pJ2Vcu8EhmByWHuq24nHX2IYaee0meLQm4Tupb+suJPTD1j2bHO7Sl8OP
         QjZN/vLsXc5tKiU7fuZ3JCQyW8kxvVjuTGYOUNmCwZh6ZAVxymcH6Li/N4pTPjxun1vX
         +dHA==
X-Forwarded-Encrypted: i=1; AJvYcCU+kneVqjFdwIbTCkpLDJlU1lFX5DfFYTOCPDaYG7iEJco2BgqCgkkTSs2z6LjSYvFu1zfSFd9vIUFc@vger.kernel.org, AJvYcCW958Phraj2g7qajw5suf9HopQ6Ygtq77oo+sslZjFJQKCLCubbM4J2rbnG6UOahZ88fWvcGKNmQE1F9NMk@vger.kernel.org, AJvYcCWYfg4gISalMXRhv1yWuGUBhl/VIX3Jn7L4S2S3EkZE1pfczyqmFWkyth6CikHSzk3xZRQOl0Pd/R5K@vger.kernel.org
X-Gm-Message-State: AOJu0YycHqRu4TwekGDxMS1/P/OOQjA6CclFJpjsMpMUsx2MbqKp8Vpn
	cmKRnvybHW1Bj15deK/QndXQwr/y47G6++bxCTiC3ILnq0yS2KpP
X-Gm-Gg: ASbGncvHbAntjIZ4lqpTf9DxTanUX2ch2tMpeTKktC8cmtL6fFBYqPoS7n4oXPrG9hO
	5uXoDijy6o0JQM5wWcZR/5oRhzvstEYsGdinhx413q0PpxajqlGZwnNEoFGim6u6FrwntQhkHOp
	LszsnXfgZnVIpTiKxjxd7J/TymgYR2iCKK4UwJ80nmkpG+Xgt/qTpBMAOYo0z/3aR8KZ48WsoEw
	lDRyxcXE0J81s5syXKdsr9An7k4OT4ZYdsx55Ag0VkLtbSdtP3GaJcWIu0pQ3WRjeV0OiFroZ67
	cu1iUCUlVXC5LIBY9tGK/tuUnaeyiw9RiTmXS70T/CbL8/MUojXUo0NdYCqIWq+8kLcFVHVbhu2
	ZS62W/i6nKNE=
X-Google-Smtp-Source: AGHT+IFdwliJt5x0A4qtfykEcwA+6DL4K6djtpFHi/OOI+ENvTwdlHFLjLx8LlsK+DOKmb5QvWM/iw==
X-Received: by 2002:a17:907:2d08:b0:ace:8398:b772 with SMTP id a640c23a62f3a-acee21ac4e6mr138915766b.14.1745995802224;
        Tue, 29 Apr 2025 23:50:02 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:50:01 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 08:49:53 +0200
Subject: [PATCH v5 6/8] clk: bcm281xx: Add corresponding bus clocks for
 peripheral clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kona-bus-clock-v5-6-46766b28b93a@gmail.com>
References: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
In-Reply-To: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=5998;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=o7X/4GECjENDH1ijH4aYrFFLIfNbwXyik12NQU8Zssg=;
 b=N7xhtirkIcicp56xw7cPbSiEEzBw3Dvr/xc44PyGtAx3UhldkU8DcJ9LdQVcoKueYC6qr6ViH
 DlRmOFnaM9uAIVOln+wb1+qT4q4x8kfOLtGDC0h86s5Lw89l1aQX0cF
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add bus clocks corresponding to peripheral clocks currently supported
by the BCM281xx clock driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Add this patch (BCM281xx bus clocks)
---
 drivers/clk/bcm/clk-bcm281xx.c | 127 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 62c3bf4656259261ae4f7d81dae48c90ab26c04e..13fd8a5ea8fa07bf6f3cca83b6b18e59a8de63df 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -59,7 +59,17 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
-#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+static struct bus_clk_data pmu_bsc_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 18, 3, 2),
+	.hyst		= HYST(0x0418, 10, 11),
+};
+
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
@@ -70,6 +80,10 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
+		[BCM281XX_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
+		[BCM281XX_AON_CCU_PMU_BSC_APB] =
+			KONA_CLK(aon, pmu_bsc_apb, bus),
 		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -178,7 +192,36 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
-#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 1, 0),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_ic_ahb_data = {
+	.gate		= HW_SW_GATE(0x0354, 16, 1, 0),
+};
+
+/* also called usbh_ahb */
+static struct bus_clk_data hsic2_ahb_data = {
+	.gate		= HW_SW_GATE(0x0370, 16, 1, 0),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 1, 0),
+};
+
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
@@ -197,6 +240,20 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
+		[BCM281XX_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM281XX_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_IC_AHB] =
+			KONA_CLK(master, usb_ic_ahb, bus),
+		[BCM281XX_MASTER_CCU_HSIC2_AHB] =
+			KONA_CLK(master, hsic2_ahb, bus),
+		[BCM281XX_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -309,7 +366,51 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
-#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE(0x0400, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE(0x0404, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE(0x0408, 16, 1, 0),
+};
+
+static struct bus_clk_data uartb4_apb_data = {
+	.gate		= HW_SW_GATE(0x040c, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp0_apb_data = {
+	.gate		= HW_SW_GATE(0x0410, 16, 1, 0),
+};
+
+static struct bus_clk_data ssp2_apb_data = {
+	.gate		= HW_SW_GATE(0x0418, 16, 1, 0),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE(0x0458, 16, 1, 0),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE(0x045c, 16, 1, 0),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE(0x0484, 16, 1, 0),
+	.hyst		= HYST(0x0484, 8, 9),
+};
+
+static struct bus_clk_data pwm_apb_data = {
+	.gate		= HW_SW_GATE(0x0468, 16, 1, 0),
+	.hyst		= HYST(0x0468, 8, 9),
+};
+
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
@@ -334,6 +435,26 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
+		[BCM281XX_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM281XX_SLAVE_CCU_UARTB4_APB] =
+			KONA_CLK(slave, uartb4_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP0_APB] =
+			KONA_CLK(slave, ssp0_apb, bus),
+		[BCM281XX_SLAVE_CCU_SSP2_APB] =
+			KONA_CLK(slave, ssp2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM281XX_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM281XX_SLAVE_CCU_PWM_APB] =
+			KONA_CLK(slave, pwm_apb, bus),
 		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.49.0

