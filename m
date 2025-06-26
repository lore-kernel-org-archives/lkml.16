Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F52E7F1A;
	Thu, 26 Jun 2025 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946702; cv=none; b=TCjRxCZtnPuPw24XbKfNtfRIPcQsnMGhoA3wtfgYnMe2YWsIOwnCXUYZ03rsUKIwHFVoWnGPC6k2+D2oZR9hcu8Yond4fX81Ix+8MnilOfeZHxu5trw4RScQjDdASByGS6CamCCfnG5IIDpIJrDEQsfp24vDXqRpvMuHosZuNzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946702; c=relaxed/simple;
	bh=DOHW80VmldO6UV+Thm2o7jsLJKf0oynugoEVz5ctmhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5fCTE1gPziVxEwS9YImR2Zmesz1WF/pA+Q3BtvH9IRVeJ47EPI6/ejgG3LxOQgiyV98oEye8+PL1np5oKRuhAT/iekoCnrqDlDp8AeJiavV0AvTKVzEfAYg6H6SqN44TX3bvfhLxEFNKtSRszdmvaXHoAMhlCuAxpJdr3xJFxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8S7flO1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8S7flO1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0d11bb2a7so143504566b.3;
        Thu, 26 Jun 2025 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946699; x=1751551499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWtWtBwjob36nAaKnSWI4pJUD13rGF2wqiMWwwOpQSE=;
        b=f8S7flO1PcBLohCdIHp2fwYZqiYwT9sj9rJU3OgKQYZaWzsujBC3X+SGUOIbBe0oRB
         aaKkXjQ4+W1z1R4uREBnvYGsKB1FpqyPnPXTwkj3C98J8hJu7l+K+wfae0cY1wuZdDMy
         xdVasyw8fK0iqu6XO2RSpZBRNV1TpuH9wZRFch/HVsGujkYsTOS4oTrlrk/K7sBWM1iq
         8fLHw5tyUD5d/WzQPGldcokLYGzDUvXTNKXwOAuJzwrbag6rKt2yhQ5wmTNqiwz/n4Lx
         2T3w6HauUicurZ06GiFukeQXJrNvO9hbP+I2s2b965U8LXEKR8iMMAj8iJOUAkvubbOq
         n5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946699; x=1751551499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWtWtBwjob36nAaKnSWI4pJUD13rGF2wqiMWwwOpQSE=;
        b=jtZGG51rTSxWB0b2h2Wd4afdvztHNCRzwO2uNQJOE9vaiIUU2SDqBzEKz3QeQgIBF9
         m45jmZ6hboAoFIWo6IJG+jgPX/CZxqGMXj57UMb066l+8OLcbHlzoCUaW2tZosoIsXoW
         EiQm79C5olknJFUsZ94dO7PStBZo29PstOmfRuqbrOVOWdpToXFQactQn2Oyu8wyUL9r
         qSC8FFkNy2gprEl/wcu2G4PDLPsKIoQrKUb9toeXNz16Ze7wEZ8XvyyVmOcK3914eCEl
         LEnUYAUTyLXuvTlNuIzynDtg19Smxp5+G6eOikUSxApCdUqAu/kDOCx4uVCz7XIkfamt
         g64A==
X-Forwarded-Encrypted: i=1; AJvYcCXjpK78BCNqK5RnEh3K3zdmS1+sU1Q7dp7CMegQBDd+vTHkhotol40V494yvWIwsAGBC/Dnvx+fbQnu23k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+hUBEWBMAmxehz7KXZnbJo8AOXnzChziPYTDJx+tgxbRgdu4
	8NwAgzzrCFE1wIbprInNy4Fnj4hcPcBJ7u9/8gyTnMxBmrG73YS0SZM6P75FcgSrghgiDQ==
