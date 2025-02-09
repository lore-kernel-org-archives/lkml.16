Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A161DF747;
	Sun,  9 Feb 2025 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104206; cv=none; b=CGQmeJaSWiJxCnHm/05Xr6+EOyg5OV0I7JI55QpwYr3doZso/Qq/eSWzedSn+ewRZh5UD1+jlFT14icB3S4G+Ppzl/q95HDhpbzmZoGqtjt2aIxAL5hl93RZvkvKVMTqaZhQEhbZUOrsWV7+VV6s8Oq5TneEym4LVBCMBN5S8gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104206; c=relaxed/simple;
	bh=ig69VaT7nCFBD5aRGVUc1/uLdqZH467Zr0H0LoJq2uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0m3cNAZUgCeUaAJB+TjcST3pKh0VxnVThmelfYHcJ6Uo/h+qvTlYCjvrgR0O+U/Svt5sYplajVUCjEIkQZ2kqSBDCZEjQavpRNKRHrwsSIcbF2ZxOliK+6AE/wTstkaOzLIMTSR03SQV3aVDylytP7uGIQ/xvcqMsJB6Bl4aoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZYXBqek; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZYXBqek"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4718e6fffbeso3200471cf.1;
        Sun, 09 Feb 2025 04:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104204; x=1739709004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGHYTtsO5m0v1wjedl0Lk54MdsgI8dY68S8yR3p3+p8=;
        b=WZYXBqekhqO8ZFsnUgEQ4w/dU3aJOZZiXXjuZqA+g5jRU5uUwjUAFf4jhGcO7EJsrA
         qB43gRyTCTdcoLNeQOeY5ZFY7V83okzax1rRKxucMuXdcg8HCuu+L//DEyL9UB4vzvU1
         6mEwkFcsPMbAhz0skkeQMhRD0Xkw8ybw/by7nYCJKOQPoCmY+aVWRKQKBSIKMxtfBAHw
         YhGXDyJWlBHm7pqo76GRxmy7vpJ7l06irJBWHhzj7Gu3sIWOeuHzrApBU5b0muQrbbCK
         Mdt7kNIwkWlmMxEFnz177g7MtXkK7XU3HTUTjQNbUPN8Ex/jqVH0sFfBslx2BI39czLg
         YNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104204; x=1739709004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGHYTtsO5m0v1wjedl0Lk54MdsgI8dY68S8yR3p3+p8=;
        b=SsTORMYbLfIlphLIx/yaFkxrieeCBuwzFrrhI5SKO1LE8DfLNu/suQOZGSFI3ZxcjH
         ef2r/3p4PjrGnwGFpBIa42B95m6nUOEjRcBVie54NoqTpQ7Cnq4zbbiJqxgp5oWHTtrB
         ZXEaNOnsahE1iKzeeG7PCVw59Nee/ifA1sYrCW4r52+gNvFK5geFjCZtMzhkXWX6aQEB
         QXNHrkobdo+LXU8+nCgrFNxPTJEYczsLxjkpo/1XHLe+nueHZO7A0A56YDEsLQrcq/eO
         naIqX1QMK63ao8f7tQFvA8DHO0XGjPSMvRh54OhKd3uUEQ5p66m/GMX2Yukaeqc74mwR
         sBzw==
X-Forwarded-Encrypted: i=1; AJvYcCWo+lxzgQ77Ji4wjx2NE6/5zSSB85g1o46t1I2+TlBC0QTLYah3LEXFkZrrR4pg8PW/B+TCsFSqlHyfatVG@vger.kernel.org, AJvYcCXPSJJtU4TXMBNbgeJXt0bP0eI09K0ldikRaQHS3PV3TbWPRP83gAeTh2jQNizVjkShgz4xe169DbId@vger.kernel.org
X-Gm-Message-State: AOJu0YyUyIrxU0pchsClEsWh8rabflKHItkiBambg/xyvP4v32MdC2oX
	Z8up1J03YFxuI0TvGpLiZKWtDBwz4wqAsYGdwBaaKP2fhKiwIphK
X-Gm-Gg: ASbGncuU+DLRMlvEyz1neeRLnyxJ/90h/6JPWi8mjuH5CK/msNo0rDmL+f4iWrG10Fe
	fNMjmEzB1ySx61w5/rrgc+Uih4SpMVUXYITM0qowfT8vPgHyGaP5DQoIvICkVnAQSvySbwB9Luk
	BbDYdmhCnkcjxHDZwp6xOg+E1Uq8vKd9Dw4TfpQdOrV2TNfLCdzWaHj5myb1A6V7nvIUjlbcqsB
	GFw/SJuJP5onawPy31RT3/6SGCItwH12GTKz4AFUqL7PPnWoBxicjIuU4Ixi9jSXHE=
X-Google-Smtp-Source: AGHT+IE+DwN/tIPHA9yVzmEHHvww+6T4HxFjt9LxAFNhsW2bNJs1ipcvQrD0Ovvh/YRzs9Ku8jQ+5A==
X-Received: by 2002:a05:622a:519b:b0:46d:d8be:d2c1 with SMTP id d75a77b69052e-471677f61bfmr152285431cf.0.1739104203900;
        Sun, 09 Feb 2025 04:30:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471921be65dsm1729841cf.65.2025.02.09.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:30:03 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Sun,  9 Feb 2025 20:29:34 +0800
Message-ID: <20250209122936.2338821-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209122936.2338821-1-inochiama@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
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
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
new file mode 100644
index 000000000000..3d9aa9ec7e90
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
+#define RST_AUTOCLEAR_CPUCORE0		128
+#define RST_AUTOCLEAR_CPUCORE1		129
+#define RST_AUTOCLEAR_CPUCORE2		130
+#define RST_AUTOCLEAR_CPUCORE3		131
+#define RST_AUTOCLEAR_CPUSYS0		132
+#define RST_AUTOCLEAR_CPUSYS1		133
+#define RST_AUTOCLEAR_CPUSYS2		134
+#define RST_CPUCORE0			160
+#define RST_CPUCORE1			161
+#define RST_CPUCORE2			162
+#define RST_CPUCORE3			163
+#define RST_CPUSYS0			164
+#define RST_CPUSYS1			165
+#define RST_CPUSYS2			166
+
+#endif /* _SOPHGO_CV18XX_RESET */
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..9aa28ade73a4 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,cv1800.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include "cv18xx-reset.h"
 
 / {
 	#address-cells = <1>;
@@ -61,6 +62,12 @@ clk: clock-controller@3002000 {
 			#clock-cells = <1>;
 		};
 
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,cv1800b-reset";
+			reg = <0x3003000 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
-- 
2.48.1

