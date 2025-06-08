Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7C22673B0;
	Sun,  8 Jun 2025 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425026; cv=none; b=seQnY44Ov/2DP1LdtDUGzl5GUF4githjfZEN/IH8xc+zGpX0xRWTyRHG3Vj3siQuvqHoH17mdNCO9DwxBoNqhY9H8nLRtMYtJTUBhxDrT+2McZAtFqg9ge3jUjOkIRY/AN3ymbpCRIBXall2krTgoFApre8vKLvsi1ZwlutjyUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425026; c=relaxed/simple;
	bh=hBgMPetOaLI2yQ8hN5lqvc9AJmOF865LMQBDSkW0aw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwdZlLuUmFFSRGAUvXn8gCYiiW7jXMREO6Mr2C8qMIwgXcrVK9cR54aNlmub2tTmEfPxz/nOf8pGoyQzVXGNqJ5GdY3GStVOllFTn23U3LN4uHFFeYk1vC5pyDGNbOCaQ3edhqHHX+6NHJtQjE22iYRNl4ffEwlz/6TCGflZY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJxQkIZA; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJxQkIZA"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecf99dd567so50628116d6.0;
        Sun, 08 Jun 2025 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425023; x=1750029823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f80/rTjexX6kZx0F6zMPRlo3NF3zV6bgMpBVAmghpHA=;
        b=lJxQkIZABxSUHu/P/HEq0XPSo0ZGpjlBZRiGgPr+Ha6y3NGCo+m6bTavigQeMlSiI7
         g3uoxtPiBUmgjY8S+C6QinEc4D7WCpWlKG5WsUxjqVMebof5BbsFBKIn4IsoeLvv9/nq
         j9gD7xxVF9wsmtFn4Z3B3hxL6GoXpBMkZ81BPudAdBBXDtIFaXbYMjP6vcWD5VEjZszU
         ecHtbUlFx08vrE2ZTvu2tnpPBqXQ1DTvFm8h5aX+fhB2zOcWburFh3k7gFAevgoBnj00
         P6Udt/KpxwGewZHBu71w4tLYoN3fuhgPme/OejysZjccAbkaOQRA/x/cs8fo5D4C4zEH
         SAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425023; x=1750029823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f80/rTjexX6kZx0F6zMPRlo3NF3zV6bgMpBVAmghpHA=;
        b=n0mz3Qo0mdpH7LPFfJ8qZCug/zt1hQxwiFlhRHZEjx0D7EPtmcj3iM4U1fwUNABJWm
         z9xidIC6ozmDXLe6HRHhJxyoEh1pcQU2OxDB2dKSxSs6fMCTQn3O3tr1uumsgvlt2+DM
         7rHUH5GpKfczybB3YgQRDhu+axRaad2ad+4pD9syGD/f0ijYsh3p2uLcs5KjDX9TMotm
         DwsdCsRQjFBlBzEGEiuXUwxqKrPa1AaVBvywHVfoJG8bGoTTCXzrgVybyT6UGphQpGxt
         MgQIucPmyK7sSWfW6QpesMrM6i6ke88+Q7X1RAgjqt4PZZrjfv3TD/LdlBLxPrGdXIKB
         BebA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/NnaLdznG/jLvTVEy6LtARSELBzpctQsrNsAqxUyI3AlyfOKEDsvnJu+cREi7vBp14qQ7hFM7rvF@vger.kernel.org, AJvYcCXOubSEdKQ5kOPi0FrA6ghl88SdckEYHGig1JqE1Wp2BfQ8brQhU6N3UQkzR0Zm0D5CGzKufwDBPi9dDJQI@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7Q1nC0lST6RjwEiQk0VRhPmFnnfcOipYLjN2ESm58+/omhzl
	c/ePHAWh4M2ez0N4gKkMc3Rg8+ti489dCu3KVD5QWR25neVTuQ5QdBME
