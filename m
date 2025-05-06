Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8C278771;
	Tue,  6 May 2025 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528219; cv=pass; b=NqdQHzvnGMfYt9HWuPGrKoRKoOntKekr4wBLZD2Y902plf19P67eA3pyltVSBhw7fo3Zrk5oQHRfKo/GlBJZfa9xxI12m63wiDYQZgCFfB+Uwo9ikNkaA1lFAHivMagDK8dZXM+APuIsFq4HTKYVeTThTnYZtFgaZSAh67SrjmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528219; c=relaxed/simple;
	bh=eUI7JFuMHDcOjo9SML9gOZkOJRLohYjAeJuMIRLFUxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olO1waW8vLS1xTT2ApcW/USAfD+PT/mTVgwpF9dtkk8cs0k8o//Iw9z+c4zz/66ii5B1EPvLcisibs8PNns1Ol5uOdklSQBV5IMlJouJ5ThtbMCKDp7yrRJN1bxbyFprSNpNnk1UJUhAWH7ZTl6OSqO7RyHKV+2ZGb94gdS7YY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=UbONrpCN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="UbONrpCN"
ARC-Seal: i=1; a=rsa-sha256; t=1746528186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DgF/zVWGWJl7AAReI1hJR9cRPTrndBwCbBKuQpJrH/SbLlxEk3YGhWq84FfRAKATOjx8g3Lm6818VcE7SliEcyT1agSTtARB8762l0P1mT3jspTEGDGBZzTul3GZ1SqrqQOFEoEPiUyNFbJpEmpwyD3jMnczkRIdAiS5frbTbPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528186; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tLCasK8e9R84NfOujCZyRtRjQpqhlhhO1RqpULpghak=; 
	b=lwJ5oBa4vV4azfh4btroVPf7MgZmFgQQ70L7luUclq4TirEuA2OX/2BJOi5mb8JcqN+jff/ye5Wr/GuEG0NqNnMQk7uAFcEgjU1BJn0qeNdfPychoDl96aXZEDohs5a2plH4GCJqho2l14rxySrkIhUSWt4lNdFzqZgJXroX8bs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528186;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=tLCasK8e9R84NfOujCZyRtRjQpqhlhhO1RqpULpghak=;
	b=UbONrpCNlDVWVrMcywxVeN3yNMoi0eeYd9YsAI/gS86pcaJz/K/p1Tzs3CssQ8f5
	shNjzjFPOvasChjoE5Vpa9AFjfcqH5QcA8HuFj/XHEXwi0l2ODHX/1S0JZS2bnwoSZt
	7LNeA8mU6vMXgH0hNcWoAZxGIxzAzvicHaDq5h44=
Received: by mx.zohomail.com with SMTPS id 1746528184511266.37259709756916;
	Tue, 6 May 2025 03:43:04 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 06 May 2025 12:42:40 +0200
Subject: [PATCH v4 1/5] arm64: dts: rockchip: Add RK3576 SAI nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-rk3576-sai-v4-1-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The RK3576 SoC has 10 SAI controllers in total. Five of them are in the
video output power domains, and are used for digital audio output along
with the video signal of those, e.g. HDMI audio.

The other five, SAI0 through SAI4, are exposed externally. SAI0 and SAI1
are capable of 8-channel audio, whereas SAI2, SAI3 and SAI4 are limited
to two channels. These five are in the audio power domain.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 200 +++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index d7c6495e18c08042e7d541e21c06d9c7a3f18286..335a868a1200493d60d08983281fe5637a20ec61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1010,6 +1010,41 @@ vop_mmu: iommu@27d07e00 {
 			status = "disabled";
 		};
 
+		sai5: sai@27d40000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27d40000 0x0 0x1000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI5_8CH>, <&cru HCLK_SAI5_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 3>;
+			dma-names = "rx";
+			power-domains = <&power RK3576_PD_VO0>;
+			resets = <&cru SRST_M_SAI5_8CH>, <&cru SRST_H_SAI5_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-rx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI5";
+			status = "disabled";
+		};
+
+		sai6: sai@27d50000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27d50000 0x0 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI6_8CH>, <&cru HCLK_SAI6_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 4>, <&dmac2 5>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_VO0>;
+			resets = <&cru SRST_M_SAI6_8CH>, <&cru SRST_H_SAI6_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-rx-route = <0 1 2 3>;
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI6";
+			status = "disabled";
+		};
+
 		hdmi: hdmi@27da0000 {
 			compatible = "rockchip,rk3576-dw-hdmi-qp";
 			reg = <0x0 0x27da0000 0x0 0x20000>;
@@ -1050,6 +1085,57 @@ hdmi_out: port@1 {
 			};
 		};
 
