Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC121DF967;
	Sun,  9 Feb 2025 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104210; cv=none; b=ce2pdO10pdCh6ZXVfK2fY3ZAXf2EmUmhL25/ng7WHLKRFU+bXppXFGUwwtRy0/mVZGj+h7nkR1WIzp6hnJWrwRPo+cMO13Bfq89fenEvAWGPGWKk/e0uP4qTO0tO+5DcBg9uEoWBxDfszAoYQDAXJBlP/5xcILtmfUO3VRmYnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104210; c=relaxed/simple;
	bh=XNeWrDkqeQZgDTJecMj0uEz+bUG0w9Ec3qujJ8NrWXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrcbAVuXl8EfIMdavuiCs+PVB3EwNvHBwOSLi7V7Hsrmi684nZlgnCGz+09hvItGT0sb2AN5Ss0q8TKy5y7IamKKXQAWLW6h+03e+JN0fwfOk/a0D7Idxho9NHpI2ovftf8H+Rc/+fkLTjLL05UIC2KszVkV1Ibr3iITXUB2h8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRpdW/Ok; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRpdW/Ok"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b8618be68bso346974285a.3;
        Sun, 09 Feb 2025 04:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104208; x=1739709008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP1A8Q2/YJDkOLyvGGNH2HjOHurUFBz6/G+d3BpXgt4=;
        b=WRpdW/OkMAIQ/SHytT+EqNEksDLw8fkuNNo8xKuLoU6uASxgg9NQF2IZwd5nsv/nio
         Mp1O3RHAQ351ZXIAf7jRbW6IS+pgHJzQ1x1UBw+c8jNoLLVPJfHQn6Z1lA/IbyY4H8Ri
         EFceuycAO8hWBfM2xa0fAk+poWF7CMUa0lPe7REqRVHwulYMu0VT7gra9YgECym4oIGZ
         /wWOk79+JGFSCniZSvdn7rUgsSCxEznIsfA3FaB3TE6rbx1ilR1RBxStpuy7yswnsCAS
         T4RVXq31C1akQBM2o6jMqMDT4+2IA4q0+t1n9Va8ASDvLJUieuwNJG8eOcO/ADTpt7UA
         6wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104208; x=1739709008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aP1A8Q2/YJDkOLyvGGNH2HjOHurUFBz6/G+d3BpXgt4=;
        b=qj9N1KL0ans4+Mk1ObOjFu2v7y2kc4gyHCLDVizCsmSI6SKTxeq4IXTZnN4UUxYQY5
         oaRPQI/10fO1ORCGfjdRbtXH89U678wbq5PrFk48p3GN15JzKHNQuBkd9SmTej61gGK1
         bUYm4lYCc+hD32jesAyNNgeaDTOpg7mg1+xESdddTpW6F4WEPX245qlmx/bWCZfzBQjC
         sh5erofkrVpTSCZEXy4F7jbhFdg379Att8MIWs1+5JHfN4x4dMltAKDEhc1ryYt1jenT
         TncBBPHAEeKwMre87wlql24Ncn5iO0u0sjDv0Jh9/I6bscVZ6GAhPRZp+UzaEme5Akh/
         BYeA==
X-Forwarded-Encrypted: i=1; AJvYcCUM7zhZuIEIiNKqg/iN5P5rkYwDQ0aWl3hTQR0cHMcyrEKk1wvjd6WhjMtJoqu+eKfqH04cgeOeaQoAhVKB@vger.kernel.org, AJvYcCXcczcJ7kuTJC6hMa3b1/HtrfYEO6afmrnlRVcuF4ZEH8IhGo4s+aYTyFq4Nz9o9iiTu+Y+BXeO8e2y@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6XJ0Rv2ZD/N+DQvbRygvvXN14iQEAxrnGZMte6Cv6wyGpEmf
	9ig4HS76+MELGB2igyXiLnp4RmRx6nDQUlcBLF9klm5XB2iQwhZ9
X-Gm-Gg: ASbGncv+060Ag7nYjdfGJB9Wnvx1chlhLGrB8CIPWDrN62IBERkHun3am2JIRkIsaEL
	kMvtlBPU4/RR/3yEiFg6RE+g+e+DyKvcUb+9uOJnEtG3uihQHq3tQOiwtPwY3rG+Cbyu0TJNKPL
	qjzbiZrgPI5b798jkPOJrtFvPtRlQosnKOZpXOPMLcT8roP+pDdT1xVAK1dV79dys8xepNBP3AG
	UHuONBUs1NwiSvU4G9rFeyhdTMfnVO4E3RhCOcY4AVq9hXZzZeiM1HccguFFDX9Xv4=
X-Google-Smtp-Source: AGHT+IFu1jYq9+NbSFutpGnGyGE/BrJDPjC+jrFv/p8XEYF0RMJ1EQ79hjJ8gTYNpFdDSrlVeRta1g==
X-Received: by 2002:a05:620a:bcc:b0:7b6:f024:3ca with SMTP id af79cd13be357-7c047c9b512mr1423267085a.58.1739104208110;
        Sun, 09 Feb 2025 04:30:08 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c05a703d71sm65376385a.46.2025.02.09.04.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:30:07 -0800 (PST)
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
Subject: [PATCH 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Sun,  9 Feb 2025 20:29:35 +0800
Message-ID: <20250209122936.2338821-5-inochiama@gmail.com>
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

Add already known reset configuration for existed device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 9aa28ade73a4..4fadcb8e4359 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -170,6 +170,7 @@ i2c0: i2c@4000000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
 			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C0>;
 			status = "disabled";
 		};
 
@@ -181,6 +182,7 @@ i2c1: i2c@4010000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
 			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C1>;
 			status = "disabled";
 		};
 
@@ -192,6 +194,7 @@ i2c2: i2c@4020000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
 			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C2>;
 			status = "disabled";
 		};
 
@@ -203,6 +206,7 @@ i2c3: i2c@4030000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
 			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C3>;
 			status = "disabled";
 		};
 
@@ -214,6 +218,7 @@ i2c4: i2c@4040000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
 			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C4>;
 			status = "disabled";
 		};
 
@@ -225,6 +230,7 @@ uart0: serial@4140000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART0>;
 			status = "disabled";
 		};
 
@@ -236,6 +242,7 @@ uart1: serial@4150000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART1>;
 			status = "disabled";
 		};
 
@@ -247,6 +254,7 @@ uart2: serial@4160000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART2>;
 			status = "disabled";
 		};
 
@@ -258,6 +266,7 @@ uart3: serial@4170000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART3>;
 			status = "disabled";
 		};
 
@@ -269,6 +278,7 @@ spi0: spi@4180000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI0>;
 			status = "disabled";
 		};
 
@@ -280,6 +290,7 @@ spi1: spi@4190000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI1>;
 			status = "disabled";
 		};
 
@@ -291,6 +302,7 @@ spi2: spi@41a0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI2>;
 			status = "disabled";
 		};
 
@@ -302,6 +314,7 @@ spi3: spi@41b0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI3>;
 			status = "disabled";
 		};
 
@@ -313,6 +326,7 @@ uart4: serial@41c0000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART4>;
 			status = "disabled";
 		};
 
-- 
2.48.1

