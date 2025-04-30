Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1241F1315;
	Wed, 30 Apr 2025 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995804; cv=none; b=NqinCGlJNc/mIZ/NqgIzZmJr6Xzty/2IP725Ir20tKbBSyJEI4w+uJb1yusGvTpcqarDVDi3HMn855ShnlmdOv7qnFdsT+JHWDipIuj9YkoQoF9JVtfFx/1wkmdJkR97TIEANAkwc5WLpXBKh9cdF7Rg7JdK5dJXdCm/aNT18v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995804; c=relaxed/simple;
	bh=WjgxMXTcgwItgoKD3Gfx/jrI7CDJuRJs1NF5T26HbW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNIhLi2j2gWDi9ZD0Cb1afwd85KnVPUStQFd44Jr4H5lVvu38eRQk/qU8u2MOozp19lFntOF5bEFxCi8Rm8ZA/G0lEQDfKErkuP003AYEuNYyQW9T/Xh+eYamQ+hhzUJS7LPjxEBX0PsXLuXwZYMU4+pLn6/9qVSIOdsUumOVxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+u2QzDk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+u2QzDk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ace98258d4dso650948566b.2;
        Tue, 29 Apr 2025 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995801; x=1746600601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YoHxeLl8xpgurqNdYUhKuk/L00l3h3COXXZrxfE49E=;
        b=S+u2QzDkMPLqmty8WMHl1i2DprJpz12o7a9iLqnW9kQeXNGEpKgcb8DVenuOn1u2tc
         0zitAPlFKzIpY7CxEIkaac9c2jNzI2TunhCuBujsSY4cXWJ2mDFOibG1ERrZ/TTuuR7S
         rf/kR0Te4OL6KObkavnbDSudo2q5CNSumYDqYmZm8FALyCr4f+c0ohEA1YigbCyHw4UD
         1mPobDh2F7KM0MZ27TPvBJnZlpceL+W87R9mxg7GCIUhiDpdv/hbbM71orTKJXr5FpRL
         Dod5VwIdN+YMwZSHgOcUMntLUBEucQBTpZGILjo1neYL7Ye6D54X4fgEUQedzy3xdfQl
         610g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995801; x=1746600601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YoHxeLl8xpgurqNdYUhKuk/L00l3h3COXXZrxfE49E=;
        b=QwMu69DcquFNMiCXVCf717COEl5sdRn+hx295wQUAD3cKfQ6G6mcZSd21w/P1Z1yIo
         FRZ8V7KIpNvwKxWZ9izOJCXeE20CPIyJlU1zhqXyEeGqWXsVBT/FiAQNNj+P0sht9u9/
         +TkGJaUDgGJpqeXpYhD8vp+svIJ93rzfca+E6N8s941py/ZZUBBu61XbPLJaE79VT7dx
         W0mers+z6UKnOF/2PmrWRdg12dja8cr7S4WnexaKzTff5HDXeisEsR+Dsg6kTIS8Tw7M
         PvuBuEu/RYV0QvSfTB5jNor1X/4k3m1KfwiwJePvipL+UHpLp8drqryosfkCEhiZLOMj
         Es0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqXAIDRa5LVbPENxGiNhwm12cg2j9x2RnKAuelUmtpHqcgtUXqSXRZBt4zYaaLD+STVIfMq0P7xODb@vger.kernel.org, AJvYcCWJKG4d0U/MGFLUUsX2BoNQ636oUm6P+MTrJ9NDD/w4MUMEyIUlXdElCwxkhKgbUxedmaB81qnCjL7U@vger.kernel.org, AJvYcCXoCFg7rRTQPIOts7WnwQo/6UpCGSZOgH6AOd+SUDv0efLMun8XaALWZqDzvc0qA2C9sF7I+qvz8YUqRWcH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzp2OMpTYi6lb0vTZzAApeiOFWfam4IauDb8FRezraA/ypZcOI
	Yk0w0dNvB6MtCEI0KP6A/ahpFbeUhzyfA/qa1E6FoRkPYTQ1/sj+
X-Gm-Gg: ASbGncu6OXpfPxAmb9QoXr84MMPtpQBahqopAFrlepxTG/1rPpV5xyc+aVpyAs26oAp
	9sxFRXKz2yUTzlO72dmifOMYk464A9gjqqRbYcdMCYEgBgiJbigdhdUTWZeoCKdag2qLyF1YyOm
	A66eJRuLOHxud5NWr7aUHRjnA3X3DRbOXCoV3CSSx4JSNmKbfPqBOlet5p8h7xXIs6dDA7qQNSB
	/Ibx3q8HUV6zZQdPY3smyYNcsHcySn8w372Z2CjbVWTq84pc//FKfowy5D7zvCeBMLKrci3mZh6
	fN11XIQBvsL/VW/PyfuDqmTnCEqQnlkdGeTz/IP8wbCR7qEBJ2h9Lfe5Q8R33mO0GQpC2YPwS1Q
	o+z/k8I8ZwyQ=
X-Google-Smtp-Source: AGHT+IF6aR20r1djnYnFri4nliB+f7qiFvYNWiK+xI5qR2P3ExdhEB5X8eSN2GGcme2WhYpc9zmpmw==
X-Received: by 2002:a17:907:2d1f:b0:ac6:e327:8de7 with SMTP id a640c23a62f3a-acedc6f171amr186838566b.42.1745995800873;
        Tue, 29 Apr 2025 23:50:00 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:50:00 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 08:49:52 +0200
Subject: [PATCH v5 5/8] clk: bcm21664: Add corresponding bus clocks for
 peripheral clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kona-bus-clock-v5-5-46766b28b93a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=5067;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=WjgxMXTcgwItgoKD3Gfx/jrI7CDJuRJs1NF5T26HbW4=;
 b=gDKEHRU8iByW4Qe0RvqzaXoW+QQ8hc6NX4IDzn/tC3MotVK5LnzZ6lvN6COwtXgSytQfJ4HYh
 6uhTdWZiSMQD66B8OOGexHyNDpNSg19GRq6Dy6FEMiFuvkuv5M4/Jsq
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Now that bus clock support has been implemented into the Broadcom Kona
clock driver, add bus clocks corresponding to HUB_TIMER, SDIO, UART and
BSC, as well as the USB OTG bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename
- Change commit summary to match equivalent BCM281xx commit

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Adapt to dropped prereq clocks
---
 drivers/clk/bcm/clk-bcm21664.c | 89 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 14b7db824704824b4a6bfcce79308afa44e092c6..4223ac1c35a258bd30ba2bd4b240da6b1e88fa06 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -41,7 +41,12 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
-#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
@@ -52,6 +57,8 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
+		[BCM21664_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
 		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -126,7 +133,27 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
-#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 0, 1),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 0, 1),
+};
+
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
@@ -151,6 +178,16 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
+		[BCM21664_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM21664_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -231,7 +268,39 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
-#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0400, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0404, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0408, 16, 0, 1),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0458, 16, 0, 1),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x045c, 16, 0, 1),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0470, 16, 0, 1),
+	.hyst		= HYST(0x0470, 8, 9),
+};
+
+static struct bus_clk_data bsc4_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0474, 16, 0, 1),
+	.hyst		= HYST(0x0474, 8, 9),
+};
+
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
@@ -254,6 +323,20 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
+		[BCM21664_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC4_APB] =
+			KONA_CLK(slave, bsc4_apb, bus),
 		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.49.0

