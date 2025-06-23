Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E1F26058E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689431; cv=none; b=Z5rotRACdtgdfq7WYpt424fcRGq85+lgIqPan9ww5/ua87wh/KRiM0Ov2ZilJQ2kL3BN0vIgVp9LiwzdCXDJys4tI7eGfx1/qMJ6a4pvriRIza50QrxnbUaum1Is58jgG08pV831no8IwLYr7W/FlsdAaq/AeDH8rAygfvRn/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689431; c=relaxed/simple;
	bh=3i4jQEtQX+L9Eq2t6KV8GKnfogkMywvb9KQaoKM/ncE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MHJWPri7ZpyNRqD7RzHl7kcXPGcQXBrykJrxUv1yHAb7PYcTGElLWKiWqIOFtP0YVCCSfpK5E9TcbppSviyCTjgHsP+uLDrMzYyXo8rclm3UNtZdq1qMG4ZP22FNXLV6JV6Dd1bRBFkTjpwM6QG9ePmZGNYUk5IUiQtWh9AXR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tt3xx8WG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tt3xx8WG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so41363035e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750689424; x=1751294224; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLw4sJBpHIt3uyA1434ZtjTQEfTknoQ3X9sNKQBLmeY=;
        b=tt3xx8WGWAf1LUBzFsAhU2qzN9bWGjS/fZz5J8siCtPlTJeaNHoM5u7j5eL6QMc1AO
         PIIK9UKv3bHDHgUUMaVD6fKWi7BbP1zB5Q/ypLvMKsLCweyRPNaifQJGsOPcyKNrj97f
         W5UQyJUgQzOZ0PIM09Bi2J0i7kSR8N0+TP4kJOusG1bYt7rkcpCQbLU2/Xt5JffB92c1
         QFCPRLAvX0KhGJN4P2+ny/TIflOaUhnkJ4UH1xmlik4eRBMm8Fgy3/e5CmORBUK1ES2l
         1JuAJRWXzgW9pEapJ/2hhBHHLfcdbQhHj+XoByvDnHbE7QN7xik0l5SJ08KDTHJlvcDJ
         nexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689424; x=1751294224;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLw4sJBpHIt3uyA1434ZtjTQEfTknoQ3X9sNKQBLmeY=;
        b=ebrTshOHTQkOSQegJCHq9ZUcz0Tmyd2p4fs3LamvWAqQ5GNGidWxuYlUyj1QVPr2sS
         sQFPoE8NQWiZBfqIBTIE7AXTkov/xRKvamSMs5BGw7tg6yfxLShpczVkQYiWPyAcAhX2
         gVbsMbBzPF8vFotR9sH8fp1iCJtgI/IMEISw0c2ZD7GYLLd554F0BzXQhSR5s+RIk4hR
         8TITixS/3s10uAGrS9jwMiS63SGB7Vpxh1vffS/E07og+D3TtuCCnCbQ5KKVtUW8dylK
         GnTv9fiT4R94ScY3gauoh6b2NYbO9pZfJpcg7c5CkbfLtSE7NxZKSgfGwed4nFhdcgbj
         LAYA==
X-Gm-Message-State: AOJu0Yx72X4XSBdpUiDToo48kTP34dDPb3FkvgRGIBUnMHqFgapSzaPZ
	94BiTlu4bZLdIcHb8YLks/2O3vq0729bhmUZa9JGHgm9CZ2v+D5o18b3VNOLNMDCHFA=
X-Gm-Gg: ASbGncujYl2iZRxEyxH2E1xiY2UxzKJXP+eJsMWMPvQj6F2pcVZCPakBUXkKsKjy0hb
	eunq3UKQtcPgc9QLa2EJDkJMWVTQW1s/SMq+RP4JT3b5UHQp0ZEPuxxU1G3idSMv9rQ+XK3Z7vd
	Sh/GD3t2/OI93BC+TLgVSWZji6UsM81JCz9K5CWWuy0BAPXVhAoEyZ3gWtYH1fR4afQV0oEhS7o
	Dhm4v/gFG716E8vec6BlrkoP6IBMDB4eCZkGDvni+KkoBEfDdwSg19k0lcqk79+jq0opqtXVTJk
	sMyzth/Rgfs+XDcq0nwC7Vi14sN/NlpMwJLaRKraS9KYK2f+hOl/wi3Ngaq/KHbV5l2OnE8yll8
	Y
X-Google-Smtp-Source: AGHT+IH5piewyLlcy+0SGKa/1LeFLd+cwTz+uB+lv2H3H+xVmuVweOCEGkMRiGdXwe6AqoV9QXHwfg==
X-Received: by 2002:a05:600c:3b84:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-453657bf26bmr110395425e9.13.1750689424080;
        Mon, 23 Jun 2025 07:37:04 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4536470826fsm111111965e9.36.2025.06.23.07.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:37:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Jun 2025 16:37:00 +0200
Subject: [PATCH] clk: amlogic: remove unnecessary headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAItmWWgC/x3MQQqDMBBG4avIrB0wUbPwKtLFYH6boW1SMiCCe
 PeGLr/FexcZqsJo6S6qONS05AbXd7QlyU+wxmbyg5+H4Efe3i/+wErmXDhBIqrxOAUnEO+izNT
 Sb8Wu53+7Pu77Bx6j4jdmAAAA
X-Change-ID: 20250623-clk-meson-no-headers-3461aea21da5
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=55908; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3i4jQEtQX+L9Eq2t6KV8GKnfogkMywvb9KQaoKM/ncE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWWaOsDrcLA1sXNXhAhRDFRpbZKg4/6BPJZi3A
 Lj7NMdUXISJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFlmjgAKCRDm/A8cN/La
 hRhbEACH9xUDIjhmlX3ojkGWOIRuua6Abn/vEqA8vfWfn+2L9Aa4YRp4c/TtOvU1fGbWDqqUtH1
 icG6Mmk3pqYZfmKaVcLLqQHXsBJWpDpjQhvZ1/WdMvdpZJMAx97wLtKD3ZKXf1bcKmvAMi4rh95
 pjxuHO0KezjXfGavmZ2aGPQZtx98qP3VZqcx6Gx0aXc/h+cQNOp90mN3RDEkhZ5V6z9Adp8/5T9
 5H0TUmE5NbyMpLFrcweSSt23nUTRrY7V3jksEdcTQKmI80cxcHM6L9tPa+025Yh0+YO6IaeSl3B
 96GEayIp4a+nd+43qqPIdCGKsv2adCCctYDbto/2WbBNHDZ+tS74eQvLYVmTxsbqjc3rH4cMvro
 6nMPMUDKuwt1m9P54DtEVUTgVodOXwZ6yB90afKw/q3HzupeGzhFLxX3IfVxtSs2fo3xoeEDtya
 5h5Eltul827MnglmsghGnRAcA4CRDbIAQq0WUZf6Va0Lns95FtNMhPqaA311jKs2HrhQyjOU2Kc
 54pEvRUJp7TRNl+8vgOXk8eyQbig9m9n42oG2+tPTp+KBl4fsaKoj42keuGnfhRCLoqlLcyQtiu
 CHSW8pjsEQ0dKIqYM0w7DoT99cU4pZpPoWxrS5m4vS7aasjX46xVGQDtfMkVouaq4gO2Uy3FIe8
 FKb9zaXxE2TIFDQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Some Amlogic clock controller drivers have a dedicated headers file, some
do not. Over time, these headers have evolved and now only carry register
offset definitions. These offsets are only used by the related controller
and are not meant to be shared.

These headers are not serving any purpose now.

Start enforcing some consistency between the different Amlogic clock
drivers and move the register offset definitions to the related driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/a1-peripherals.c |  31 ++++++++-
 drivers/clk/meson/a1-peripherals.h |  46 -------------
 drivers/clk/meson/a1-pll.c         |  12 +++-
 drivers/clk/meson/a1-pll.h         |  28 --------
 drivers/clk/meson/axg-audio.c      |  57 +++++++++++++++-
 drivers/clk/meson/axg-audio.h      |  70 --------------------
 drivers/clk/meson/axg.c            |  87 ++++++++++++++++++++++++-
 drivers/clk/meson/axg.h            | 105 ------------------------------
 drivers/clk/meson/g12a.c           | 111 ++++++++++++++++++++++++++++++-
 drivers/clk/meson/g12a.h           | 130 -------------------------------------
 drivers/clk/meson/gxbb.c           |  99 +++++++++++++++++++++++++++-
 drivers/clk/meson/gxbb.h           | 115 --------------------------------
 drivers/clk/meson/meson8b.c        |  67 ++++++++++++++++++-
 drivers/clk/meson/meson8b.h        |  80 -----------------------
 drivers/clk/meson/s4-peripherals.c |  47 +++++++++++++-
 drivers/clk/meson/s4-peripherals.h |  56 ----------------
 drivers/clk/meson/s4-pll.c         |  29 ++++++++-
 drivers/clk/meson/s4-pll.h         |  38 -----------
 18 files changed, 531 insertions(+), 677 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 36489e0f948a544d7ef95bc34381b83b2bee30b4..8ae02df3490b4242a59b07266c741cb50dbf7b97 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -10,13 +10,42 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
-#include "a1-peripherals.h"
 #include "clk-dualdiv.h"
 #include "clk-regmap.h"
 #include "meson-clkc-utils.h"
 
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
 
+#define SYS_OSCIN_CTRL		0x0
+#define RTC_BY_OSCIN_CTRL0	0x4
+#define RTC_BY_OSCIN_CTRL1	0x8
+#define RTC_CTRL		0xc
+#define SYS_CLK_CTRL0		0x10
+#define SYS_CLK_EN0		0x1c
+#define SYS_CLK_EN1		0x20
+#define AXI_CLK_EN		0x24
+#define DSPA_CLK_EN		0x28
+#define DSPB_CLK_EN		0x2c
+#define DSPA_CLK_CTRL0		0x30
+#define DSPB_CLK_CTRL0		0x34
+#define CLK12_24_CTRL		0x38
+#define GEN_CLK_CTRL		0x3c
+#define SAR_ADC_CLK_CTRL	0xc0
+#define PWM_CLK_AB_CTRL		0xc4
+#define PWM_CLK_CD_CTRL		0xc8
+#define PWM_CLK_EF_CTRL		0xcc
+#define SPICC_CLK_CTRL		0xd0
+#define TS_CLK_CTRL		0xd4
+#define SPIFC_CLK_CTRL		0xd8
+#define USB_BUSCLK_CTRL		0xdc
+#define SD_EMMC_CLK_CTRL	0xe0
+#define CECA_CLK_CTRL0		0xe4
+#define CECA_CLK_CTRL1		0xe8
+#define CECB_CLK_CTRL0		0xec
+#define CECB_CLK_CTRL1		0xf0
+#define PSRAM_CLK_CTRL		0xf4
+#define DMC_CLK_CTRL		0xf8
+
 static struct clk_regmap xtal_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