+		sai7: sai@27ed0000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27ed0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI7_8CH>, <&cru HCLK_SAI7_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 19>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			resets = <&cru SRST_M_SAI7_8CH>, <&cru SRST_H_SAI7_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI7";
+			status = "disabled";
+		};
+
+		sai8: sai@27ee0000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27ee0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI8_8CH>, <&cru HCLK_SAI8_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 7>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			resets = <&cru SRST_M_SAI8_8CH>, <&cru SRST_H_SAI8_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI8";
+			status = "disabled";
+		};
+
+		sai9: sai@27ef0000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x27ef0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI9_8CH>, <&cru HCLK_SAI9_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 26>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			resets = <&cru SRST_M_SAI9_8CH>, <&cru SRST_H_SAI9_8CH>;
+			reset-names = "m", "h";
+			rockchip,sai-tx-route = <0 1 2 3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI9";
+			status = "disabled";
+		};
+
 		qos_hdcp1: qos@27f02000 {
 			compatible = "rockchip,rk3576-qos", "syscon";
 			reg = <0x0 0x27f02000 0x0 0x20>;
@@ -1604,6 +1690,120 @@ log_leakage: log-leakage@22 {
 			};
 		};
 
+		sai0: sai@2a600000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a600000 0x0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI0_8CH>, <&cru HCLK_SAI0_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 0>, <&dmac0 1>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI0_8CH>, <&cru SRST_H_SAI0_8CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai0m0_lrck
+				&sai0m0_sclk
+				&sai0m0_sdi0
+				&sai0m0_sdi1
+				&sai0m0_sdi2
+				&sai0m0_sdi3
+				&sai0m0_sdo0
+				&sai0m0_sdo1
+				&sai0m0_sdo2
+				&sai0m0_sdo3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI0";
+			status = "disabled";
+		};
+
+		sai1: sai@2a610000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a610000 0x0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI1_8CH>, <&cru HCLK_SAI1_8CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 2>, <&dmac0 3>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI1_8CH>, <&cru SRST_H_SAI1_8CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai1m0_lrck
+				&sai1m0_sclk
+				&sai1m0_sdi0
+				&sai1m0_sdo0
+				&sai1m0_sdo1
+				&sai1m0_sdo2
+				&sai1m0_sdo3>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI1";
+			status = "disabled";
+		};
+
+		sai2: sai@2a620000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a620000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI2_2CH>, <&cru HCLK_SAI2_2CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 0>, <&dmac1 1>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI2_2CH>, <&cru SRST_H_SAI2_2CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai2m0_lrck
+				&sai2m0_sclk
+				&sai2m0_sdi
+				&sai2m0_sdo>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI2";
+			status = "disabled";
+		};
+
+		sai3: sai@2a630000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a630000 0x0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI3_2CH>, <&cru HCLK_SAI3_2CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 2>, <&dmac1 3>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI3_2CH>, <&cru SRST_H_SAI3_2CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai3m0_lrck
+				&sai3m0_sclk
+				&sai3m0_sdi
+				&sai3m0_sdo>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI3";
+			status = "disabled";
+		};
+
+		sai4: sai@2a640000 {
+			compatible = "rockchip,rk3576-sai";
+			reg = <0x0 0x2a640000 0x0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SAI4_2CH>, <&cru HCLK_SAI4_2CH>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 0>, <&dmac2 1>;
+			dma-names = "tx", "rx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			resets = <&cru SRST_M_SAI4_2CH>, <&cru SRST_H_SAI4_2CH>;
+			reset-names = "m", "h";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sai4m0_lrck
+				&sai4m0_sclk
+				&sai4m0_sdi
+				&sai4m0_sdo>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SAI4";
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@2a701000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0x2a701000 0 0x10000>,

-- 
2.49.0