X-Gm-Gg: ASbGncuV0I1cr7zhzlQN+G8i8swFozxrd0r8pz6zTNHWzPNLKs9y5OZ74NMCQiPGnkO
	F9vhDbWNgr6tdNizVLw6hKS980b14S4D0gJYk9f8G21eDlakwqvWte6NP4es+7swBo3IKxoHJAw
	G5j1vkbXZ33rqpfJMIqbLYX0xhgf3lMZpZ3t+WzXwKcbTkOsNEBAGhpNndYD8R4tJWExY7OMCri
	hqPiCFLMnLIozYULDsaUmNpwei4iMaE4vEHh7WVSxATX9uFW/5Fxq9fMi18qPyh+e0zWA5oxspC
	EOdXiJeIWawtFh0mUh5Mb5fc6Lnoe+SsrfO0PRha6JMyKJu6sEvc1yz8MwvCdk94hKtQRlRTw8R
	zrL4LuF0eaWKTpsjZKKRiRQ==
X-Google-Smtp-Source: AGHT+IGRGxDi3nPzaP3+FSW4c8MyVlay1gtJ0zdopMKZ0v2+8WCKkner18HyfnUkf/LF+ysDQFdlmA==
X-Received: by 2002:a17:906:4fc5:b0:ad8:85df:865b with SMTP id a640c23a62f3a-ae0bee4f81bmr699701566b.33.1750946698184;
        Thu, 26 Jun 2025 07:04:58 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:04:57 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 3/5] mfd: khadas-mcu: add Khadas Edge 2 registers
Date: Thu, 26 Jun 2025 17:04:30 +0300
Message-ID: <16807e13e034f85adc91d131f6c5046ce7d98d9c.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas Edge 2 MCU registers to khadas-mcu.h and adjust some properties.
Also, i've added some registers with V2 suffix,
as same addresses were already exist for previous boards.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/mfd/khadas-mcu.c       |  8 ++++++--
 include/linux/mfd/khadas-mcu.h | 25 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ca4bd6cf5..199ed4925 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -26,6 +26,10 @@ static bool khadas_mcu_reg_volatile(struct device *dev, unsigned int reg)
 	case KHADAS_MCU_CHECK_USER_PASSWD_REG:
 	case KHADAS_MCU_WOL_INIT_START_REG:
 	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG:
+	case KHADAS_MCU_LED_ON_RAM_REG:
+	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2:
+	case KHADAS_MCU_WDT_EN_REG:
+	case KHADAS_MCU_SYS_RST_REG:
 		return true;
 	default:
 		return false;
@@ -69,14 +73,14 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.reg_bits	= 8,
 	.reg_stride	= 1,
 	.val_bits	= 8,