diff --git a/drivers/clk/meson/a1-peripherals.h b/drivers/clk/meson/a1-peripherals.h
deleted file mode 100644
index 26de8530184ad7219aeb0767a9fff1a2de33afe6..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/a1-peripherals.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Amlogic A1 Peripherals Clock Controller internals
- *
- * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
- * Author: Jian Hu <jian.hu@amlogic.com>
- *
- * Copyright (c) 2023, SberDevices. All Rights Reserved.
- * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
- */
-
-#ifndef __A1_PERIPHERALS_H
-#define __A1_PERIPHERALS_H
-
-/* peripherals clock controller register offset */
-#define SYS_OSCIN_CTRL		0x0
-#define RTC_BY_OSCIN_CTRL0	0x4
-#define RTC_BY_OSCIN_CTRL1	0x8
-#define RTC_CTRL		0xc
-#define SYS_CLK_CTRL0		0x10
-#define SYS_CLK_EN0		0x1c
-#define SYS_CLK_EN1		0x20
-#define AXI_CLK_EN		0x24
-#define DSPA_CLK_EN		0x28
-#define DSPB_CLK_EN		0x2c
-#define DSPA_CLK_CTRL0		0x30
-#define DSPB_CLK_CTRL0		0x34
-#define CLK12_24_CTRL		0x38
-#define GEN_CLK_CTRL		0x3c
-#define SAR_ADC_CLK_CTRL	0xc0
-#define PWM_CLK_AB_CTRL		0xc4
-#define PWM_CLK_CD_CTRL		0xc8
-#define PWM_CLK_EF_CTRL		0xcc
-#define SPICC_CLK_CTRL		0xd0
-#define TS_CLK_CTRL		0xd4
-#define SPIFC_CLK_CTRL		0xd8
-#define USB_BUSCLK_CTRL		0xdc
-#define SD_EMMC_CLK_CTRL	0xe0
-#define CECA_CLK_CTRL0		0xe4
-#define CECA_CLK_CTRL1		0xe8
-#define CECB_CLK_CTRL0		0xec
-#define CECB_CLK_CTRL1		0xf0
-#define PSRAM_CLK_CTRL		0xf4
-#define DMC_CLK_CTRL		0xf8
-
-#endif /* __A1_PERIPHERALS_H */
diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 86d8159f331999cd3a8a8bc8ac520ee420ada30a..f0ba283cf1d0754bfe48e2e67b0d0b89498100a5 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -10,10 +10,20 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
-#include "a1-pll.h"
+#include "clk-pll.h"
 #include "clk-regmap.h"
 #include "meson-clkc-utils.h"
 
