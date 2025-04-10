Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3DB28EA7C;
	Thu, 10 Apr 2025 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314087; cv=pass; b=qeLnx1d8sWqXw2Az/hdQfMDdSKi9HjQfwmdp7Cj4n2Ckm7mEM8JqVCUJvPiMfZVeAQUiz40NQZgutWSMqZ0v+PuYELrJL/+WVw1sXBuPOJXB6FV5B3tQHgEF8HZsJCU6dDD4gkB98mnAZsD0i1CBbfeioTo9W6rMycHQkEJBekw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314087; c=relaxed/simple;
	bh=a1i0m8FBfO7I8BVPAHQtpJxLkIuXiVl/rELkpFCVqg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+r7wjM6bQV3S3ZCACJIfXM72pQNmJCgf6ZyBQ0F6sE/IJO0ufASPmrPo89Hhh8d6y+ok46vhRZk4MN/RfPtP4tn1Xo0ogwHWlDCHZtIbKALzPpaLXO2DSJS6S97UjUu+Ge7LJJH81VsTRQuTKoXCogQDTbrm8IfMWnmkQCn5cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=lZ3baldn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="lZ3baldn"
ARC-Seal: i=1; a=rsa-sha256; t=1744314055; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JuhIU6WYcXobMl4lsFaVYBxrUitRxUS34pjeqYvj80FquxzW/+Bt2rAhhzQ3hWGS6dS9aGe2qPoCaaWT64TP43y/EQiCFKaiAQztQu9D3dJP7A4CSdMJ6T0Y5+3mDd7bRr3HscKcqdbB63tf3bD6i5if9PCEFrJnM7l8Hs36i9M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314055; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5M4VInIY/QXe9N2rVUvgGLn9Gt/uljp8uC3lxjZwVVE=; 
	b=OJ3Kfo/umxuuag0oww/D24+j5E6TmqD8LaLQwo9VVxlMb+Qy29DtkwED5e8u010juLYsRIeHF8id01TL2hikrQ0g/y/Jhc2epDRyibnegS+7qFpimNVXfpe3sFU6RmUvYZw0Jz/lTYlGXuRpI7YlMsNiOyjq8pqVbUz1LquP5zA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314055;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5M4VInIY/QXe9N2rVUvgGLn9Gt/uljp8uC3lxjZwVVE=;
	b=lZ3baldnbjIDJ5alHISJSQaYP3gUJaTGxp2TnTB02mXHOJ/y2hf7ZfFSt1TdU9uc
	7d1APzX7UygtshHP9Rwge+CiAxepRN+L47rHAakkWxatkkplx6JkEQo0Tl351LIvOq6
	o2Ks7cuedrlKxyEPEynWMBjgcrz5DWqJ7aSKp20Y=
Received: by mx.zohomail.com with SMTPS id 174431405267512.187440727507806;
	Thu, 10 Apr 2025 12:40:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:39:59 +0200
Subject: [PATCH v2 07/11] arm64: dts: rockchip: Add RK3576 SAI nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-7-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
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
index ebb5fc8bb8b1363127b9d3782801c4a79b678a92..91aaba3b2b7c6d208254025cfb9ab711e0d424f5 100644
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
@@ -1458,6 +1544,120 @@ log_leakage: log-leakage@22 {
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

