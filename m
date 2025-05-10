Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CA0288D6
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746893746; cv=none; b=j9wnTIo8+NGt53NKsFzA3qGc99n2jtJZ2WX53E3OXXelKUh/vE0DQCb/Vi1FLTA0YZput7Jfep79jj/DvUhStbiU1cfKKKlwf6aj/DVUA+Dw2vpGjEghMdLNFrl4lZo4Xw5DOrdfnE+HHqNoqVsJgxzZlZkMAzBFDg89XWH/ajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746893746; c=relaxed/simple;
	bh=I7qsisNmJSUmqYJBmMiwDIyEFTkKuC/j8SsQjRaqRkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXZmp2ccYg9/7m65dCnYul7KkZzjrjJjW8cW/HbJgH3IxCSZqpI9IPhIIHD3KH9p76p366VDn+WwVCSuDQvaiA+N34VjfQyvzMNZ7QvS1tblh/6GKCyLOeRpNYDtFoeDeDgc9YV0/YNzOJZ3XzGKZ1lmuRgMqwz4TTmizQBCZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HwGIKoxR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HwGIKoxR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=0GKSka8sGAEVtIjgnkv+3cC9f+hK5UlvpIaCwa+sWU4=; b=HwGIKoxRapWnJikLnDBLSqW7KD
	EFFcCdddUtvPqFJWG6JHMfL1tzYz4SPBlCFuAqFrIfAjAvG+NXZ5hf0mKhkstK1SBSlKdo0hA9Pwh
	KzsB5A3Ey9PrW2mcWwQBBSGTvuwWHrYoXwTEl75811/u0gLTvdR9C1mp58aJoOu1PCe4FWNm5VLMo
	xWxrt9qE7JSGLm60tWt3+y5eD136ZPLQkyYNclMnjAKlGNbVzkuy3N9i1PhAUWaL1wY6SW4oGrTlC
	zHrJMsN8XmTMtLXe1i1HyByugK2qtwh/2uHueMzmjS1XIE+4gKVFsr2HG6xVXpULuESkb0oZGN4NE
	ZgDKZMFA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDmrU-0000ha-Hn; Sat, 10 May 2025 18:15:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: kever.yang@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: convert rk3562 to their dt-binding constants
Date: Sat, 10 May 2025 18:15:31 +0200
Message-ID: <20250510161531.2086706-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the binding head has been merged, convert the power-domain ids
back to these constants for easier handling.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3562.dtsi | 37 ++++++++++++------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
index 0156f969c4bc..412ecad79b0d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/rockchip,rk3562-power.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/reset/rockchip,rk3562-cru.h>
 #include <dt-bindings/soc/rockchip,boot-mode.h>
@@ -546,48 +547,48 @@ power: power-controller {
 				#size-cells = <0>;
 				status = "okay";
 
-				power-domain@8 {
-					reg = <8>;
+				power-domain@RK3562_PD_GPU {
+					reg = <RK3562_PD_GPU>;
 					pm_qos = <&qos_gpu>;
 					#power-domain-cells = <0>;
 				};
 
-				power-domain@7 {
-					reg = <7>;
+				power-domain@RK3562_PD_NPU {
+					reg = <RK3562_PD_NPU>;
 					pm_qos = <&qos_npu>;
 					#power-domain-cells = <0>;
 				};
 
-				power-domain@11 {
-					reg = <11>;
+				power-domain@RK3562_PD_VDPU {
+					reg = <RK3562_PD_VDPU>;
 					pm_qos = <&qos_rkvdec>;
 					#power-domain-cells = <0>;
 				};
 
-				power-domain@12 {
-					reg = <12>;
+				power-domain@RK3562_PD_VI {
+					reg = <RK3562_PD_VI>;
 					#power-domain-cells = <1>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 					pm_qos = <&qos_isp>,
 						 <&qos_vicap>;
 
-					power-domain@10 {
-						reg = <10>;
+					power-domain@RK3562_PD_VEPU {
+						reg = <RK3562_PD_VEPU>;
 						pm_qos = <&qos_vepu>;
 					#power-domain-cells = <0>;
 					};
 				};
 
-				power-domain@13 {
-					reg = <13>;
+				power-domain@RK3562_PD_VO {
+					reg = <RK3562_PD_VO>;
 					#power-domain-cells = <1>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 					pm_qos = <&qos_vop>;
 
-					power-domain@14 {
-						reg = <14>;
+					power-domain@RK3562_PD_RGA {
+						reg = <RK3562_PD_RGA>;
 						pm_qos = <&qos_rga_rd>,
 							 <&qos_rga_wr>,
 							 <&qos_jpeg>;
@@ -595,8 +596,8 @@ power-domain@14 {
 					};
 				};
 
-				power-domain@15 {
-					reg = <15>;
+				power-domain@RK3562_PD_PHP {
+					reg = <RK3562_PD_PHP>;
 					pm_qos = <&qos_pcie>,
 						 <&qos_usb3>;
 					#power-domain-cells = <0>;
@@ -616,7 +617,7 @@ gpu: gpu@ff320000 {
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "job", "mmu", "gpu";
 			operating-points-v2 = <&gpu_opp_table>;
-			power-domains = <&power 8>;
+			power-domains = <&power RK3562_PD_GPU>;
 			#cooling-cells = <2>;
 			status = "disabled";
 		};
@@ -653,7 +654,7 @@ pcie2x1: pcie@ff500000 {
 			num-lanes = <1>;
 			phys = <&combphy_pu PHY_TYPE_PCIE>;
 			phy-names = "pcie-phy";
-			power-domains = <&power 15>;
+			power-domains = <&power RK3562_PD_PHP>;
 			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x100000
 				  0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x1e00000
 				  0x03000000 0x3 0x00000000 0x3 0x00000000 0x0 0x40000000>;
-- 
2.47.2

