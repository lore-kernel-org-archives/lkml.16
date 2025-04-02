Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DDC23A985;
	Wed,  2 Apr 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593548; cv=none; b=UmoJIf2RjuTWuVmz+R3ZmU4T2LzJ8zX1AoDGW0evRP8tC/YNDqNelQtlTFRYMdrSLZcPi2+8KkxFxobsIeSOUnbWSD+I45HK8W/cf1bSp9k7iXbc5qTfvmiPR77I6l5mQVccDXx0LQsK/r5f4ojXVKkfVAAZXXG0abhn6ph0UcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593548; c=relaxed/simple;
	bh=uCddyScs0LZXXxmtQqSCDKfCbbXYp/uBboKqVPle1WQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHIEW/rb4ieT0ouSiYtki3wKvqBg4J9Hc46PEsfrbGeNpg2k3RBiuKHKDk8b/1N2qCuGElsjmqYkVSzQyQHZwRWmXp7aKa7mv+MC9xu4JxxVLODtcNsBgdTKENDRwdDziYtS3UGMOkEj/MbMCgtmmqDW5asZoE+VlnCoWKEnsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZOyjyalI; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZOyjyalI"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWATl3385659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593530;
	bh=ORyDsDwlIJT9ec0ftSCvdkp8POP6HUCnq/zrVrnKi+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZOyjyalIcovjDTTsuKPvke2JRMPEIp8StUN45CaND4EakqcmCLViREXrAH5swaWYC
	 52D/3dOXouI41Z496AADBmP3xiZouKiqXPZdklM7QSw+QcWckfjf0L2DgfzEgLprL/
	 rVwriwE9Dq1K6Ra/2OjrtuRF4YuTeJynrtdAS4U8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWATk123280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:10 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:10 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW9P3017462;
	Wed, 2 Apr 2025 06:32:09 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
Date: Wed, 2 Apr 2025 17:02:00 +0530
Message-ID: <20250402113201.151195-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Andrew Davis <afd@ti.com>

This region is used for controlling the function of the PCIe IP. It is
compatible with "ti,j784s4-pcie-ctrl", add this here and use it with
the PCIe node.

Signed-off-by: Andrew Davis <afd@ti.com>
[j-choudhary@ti.com: Add changes to k3-am68-sk-base-board-pcie1-ep.dtso]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso | 2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso         | 2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi                 | 7 ++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
index 455736e378cc..ba521d661144 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
@@ -48,6 +48,6 @@ pcie1_ep: pcie-ep@2910000 {
 		dma-coherent;
 		phys = <&serdes0_pcie_link>;
 		phy-names = "pcie-phy";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso
index 5ff390915b75..8c2cd99cf2b4 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso
@@ -38,7 +38,7 @@ pcie1_ep: pcie-ep@2910000 {
 		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
-		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <1>;
 		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 92bf48fdbeba..c0c2b95d4652 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -57,6 +57,11 @@ phy_gmii_sel_cpsw: phy@34 {
 			#phy-cells = <1>;
 		};
 
+		pcie1_ctrl: pcie-ctrl@74 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x74 0x4>;
+		};
+
 		serdes_ln_ctrl: mux-controller@80 {
 			compatible = "reg-mux";
 			reg = <0x80 0x10>;
@@ -1399,7 +1404,7 @@ pcie1_rc: pcie@2910000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <4>;
 		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
-- 
2.34.1