X-Gm-Gg: ASbGncvjzumtxPOhPWjh/xH3hYdU9hnZB/ceDUbTYXc7JfV9a9dSjr6tZ5n5+uYpFB2
	bQ3542KcI+JnR9Q9aCHHjVXhsMiKMZRbZiBBLDd0FCavbL0nH5GJJPZJ7e6Rk2h0jTbCLXAjFAj
	3dOFP85mrwaECypnDtB+XOsnM4059BK21DcoGJ7uFMw+m4O6K/rLpiBCLHyO42SDr4iJHsFCjgS
	kTPntDQFy3H+saJWex2GvbwQ8uparXd8sDv0viT2QxpUxIhYVPRVSJ1U+G8X+vYxp9YjitKNR5w
	ex6vNM8xeO27ylm6A6tyaHYNx0oEDqCyGqggsw==
X-Google-Smtp-Source: AGHT+IGDR5vCzjnRiL5Bd9DmHdP239tGw9TK/2w6p5uhxMHd8d9XEN7rTINOxss4Gjf2OI+0cHYNfw==
X-Received: by 2002:a05:6214:5017:b0:6f9:51b5:45b4 with SMTP id 6a1803df08f44-6fb08fdc76fmr172715016d6.12.1749425023356;
        Sun, 08 Jun 2025 16:23:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b36759sm44140746d6.121.2025.06.08.16.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:43 -0700 (PDT)
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
Subject: [PATCH v2 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Mon,  9 Jun 2025 07:22:10 +0800
Message-ID: <20250608232214.771855-5-inochiama@gmail.com>
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

Add known reset configuration for existed device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 4c3d16764131..e91bb512b099 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -36,6 +36,7 @@ gpio0: gpio@3020000 {
 			reg = <0x3020000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO0>;
 
 			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -54,6 +55,7 @@ gpio1: gpio@3021000 {
 			reg = <0x3021000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO1>;
 
 			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -72,6 +74,7 @@ gpio2: gpio@3022000 {
 			reg = <0x3022000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO2>;
 
 			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -90,6 +93,7 @@ gpio3: gpio@3023000 {
 			reg = <0x3023000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO3>;
 
 			portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -133,6 +137,7 @@ i2c0: i2c@4000000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C0>;
 			status = "disabled";
 		};
 
@@ -144,6 +149,7 @@ i2c1: i2c@4010000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C1>;
 			status = "disabled";
 		};
 
@@ -155,6 +161,7 @@ i2c2: i2c@4020000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C2>;
 			status = "disabled";
 		};
 
@@ -166,6 +173,7 @@ i2c3: i2c@4030000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C3>;
 			status = "disabled";
 		};
 
@@ -177,6 +185,7 @@ i2c4: i2c@4040000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C4>;
 			status = "disabled";
 		};
 
@@ -188,6 +197,7 @@ uart0: serial@4140000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART0>;
 			status = "disabled";
 		};
 
@@ -199,6 +209,7 @@ uart1: serial@4150000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART1>;
 			status = "disabled";
 		};
 
@@ -210,6 +221,7 @@ uart2: serial@4160000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART2>;
 			status = "disabled";
 		};
 
@@ -221,6 +233,7 @@ uart3: serial@4170000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART3>;
 			status = "disabled";
 		};
 
@@ -232,6 +245,7 @@ spi0: spi@4180000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI0>;
 			status = "disabled";
 		};
 
@@ -243,6 +257,7 @@ spi1: spi@4190000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI1>;
 			status = "disabled";
 		};
 
@@ -254,6 +269,7 @@ spi2: spi@41a0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI2>;
 			status = "disabled";
 		};
 
@@ -265,6 +281,7 @@ spi3: spi@41b0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI3>;
 			status = "disabled";
 		};
 
@@ -276,6 +293,7 @@ uart4: serial@41c0000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART4>;
 			status = "disabled";
 		};
 
-- 
2.49.0

