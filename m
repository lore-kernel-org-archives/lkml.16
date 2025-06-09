Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308DA22F155;
	Mon,  9 Jun 2025 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512515; cv=none; b=Ft0msY70B0y1Hr+mlRhUKiohgsunTjz2Uvo5duQAZ3+CXaIJtXpSRn0u5zcnMNRKaudf/I8xoBjibUAjjT6978XVACOeizHGy+tF2mvZAwJPddwrz8D/z0hLh4P0wXHgeZM+JvnNZTDA0ztz+i5R9/ZwWFotu92tjAFMudY7ZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512515; c=relaxed/simple;
	bh=pwi6o6ww6dSkF8fNqOT9t3Uh8gUsHMUCgpjs0IyKqIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXh6TfuQ9q/nSMJwGQYuQEwgN2cJV/a9+xT6eJKKpSWVRnyv33+VUtnbZ6UKfNQ7SFvjE55c1ScBdl6J7QwiAevgSZ2IKsgYXnmYsCWO1FkRvQLMBaoHxQruyYf6IkkKUCQYN8kypFmHwpWcloHifS78Wyqdjsq/sR11I/vSJ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6yEJmN+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6yEJmN+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d7b50815so41848995e9.2;
        Mon, 09 Jun 2025 16:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512511; x=1750117311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo1dYTSb5N84GQeVh5+0QHCVJJnsbzuqHcvvt9y6zKY=;
        b=M6yEJmN+qvYyDfEn34hlOO8JMJwa5VM6SvwIL4IkRxVfwIFGByKKyX3Mjzqzi4bNJQ
         CuO8E1eNZ/yJD8miZa4dxsUG8cB093gPSmybBJEMx3CHi6B9NAQAdtG6XnAflUUuO8vV
         Ppwyw/jZOXqHflfFx4naQYVXj4mLmBjJSWLW2oajO+bv4tWrPoR0i+ET17BrLjZ2eiQ4
         ZjovRXSLE16Mp4ls26Wb0XBo/4Y59JfGeB3dTPmhh0hAg+1PYvwnihcGiInCPhQaE+tE
         3PzSrk2CbjWeQo5ywvb1VcEKA3gDYK2f10d8nw2sogeuBPP3DMeIrHFaxUoNvCnPiIN4
         T9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512511; x=1750117311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo1dYTSb5N84GQeVh5+0QHCVJJnsbzuqHcvvt9y6zKY=;
        b=T2iO6YrR1Ipn0ookgJKOwxgFloXoV/6+GDnDg5svq+Xx0iSJYirSDFHdBIAk1T5oyo
         Dl8XFnvW5KId45BUc1rd927iA+d2ItLtOhqs4wO79F5OJU+n4k/OHzDh3i57g4IJARab
         bM0XLEy0Gd99Xr2wlgnJSFAon9mGvnR7ee9zHzf8RFRooop/rqQEVTsibIvrEae0xb9L
         GacsetUOFgLe0lHE3hyBeOe5610QDVobJBC1hiRHY7iYH6FlZL9i350sUNTxQEy0LEav
         O4xbKVIWKqbD76v5Tihvpcvp1SAfXThjgX+hytuh94ZLUyuF8Lp44LYwtVdO0u493yXh
         4b5A==
X-Forwarded-Encrypted: i=1; AJvYcCW+PReGBNmKJ3nePXnwQzyiz2m3Wc78zURhcuAAwtaN8zbGGB4PR8OragkvcRpgTusePrUtme8ItY2M@vger.kernel.org, AJvYcCW3bwK64XIJ4bfqX1WUXaUPr5sslCBlrjDgEkvycXCYCeugC5NteVV0kt2D/cKb92XOxP+pewm3hdYpDVcH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxau0GOYMNqfnv7HW0tbSSW73DMIVoh000qLmcWKyO3ymvuQylU
	FPcACumAKahtpj/xbIRknr6sUkYYMetgWCTqEItLI+sq0xB4eYdoPZy6
X-Gm-Gg: ASbGncuK7dVVkryBY9zcAZX9Lfp4QcZkTJofpizupcldYE8TCsnbhLXaD4Jj+fjqVo5
	AwdKqKq2QAKt/wretZgKRK3twzYrImSkOKZGPr6d8MhoxTcjtcam8xTfa2bkozUJ/zufl69fqD3
	CbuTja0Vb7nFoHRFMCNyd19LitmfzpJIVT8A/fMQMUVsM1cHGQ2lAxPL0wHp9p3zfjpdnVFt6HY
	0m+ReXMn2CiOAfh20+9uHawF+5NyU4lnOduENollAFJwWSOtezcvNnorrAoII+tKOObpjYCz4wQ
	JFfEMdOsawwcKOYsLFb+MEy0vBgVsyZF3PaTMsdcUVIs4QVARC4ZOaQ5PwRLIx3kW2COBsyZa7Y
	=
X-Google-Smtp-Source: AGHT+IFApIvy4cDz1KO3QF2Y2DufyzGd0D/WiNt6nw0laf5Xpx85PGR9pawpRsdmsQ43gv8vaIkl8g==
X-Received: by 2002:a05:600c:6205:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-4520140c06dmr126096785e9.21.1749512511504;
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:51 -0700 (PDT)
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
Subject: [PATCH v6 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Tue, 10 Jun 2025 01:41:14 +0200
Message-ID: <20250609234125.722923-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
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

