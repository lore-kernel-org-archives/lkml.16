Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D3231A21;
	Thu,  8 May 2025 23:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748188; cv=none; b=WuE+atfkuCeWwsk+iH08IfBt3DEWwN8Iy8QN0G4xErWoFN4cmuGqt6Vuse6QsYovchivqq/1ksiZFMPDxVItkSrA0IvjVBhKreuV3aUixCk9U8DkTPOyHghXDUh63qPO/NJ1xmj/jnUQA3uhE5Ci/LFk5FEqxk791aC68OAJV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748188; c=relaxed/simple;
	bh=Wrr79+CJ85JON8vzwGdPUpl+grkKCAE70pkA3RyyukE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5foHocRBlCMbbRn3gyOldFesZ5Y7wFCKu0t+r1y3ADHaUk1FI+0ZdnsFFw+WRvuLTeuefPEedSNbS6weRGktM0goIc4ZCR1xob7VuOIAmQvs5fVKwqJ+Bl7rE2LHtel0R1/W5wy2iE4wx7GrZy+VAiSzL9ay3jg/kKRttk3cL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=S/9aZ/2H; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="S/9aZ/2H"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B59862616D;
	Fri,  9 May 2025 01:49:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QjRQtUPG1cv; Fri,  9 May 2025 01:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746748185; bh=Wrr79+CJ85JON8vzwGdPUpl+grkKCAE70pkA3RyyukE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S/9aZ/2HezfZdjTgdwbeEnVbIrxyPOwgKMFCvoUWj6ejuTBUiQ5NtT5KYsbf9eo5K
	 ArnQarhvElmRIwp/fxPCFrMsgVrn9zfi4PJ5u8qEUZC7TGU8GoBUnBlpO9/ddnEdoU
	 8/NiG9eXhpipnU8FzdCTXO597PA1Zr6qHh4dlrtM3mvXNUB8sFm7vDHbI4ZsRjUwXC
	 gZ8ChBeVl2pANsaQK5Nk13hTWqhvE7nmfd4imobispiopwEaukYOJMkaSWMvdb3JuW
	 mPBs8YUuPqylGwOkbQB9mz1Ued0nggZd5SEQlNxz1lbDhoY7rd+Grl/xAk+SH334Wm
	 2WcMJrNRrwHoA==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
Date: Thu,  8 May 2025 23:48:29 +0000
Message-ID: <20250508234829.27111-3-ziyao@disroot.org>
In-Reply-To: <20250508234829.27111-2-ziyao@disroot.org>
References: <20250508234829.27111-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3528 features two SDIO controllers and one SD/MMC controller, describe
them in devicetree. Since their sample and drive clocks are located in
the VO and VPU GRFs, corresponding syscons are added to make these
clocks available.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 69 ++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 923cff6bb103..193b84b5e912 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -329,6 +329,16 @@ qos_vpu: qos@ff280400 {
 			reg = <0x0 0xff280400 0x0 0x20>;
 		};
 
+		vpu_grf: syscon@ff340000 {
+			compatible = "rockchip,rk3528-vpu-grf", "syscon";
+			reg = <0x0 0xff340000 0x0 0x8000>;
+		};
+
+		vo_grf: syscon@ff360000 {
+			compatible = "rockchip,rk3528-vo-grf", "syscon";
+			reg = <0x0 0xff360000 0x0 0x10000>;
+		};
+
 		cru: clock-controller@ff4a0000 {
 			compatible = "rockchip,rk3528-cru";
 			reg = <0x0 0xff4a0000 0x0 0x30000>;
@@ -691,6 +701,65 @@ sdhci: mmc@ffbf0000 {
 			status = "disabled";
 		};
 
+		sdio0: mmc@ffc10000 {
+			compatible = "rockchip,rk3528-dw-mshc",
+				     "rockchip,rk3288-dw-mshc";
+			reg = <0x0 0xffc10000 0x0 0x4000>;
+			clocks = <&cru HCLK_SDIO0>,
+				 <&cru CCLK_SRC_SDIO0>,
+				 <&cru SCLK_SDIO0_DRV>,
+				 <&cru SCLK_SDIO0_SAMPLE>;
+			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+			fifo-depth = <0x100>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>;
+			resets = <&cru SRST_H_SDIO0>;
+			reset-names = "reset";
+			status = "disabled";
+		};
+
+		sdio1: mmc@ffc20000 {
+			compatible = "rockchip,rk3528-dw-mshc",
+				     "rockchip,rk3288-dw-mshc";
+			reg = <0x0 0xffc20000 0x0 0x4000>;
+			clocks = <&cru HCLK_SDIO1>,
+				 <&cru CCLK_SRC_SDIO1>,
+				 <&cru SCLK_SDIO1_DRV>,
+				 <&cru SCLK_SDIO1_SAMPLE>;
+			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+			fifo-depth = <0x100>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdio1_bus4>, <&sdio1_clk>, <&sdio1_cmd>;
+			resets = <&cru SRST_H_SDIO1>;
+			reset-names = "reset";
+			status = "disabled";
+		};
+
+		sdmmc: mmc@ffc30000 {
+			compatible = "rockchip,rk3528-dw-mshc",
+				     "rockchip,rk3288-dw-mshc";
+			reg = <0x0 0xffc30000 0x0 0x4000>;
+			clocks = <&cru HCLK_SDMMC0>,
+				 <&cru CCLK_SRC_SDMMC0>,
+				 <&cru SCLK_SDMMC_DRV>,
+				 <&cru SCLK_SDMMC_SAMPLE>;
+			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+			fifo-depth = <0x100>;
+			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <150000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>,
+				    <&sdmmc_det>;
+			resets = <&cru SRST_H_SDMMC0>;
+			reset-names = "reset";
+			rockchip,default-sample-phase = <90>;
+			status = "disabled";
+		};
+
 		dmac: dma-controller@ffd60000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x0 0xffd60000 0x0 0x4000>;
-- 
2.49.0

