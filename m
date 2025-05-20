Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D958326A0BA;
	Tue, 20 May 2025 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737636; cv=none; b=LfQxi3Su5e+cuNmF01DP0QhbrZFXuXJY7KN7tRsHz4W9uM1NtTsEZZoUoF0gtiZP/xwgh/qOSp8LxB/b5NBLRI2gb5XoomF6lqAqNSgfTk8WCBkJ4mTEbBL2vLzXWnp56aaUKap2g+Nn8WTvOBItRJwHbYpfcLroLEaLA4oIDbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737636; c=relaxed/simple;
	bh=V+NOc2acjuXpClTQO1qhU9wwr4AKtc3CzSxXuc5gRWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITQVhCwJdqQal3R5prNNIOFmSFEEpCJr6erB4zGJJRVIhEkUdi/i28Het9bG1aCRMWdzhApTXmfHi89B1KK+NXd8cprsa/rHktp4PXbgqkz8+7bCFZQ5R+q8or3hZxz8nl7+eyKesx4v+q5tL9i9ilty/RniILAyEAf1tWOTtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GKePxSLS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GKePxSLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747737631;
	bh=V+NOc2acjuXpClTQO1qhU9wwr4AKtc3CzSxXuc5gRWU=;
	h=From:To:Cc:Subject:Date:From;
	b=GKePxSLSdrOv2B9UOKQmSfwKiTtYyuUWWK1tcrCCD+3grGf/E3bh5Q68t89hV1WeT
	 lT/d95lIeoRZFG7D3ku2tVXLJcKrfdra6urvWmVzNGIhcUv3V61DURE/TqANYym2wm
	 in08JR3fILOaa2CdzBpcrF5aVh8EAkKRefo6Lb+VCD5Za8pZd+Bf7s/X2mYVh2qnTn
	 mkUXWSSsVRrHV/sp0xveOD7wrn4Y6/bVtWENN7tlo7tx2xGygdq2nQljzKLbxIHUC3
	 BXLSVle9WHecZvi8ZEcNco/x6yWyJyV6UKiOjmpMii3hvFnrOwl97JTfz7f07oos3F
	 lEQRDQepjmisg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 61B7817E1047;
	Tue, 20 May 2025 12:40:31 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8188: Address binding warnings for MDP3 nodes
Date: Tue, 20 May 2025 12:40:24 +0200
Message-ID: <20250520104024.3706723-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address various dt-binding warnings for most of the MDP3 nodes by
adding and removing interrupts and power domains where required.

Also, remove the mediatek,mt8195-mdp3-rdma fallback compatible
from the main MDP3 RDMA node as the two have never really been
fully compatible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

I have sent a refactored commit to address those issues, but then I
I acknowledged that the first pull request was mistakenly merged in.

This commit is a diff between the commit that originally added the MDP3
nodes and the refactored one at [1] - so that the mt8188.dtsi file ends
up in the very same state as if the refactored one was applied in the
first place: for this reason, I kept the Ack from Rob for this commit.

