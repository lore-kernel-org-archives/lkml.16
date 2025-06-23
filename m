Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097125394C;
	Mon, 23 Jun 2025 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683435; cv=none; b=FqDwIvJ3uoKb+vP7aU5QtvI43NcF9N4/r3gPc6Mf1U2Mj8vWYvrdXXHkVxGdpK+0V3eGgWdZHn5E29h+ifwwfNdcMqZmlFRq4CAi8LYZrM7agDtzaljDPnYOZCo+3ZnBi3kjtVuBVLApMZUeFbgeEv6R5uCttrsT64NVKHgpb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683435; c=relaxed/simple;
	bh=DJSrVH7GlOfN6cb35orDOkMbtdc3M+/Haiv087kcVL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVxhpaiINbyUoMLI6TSFghq1Zd3M5eJbfXRN4BgW5SWhWKATmlAjMAgoxAr1HiSdS5idG+Bf8TQNVl8wrVIxiv+kzd5cecLIeHDdd0uL7roKKYO0M3SL8QMaVD0md6WMd3vzrR9aBbiV1GRWDIU+naCeg87UTWOq8fyXTh5NqwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwk0lrZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwk0lrZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D50C4CEF1;
	Mon, 23 Jun 2025 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683435;
	bh=DJSrVH7GlOfN6cb35orDOkMbtdc3M+/Haiv087kcVL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nwk0lrZoQ8QRJxM8yO+5HvwUYw5maLMsKdJH7qfImv4ivCVFRbevnbIGIjyAeQWbI
	 txTlVb6SH/C97X4uHb7kWgjgCejXe+58nfgkHfi3Hc+KnqfSX+M+kYcqrkYIUxwoms
	 1zj+Aeg9LVPNZEwfvWK31I/t2WZ7zGCzoeKVGS6BmS6pne6FwPmMvcP4lIEsNxZFWK
	 0NjXeQTt69EaSiPuxE1hS/c0bfg6CRcAs+PxecqSNGmVZm8USpn8i4KMtS5Wi0NTTW
	 yIZEtN5HJ5SuLMsxoN1w658SLRPRKuwtwjp9zu/fe/i8057A46RC3+OPG4/7fLmOpJ
	 1RUNEPYYhpdcA==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] riscv: dts: microchip: convert clock and reset to use syscon
Date: Mon, 23 Jun 2025 13:56:21 +0100
Message-ID: <20250623-bobble-corncob-6c4e70431679@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UH99rELY30Gno51gklgXi1R8GCrl6eHh831fS+cCFNY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfh+Kdp1KKuifLc+kYCjJxlj+7rzhSoHGqVsiDI4u9 9uwcuG8jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExk+mWG/04HQjw65q2WbJJk OlKyU2dV47GUujNGmZ//nVJbFVgwdxIjw/lg59rzC2StGNjzp0hfmH3+F9cBFbHi6KWF5m8v+9d v4gIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The "subblock" clocks and reset registers on PolarFire SoC are located
in the mss-top-sysreg region, alongside pinctrl and interrupt control
functionality. Re-write the devicetree to describe the sys explicitly,
as its own node, rather than as a region of the clock node.
Correspondingly, the phandles to the reset controller must be updated to
the new provider. The drivers will continue to support the old way of
doing things.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index f9d6bf08e7170..5c2963e269b83 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -251,11 +251,9 @@ pdma: dma-controller@3000000 {
 			#dma-cells = <1>;
 		};
 
-		clkcfg: clkcfg@20002000 {
-			compatible = "microchip,mpfs-clkcfg";
-			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
-			clocks = <&refclk>;
-			#clock-cells = <1>;
+		mss_top_sysreg: syscon@20002000 {
+			compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
+			reg = <0x0 0x20002000 0x0 0x1000>;
 			#reset-cells = <1>;
 		};
 
@@ -452,7 +450,7 @@ mac0: ethernet@20110000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
-			resets = <&clkcfg CLK_MAC0>;
+			resets = <&mss_top_sysreg CLK_MAC0>;
 			status = "disabled";
 		};
 
@@ -466,7 +464,7 @@ mac1: ethernet@20112000 {
 			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
 			clock-names = "pclk", "hclk";
-			resets = <&clkcfg CLK_MAC1>;
+			resets = <&mss_top_sysreg CLK_MAC1>;
 			status = "disabled";
 		};
 
@@ -550,5 +548,12 @@ syscontroller_qspi: spi@37020100 {
 			clocks = <&scbclk>;
 			status = "disabled";
 		};
+
+		clkcfg: clkcfg@3e001000 {
+			compatible = "microchip,mpfs-clkcfg";
+			reg = <0x0 0x3e001000 0x0 0x1000>;
+			clocks = <&refclk>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.45.2

