Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27442676E6;
	Sun,  8 Jun 2025 23:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425023; cv=none; b=vAe8C18zPL6AelZPzcYR+YNPPhWMy0YKYLSaQOdY1uzyMT7OJsqV3uyXiDvj2tpGookwWFFPrqJmHw2NyTbBZ6CEJ8prxOgtJbcYg65zIy6WwinCbPN6VkCZVbJ9KFbXxegBuPwQ1L3jbxf15UruV30o5UMe/vGbWvHVPXr55D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425023; c=relaxed/simple;
	bh=AHpEN/dJhul4v/WmXKedW/4rDaSNB2ehr9j/Q9PtQqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nr9XtVQze+DSKBQioHvPPxGG7IZda2wvE0JzuISW4EjfY3TMMMGfN0Y7oO0+/4/XgcXnHeI84eDHHI7Qt/1IaZe5ZueWjABeuLhrQttmKFnkWFOlhM8OHpcZ+QNHAoT2SG7eN/K2HrX/HSCtvheBzG2Doqhku9eMyJ71vDI7aUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaLz3Z+s; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaLz3Z+s"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58ba6c945so64397291cf.2;
        Sun, 08 Jun 2025 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425020; x=1750029820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyOPT5bb27xpSlfKUprjkFPzASHSgU4t1PeuReJqiO8=;
        b=iaLz3Z+sNvZ2FCdaQtaCnScEzbJIgpMmtZUVWoRR+8e7XnvI4jwEmvDWVBUBG9FkQd
         7uPqD8rK+a60Jv96MYFPnbO147IEPTcSruaJWX49l4NMLBW4N93QLSWqtoZ+VOMX15L8
         G2Qfnvnty5sECTxGXk8V9tk8w+RDyKvpZOh+ID5cSjhGpqvXGFbEJlnVgjWB7kGcZ7+5
         RNYplnYlAAKG5kzUJ9JgsIPBlbm/096aBCt+xmOnWkfHcV3z8C3k5TxTYSxopgSYnh+q
         j+28OW3ZtCOoTacWNFGL3d43P1Lk0KADWqM+PPoI+7yuWhP1TOm8IkcU99ePbKeQE71M
         3qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425020; x=1750029820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyOPT5bb27xpSlfKUprjkFPzASHSgU4t1PeuReJqiO8=;
        b=Y0khz/t5g14ICBt6iyvhrYbb/IhKFkRbd1jQjb74hL+vhYj2LNmpTrdUbEZOEU9rTN
         WpvSrE90GApexNKu05oFJKRHo31Y7Xnr9JIEZvika2Rl+eTj+u90jfNis1cG6CMrrYw4
         h4gWp9YXTjRitoujDPsllN5+/wwfh5tYE+trRqgd/WIcIUYpwnf5SO0JWFq0Ls93SIcO
         dBIH2+YyMb3zVVv6+fX64anIdzAgPlkCcN5pz4egg9h5d/4rvovfbAqo2Wa0W3QReKsh
         VncFvr1kHKEFR30hJeNw/2gIxD5NgRfxKEl3ioqAcKFCmZ8ReCC8pfPBonXb5S0W3cle
         4+3w==
X-Forwarded-Encrypted: i=1; AJvYcCVfRw/uA7PGwxu6QC82ju/q2U/Ua/blshpvASeJMQfUHBEGJTJvBn7s6/M/7mtmacoh4ON28EfKxhoDnR/C@vger.kernel.org, AJvYcCXY4TdDeEmzaV/UPDM0e3VywJO0aZodnkCGwzIat9eFua5eQHOQ18vooNR6egXh8Hdkqy6hdf1e15z3@vger.kernel.org
X-Gm-Message-State: AOJu0YwA3S/uKWKKscmoQWI45fhb8+br6w5TvgNetadXxa+5YVby8pdn
	sTB7ar/fJ6wVihxCdNaaYp09GDzNNzEbovRtijH2AxI7UVQI5gX+EGo8
X-Gm-Gg: ASbGncvqRwxNjhg2XYeGPKRV/5aay4B4z4vv7ShEAuUnlnjB0fPuAfe5LOLBu5nYpyd
	9vMoReNtwCQJdd0+PaWRurhJVFIU+IDOSCWzSaYlh2NRqJc1apiSrN/Nnj9duJomgshD77kwA4m
	E1hImTMml91IQrTe/+P2mkh6XdcREMqloFhoPBbr2WmuGKqZ3Rm8rrYJX8W92jXsWeL4aENgOzD
	yA31qIuNAbNiYg+1+/JiAL0tk5Xc644wkD1xiTijllIhJUtAUyqDVT5425gRUNlqv5NjQ7N3Pi/
	aB5tI/iWa+FrR53ySEgAk7pk14ykql5+NZBn5w==