[1]: https://lore.kernel.org/all/20250514092259.47035-3-angelogioacchino.delregno@collabora.com

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 76 ++++++++++--------------
 1 file changed, 31 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index dec6ce3e94e9..202478407727 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2243,27 +2243,17 @@ vppsys0: syscon@14000000 {
 		};
 
 		dma-controller@14001000 {
-			compatible = "mediatek,mt8188-mdp3-rdma", "mediatek,mt8195-mdp3-rdma";
+			compatible = "mediatek,mt8188-mdp3-rdma";
 			reg = <0 0x14001000 0 0x1000>;
 			#dma-cells = <1>;
-			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>,
-				 <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP0>,
-				 <&topckgen CLK_TOP_CFGREG_F26M_VPP0>,
-				 <&vppsys0 CLK_VPP0_WARP0_ASYNC_TX>,
-				 <&vppsys0 CLK_VPP0_WARP0_RELAY>,
-				 <&vppsys0 CLK_VPP0_WARP0_ASYNC>,
-				 <&vppsys0 CLK_VPP02VPP1_RELAY>,
-				 <&vppsys1 CLK_VPP1_VPP0_DL_ASYNC>,
-				 <&vppsys1 CLK_VPP1_VPP0_DL1_RELAY>,
-				 <&vppsys0 CLK_VPP0_VPP12VPP0_ASYNC>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>;
 			mboxes = <&gce0 13 CMDQ_THR_PRIO_1>,
 				 <&gce0 14 CMDQ_THR_PRIO_1>,
 				 <&gce0 16 CMDQ_THR_PRIO_1>,
-				 <&gce0 21 CMDQ_THR_PRIO_1>;
-			iommus = <&vpp_iommu M4U_PORT_L4_MDP_RDMA>,
-				 <&vpp_iommu M4U_PORT_L4_MDP_WROT>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>,
-					<&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+				 <&gce0 21 CMDQ_THR_PRIO_1>,
+				 <&gce0 22 CMDQ_THR_PRIO_1>;
+			iommus = <&vpp_iommu M4U_PORT_L4_MDP_RDMA>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
 					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
@@ -2274,7 +2264,6 @@ display@14002000 {
 			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
 			reg = <0 0x14002000 0 0x1000>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
 		};
 
@@ -2282,13 +2271,13 @@ display@14004000 {
 			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
 			reg = <0 0x14004000 0 0x1000>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
 		};
 
 		display@14005000 {
 			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
 			reg = <0 0x14005000 0 0x1000>;
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
@@ -2298,21 +2287,22 @@ display@14006000 {
 			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
 			reg = <0 0x14006000 0 0x1000>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_RSZ>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RSZ_IN_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP0_MDP_RSZ_FRAME_DONE>;
 		};
 
 		display@14007000 {
 			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
 			reg = <0 0x14007000 0 0x1000>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
 		};
 
 		display@14008000 {
 			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
 			reg = <0 0x14008000 0 0x1000>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x8000 0x1000>;
@@ -2321,9 +2311,11 @@ display@14008000 {
 		display@14009000 {
 			compatible = "mediatek,mt8188-mdp3-ovl", "mediatek,mt8195-mdp3-ovl";
 			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
+			iommus = <&vpp_iommu M4U_PORT_L4_MDP_OVL>;
 		};
 
 		display@1400a000 {
@@ -2338,13 +2330,13 @@ display@1400b000 {
 			compatible = "mediatek,mt8188-mdp3-tcc", "mediatek,mt8195-mdp3-tcc";
 			reg = <0 0x1400b000 0 0x1000>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
 
 		display@1400c000 {
 			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
 			reg = <0 0x1400c000 0 0x1000>;
+			#dma-cells = <1>;
 			clocks = <&vppsys0 CLK_VPP0_MDP_WROT>;
 			iommus = <&vpp_iommu M4U_PORT_L4_MDP_WROT>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
@@ -2394,14 +2386,11 @@ vpp_iommu: iommu@14018000 {
 		};
 
 		dma-controller@14f09000 {
-			compatible = "mediatek,mt8188-mdp3-rdma", "mediatek,mt8195-mdp3-rdma";
+			compatible = "mediatek,mt8188-mdp3-rdma";
 			reg = <0 0x14f09000 0 0x1000>;
 			#dma-cells = <1>;
-			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RDMA>,
-				 <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP1>,
-				 <&topckgen CLK_TOP_CFGREG_F26M_VPP1>;
-			iommus = <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_RDMA>,
-				 <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_WROT>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RDMA>;
+			iommus = <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_RDMA>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x9000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_SOF>,
@@ -2409,14 +2398,11 @@ dma-controller@14f09000 {
 		};
 
 		dma-controller@14f0a000 {
-			compatible = "mediatek,mt8188-mdp3-rdma", "mediatek,mt8195-mdp3-rdma";
+			compatible = "mediatek,mt8188-mdp3-rdma";
 			reg = <0 0x14f0a000 0 0x1000>;
 			#dma-cells = <1>;
-			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RDMA>,
-				 <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP1>,
-				 <&topckgen CLK_TOP_CFGREG_F26M_VPP1>;
-			iommus = <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_RDMA>,
-				 <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_WROT>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RDMA>;
+			iommus = <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_RDMA>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xa000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_SOF>,
@@ -2427,7 +2413,6 @@ display@14f0c000 {
 			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
 			reg = <0 0x14f0c000 0 0x1000>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_FG>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xc000 0x1000>;
 		};
 
@@ -2435,7 +2420,6 @@ display@14f0d000 {
 			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
 			reg = <0 0x14f0d000 0 0x1000>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_FG>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xd000 0x1000>;
 		};
 
@@ -2443,7 +2427,6 @@ display@14f0f000 {
 			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
 			reg = <0 0x14f0f000 0 0x1000>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_HDR>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xf000 0x1000>;
 		};
 
@@ -2451,13 +2434,13 @@ display@14f10000 {
 			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
 			reg = <0 0x14f10000 0 0x1000>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_HDR>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0 0x1000>;
 		};
 
 		display@14f12000 {
 			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
 			reg = <0 0x14f12000 0 0x1000>;
+			interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_AAL>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x2000 0x1000>;
@@ -2466,6 +2449,7 @@ display@14f12000 {
 		display@14f13000 {
 			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
 			reg = <0 0x14f13000 0 0x1000>;
+			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_AAL>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x3000 0x1000>;
@@ -2474,26 +2458,25 @@ display@14f13000 {
 		display@14f15000 {
 			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
 			reg = <0 0x14f15000 0 0x1000>;
-			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>,
-				 <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x5000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_FRAME_DONE>;
 		};
 
 		display@14f16000 {
 			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
 			reg = <0 0x14f16000 0 0x1000>;
-			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>,
-				 <&vppsys1 CLK_VPP1_SVPP3_VPP_MERGE>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_FRAME_DONE>;
 		};
 
 		display@14f18000 {
 			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
 			reg = <0 0x14f18000 0 0x1000>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_TDSHP>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x8000 0x1000>;
 		};
 
@@ -2501,7 +2484,6 @@ display@14f19000 {
 			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
 			reg = <0 0x14f19000 0 0x1000>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_TDSHP>;
-			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x9000 0x1000>;
 		};
 
@@ -2524,6 +2506,7 @@ display@14f1b000 {
 		display@14f1d000 {
 			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
 			reg = <0 0x14f1d000 0 0x1000>;
+			interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_COLOR>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xd000 0x1000>;
@@ -2532,6 +2515,7 @@ display@14f1d000 {
 		display@14f1e000 {
 			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
 			reg = <0 0x14f1e000 0 0x1000>;
+			interrupts = <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_COLOR>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
 			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xe000 0x1000>;
@@ -2558,6 +2542,7 @@ display@14f22000 {
 		display@14f24000 {
 			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
 			reg = <0 0x14f24000 0 0x1000>;
+			#dma-cells = <1>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_WROT>;
 			iommus = <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_WROT>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
@@ -2569,6 +2554,7 @@ display@14f24000 {
 		display@14f25000 {
 			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
 			reg = <0 0x14f25000 0 0x1000>;
+			#dma-cells = <1>;
 			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_WROT>;
 			iommus = <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_WROT>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
-- 
2.49.0

