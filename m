Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5046266B46;
	Tue, 10 Jun 2025 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586365; cv=none; b=B3H0jHJNAmcOtfJUp6420u3K5jeLIHifelBzajA7DLD5Sn21quaD7bMCtSD1rYuiJYyACaxKNks5Hzr4kP9MCGHlbb5deHtImHbJw4j7rkbkqU1vwmSxICKOgeYOYeRw4DyAtY+DwPBd8B1lGAojRNBGpqNd1yqmzIOTTjsQG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586365; c=relaxed/simple;
	bh=hgmwqVh9XIhlP7omZsMBOzfBNE3pBOvKp0NYjLwGgnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+vM2ZbeWfkCiDW3dp44ziw+w+AKYpNRKUlP/tnWCZQjiNB2csLywdtWSw9gJyCgz0U3KMhe1v/ZdJHGviwEQMP1YNXJrLy/VAUkuPSuk/Yg31ryGAEMUcteu3k9YohaW6nxVebN3CjUFOn1LN0sBfGal6lsoyOgdlHQoPNcJyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKvPsQhd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKvPsQhd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a510432236so4601346f8f.0;
        Tue, 10 Jun 2025 13:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586362; x=1750191162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPm0e/JJXYmTtXoApki92fg4KK/rnmg1MG8vP8qKKeI=;
        b=jKvPsQhdo4XY4J6GQXUublxv9zZliUmKxlY3RFTGcnuq8340OkvYi2BtJDJAXvoy8N
         h25BmQam2BJPF4nZYNGhDjLcp66ybq3QIQ31ByUSVg3y4eZZhzGeAaiPdN/WHkLhjJFQ
         vwGXIjLHIRyYTPxXNV5qunthWR/QnS9cAWEBpX2t7M90rm1ejn771dJfiFjOJde/aqHG
         uMEMZGcFulmYaQX8ECOBDMtasFY8h5qr/PMaVu+g28UFXp6HMVbQjZ1szh7fwzZV07oZ
         BVJLW435nzRDF242QWlTZ1yVOPpIFwACnTQIpj1cTku83TQFAp+GN1zppqHnhdY36uTA
         wQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586362; x=1750191162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPm0e/JJXYmTtXoApki92fg4KK/rnmg1MG8vP8qKKeI=;
        b=i5WOBwJ3VjoK8KVC65sR2VTh1sGGQetUFsO9oW2Ah1St46uR4GDxLN3dsNbzirCHq1
         xIT7rZzNRVr58gi8/5Ap4DkZ/lUS85h9vGU2eTn8ALCfb5cQA7+3frYCgBhsq0tOUBbD
         qK893P774+jJh27aJZ79BB9RXRMOt3K2dtiMSUEsHBoWDjZqAdcsboFKjXBzK1v5pStL
         DzGKi6rpZ0amC0uGd/tvKXnq487f1kGIWDuAWjnHLugst438e+ZJ+mAbLncIMO2CcgYF
         BBH5py8IIKSBH31E1BRxLD9XxDQj1HEB6se4dCdZ8mWxzdNBhoyjiBycU9aQpIRyXiGA
         SUOw==
X-Forwarded-Encrypted: i=1; AJvYcCW0sXnGXaCovym3a15WlrK3HHtkGMuptwRa8IeMA1954Wffk2dXXQcfdak26shYWMOE3UTIOdivij0I@vger.kernel.org, AJvYcCXe0MzLeysAA2XpqqoxddJtd92Sr2Ew7y0N5t6HTYFOdOTBPt8vgUvkfLzGvDJJoPbZ9HfREHY55grwMu51@vger.kernel.org
X-Gm-Message-State: AOJu0Yym44+S2xgwbZ4qZLtizM3Cv0kfzoUaKwqI/a1x4hQOHrUxthsO
	dkk29UAs4WeuUmLXkfXpCAx/H6KbLFhlOMnIljkTrL5Cg4lyso1XMhRM
X-Gm-Gg: ASbGncvDP+FC3OFvoe/M+01w+0AV5lmVnYN3SPrZs/rR9Uryy3mIZHKm640gcx988q2
	rAFuvOhbW1xCb7TT3/7wOHRWa4WVP0Naka1QNUmrmeBmsbv41gfl2EYEiDNsIDeG15p/BFOOIa4
	5JPUTqwWE9pMZ+wN25blDLlGnvbLzDhhAdVVfitP2Dnu8OkI8DFk/fuMBiza3+vkObs307738wO
	nGUPk+YYsqgeIIxlGFq8mkcaGSoFs0gRITXDRVWFHlE9zqiouNYDElEByS1ViRmewZakFnwD8zD
	Ow5EkED6gI9IPxComOtqM/BZNmx2LIINgYnk8jHe7YH0+R3UvWY88znhWmz6Pcorh++Va7SZ0ds
	=
X-Google-Smtp-Source: AGHT+IGeIgB5Jm3zvzqrQCQ5YAuHI//D5pyuMaTvzBfMR1wJ2aI2COqR2XOMS3IGrHzzEanCXEJOQQ==
X-Received: by 2002:a05:6000:430b:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a558a27aabmr309671f8f.56.1749586362120;
        Tue, 10 Jun 2025 13:12:42 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:41 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Tue, 10 Jun 2025 22:12:16 +0200
Message-ID: <20250610201241.730983-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.49.0