X-Google-Smtp-Source: AGHT+IET3f7QbRTBxJ5zmqMOJC3RYOEvWDP8i0B7bIKfGXy4c6ekxkf5y/zk5WatlDc2mvCvrtc3kw==
X-Received: by 2002:a05:622a:1cc4:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a5b9a2ae3bmr204216041cf.20.1749425019695;
        Sun, 08 Jun 2025 16:23:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a619852dedsm48449871cf.39.2025.06.08.16.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:39 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Mon,  9 Jun 2025 07:22:09 +0800
Message-ID: <20250608232214.771855-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset generator node for all CV18XX series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi    |  7 ++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ed06c3609fb2..4c3d16764131 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,cv1800.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include "cv18xx-reset.h"
 
 / {
 	#address-cells = <1>;
@@ -24,6 +25,12 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,cv1800b-reset";
+			reg = <0x3003000 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
new file mode 100644
index 000000000000..b9b6dd56a9e2
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _SOPHGO_CV18XX_RESET
+#define _SOPHGO_CV18XX_RESET
+
+#define RST_DDR				2
+#define RST_H264C			3
+#define RST_JPEG			4
+#define RST_H265C			5
+#define RST_VIPSYS			6
+#define RST_TDMA			7
+#define RST_TPU				8
+#define RST_TPUSYS			9
+#define RST_USB				11
+#define RST_ETH0			12
+#define RST_ETH1			13
+#define RST_NAND			14
+#define RST_EMMC			15
+#define RST_SD0				16
+#define RST_SDMA			18
+#define RST_I2S0			19
+#define RST_I2S1			20
+#define RST_I2S2			21
+#define RST_I2S3			22
+#define RST_UART0			23
+#define RST_UART1			24
+#define RST_UART2			25
+#define RST_UART3			26
+#define RST_I2C0			27
+#define RST_I2C1			28
+#define RST_I2C2			29
+#define RST_I2C3			30
+#define RST_I2C4			31
+#define RST_PWM0			32
+#define RST_PWM1			33
+#define RST_PWM2			34
+#define RST_PWM3			35
+#define RST_SPI0			40
+#define RST_SPI1			41
+#define RST_SPI2			42
+#define RST_SPI3			43
+#define RST_GPIO0			44
+#define RST_GPIO1			45
+#define RST_GPIO2			46
+#define RST_EFUSE			47
+#define RST_WDT				48
+#define RST_AHB_ROM			49
+#define RST_SPIC			50
+#define RST_TEMPSEN			51
+#define RST_SARADC			52
+#define RST_COMBO_PHY0			58
+#define RST_SPI_NAND			61
+#define RST_SE				62
+#define RST_UART4			74
+#define RST_GPIO3			75
+#define RST_SYSTEM			76
+#define RST_TIMER			77
+#define RST_TIMER0			78
+#define RST_TIMER1			79
+#define RST_TIMER2			80
+#define RST_TIMER3			81
+#define RST_TIMER4			82
+#define RST_TIMER5			83
+#define RST_TIMER6			84
+#define RST_TIMER7			85
+#define RST_WGN0			86
+#define RST_WGN1			87
+#define RST_WGN2			88
+#define RST_KEYSCAN			89
+#define RST_AUDDAC			91
+#define RST_AUDDAC_APB			92
+#define RST_AUDADC			93
+#define RST_VCSYS			95
+#define RST_ETHPHY			96
+#define RST_ETHPHY_APB			97
+#define RST_AUDSRC			98
+#define RST_VIP_CAM0			99
+#define RST_WDT1			100
+#define RST_WDT2			101
+#define RST_AUTOCLEAR_CPUCORE0		256
+#define RST_AUTOCLEAR_CPUCORE1		257
+#define RST_AUTOCLEAR_CPUCORE2		258
+#define RST_AUTOCLEAR_CPUCORE3		259
+#define RST_AUTOCLEAR_CPUSYS0		260
+#define RST_AUTOCLEAR_CPUSYS1		261
+#define RST_AUTOCLEAR_CPUSYS2		262
+#define RST_CPUCORE0			268
+#define RST_CPUCORE1			269
+#define RST_CPUCORE2			270
+#define RST_CPUCORE3			271
+#define RST_CPUSYS0			272
+#define RST_CPUSYS1			273
+#define RST_CPUSYS2			274
+
+#endif /* _SOPHGO_CV18XX_RESET */
-- 
2.49.0