+#define ANACTRL_FIXPLL_CTRL0	0x0
+#define ANACTRL_FIXPLL_CTRL1	0x4
+#define ANACTRL_FIXPLL_STS	0x14
+#define ANACTRL_HIFIPLL_CTRL0	0xc0
+#define ANACTRL_HIFIPLL_CTRL1	0xc4
+#define ANACTRL_HIFIPLL_CTRL2	0xc8
+#define ANACTRL_HIFIPLL_CTRL3	0xcc
+#define ANACTRL_HIFIPLL_CTRL4	0xd0
+#define ANACTRL_HIFIPLL_STS	0xd4
+
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 
 static struct clk_regmap fixed_pll_dco = {
diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
deleted file mode 100644
index 4be17b2bf383e8c9176107291c9c36a0332cd0a2..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/a1-pll.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Amlogic A1 PLL Clock Controller internals
- *
- * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
- * Author: Jian Hu <jian.hu@amlogic.com>
- *
- * Copyright (c) 2023, SberDevices. All Rights Reserved.
- * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
- */
-
-#ifndef __A1_PLL_H
-#define __A1_PLL_H
-
-#include "clk-pll.h"
-
-/* PLL register offset */
-#define ANACTRL_FIXPLL_CTRL0	0x0
-#define ANACTRL_FIXPLL_CTRL1	0x4
-#define ANACTRL_FIXPLL_STS	0x14
-#define ANACTRL_HIFIPLL_CTRL0	0xc0
-#define ANACTRL_HIFIPLL_CTRL1	0xc4
-#define ANACTRL_HIFIPLL_CTRL2	0xc8
-#define ANACTRL_HIFIPLL_CTRL3	0xcc
-#define ANACTRL_HIFIPLL_CTRL4	0xd0
-#define ANACTRL_HIFIPLL_STS	0xd4
-
-#endif /* __A1_PLL_H */
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 3948f5d0faca372dd5cc4ed6dc95f9c89fe5bae8..22940475343503c88b16b6b0e809290d9848a0d9 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -16,13 +16,68 @@
 #include <linux/slab.h>
 
 #include "meson-clkc-utils.h"
-#include "axg-audio.h"
 #include "clk-regmap.h"
 #include "clk-phase.h"
 #include "sclk-div.h"
 
 #include <dt-bindings/clock/axg-audio-clkc.h>
 
+/* Audio clock register offsets */
+#define AUDIO_CLK_GATE_EN	0x000
+#define AUDIO_MCLK_A_CTRL	0x004
+#define AUDIO_MCLK_B_CTRL	0x008
+#define AUDIO_MCLK_C_CTRL	0x00C
+#define AUDIO_MCLK_D_CTRL	0x010
+#define AUDIO_MCLK_E_CTRL	0x014
+#define AUDIO_MCLK_F_CTRL	0x018
+#define AUDIO_MST_PAD_CTRL0	0x01c
+#define AUDIO_MST_PAD_CTRL1	0x020
+#define AUDIO_SW_RESET		0x024
+#define AUDIO_MST_A_SCLK_CTRL0	0x040
+#define AUDIO_MST_A_SCLK_CTRL1	0x044
+#define AUDIO_MST_B_SCLK_CTRL0	0x048
+#define AUDIO_MST_B_SCLK_CTRL1	0x04C
+#define AUDIO_MST_C_SCLK_CTRL0	0x050
+#define AUDIO_MST_C_SCLK_CTRL1	0x054
+#define AUDIO_MST_D_SCLK_CTRL0	0x058
+#define AUDIO_MST_D_SCLK_CTRL1	0x05C
+#define AUDIO_MST_E_SCLK_CTRL0	0x060
+#define AUDIO_MST_E_SCLK_CTRL1	0x064
+#define AUDIO_MST_F_SCLK_CTRL0	0x068
+#define AUDIO_MST_F_SCLK_CTRL1	0x06C
+#define AUDIO_CLK_TDMIN_A_CTRL	0x080
+#define AUDIO_CLK_TDMIN_B_CTRL	0x084
+#define AUDIO_CLK_TDMIN_C_CTRL	0x088
+#define AUDIO_CLK_TDMIN_LB_CTRL 0x08C
+#define AUDIO_CLK_TDMOUT_A_CTRL 0x090
+#define AUDIO_CLK_TDMOUT_B_CTRL 0x094
+#define AUDIO_CLK_TDMOUT_C_CTRL 0x098
+#define AUDIO_CLK_SPDIFIN_CTRL	0x09C
+#define AUDIO_CLK_SPDIFOUT_CTRL 0x0A0
+#define AUDIO_CLK_RESAMPLE_CTRL 0x0A4
+#define AUDIO_CLK_LOCKER_CTRL	0x0A8
+#define AUDIO_CLK_PDMIN_CTRL0	0x0AC
+#define AUDIO_CLK_PDMIN_CTRL1	0x0B0
+#define AUDIO_CLK_SPDIFOUT_B_CTRL 0x0B4
+
+/* SM1 introduce new register and some shifts :( */
+#define AUDIO_CLK_GATE_EN1	0x004
+#define AUDIO_SM1_MCLK_A_CTRL	0x008
+#define AUDIO_SM1_MCLK_B_CTRL	0x00C
+#define AUDIO_SM1_MCLK_C_CTRL	0x010
+#define AUDIO_SM1_MCLK_D_CTRL	0x014
+#define AUDIO_SM1_MCLK_E_CTRL	0x018
+#define AUDIO_SM1_MCLK_F_CTRL	0x01C
+#define AUDIO_SM1_MST_PAD_CTRL0	0x020
+#define AUDIO_SM1_MST_PAD_CTRL1	0x024
+#define AUDIO_SM1_SW_RESET0	0x028
+#define AUDIO_SM1_SW_RESET1	0x02C
+#define AUDIO_CLK81_CTRL	0x030
+#define AUDIO_CLK81_EN		0x034
+#define AUDIO_EARCRX_CMDC_CLK_CTRL	0x0D0
+#define AUDIO_EARCRX_DMAC_CLK_CTRL	0x0D4
+
+
 #define AUD_GATE(_name, _reg, _bit, _pname, _iflags) {			\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (_reg),					\
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
deleted file mode 100644
index 9e7765b630c96a8029140539ffda789b7db5277a..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/axg-audio.h
+++ /dev/null
@@ -1,70 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- * Copyright (c) 2018 BayLibre, SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- */
-
-#ifndef __AXG_AUDIO_CLKC_H
-#define __AXG_AUDIO_CLKC_H
-
-/*
- * Audio Clock  register offsets
- *
- * Register offsets from the datasheet must be multiplied by 4 before
- * to get the right offset
- */
-#define AUDIO_CLK_GATE_EN	0x000
-#define AUDIO_MCLK_A_CTRL	0x004
-#define AUDIO_MCLK_B_CTRL	0x008
-#define AUDIO_MCLK_C_CTRL	0x00C
-#define AUDIO_MCLK_D_CTRL	0x010
-#define AUDIO_MCLK_E_CTRL	0x014
-#define AUDIO_MCLK_F_CTRL	0x018
-#define AUDIO_MST_PAD_CTRL0	0x01c
-#define AUDIO_MST_PAD_CTRL1	0x020
-#define AUDIO_SW_RESET		0x024
-#define AUDIO_MST_A_SCLK_CTRL0	0x040
-#define AUDIO_MST_A_SCLK_CTRL1	0x044
-#define AUDIO_MST_B_SCLK_CTRL0	0x048
-#define AUDIO_MST_B_SCLK_CTRL1	0x04C
-#define AUDIO_MST_C_SCLK_CTRL0	0x050
-#define AUDIO_MST_C_SCLK_CTRL1	0x054
-#define AUDIO_MST_D_SCLK_CTRL0	0x058
-#define AUDIO_MST_D_SCLK_CTRL1	0x05C
-#define AUDIO_MST_E_SCLK_CTRL0	0x060
-#define AUDIO_MST_E_SCLK_CTRL1	0x064
-#define AUDIO_MST_F_SCLK_CTRL0	0x068
-#define AUDIO_MST_F_SCLK_CTRL1	0x06C
-#define AUDIO_CLK_TDMIN_A_CTRL	0x080
-#define AUDIO_CLK_TDMIN_B_CTRL	0x084
-#define AUDIO_CLK_TDMIN_C_CTRL	0x088
-#define AUDIO_CLK_TDMIN_LB_CTRL 0x08C
-#define AUDIO_CLK_TDMOUT_A_CTRL 0x090
-#define AUDIO_CLK_TDMOUT_B_CTRL 0x094
-#define AUDIO_CLK_TDMOUT_C_CTRL 0x098
-#define AUDIO_CLK_SPDIFIN_CTRL	0x09C
-#define AUDIO_CLK_SPDIFOUT_CTRL 0x0A0
-#define AUDIO_CLK_RESAMPLE_CTRL 0x0A4
-#define AUDIO_CLK_LOCKER_CTRL	0x0A8
-#define AUDIO_CLK_PDMIN_CTRL0	0x0AC
-#define AUDIO_CLK_PDMIN_CTRL1	0x0B0
-#define AUDIO_CLK_SPDIFOUT_B_CTRL 0x0B4
-
-/* SM1 introduce new register and some shifts :( */
-#define AUDIO_CLK_GATE_EN1	0x004
-#define AUDIO_SM1_MCLK_A_CTRL	0x008
-#define AUDIO_SM1_MCLK_B_CTRL	0x00C
-#define AUDIO_SM1_MCLK_C_CTRL	0x010
-#define AUDIO_SM1_MCLK_D_CTRL	0x014
-#define AUDIO_SM1_MCLK_E_CTRL	0x018
-#define AUDIO_SM1_MCLK_F_CTRL	0x01C
-#define AUDIO_SM1_MST_PAD_CTRL0	0x020
-#define AUDIO_SM1_MST_PAD_CTRL1	0x024
-#define AUDIO_SM1_SW_RESET0	0x028
-#define AUDIO_SM1_SW_RESET1	0x02C
-#define AUDIO_CLK81_CTRL	0x030
-#define AUDIO_CLK81_EN		0x034
-#define AUDIO_EARCRX_CMDC_CLK_CTRL	0x0D0
-#define AUDIO_EARCRX_DMAC_CLK_CTRL	0x0D4
-
-#endif /*__AXG_AUDIO_CLKC_H */
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 448eece246ca752da576d257b33f822ec92f4192..766764b50b36609784b0122656890a6de7154012 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -18,11 +18,96 @@
 #include "clk-regmap.h"
 #include "clk-pll.h"
 #include "clk-mpll.h"
-#include "axg.h"
 #include "meson-eeclk.h"
 
 #include <dt-bindings/clock/axg-clkc.h>
 
+#define HHI_GP0_PLL_CNTL		0x40
+#define HHI_GP0_PLL_CNTL2		0x44
+#define HHI_GP0_PLL_CNTL3		0x48
+#define HHI_GP0_PLL_CNTL4		0x4c
+#define HHI_GP0_PLL_CNTL5		0x50
+#define HHI_GP0_PLL_STS			0x54
+#define HHI_GP0_PLL_CNTL1		0x58
+#define HHI_HIFI_PLL_CNTL		0x80
+#define HHI_HIFI_PLL_CNTL2		0x84
+#define HHI_HIFI_PLL_CNTL3		0x88
+#define HHI_HIFI_PLL_CNTL4		0x8C
+#define HHI_HIFI_PLL_CNTL5		0x90
+#define HHI_HIFI_PLL_STS		0x94
+#define HHI_HIFI_PLL_CNTL1		0x98
+
+#define HHI_XTAL_DIVN_CNTL		0xbc
+#define HHI_GCLK2_MPEG0			0xc0
+#define HHI_GCLK2_MPEG1			0xc4
+#define HHI_GCLK2_MPEG2			0xc8
+#define HHI_GCLK2_OTHER			0xd0
+#define HHI_GCLK2_AO			0xd4
+#define HHI_PCIE_PLL_CNTL		0xd8
+#define HHI_PCIE_PLL_CNTL1		0xdC
+#define HHI_PCIE_PLL_CNTL2		0xe0
+#define HHI_PCIE_PLL_CNTL3		0xe4
+#define HHI_PCIE_PLL_CNTL4		0xe8
+#define HHI_PCIE_PLL_CNTL5		0xec
+#define HHI_PCIE_PLL_CNTL6		0xf0
+#define HHI_PCIE_PLL_STS		0xf4
+
+#define HHI_MEM_PD_REG0			0x100
+#define HHI_VPU_MEM_PD_REG0		0x104
+#define HHI_VIID_CLK_DIV		0x128
+#define HHI_VIID_CLK_CNTL		0x12c
+
+#define HHI_GCLK_MPEG0			0x140
+#define HHI_GCLK_MPEG1			0x144
+#define HHI_GCLK_MPEG2			0x148
+#define HHI_GCLK_OTHER			0x150
+#define HHI_GCLK_AO			0x154
+#define HHI_SYS_CPU_CLK_CNTL1		0x15c
+#define HHI_SYS_CPU_RESET_CNTL		0x160
+#define HHI_VID_CLK_DIV			0x164
+#define HHI_SPICC_HCLK_CNTL		0x168
+
+#define HHI_MPEG_CLK_CNTL		0x174
+#define HHI_VID_CLK_CNTL		0x17c
+#define HHI_TS_CLK_CNTL			0x190
+#define HHI_VID_CLK_CNTL2		0x194
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c
+#define HHI_VID_PLL_CLK_DIV		0x1a0
+#define HHI_VPU_CLK_CNTL		0x1bC
+
+#define HHI_VAPBCLK_CNTL		0x1F4
+
+#define HHI_GEN_CLK_CNTL		0x228
+
+#define HHI_VDIN_MEAS_CLK_CNTL		0x250
+#define HHI_NAND_CLK_CNTL		0x25C
+#define HHI_SD_EMMC_CLK_CNTL		0x264
+
+#define HHI_MPLL_CNTL			0x280
+#define HHI_MPLL_CNTL2			0x284
+#define HHI_MPLL_CNTL3			0x288
+#define HHI_MPLL_CNTL4			0x28C
+#define HHI_MPLL_CNTL5			0x290
+#define HHI_MPLL_CNTL6			0x294
+#define HHI_MPLL_CNTL7			0x298
+#define HHI_MPLL_CNTL8			0x29C
+#define HHI_MPLL_CNTL9			0x2A0
+#define HHI_MPLL_CNTL10			0x2A4
+
+#define HHI_MPLL3_CNTL0			0x2E0
+#define HHI_MPLL3_CNTL1			0x2E4
+#define HHI_PLL_TOP_MISC		0x2E8
+
+#define HHI_SYS_PLL_CNTL1		0x2FC
+#define HHI_SYS_PLL_CNTL		0x300
+#define HHI_SYS_PLL_CNTL2		0x304
+#define HHI_SYS_PLL_CNTL3		0x308
+#define HHI_SYS_PLL_CNTL4		0x30c
+#define HHI_SYS_PLL_CNTL5		0x310
+#define HHI_SYS_PLL_STS			0x314
+#define HHI_DPLL_TOP_I			0x318
+#define HHI_DPLL_TOP2_I			0x31C
+
 static struct clk_regmap axg_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
deleted file mode 100644
index 624d8d3ce7c424b258e1994b6ffba1cfa0d676e4..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/axg.h
+++ /dev/null
@@ -1,105 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2016 AmLogic, Inc.
- * Author: Michael Turquette <mturquette@baylibre.com>
- *
- * Copyright (c) 2017 Amlogic, inc.
- * Author: Qiufang Dai <qiufang.dai@amlogic.com>
- *
- */
-#ifndef __AXG_H
-#define __AXG_H
-
-/*
- * Clock controller register offsets
- *
- * Register offsets from the data sheet must be multiplied by 4 before
- * adding them to the base address to get the right value.
- */
-#define HHI_GP0_PLL_CNTL		0x40
-#define HHI_GP0_PLL_CNTL2		0x44
-#define HHI_GP0_PLL_CNTL3		0x48
-#define HHI_GP0_PLL_CNTL4		0x4c
-#define HHI_GP0_PLL_CNTL5		0x50
-#define HHI_GP0_PLL_STS			0x54
-#define HHI_GP0_PLL_CNTL1		0x58
-#define HHI_HIFI_PLL_CNTL		0x80
-#define HHI_HIFI_PLL_CNTL2		0x84
-#define HHI_HIFI_PLL_CNTL3		0x88
-#define HHI_HIFI_PLL_CNTL4		0x8C
-#define HHI_HIFI_PLL_CNTL5		0x90
-#define HHI_HIFI_PLL_STS		0x94
-#define HHI_HIFI_PLL_CNTL1		0x98
-
-#define HHI_XTAL_DIVN_CNTL		0xbc
-#define HHI_GCLK2_MPEG0			0xc0
-#define HHI_GCLK2_MPEG1			0xc4
-#define HHI_GCLK2_MPEG2			0xc8
-#define HHI_GCLK2_OTHER			0xd0
-#define HHI_GCLK2_AO			0xd4
-#define HHI_PCIE_PLL_CNTL		0xd8
-#define HHI_PCIE_PLL_CNTL1		0xdC
-#define HHI_PCIE_PLL_CNTL2		0xe0
-#define HHI_PCIE_PLL_CNTL3		0xe4
-#define HHI_PCIE_PLL_CNTL4		0xe8
-#define HHI_PCIE_PLL_CNTL5		0xec
-#define HHI_PCIE_PLL_CNTL6		0xf0
-#define HHI_PCIE_PLL_STS		0xf4
-
-#define HHI_MEM_PD_REG0			0x100
-#define HHI_VPU_MEM_PD_REG0		0x104
-#define HHI_VIID_CLK_DIV		0x128
-#define HHI_VIID_CLK_CNTL		0x12c
-
-#define HHI_GCLK_MPEG0			0x140
-#define HHI_GCLK_MPEG1			0x144
-#define HHI_GCLK_MPEG2			0x148
-#define HHI_GCLK_OTHER			0x150
-#define HHI_GCLK_AO			0x154
-#define HHI_SYS_CPU_CLK_CNTL1		0x15c
-#define HHI_SYS_CPU_RESET_CNTL		0x160
-#define HHI_VID_CLK_DIV			0x164
-#define HHI_SPICC_HCLK_CNTL		0x168
-
-#define HHI_MPEG_CLK_CNTL		0x174
-#define HHI_VID_CLK_CNTL		0x17c
-#define HHI_TS_CLK_CNTL			0x190
-#define HHI_VID_CLK_CNTL2		0x194
-#define HHI_SYS_CPU_CLK_CNTL0		0x19c
-#define HHI_VID_PLL_CLK_DIV		0x1a0
-#define HHI_VPU_CLK_CNTL		0x1bC
-
-#define HHI_VAPBCLK_CNTL		0x1F4
-
-#define HHI_GEN_CLK_CNTL		0x228
-
-#define HHI_VDIN_MEAS_CLK_CNTL		0x250
-#define HHI_NAND_CLK_CNTL		0x25C
-#define HHI_SD_EMMC_CLK_CNTL		0x264
-
-#define HHI_MPLL_CNTL			0x280
-#define HHI_MPLL_CNTL2			0x284
-#define HHI_MPLL_CNTL3			0x288
-#define HHI_MPLL_CNTL4			0x28C
-#define HHI_MPLL_CNTL5			0x290
-#define HHI_MPLL_CNTL6			0x294
-#define HHI_MPLL_CNTL7			0x298
-#define HHI_MPLL_CNTL8			0x29C
-#define HHI_MPLL_CNTL9			0x2A0
-#define HHI_MPLL_CNTL10			0x2A4
-
-#define HHI_MPLL3_CNTL0			0x2E0
-#define HHI_MPLL3_CNTL1			0x2E4
-#define HHI_PLL_TOP_MISC		0x2E8
-
-#define HHI_SYS_PLL_CNTL1		0x2FC
-#define HHI_SYS_PLL_CNTL		0x300
-#define HHI_SYS_PLL_CNTL2		0x304
-#define HHI_SYS_PLL_CNTL3		0x308
-#define HHI_SYS_PLL_CNTL4		0x30c
-#define HHI_SYS_PLL_CNTL5		0x310
-#define HHI_SYS_PLL_STS			0x314
-#define HHI_DPLL_TOP_I			0x318
-#define HHI_DPLL_TOP2_I			0x31C
-
-#endif /* __AXG_H */
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d9e546e006d7e0b2af92fbcbb35498a00bd2fc6d..e59bae56a4a5c9604a63038ce79e904b91025d2a 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -24,10 +24,119 @@
 #include "vid-pll-div.h"
 #include "vclk.h"
 #include "meson-eeclk.h"
-#include "g12a.h"
 
 #include <dt-bindings/clock/g12a-clkc.h>
 
+#define HHI_MIPI_CNTL0			0x000
+#define HHI_MIPI_CNTL1			0x004
+#define HHI_MIPI_CNTL2			0x008
+#define HHI_MIPI_STS			0x00c
+#define HHI_GP0_PLL_CNTL0		0x040
+#define HHI_GP0_PLL_CNTL1		0x044
+#define HHI_GP0_PLL_CNTL2		0x048
+#define HHI_GP0_PLL_CNTL3		0x04c
+#define HHI_GP0_PLL_CNTL4		0x050
+#define HHI_GP0_PLL_CNTL5		0x054
+#define HHI_GP0_PLL_CNTL6		0x058
+#define HHI_GP0_PLL_STS			0x05c
+#define HHI_GP1_PLL_CNTL0		0x060
+#define HHI_GP1_PLL_CNTL1		0x064
+#define HHI_GP1_PLL_CNTL2		0x068
+#define HHI_GP1_PLL_CNTL3		0x06c
+#define HHI_GP1_PLL_CNTL4		0x070
+#define HHI_GP1_PLL_CNTL5		0x074
+#define HHI_GP1_PLL_CNTL6		0x078
+#define HHI_GP1_PLL_STS			0x07c
+#define HHI_PCIE_PLL_CNTL0		0x098
+#define HHI_PCIE_PLL_CNTL1		0x09c
+#define HHI_PCIE_PLL_CNTL2		0x0a0
+#define HHI_PCIE_PLL_CNTL3		0x0a4
+#define HHI_PCIE_PLL_CNTL4		0x0a8
+#define HHI_PCIE_PLL_CNTL5		0x0ac
+#define HHI_PCIE_PLL_STS		0x0b8
+#define HHI_HIFI_PLL_CNTL0		0x0d8
+#define HHI_HIFI_PLL_CNTL1		0x0dc
+#define HHI_HIFI_PLL_CNTL2		0x0e0
+#define HHI_HIFI_PLL_CNTL3		0x0e4
+#define HHI_HIFI_PLL_CNTL4		0x0e8
+#define HHI_HIFI_PLL_CNTL5		0x0ec
+#define HHI_HIFI_PLL_CNTL6		0x0f0
+#define HHI_VIID_CLK_DIV		0x128
+#define HHI_VIID_CLK_CNTL		0x12c
+#define HHI_GCLK_MPEG0			0x140
+#define HHI_GCLK_MPEG1			0x144
+#define HHI_GCLK_MPEG2			0x148
+#define HHI_GCLK_OTHER			0x150
+#define HHI_GCLK_OTHER2			0x154
+#define HHI_SYS_CPU_CLK_CNTL1		0x15c
+#define HHI_VID_CLK_DIV			0x164
+#define HHI_MPEG_CLK_CNTL		0x174
+#define HHI_AUD_CLK_CNTL		0x178
+#define HHI_VID_CLK_CNTL		0x17c
+#define HHI_TS_CLK_CNTL			0x190
+#define HHI_VID_CLK_CNTL2		0x194
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c
+#define HHI_VID_PLL_CLK_DIV		0x1a0
+#define HHI_MALI_CLK_CNTL		0x1b0
+#define HHI_VPU_CLKC_CNTL		0x1b4
+#define HHI_VPU_CLK_CNTL		0x1bc
+#define HHI_ISP_CLK_CNTL		0x1c0
+#define HHI_NNA_CLK_CNTL		0x1c8
+#define HHI_HDMI_CLK_CNTL		0x1cc
+#define HHI_VDEC_CLK_CNTL		0x1e0
+#define HHI_VDEC2_CLK_CNTL		0x1e4
+#define HHI_VDEC3_CLK_CNTL		0x1e8
+#define HHI_VDEC4_CLK_CNTL		0x1ec
+#define HHI_HDCP22_CLK_CNTL		0x1f0
+#define HHI_VAPBCLK_CNTL		0x1f4
+#define HHI_SYS_CPUB_CLK_CNTL1		0x200
+#define HHI_SYS_CPUB_CLK_CNTL		0x208
+#define HHI_VPU_CLKB_CNTL		0x20c
+#define HHI_SYS_CPU_CLK_CNTL2		0x210
+#define HHI_SYS_CPU_CLK_CNTL3		0x214
+#define HHI_SYS_CPU_CLK_CNTL4		0x218
+#define HHI_SYS_CPU_CLK_CNTL5		0x21c
+#define HHI_SYS_CPU_CLK_CNTL6		0x220
+#define HHI_GEN_CLK_CNTL		0x228
+#define HHI_VDIN_MEAS_CLK_CNTL		0x250
+#define HHI_MIPIDSI_PHY_CLK_CNTL	0x254
+#define HHI_NAND_CLK_CNTL		0x25c
+#define HHI_SD_EMMC_CLK_CNTL		0x264
+#define HHI_MPLL_CNTL0			0x278
+#define HHI_MPLL_CNTL1			0x27c
+#define HHI_MPLL_CNTL2			0x280
+#define HHI_MPLL_CNTL3			0x284
+#define HHI_MPLL_CNTL4			0x288
+#define HHI_MPLL_CNTL5			0x28c
+#define HHI_MPLL_CNTL6			0x290
+#define HHI_MPLL_CNTL7			0x294
+#define HHI_MPLL_CNTL8			0x298
+#define HHI_FIX_PLL_CNTL0		0x2a0
+#define HHI_FIX_PLL_CNTL1		0x2a4
+#define HHI_FIX_PLL_CNTL3		0x2ac
+#define HHI_SYS_PLL_CNTL0		0x2f4
+#define HHI_SYS_PLL_CNTL1		0x2f8
+#define HHI_SYS_PLL_CNTL2		0x2fc
+#define HHI_SYS_PLL_CNTL3		0x300
+#define HHI_SYS_PLL_CNTL4		0x304
+#define HHI_SYS_PLL_CNTL5		0x308
+#define HHI_SYS_PLL_CNTL6		0x30c
+#define HHI_HDMI_PLL_CNTL0		0x320
+#define HHI_HDMI_PLL_CNTL1		0x324
+#define HHI_HDMI_PLL_CNTL2		0x328
+#define HHI_HDMI_PLL_CNTL3		0x32c
+#define HHI_HDMI_PLL_CNTL4		0x330
+#define HHI_HDMI_PLL_CNTL5		0x334
+#define HHI_HDMI_PLL_CNTL6		0x338
+#define HHI_SPICC_CLK_CNTL		0x3dc
+#define HHI_SYS1_PLL_CNTL0		0x380
+#define HHI_SYS1_PLL_CNTL1		0x384
+#define HHI_SYS1_PLL_CNTL2		0x388
+#define HHI_SYS1_PLL_CNTL3		0x38c
+#define HHI_SYS1_PLL_CNTL4		0x390
+#define HHI_SYS1_PLL_CNTL5		0x394
+#define HHI_SYS1_PLL_CNTL6		0x398
+
 static struct clk_regmap g12a_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
deleted file mode 100644
index 27df99c4565aed5036be1fb106ee096a0a1127b5..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/g12a.h
+++ /dev/null
@@ -1,130 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2016 Amlogic, Inc.
- * Author: Michael Turquette <mturquette@baylibre.com>
- *
- * Copyright (c) 2018 Amlogic, inc.
- * Author: Qiufang Dai <qiufang.dai@amlogic.com>
- * Author: Jian Hu <jian.hu@amlogic.com>
- *
- */
-#ifndef __G12A_H
-#define __G12A_H
-
-/*
- * Clock controller register offsets
- *
- * Register offsets from the data sheet must be multiplied by 4 before
- * adding them to the base address to get the right value.
- */
-#define HHI_MIPI_CNTL0			0x000
-#define HHI_MIPI_CNTL1			0x004
-#define HHI_MIPI_CNTL2			0x008
-#define HHI_MIPI_STS			0x00C
-#define HHI_GP0_PLL_CNTL0		0x040
-#define HHI_GP0_PLL_CNTL1		0x044
-#define HHI_GP0_PLL_CNTL2		0x048
-#define HHI_GP0_PLL_CNTL3		0x04C
-#define HHI_GP0_PLL_CNTL4		0x050
-#define HHI_GP0_PLL_CNTL5		0x054
-#define HHI_GP0_PLL_CNTL6		0x058
-#define HHI_GP0_PLL_STS			0x05C
-#define HHI_GP1_PLL_CNTL0		0x060
-#define HHI_GP1_PLL_CNTL1		0x064
-#define HHI_GP1_PLL_CNTL2		0x068
-#define HHI_GP1_PLL_CNTL3		0x06C
-#define HHI_GP1_PLL_CNTL4		0x070
-#define HHI_GP1_PLL_CNTL5		0x074
-#define HHI_GP1_PLL_CNTL6		0x078
-#define HHI_GP1_PLL_STS			0x07C
-#define HHI_PCIE_PLL_CNTL0		0x098
-#define HHI_PCIE_PLL_CNTL1		0x09C
-#define HHI_PCIE_PLL_CNTL2		0x0A0
-#define HHI_PCIE_PLL_CNTL3		0x0A4
-#define HHI_PCIE_PLL_CNTL4		0x0A8
-#define HHI_PCIE_PLL_CNTL5		0x0AC
-#define HHI_PCIE_PLL_STS		0x0B8
-#define HHI_HIFI_PLL_CNTL0		0x0D8
-#define HHI_HIFI_PLL_CNTL1		0x0DC
-#define HHI_HIFI_PLL_CNTL2		0x0E0
-#define HHI_HIFI_PLL_CNTL3		0x0E4
-#define HHI_HIFI_PLL_CNTL4		0x0E8
-#define HHI_HIFI_PLL_CNTL5		0x0EC
-#define HHI_HIFI_PLL_CNTL6		0x0F0
-#define HHI_VIID_CLK_DIV		0x128
-#define HHI_VIID_CLK_CNTL		0x12C
-#define HHI_GCLK_MPEG0			0x140
-#define HHI_GCLK_MPEG1			0x144
-#define HHI_GCLK_MPEG2			0x148
-#define HHI_GCLK_OTHER			0x150
-#define HHI_GCLK_OTHER2			0x154
-#define HHI_SYS_CPU_CLK_CNTL1		0x15c
-#define HHI_VID_CLK_DIV			0x164
-#define HHI_MPEG_CLK_CNTL		0x174
-#define HHI_AUD_CLK_CNTL		0x178
-#define HHI_VID_CLK_CNTL		0x17c
-#define HHI_TS_CLK_CNTL			0x190
-#define HHI_VID_CLK_CNTL2		0x194
-#define HHI_SYS_CPU_CLK_CNTL0		0x19c
-#define HHI_VID_PLL_CLK_DIV		0x1A0
-#define HHI_MALI_CLK_CNTL		0x1b0
-#define HHI_VPU_CLKC_CNTL		0x1b4
-#define HHI_VPU_CLK_CNTL		0x1bC
-#define HHI_ISP_CLK_CNTL		0x1C0
-#define HHI_NNA_CLK_CNTL		0x1C8
-#define HHI_HDMI_CLK_CNTL		0x1CC
-#define HHI_VDEC_CLK_CNTL		0x1E0
-#define HHI_VDEC2_CLK_CNTL		0x1E4
-#define HHI_VDEC3_CLK_CNTL		0x1E8
-#define HHI_VDEC4_CLK_CNTL		0x1EC
-#define HHI_HDCP22_CLK_CNTL		0x1F0
-#define HHI_VAPBCLK_CNTL		0x1F4
-#define HHI_SYS_CPUB_CLK_CNTL1		0x200
-#define HHI_SYS_CPUB_CLK_CNTL		0x208
-#define HHI_VPU_CLKB_CNTL		0x20C
-#define HHI_SYS_CPU_CLK_CNTL2		0x210
-#define HHI_SYS_CPU_CLK_CNTL3		0x214
-#define HHI_SYS_CPU_CLK_CNTL4		0x218
-#define HHI_SYS_CPU_CLK_CNTL5		0x21c
-#define HHI_SYS_CPU_CLK_CNTL6		0x220
-#define HHI_GEN_CLK_CNTL		0x228
-#define HHI_VDIN_MEAS_CLK_CNTL		0x250
-#define HHI_MIPIDSI_PHY_CLK_CNTL	0x254
-#define HHI_NAND_CLK_CNTL		0x25C
-#define HHI_SD_EMMC_CLK_CNTL		0x264
-#define HHI_MPLL_CNTL0			0x278
-#define HHI_MPLL_CNTL1			0x27C
-#define HHI_MPLL_CNTL2			0x280
-#define HHI_MPLL_CNTL3			0x284
-#define HHI_MPLL_CNTL4			0x288
-#define HHI_MPLL_CNTL5			0x28c
-#define HHI_MPLL_CNTL6			0x290
-#define HHI_MPLL_CNTL7			0x294
-#define HHI_MPLL_CNTL8			0x298
-#define HHI_FIX_PLL_CNTL0		0x2A0
-#define HHI_FIX_PLL_CNTL1		0x2A4
-#define HHI_FIX_PLL_CNTL3		0x2AC
-#define HHI_SYS_PLL_CNTL0		0x2f4
-#define HHI_SYS_PLL_CNTL1		0x2f8
-#define HHI_SYS_PLL_CNTL2		0x2fc
-#define HHI_SYS_PLL_CNTL3		0x300
-#define HHI_SYS_PLL_CNTL4		0x304
-#define HHI_SYS_PLL_CNTL5		0x308
-#define HHI_SYS_PLL_CNTL6		0x30c
-#define HHI_HDMI_PLL_CNTL0		0x320
-#define HHI_HDMI_PLL_CNTL1		0x324
-#define HHI_HDMI_PLL_CNTL2		0x328
-#define HHI_HDMI_PLL_CNTL3		0x32c
-#define HHI_HDMI_PLL_CNTL4		0x330
-#define HHI_HDMI_PLL_CNTL5		0x334
-#define HHI_HDMI_PLL_CNTL6		0x338
-#define HHI_SPICC_CLK_CNTL		0x3dc
-#define HHI_SYS1_PLL_CNTL0		0x380
-#define HHI_SYS1_PLL_CNTL1		0x384
-#define HHI_SYS1_PLL_CNTL2		0x388
-#define HHI_SYS1_PLL_CNTL3		0x38c
-#define HHI_SYS1_PLL_CNTL4		0x390
-#define HHI_SYS1_PLL_CNTL5		0x394
-#define HHI_SYS1_PLL_CNTL6		0x398
-
-#endif /* __G12A_H */
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 3abb44a2532b9e4ef9259eebce836226ac25e1db..9aed0ea657abddfed2a8b19fe92f511ec7bd1c72 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -10,7 +10,6 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 
-#include "gxbb.h"
 #include "clk-regmap.h"
 #include "clk-pll.h"
 #include "clk-mpll.h"
@@ -19,6 +18,104 @@
 
 #include <dt-bindings/clock/gxbb-clkc.h>
 
+#define SCR				0x2c
+#define TIMEOUT_VALUE			0x3c
+
+#define HHI_GP0_PLL_CNTL		0x40
+#define HHI_GP0_PLL_CNTL2		0x44
+#define HHI_GP0_PLL_CNTL3		0x48
+#define HHI_GP0_PLL_CNTL4		0x4c
+#define	HHI_GP0_PLL_CNTL5		0x50
+#define	HHI_GP0_PLL_CNTL1		0x58
+
+#define HHI_XTAL_DIVN_CNTL		0xbc
+#define HHI_TIMER90K			0xec
+
+#define HHI_MEM_PD_REG0			0x100
+#define HHI_MEM_PD_REG1			0x104
+#define HHI_VPU_MEM_PD_REG1		0x108
+#define HHI_VIID_CLK_DIV		0x128
+#define HHI_VIID_CLK_CNTL		0x12c
+
+#define HHI_GCLK_MPEG0			0x140
+#define HHI_GCLK_MPEG1			0x144
+#define HHI_GCLK_MPEG2			0x148
+#define HHI_GCLK_OTHER			0x150
+#define HHI_GCLK_AO			0x154
+#define HHI_SYS_OSCIN_CNTL		0x158
+#define HHI_SYS_CPU_CLK_CNTL1		0x15c
+#define HHI_SYS_CPU_RESET_CNTL		0x160
+#define HHI_VID_CLK_DIV			0x164
+
+#define HHI_MPEG_CLK_CNTL		0x174
+#define HHI_AUD_CLK_CNTL		0x178
+#define HHI_VID_CLK_CNTL		0x17c
+#define HHI_AUD_CLK_CNTL2		0x190
+#define HHI_VID_CLK_CNTL2		0x194
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c
+#define HHI_VID_PLL_CLK_DIV		0x1a0
+#define HHI_AUD_CLK_CNTL3		0x1a4
+#define HHI_MALI_CLK_CNTL		0x1b0
+#define HHI_VPU_CLK_CNTL		0x1bc
+
+#define HHI_HDMI_CLK_CNTL		0x1cc
+#define HHI_VDEC_CLK_CNTL		0x1e0
+#define HHI_VDEC2_CLK_CNTL		0x1e4
+#define HHI_VDEC3_CLK_CNTL		0x1e8
+#define HHI_VDEC4_CLK_CNTL		0x1ec
+#define HHI_HDCP22_CLK_CNTL		0x1f0
+#define HHI_VAPBCLK_CNTL		0x1f4
+
+#define HHI_VPU_CLKB_CNTL		0x20c
+#define HHI_USB_CLK_CNTL		0x220
+#define HHI_32K_CLK_CNTL		0x224
+#define HHI_GEN_CLK_CNTL		0x228
+
+#define HHI_PCM_CLK_CNTL		0x258
+#define HHI_NAND_CLK_CNTL		0x25c
+#define HHI_SD_EMMC_CLK_CNTL		0x264
+
+#define HHI_MPLL_CNTL			0x280
+#define HHI_MPLL_CNTL2			0x284
+#define HHI_MPLL_CNTL3			0x288
+#define HHI_MPLL_CNTL4			0x28c
+#define HHI_MPLL_CNTL5			0x290
+#define HHI_MPLL_CNTL6			0x294
+#define HHI_MPLL_CNTL7			0x298
+#define HHI_MPLL_CNTL8			0x29c
+#define HHI_MPLL_CNTL9			0x2a0
+#define HHI_MPLL_CNTL10			0x2a4
+
+#define HHI_MPLL3_CNTL0			0x2e0
+#define HHI_MPLL3_CNTL1			0x2e4
+#define HHI_VDAC_CNTL0			0x2f4
+#define HHI_VDAC_CNTL1			0x2f8
+
+#define HHI_SYS_PLL_CNTL		0x300
+#define HHI_SYS_PLL_CNTL2		0x304
+#define HHI_SYS_PLL_CNTL3		0x308
+#define HHI_SYS_PLL_CNTL4		0x30c
+#define HHI_SYS_PLL_CNTL5		0x310
+#define HHI_DPLL_TOP_I			0x318
+#define HHI_DPLL_TOP2_I			0x31c
+#define HHI_HDMI_PLL_CNTL		0x320
+#define HHI_HDMI_PLL_CNTL2		0x324
+#define HHI_HDMI_PLL_CNTL3		0x328
+#define HHI_HDMI_PLL_CNTL4		0x32c
+#define HHI_HDMI_PLL_CNTL5		0x330
+#define HHI_HDMI_PLL_CNTL6		0x334
+#define HHI_HDMI_PLL_CNTL_I		0x338
+#define HHI_HDMI_PLL_CNTL7		0x33c
+
+#define HHI_HDMI_PHY_CNTL0		0x3a0
+#define HHI_HDMI_PHY_CNTL1		0x3a4
+#define HHI_HDMI_PHY_CNTL2		0x3a8
+#define HHI_HDMI_PHY_CNTL3		0x3ac
+
+#define HHI_VID_LOCK_CLK_CNTL		0x3c8
+#define HHI_BT656_CLK_CNTL		0x3d4
+#define HHI_SAR_CLK_CNTL		0x3d8
+
 static const struct pll_params_table gxbb_gp0_pll_params_table[] = {
 	PLL_PARAMS(32, 1),
 	PLL_PARAMS(33, 1),
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
deleted file mode 100644
index ba5f39a8d746ca1c69207f0022171e4bd82c6d3a..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/gxbb.h
+++ /dev/null
@@ -1,115 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
-/*
- * Copyright (c) 2016 AmLogic, Inc.
- * Author: Michael Turquette <mturquette@baylibre.com>
- */
-
-#ifndef __GXBB_H
-#define __GXBB_H
-
-/*
- * Clock controller register offsets
- *
- * Register offsets from the data sheet are listed in comment blocks below.
- * Those offsets must be multiplied by 4 before adding them to the base address
- * to get the right value
- */
-#define SCR				0x2C /* 0x0b offset in data sheet */
-#define TIMEOUT_VALUE			0x3c /* 0x0f offset in data sheet */
-
-#define HHI_GP0_PLL_CNTL		0x40 /* 0x10 offset in data sheet */
-#define HHI_GP0_PLL_CNTL2		0x44 /* 0x11 offset in data sheet */
-#define HHI_GP0_PLL_CNTL3		0x48 /* 0x12 offset in data sheet */
-#define HHI_GP0_PLL_CNTL4		0x4c /* 0x13 offset in data sheet */
-#define	HHI_GP0_PLL_CNTL5		0x50 /* 0x14 offset in data sheet */
-#define	HHI_GP0_PLL_CNTL1		0x58 /* 0x16 offset in data sheet */
-
-#define HHI_XTAL_DIVN_CNTL		0xbc /* 0x2f offset in data sheet */
-#define HHI_TIMER90K			0xec /* 0x3b offset in data sheet */
-
-#define HHI_MEM_PD_REG0			0x100 /* 0x40 offset in data sheet */
-#define HHI_MEM_PD_REG1			0x104 /* 0x41 offset in data sheet */
-#define HHI_VPU_MEM_PD_REG1		0x108 /* 0x42 offset in data sheet */
-#define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
-#define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
-
-#define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
-#define HHI_GCLK_MPEG1			0x144 /* 0x51 offset in data sheet */
-#define HHI_GCLK_MPEG2			0x148 /* 0x52 offset in data sheet */
-#define HHI_GCLK_OTHER			0x150 /* 0x54 offset in data sheet */
-#define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
-#define HHI_SYS_OSCIN_CNTL		0x158 /* 0x56 offset in data sheet */
-#define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
-#define HHI_SYS_CPU_RESET_CNTL		0x160 /* 0x58 offset in data sheet */
-#define HHI_VID_CLK_DIV			0x164 /* 0x59 offset in data sheet */
-
-#define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
-#define HHI_AUD_CLK_CNTL		0x178 /* 0x5e offset in data sheet */
-#define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
-#define HHI_AUD_CLK_CNTL2		0x190 /* 0x64 offset in data sheet */
-#define HHI_VID_CLK_CNTL2		0x194 /* 0x65 offset in data sheet */
-#define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
-#define HHI_VID_PLL_CLK_DIV		0x1a0 /* 0x68 offset in data sheet */
-#define HHI_AUD_CLK_CNTL3		0x1a4 /* 0x69 offset in data sheet */
-#define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
-#define HHI_VPU_CLK_CNTL		0x1bC /* 0x6f offset in data sheet */
-
-#define HHI_HDMI_CLK_CNTL		0x1CC /* 0x73 offset in data sheet */
-#define HHI_VDEC_CLK_CNTL		0x1E0 /* 0x78 offset in data sheet */
-#define HHI_VDEC2_CLK_CNTL		0x1E4 /* 0x79 offset in data sheet */
-#define HHI_VDEC3_CLK_CNTL		0x1E8 /* 0x7a offset in data sheet */
-#define HHI_VDEC4_CLK_CNTL		0x1EC /* 0x7b offset in data sheet */
-#define HHI_HDCP22_CLK_CNTL		0x1F0 /* 0x7c offset in data sheet */
-#define HHI_VAPBCLK_CNTL		0x1F4 /* 0x7d offset in data sheet */
-
-#define HHI_VPU_CLKB_CNTL		0x20C /* 0x83 offset in data sheet */
-#define HHI_USB_CLK_CNTL		0x220 /* 0x88 offset in data sheet */
-#define HHI_32K_CLK_CNTL		0x224 /* 0x89 offset in data sheet */
-#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
-
-#define HHI_PCM_CLK_CNTL		0x258 /* 0x96 offset in data sheet */
-#define HHI_NAND_CLK_CNTL		0x25C /* 0x97 offset in data sheet */
-#define HHI_SD_EMMC_CLK_CNTL		0x264 /* 0x99 offset in data sheet */
-
-#define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
-#define HHI_MPLL_CNTL2			0x284 /* 0xa1 offset in data sheet */
-#define HHI_MPLL_CNTL3			0x288 /* 0xa2 offset in data sheet */
-#define HHI_MPLL_CNTL4			0x28C /* 0xa3 offset in data sheet */
-#define HHI_MPLL_CNTL5			0x290 /* 0xa4 offset in data sheet */
-#define HHI_MPLL_CNTL6			0x294 /* 0xa5 offset in data sheet */
-#define HHI_MPLL_CNTL7			0x298 /* MP0, 0xa6 offset in data sheet */
-#define HHI_MPLL_CNTL8			0x29C /* MP1, 0xa7 offset in data sheet */
-#define HHI_MPLL_CNTL9			0x2A0 /* MP2, 0xa8 offset in data sheet */
-#define HHI_MPLL_CNTL10			0x2A4 /* MP2, 0xa9 offset in data sheet */
-
-#define HHI_MPLL3_CNTL0			0x2E0 /* 0xb8 offset in data sheet */
-#define HHI_MPLL3_CNTL1			0x2E4 /* 0xb9 offset in data sheet */
-#define HHI_VDAC_CNTL0			0x2F4 /* 0xbd offset in data sheet */
-#define HHI_VDAC_CNTL1			0x2F8 /* 0xbe offset in data sheet */
-
-#define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
-#define HHI_SYS_PLL_CNTL2		0x304 /* 0xc1 offset in data sheet */
-#define HHI_SYS_PLL_CNTL3		0x308 /* 0xc2 offset in data sheet */
-#define HHI_SYS_PLL_CNTL4		0x30c /* 0xc3 offset in data sheet */
-#define HHI_SYS_PLL_CNTL5		0x310 /* 0xc4 offset in data sheet */
-#define HHI_DPLL_TOP_I			0x318 /* 0xc6 offset in data sheet */
-#define HHI_DPLL_TOP2_I			0x31C /* 0xc7 offset in data sheet */
-#define HHI_HDMI_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
-#define HHI_HDMI_PLL_CNTL2		0x324 /* 0xc9 offset in data sheet */
-#define HHI_HDMI_PLL_CNTL3		0x328 /* 0xca offset in data sheet */
-#define HHI_HDMI_PLL_CNTL4		0x32C /* 0xcb offset in data sheet */
-#define HHI_HDMI_PLL_CNTL5		0x330 /* 0xcc offset in data sheet */
-#define HHI_HDMI_PLL_CNTL6		0x334 /* 0xcd offset in data sheet */
-#define HHI_HDMI_PLL_CNTL_I		0x338 /* 0xce offset in data sheet */
-#define HHI_HDMI_PLL_CNTL7		0x33C /* 0xcf offset in data sheet */
-
-#define HHI_HDMI_PHY_CNTL0		0x3A0 /* 0xe8 offset in data sheet */
-#define HHI_HDMI_PHY_CNTL1		0x3A4 /* 0xe9 offset in data sheet */
-#define HHI_HDMI_PHY_CNTL2		0x3A8 /* 0xea offset in data sheet */
-#define HHI_HDMI_PHY_CNTL3		0x3AC /* 0xeb offset in data sheet */
-
-#define HHI_VID_LOCK_CLK_CNTL		0x3C8 /* 0xf2 offset in data sheet */
-#define HHI_BT656_CLK_CNTL		0x3D4 /* 0xf5 offset in data sheet */
-#define HHI_SAR_CLK_CNTL		0x3D8 /* 0xf6 offset in data sheet */
-
-#endif /* __GXBB_H */
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index e4b474c5f86ce37664200209d7765d36b9542248..cff07006016bcf37b6381364cf2d83d22feffee8 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -16,7 +16,6 @@
 #include <linux/slab.h>
 #include <linux/regmap.h>
 
-#include "meson8b.h"
 #include "clk-regmap.h"
 #include "meson-clkc-utils.h"
 #include "clk-pll.h"
@@ -25,6 +24,72 @@
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
 
+/*
+ * Clock controller register offsets
+ *
+ * Register offsets from the HardKernel[0] data sheet must be multiplied
+ * by 4 before adding them to the base address to get the right value
+ *
+ * [0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
+ */
+#define HHI_GP_PLL_CNTL			0x40
+#define HHI_GP_PLL_CNTL2		0x44
+#define HHI_GP_PLL_CNTL3		0x48
+#define HHI_GP_PLL_CNTL4		0x4C
+#define HHI_GP_PLL_CNTL5		0x50
+#define HHI_VIID_CLK_DIV		0x128
+#define HHI_VIID_CLK_CNTL		0x12c
+#define HHI_GCLK_MPEG0			0x140
+#define HHI_GCLK_MPEG1			0x144
+#define HHI_GCLK_MPEG2			0x148
+#define HHI_GCLK_OTHER			0x150
+#define HHI_GCLK_AO			0x154
+#define HHI_SYS_CPU_CLK_CNTL1		0x15c
+#define HHI_VID_CLK_DIV			0x164
+#define HHI_MPEG_CLK_CNTL		0x174
+#define HHI_AUD_CLK_CNTL		0x178
+#define HHI_VID_CLK_CNTL		0x17c
+#define HHI_AUD_CLK_CNTL2		0x190
+#define HHI_VID_CLK_CNTL2		0x194
+#define HHI_VID_DIVIDER_CNTL		0x198
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c
+#define HHI_MALI_CLK_CNTL		0x1b0
+#define HHI_VPU_CLK_CNTL		0x1bc
+#define HHI_HDMI_CLK_CNTL		0x1cc
+#define HHI_VDEC_CLK_CNTL		0x1e0
+#define HHI_VDEC2_CLK_CNTL		0x1e4
+#define HHI_VDEC3_CLK_CNTL		0x1e8
+#define HHI_NAND_CLK_CNTL		0x25c
+#define HHI_MPLL_CNTL			0x280
+#define HHI_SYS_PLL_CNTL		0x300
+#define HHI_VID_PLL_CNTL		0x320
+#define HHI_VID_PLL_CNTL2		0x324
+#define HHI_VID_PLL_CNTL3		0x328
+#define HHI_VID_PLL_CNTL4		0x32c
+#define HHI_VID_PLL_CNTL5		0x330
+#define HHI_VID_PLL_CNTL6		0x334
+#define HHI_VID2_PLL_CNTL		0x380
+#define HHI_VID2_PLL_CNTL2		0x384
+#define HHI_VID2_PLL_CNTL3		0x388
+#define HHI_VID2_PLL_CNTL4		0x38c
+#define HHI_VID2_PLL_CNTL5		0x390
+#define HHI_VID2_PLL_CNTL6		0x394
+
+/*
+ * MPLL register offeset taken from the S905 datasheet. Vendor kernel source
+ * confirm these are the same for the S805.
+ */
+#define HHI_MPLL_CNTL			0x280
+#define HHI_MPLL_CNTL2			0x284
+#define HHI_MPLL_CNTL3			0x288
+#define HHI_MPLL_CNTL4			0x28c
+#define HHI_MPLL_CNTL5			0x290
+#define HHI_MPLL_CNTL6			0x294
+#define HHI_MPLL_CNTL7			0x298
+#define HHI_MPLL_CNTL8			0x29c
+#define HHI_MPLL_CNTL9			0x2a0
+#define HHI_MPLL_CNTL10			0x2a4
+
 struct meson8b_clk_reset {
 	struct reset_controller_dev reset;
 	struct regmap *regmap;
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
deleted file mode 100644
index a5b6e67eeefbc61a550a266d947ddcaef0393dbe..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/meson8b.h
+++ /dev/null
@@ -1,80 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2015 Endless Mobile, Inc.
- * Author: Carlo Caione <carlo@endlessm.com>
- *
- * Copyright (c) 2016 BayLibre, Inc.
- * Michael Turquette <mturquette@baylibre.com>
- */
-
-#ifndef __MESON8B_H
-#define __MESON8B_H
-
-/*
- * Clock controller register offsets
- *
- * Register offsets from the HardKernel[0] data sheet are listed in comment
- * blocks below. Those offsets must be multiplied by 4 before adding them to
- * the base address to get the right value
- *
- * [0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
- */
-#define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
-#define HHI_GP_PLL_CNTL2		0x44  /* 0x11 offset in data sheet */
-#define HHI_GP_PLL_CNTL3		0x48  /* 0x12 offset in data sheet */
-#define HHI_GP_PLL_CNTL4		0x4C  /* 0x13 offset in data sheet */
-#define HHI_GP_PLL_CNTL5		0x50  /* 0x14 offset in data sheet */
-#define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
-#define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
-#define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
-#define HHI_GCLK_MPEG1			0x144 /* 0x51 offset in data sheet */
-#define HHI_GCLK_MPEG2			0x148 /* 0x52 offset in data sheet */
-#define HHI_GCLK_OTHER			0x150 /* 0x54 offset in data sheet */
-#define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
-#define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
-#define HHI_VID_CLK_DIV			0x164 /* 0x59 offset in data sheet */
-#define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
-#define HHI_AUD_CLK_CNTL		0x178 /* 0x5e offset in data sheet */
-#define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
-#define HHI_AUD_CLK_CNTL2		0x190 /* 0x64 offset in data sheet */
-#define HHI_VID_CLK_CNTL2		0x194 /* 0x65 offset in data sheet */
-#define HHI_VID_DIVIDER_CNTL		0x198 /* 0x66 offset in data sheet */
-#define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
-#define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
-#define HHI_VPU_CLK_CNTL		0x1bc /* 0x6f offset in data sheet */
-#define HHI_HDMI_CLK_CNTL		0x1cc /* 0x73 offset in data sheet */
-#define HHI_VDEC_CLK_CNTL		0x1e0 /* 0x78 offset in data sheet */
-#define HHI_VDEC2_CLK_CNTL		0x1e4 /* 0x79 offset in data sheet */
-#define HHI_VDEC3_CLK_CNTL		0x1e8 /* 0x7a offset in data sheet */
-#define HHI_NAND_CLK_CNTL		0x25c /* 0x97 offset in data sheet */
-#define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
-#define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
-#define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
-#define HHI_VID_PLL_CNTL2		0x324 /* 0xc9 offset in data sheet */
-#define HHI_VID_PLL_CNTL3		0x328 /* 0xca offset in data sheet */
-#define HHI_VID_PLL_CNTL4		0x32c /* 0xcb offset in data sheet */
-#define HHI_VID_PLL_CNTL5		0x330 /* 0xcc offset in data sheet */
-#define HHI_VID_PLL_CNTL6		0x334 /* 0xcd offset in data sheet */
-#define HHI_VID2_PLL_CNTL		0x380 /* 0xe0 offset in data sheet */
-#define HHI_VID2_PLL_CNTL2		0x384 /* 0xe1 offset in data sheet */
-#define HHI_VID2_PLL_CNTL3		0x388 /* 0xe2 offset in data sheet */
-#define HHI_VID2_PLL_CNTL4		0x38c /* 0xe3 offset in data sheet */
-#define HHI_VID2_PLL_CNTL5		0x390 /* 0xe4 offset in data sheet */
-#define HHI_VID2_PLL_CNTL6		0x394 /* 0xe5 offset in data sheet */
-
-/*
- * MPLL register offeset taken from the S905 datasheet. Vendor kernel source
- * confirm these are the same for the S805.
- */
-#define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
-#define HHI_MPLL_CNTL2			0x284 /* 0xa1 offset in data sheet */
-#define HHI_MPLL_CNTL3			0x288 /* 0xa2 offset in data sheet */
-#define HHI_MPLL_CNTL4			0x28C /* 0xa3 offset in data sheet */
-#define HHI_MPLL_CNTL5			0x290 /* 0xa4 offset in data sheet */
-#define HHI_MPLL_CNTL6			0x294 /* 0xa5 offset in data sheet */
-#define HHI_MPLL_CNTL7			0x298 /* 0xa6 offset in data sheet */
-#define HHI_MPLL_CNTL8			0x29C /* 0xa7 offset in data sheet */
-#define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
-#define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
-
-#endif /* __MESON8B_H */
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 8a403737778749cdd9ded56c5134a1a081671e42..4c663dc33572e25cc4727a121ed2a0f5d4efd98f 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -13,10 +13,55 @@
 #include "clk-regmap.h"
 #include "vid-pll-div.h"
 #include "clk-dualdiv.h"
-#include "s4-peripherals.h"
 #include "meson-clkc-utils.h"
 #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
 
+#define CLKCTRL_RTC_BY_OSCIN_CTRL0                 0x008
+#define CLKCTRL_RTC_BY_OSCIN_CTRL1                 0x00c
+#define CLKCTRL_RTC_CTRL                           0x010
+#define CLKCTRL_SYS_CLK_CTRL0                      0x040
+#define CLKCTRL_SYS_CLK_EN0_REG0                   0x044
+#define CLKCTRL_SYS_CLK_EN0_REG1                   0x048
+#define CLKCTRL_SYS_CLK_EN0_REG2                   0x04c
+#define CLKCTRL_SYS_CLK_EN0_REG3                   0x050
+#define CLKCTRL_CECA_CTRL0                         0x088
+#define CLKCTRL_CECA_CTRL1                         0x08c
+#define CLKCTRL_CECB_CTRL0                         0x090
+#define CLKCTRL_CECB_CTRL1                         0x094
+#define CLKCTRL_SC_CLK_CTRL                        0x098
+#define CLKCTRL_CLK12_24_CTRL                      0x0a8
+#define CLKCTRL_VID_CLK_CTRL                       0x0c0
+#define CLKCTRL_VID_CLK_CTRL2                      0x0c4
+#define CLKCTRL_VID_CLK_DIV                        0x0c8
+#define CLKCTRL_VIID_CLK_DIV                       0x0cc
+#define CLKCTRL_VIID_CLK_CTRL                      0x0d0
+#define CLKCTRL_HDMI_CLK_CTRL                      0x0e0
+#define CLKCTRL_VID_PLL_CLK_DIV                    0x0e4
+#define CLKCTRL_VPU_CLK_CTRL                       0x0e8
+#define CLKCTRL_VPU_CLKB_CTRL                      0x0ec
+#define CLKCTRL_VPU_CLKC_CTRL                      0x0f0
+#define CLKCTRL_VID_LOCK_CLK_CTRL                  0x0f4
+#define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
+#define CLKCTRL_VAPBCLK_CTRL                       0x0fc
+#define CLKCTRL_HDCP22_CTRL                        0x100
+#define CLKCTRL_VDEC_CLK_CTRL                      0x140
+#define CLKCTRL_VDEC2_CLK_CTRL                     0x144
+#define CLKCTRL_VDEC3_CLK_CTRL                     0x148
+#define CLKCTRL_VDEC4_CLK_CTRL                     0x14c
+#define CLKCTRL_TS_CLK_CTRL                        0x158
+#define CLKCTRL_MALI_CLK_CTRL                      0x15c
+#define CLKCTRL_NAND_CLK_CTRL                      0x168
+#define CLKCTRL_SD_EMMC_CLK_CTRL                   0x16c
+#define CLKCTRL_SPICC_CLK_CTRL                     0x174
+#define CLKCTRL_GEN_CLK_CTRL                       0x178
+#define CLKCTRL_SAR_CLK_CTRL                       0x17c
+#define CLKCTRL_PWM_CLK_AB_CTRL                    0x180
+#define CLKCTRL_PWM_CLK_CD_CTRL                    0x184
+#define CLKCTRL_PWM_CLK_EF_CTRL                    0x188
+#define CLKCTRL_PWM_CLK_GH_CTRL                    0x18c
+#define CLKCTRL_PWM_CLK_IJ_CTRL                    0x190
+#define CLKCTRL_DEMOD_CLK_CTRL                     0x200
+
 static struct clk_regmap s4_rtc_32k_by_oscin_clkin = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_RTC_BY_OSCIN_CTRL0,
diff --git a/drivers/clk/meson/s4-peripherals.h b/drivers/clk/meson/s4-peripherals.h
deleted file mode 100644
index 1e298713c2b2d1eeb05036af7e1db24378cdb805..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/s4-peripherals.h
+++ /dev/null
@@ -1,56 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
-/*
- * Copyright (c) 2022-2023 Amlogic, inc. All rights reserved
- * Author: Yu Tu <yu.tu@amlogic.com>
- */
-
-#ifndef __MESON_S4_PERIPHERALS_H__
-#define __MESON_S4_PERIPHERALS_H__
-
-#define CLKCTRL_RTC_BY_OSCIN_CTRL0                 0x008
-#define CLKCTRL_RTC_BY_OSCIN_CTRL1                 0x00c
-#define CLKCTRL_RTC_CTRL                           0x010
-#define CLKCTRL_SYS_CLK_CTRL0                      0x040
-#define CLKCTRL_SYS_CLK_EN0_REG0                   0x044
-#define CLKCTRL_SYS_CLK_EN0_REG1                   0x048
-#define CLKCTRL_SYS_CLK_EN0_REG2                   0x04c
-#define CLKCTRL_SYS_CLK_EN0_REG3                   0x050
-#define CLKCTRL_CECA_CTRL0                         0x088
-#define CLKCTRL_CECA_CTRL1                         0x08c
-#define CLKCTRL_CECB_CTRL0                         0x090
-#define CLKCTRL_CECB_CTRL1                         0x094
-#define CLKCTRL_SC_CLK_CTRL                        0x098
-#define CLKCTRL_CLK12_24_CTRL                      0x0a8
-#define CLKCTRL_VID_CLK_CTRL                       0x0c0
-#define CLKCTRL_VID_CLK_CTRL2                      0x0c4
-#define CLKCTRL_VID_CLK_DIV                        0x0c8
-#define CLKCTRL_VIID_CLK_DIV                       0x0cc
-#define CLKCTRL_VIID_CLK_CTRL                      0x0d0
-#define CLKCTRL_HDMI_CLK_CTRL                      0x0e0
-#define CLKCTRL_VID_PLL_CLK_DIV                    0x0e4
-#define CLKCTRL_VPU_CLK_CTRL                       0x0e8
-#define CLKCTRL_VPU_CLKB_CTRL                      0x0ec
-#define CLKCTRL_VPU_CLKC_CTRL                      0x0f0
-#define CLKCTRL_VID_LOCK_CLK_CTRL                  0x0f4
-#define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
-#define CLKCTRL_VAPBCLK_CTRL                       0x0fc
-#define CLKCTRL_HDCP22_CTRL                        0x100
-#define CLKCTRL_VDEC_CLK_CTRL                      0x140
-#define CLKCTRL_VDEC2_CLK_CTRL                     0x144
-#define CLKCTRL_VDEC3_CLK_CTRL                     0x148
-#define CLKCTRL_VDEC4_CLK_CTRL                     0x14c
-#define CLKCTRL_TS_CLK_CTRL                        0x158
-#define CLKCTRL_MALI_CLK_CTRL                      0x15c
-#define CLKCTRL_NAND_CLK_CTRL                      0x168
-#define CLKCTRL_SD_EMMC_CLK_CTRL                   0x16c
-#define CLKCTRL_SPICC_CLK_CTRL                     0x174
-#define CLKCTRL_GEN_CLK_CTRL                       0x178
-#define CLKCTRL_SAR_CLK_CTRL                       0x17c
-#define CLKCTRL_PWM_CLK_AB_CTRL                    0x180
-#define CLKCTRL_PWM_CLK_CD_CTRL                    0x184
-#define CLKCTRL_PWM_CLK_EF_CTRL                    0x188
-#define CLKCTRL_PWM_CLK_GH_CTRL                    0x18c
-#define CLKCTRL_PWM_CLK_IJ_CTRL                    0x190
-#define CLKCTRL_DEMOD_CLK_CTRL                     0x200
-
-#endif /* __MESON_S4_PERIPHERALS_H__ */
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index f9cc05a506e3952ca37b851a3acff04bbe090499..911a590d206fb32d401e8d71548ca0e14920d29f 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -13,10 +13,37 @@
 #include "clk-mpll.h"
 #include "clk-pll.h"
 #include "clk-regmap.h"
-#include "s4-pll.h"
 #include "meson-clkc-utils.h"
 #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
 
+#define ANACTRL_FIXPLL_CTRL0                       0x040
+#define ANACTRL_FIXPLL_CTRL1                       0x044
+#define ANACTRL_FIXPLL_CTRL3                       0x04c
+#define ANACTRL_GP0PLL_CTRL0                       0x080
+#define ANACTRL_GP0PLL_CTRL1                       0x084
+#define ANACTRL_GP0PLL_CTRL2                       0x088
+#define ANACTRL_GP0PLL_CTRL3                       0x08c
+#define ANACTRL_GP0PLL_CTRL4                       0x090
+#define ANACTRL_GP0PLL_CTRL5                       0x094
+#define ANACTRL_GP0PLL_CTRL6                       0x098
+#define ANACTRL_HIFIPLL_CTRL0                      0x100
+#define ANACTRL_HIFIPLL_CTRL1                      0x104
+#define ANACTRL_HIFIPLL_CTRL2                      0x108
+#define ANACTRL_HIFIPLL_CTRL3                      0x10c
+#define ANACTRL_HIFIPLL_CTRL4                      0x110
+#define ANACTRL_HIFIPLL_CTRL5                      0x114
+#define ANACTRL_HIFIPLL_CTRL6                      0x118
+#define ANACTRL_MPLL_CTRL0                         0x180
+#define ANACTRL_MPLL_CTRL1                         0x184
+#define ANACTRL_MPLL_CTRL2                         0x188
+#define ANACTRL_MPLL_CTRL3                         0x18c
+#define ANACTRL_MPLL_CTRL4                         0x190
+#define ANACTRL_MPLL_CTRL5                         0x194
+#define ANACTRL_MPLL_CTRL6                         0x198
+#define ANACTRL_MPLL_CTRL7                         0x19c
+#define ANACTRL_MPLL_CTRL8                         0x1a0
+#define ANACTRL_HDMIPLL_CTRL0                      0x1c0
+
 /*
  * These clock are a fixed value (fixed_pll is 2GHz) that is initialized by ROMcode.
  * The chip was changed fixed pll for security reasons. Fixed PLL registers are not writable
diff --git a/drivers/clk/meson/s4-pll.h b/drivers/clk/meson/s4-pll.h
deleted file mode 100644
index ff7d58302f2abd61b0fed6c90eec15752fc14b57..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/s4-pll.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
-/*
- * Copyright (c) 2022-2023 Amlogic, inc. All rights reserved
- * Author: Yu Tu <yu.tu@amlogic.com>
- */
-
-#ifndef __MESON_S4_PLL_H__
-#define __MESON_S4_PLL_H__
-
-#define ANACTRL_FIXPLL_CTRL0                       0x040
-#define ANACTRL_FIXPLL_CTRL1                       0x044
-#define ANACTRL_FIXPLL_CTRL3                       0x04c
-#define ANACTRL_GP0PLL_CTRL0                       0x080
-#define ANACTRL_GP0PLL_CTRL1                       0x084
-#define ANACTRL_GP0PLL_CTRL2                       0x088
-#define ANACTRL_GP0PLL_CTRL3                       0x08c
-#define ANACTRL_GP0PLL_CTRL4                       0x090
-#define ANACTRL_GP0PLL_CTRL5                       0x094
-#define ANACTRL_GP0PLL_CTRL6                       0x098
-#define ANACTRL_HIFIPLL_CTRL0                      0x100
-#define ANACTRL_HIFIPLL_CTRL1                      0x104
-#define ANACTRL_HIFIPLL_CTRL2                      0x108
-#define ANACTRL_HIFIPLL_CTRL3                      0x10c
-#define ANACTRL_HIFIPLL_CTRL4                      0x110
-#define ANACTRL_HIFIPLL_CTRL5                      0x114
-#define ANACTRL_HIFIPLL_CTRL6                      0x118
-#define ANACTRL_MPLL_CTRL0                         0x180
-#define ANACTRL_MPLL_CTRL1                         0x184
-#define ANACTRL_MPLL_CTRL2                         0x188
-#define ANACTRL_MPLL_CTRL3                         0x18c
-#define ANACTRL_MPLL_CTRL4                         0x190
-#define ANACTRL_MPLL_CTRL5                         0x194
-#define ANACTRL_MPLL_CTRL6                         0x198
-#define ANACTRL_MPLL_CTRL7                         0x19c
-#define ANACTRL_MPLL_CTRL8                         0x1a0
-#define ANACTRL_HDMIPLL_CTRL0                      0x1c0
-
-#endif /* __MESON_S4_PLL_H__ */

---
base-commit: 301b96e0668a6a0770a334b7243858b4f2d05091
change-id: 20250623-clk-meson-no-headers-3461aea21da5

Best regards,
-- 
Jerome

