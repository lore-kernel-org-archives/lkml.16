Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724A220F081
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608892; cv=none; b=tMIMiaGr2LJSAwkrTcoqRse4MmahPmOIHiymrnV3F1HuINVR1HUCPinQYWr5SRZxoSTIZmE8j9ShGMlYD5LG4/qN7Yj97RfPT+YH/MNAQUNA6idgIo9NJF4ww2bOBKAT4zeI66TQpFQR+TWuRaNwzWkrGPbh5uNtRwv9K+opq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608892; c=relaxed/simple;
	bh=Ehw5TcZZD+J5hVt3OEobP2xsd4ZyQTUoP0ELpdV0NbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBrJgtCZQj8D1Rg0aow9I6qOESQLbYCUA7/nfOiy8jALg4QGkzMI+GP/5l0kWIQIetVDdJwynBiW2yswOLWSBqVQVzCyEp+usV86NUm5QHChQQABYvUXpBiKWn3YxV5FUy0B6M3wmSzYvtEnnhYJI0dCsPp1pahNey16QVpLGRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=dk4BbYRE; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="dk4BbYRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747608889; bh=jaXXZuk1frfcedeOEDAUivp9EQrzh8hsZwc4skzNAyM=;
 b=dk4BbYRERI1xwlRMZCZD8iIDj4uUPl3EsbF5pEh88WpB0s2X4+gS/2cH+P87tdhc1znvSH1G5
 40K5eNF1USua/gt02VDr5J9EOrIRlVn4ftY9WtlAX3S0kvqLK12Qd77ZmNXGlL8KghOMcdY0200
 lbPFHWPxjyzK6K8kxJ0ra7/OnE835I4WwuRGlRjs5GXu0Vu4ij16x5O3yzF+nXheIEwK0cAsBSz
 7CRvMoNJSo6hMQcLGxDlivuRhHXx4vfF8HwQJjwMiaCoy+/pn8akgl+epAvCAljL8Yhp8070dF3
 NM8wIKl59+6hBUHmsv+m3ug14BWjwyakL+AR/zud8drw==
X-Forward-Email-ID: 682a6532db63046e3392f2c3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: rockchip: Add GPU node for RK3528
Date: Sun, 18 May 2025 22:54:12 +0000
Message-ID: <20250518225418.682182-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518225418.682182-1-jonas@kwiboo.se>
References: <20250518225418.682182-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a GPU node and a opp-table for the Mali-450 MP2 in the RK3528 SoC.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 791cb9b1e8f1..548ac6d4793f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -96,6 +96,36 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <875000 875000 1000000>;
+			opp-suspend;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <875000 875000 1000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <875000 875000 1000000>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <900000 900000 1000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <950000 950000 1000000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -433,6 +463,34 @@ power-domain@RK3528_PD_VPU {
 			};
 		};
 
+		gpu: gpu@ff700000 {
+			compatible = "rockchip,rk3528-mali", "arm,mali-450";
+			reg = <0x0 0xff700000 0x0 0x40000>;
+			assigned-clocks = <&cru ACLK_GPU_MALI>,
+					  <&scmi_clk SCMI_CLK_GPU>;
+			assigned-clock-rates = <297000000>, <300000000>;
+			clocks = <&cru ACLK_GPU_MALI>, <&scmi_clk SCMI_CLK_GPU>;
+			clock-names = "bus", "core";
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gp",
+					  "gpmmu",
+					  "pp",
+					  "pp0",
+					  "ppmmu0",
+					  "pp1",
+					  "ppmmu1";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&power RK3528_PD_GPU>;
+			resets = <&cru SRST_A_GPU>;
+			status = "disabled";
+		};
+
 		uart0: serial@ff9f0000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xff9f0000 0x0 0x100>;
-- 
2.49.0