-	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+	.max_register	= KHADAS_MCU_SYS_RST_REG,
 	.volatile_reg	= khadas_mcu_reg_volatile,
 	.writeable_reg	= khadas_mcu_reg_writeable,
 	.cache_type	= REGCACHE_MAPLE,
 };
 
 static struct mfd_cell khadas_mcu_fan_cells[] = {
-	/* VIM1/2 Rev13+ and VIM3 only */
+	/* VIM1/2 Rev13+, VIM3 and Edge2 only */
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0..de570e159 100644
--- a/include/linux/mfd/khadas-mcu.h
+++ b/include/linux/mfd/khadas-mcu.h
@@ -35,26 +35,45 @@
 #define KHADAS_MCU_FACTORY_TEST_REG		0x16 /* R */
 #define KHADAS_MCU_BOOT_MODE_REG		0x20 /* RW */
 #define KHADAS_MCU_BOOT_EN_WOL_REG		0x21 /* RW */
+#define KHADAS_MCU_BOOT_EN_DCIN_REG_V2		0x21 /* RW */
 #define KHADAS_MCU_BOOT_EN_RTC_REG		0x22 /* RW */
 #define KHADAS_MCU_BOOT_EN_EXP_REG		0x23 /* RW */
+#define KHADAS_MCU_LED_MODE_ON_REG_V2		0x23 /* RW */
+#define KHADAS_MCU_LED_MODE_OFF_REG_V2		0x24 /* RW */
 #define KHADAS_MCU_BOOT_EN_IR_REG		0x24 /* RW */
 #define KHADAS_MCU_BOOT_EN_DCIN_REG		0x25 /* RW */
+#define KHADAS_MCU_RGB_ON_R_REG			0x25 /* RW */
+#define KHADAS_MCU_RGB_ON_G_REG			0x26 /* RW */
 #define KHADAS_MCU_BOOT_EN_KEY_REG		0x26 /* RW */
+#define KHADAS_MCU_RGB_ON_B_REG			0x27 /* RW */
 #define KHADAS_MCU_KEY_MODE_REG			0x27 /* RW */
+#define KHADAS_MCU_RGB_OFF_R_REG		0x28 /* RW */
 #define KHADAS_MCU_LED_MODE_ON_REG		0x28 /* RW */
+#define KHADAS_MCU_RGB_OFF_G_REG		0x29 /* RW */
 #define KHADAS_MCU_LED_MODE_OFF_REG		0x29 /* RW */
+#define KHADAS_MCU_RGB_OFF_B_REG		0x2a /* RW */
+#define KHADAS_MCU_REST_CONF_REG		0x2c /* WO */
 #define KHADAS_MCU_SHUTDOWN_NORMAL_REG		0x2c /* RW */
 #define KHADAS_MCU_MAC_SWITCH_REG		0x2d /* RW */
 #define KHADAS_MCU_MCU_SLEEP_MODE_REG		0x2e /* RW */
+#define KHADAS_MCU_BOOT_EN_IR_REG_V2		0x2f /* RW */
 #define KHADAS_MCU_IR_CODE1_0_REG		0x2f /* RW */
 #define KHADAS_MCU_IR_CODE1_1_REG		0x30 /* RW */
+#define KHADAS_MCU_IR1_CUST1_REG		0x30 /* RW */
 #define KHADAS_MCU_IR_CODE1_2_REG		0x31 /* RW */
+#define KHADAS_MCU_IR1_CUST2_REG		0x31 /* RW */
 #define KHADAS_MCU_IR_CODE1_3_REG		0x32 /* RW */
+#define KHADAS_MCU_IR1_ORDER1_REG		0x32 /* RW */
 #define KHADAS_MCU_USB_PCIE_SWITCH_REG		0x33 /* RW */
+#define KHADAS_MCU_IR1_ORDER2_REG		0x33 /* RW */
+#define KHADAS_MCU_IR2_CUST1_REG		0x34 /* RW */
 #define KHADAS_MCU_IR_CODE2_0_REG		0x34 /* RW */
 #define KHADAS_MCU_IR_CODE2_1_REG		0x35 /* RW */
+#define KHADAS_MCU_IR2_CUST2_REG		0x35 /* RW */
 #define KHADAS_MCU_IR_CODE2_2_REG		0x36 /* RW */
+#define KHADAS_MCU_IR2_ORDER1_REG		0x36 /* RW */
 #define KHADAS_MCU_IR_CODE2_3_REG		0x37 /* RW */
+#define KHADAS_MCU_IR2_ORDER2_REG		0x36 /* RW */
 #define KHADAS_MCU_PASSWD_USER_0_REG		0x40 /* RW */
 #define KHADAS_MCU_PASSWD_USER_1_REG		0x41 /* RW */
 #define KHADAS_MCU_PASSWD_USER_2_REG		0x42 /* RW */
@@ -69,6 +88,11 @@
 #define KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG	0x86 /* RO */
 #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
 #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
+#define KHADAS_MCU_LED_ON_RAM_REG		0x89 /* WO */
+#define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2	0x8A /* WO */
+#define KHADAS_MCU_WDT_EN_REG			0x8B /* WO */
+#define KHADAS_MCU_SYS_RST_REG			0x91 /* WO */
+
 
 enum {
 	KHADAS_BOARD_VIM1 = 0x1,
@@ -76,6 +100,7 @@ enum {
 	KHADAS_BOARD_VIM3,
 	KHADAS_BOARD_EDGE = 0x11,
 	KHADAS_BOARD_EDGE_V,
+	KHADAS_BOARD_EDGE2,
 };
 
 /**
-- 
2.49.0

