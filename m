Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE128D8EA;
	Tue, 17 Jun 2025 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143794; cv=none; b=Bno32NSRI4ubrjSNwsmKwORoQ7xbGttxfDNZdYfejClr4zxQ9MQtOXtxuEF25p+ANTkgy8hJncPUJ3sg8xJJl40lhlgGQKMguIwjZDTL59ADbAGP3u5Fn2R5mNxPTz7N/VB+rUdTSqQVzUKCuFdkCkyPwmBrRiBXH2rRaca1H34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143794; c=relaxed/simple;
	bh=5JfePTqTY5kgk5bX/rR0HzAWH5XmacCIM0CylxHF4wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+TyMPRMlfBcVsKAYXgI/7CaMaBAtM9dzfs7dfzBcqn7tbqn0ad0BP58leaCDTESZ2PgqWWJTjWl+lH6LctxQnWlowQUzdT26BPb8sj8sJPnQXzMWWZgIQg0lGPrmTU8Rpq74zBhrI+6UTlXwC1ZZjI4t7GIYp/Ncdb91X/u0qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYH+HsA8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYH+HsA8"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748764d8540so4683702b3a.0;
        Tue, 17 Jun 2025 00:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143792; x=1750748592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UdGSRBtW3zJuEa1jcNBnGiuq7LhCNm0hvyprzoUF+I=;
        b=QYH+HsA8xJkvdm4xn7zAetZ324g3H5NOb69qIM6Qre4ZvGVwAGJ2v+fFoteP18OvF8
         14KzuOevBo1PVWf8zWDzYz/VQ2qLuOIA3VDqLSta1HE7sd4UBRZNe5rWbu/XarVliNOm
         K1aYnCT7VMaMy9Zu4ttEGHjJYZoBg+/Im02reV2K57uF7HFC2762T1/OFQHPzc9J6sSj
         UlXDxkQXwQ00YmhOZurK/u63l+yr8541bY/mbDPp/HPUuU4WhE6IlSY/CADGIUlU85EK
         jNKfslgq5Oq5vndRdor5K/DdbNJCQqvbpsMU+E1NR3XBSudDmoZVkpwlMVf/lWUhB529
         LqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143792; x=1750748592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UdGSRBtW3zJuEa1jcNBnGiuq7LhCNm0hvyprzoUF+I=;
        b=HOUMtSk+CixLEpo2QvvcA5Y5kqNSITqTOhlvP72SWDmsCpZR28OCeYv1kuM64mA8rn
         HGeEmM/Kq3F1x1slHwp9sTlqOocbO6eXKCRydgsFCF8l67yjWEApC+47FfHyaWXDCPWx
         j9b7MeiuT7w9mHn2zzlf1QzlI3Y8Ip9Ly4wXCDNeO2TL+z2YGANSgAJ+rTUuoQto512P
         pcTc8TXJMVc8H9m2Z7GOM2V3/JoY3vkQSPHdg1Ngw46xCcLJGzA3tgZq5tnc7FfbxNIt
         o/laItYF9y1sYdnndCMxBw/0/hAaWePpqLPdYcCAxY3rDDKn+JaUnQHkVGLoJbJWVAwI
         nFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMVATxx+c+J4qzhAOG19S8f3YclhAQeGIIbr4oNE/IqGEj9j/wH/GrRXPNd1090LhvtcO1bTswICd/bUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKCN6bXyCifnl4Vhn8lDNC2ZYRslgUoEMyizPAhjcnZrhw/Kpr
	3s04nRw868GCLMFUphZMxFlRCYHBg+SZmClvvk5jXoQ1melT4qh1D75D
X-Gm-Gg: ASbGncvOyHzWOdPvtKfJNg8e8bLygvFl4gJfDONRnr3GXasEihuDAt9xJEZaHHJRSix
	EoNK9daSuZGE/MbsmNwCpq99NOx5iYoEcLBrS7zpRSYDdpdCOMJkIt6EZk11T46Axe5J1yXYGG+
	gfP90okrIRVRIk8FRrDiJveXkEPvRh7iiWgOrg248jPGZpk+QHhIS9HtzI6jenZsMKOEnbtiiEJ
	B6RZaZ4izpArZk5QYRFuJeh9NHAFEvYoaEbMqhjyzSO0YKHIVh8z3cqhJuzGN9vHO1ZQ5KUDOAf
	3igtCJNcEvC3lf7Z8xDTcF7wp/kuOt0HaDLDd1ftMWeYLLvFzAzB/YXmA6qIkw==
X-Google-Smtp-Source: AGHT+IERdIRVvngfHGqJxfX04eOz9nZM4qur7mID14p1Iyz5B4TsKxuW2OSyqquX4OQBh6x7oRRpeg==
X-Received: by 2002:a05:6a00:846:b0:73e:1e21:b653 with SMTP id d2e1a72fcca58-7489cf5a90fmr16117748b3a.5.1750143792204;
        Tue, 17 Jun 2025 00:03:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748d956442bsm300539b3a.35.2025.06.17.00.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:11 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v4 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Tue, 17 Jun 2025 15:01:41 +0800
Message-ID: <20250617070144.1149926-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset generator node for all CV18XX series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
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
index 000000000000..7e7c5ca2dbbd
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
+#define RST_CPUCORE0			288
+#define RST_CPUCORE1			289
+#define RST_CPUCORE2			290
+#define RST_CPUCORE3			291
+#define RST_CPUSYS0			292
+#define RST_CPUSYS1			293
+#define RST_CPUSYS2			294
+
+#endif /* _SOPHGO_CV18XX_RESET */
-- 
2.49.0

