Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0262275843;
	Tue, 29 Apr 2025 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911631; cv=none; b=SpSmmCx6s6MAIrjH6ahMM3EGfuELpGSAhm+uo38hne2GqC3ohTwmwlM7EGE17O1fk7/Wcm9QuWRKq/DdyKYXzZjnZsrr7cewnUBAJQb3vA0+A4BCj7wBXnRiqofy8N7vjvoErfCukqZbdjy0thr4hXK65rickPWqNx/snyC0AiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911631; c=relaxed/simple;
	bh=8XcuXsqtdP7qg55CWR/5GbeRh/JwNd8nHN+LIRbylzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=glG8XK5SKHY+OvL0AUYHd33vXQUSnSpA+bmnZuBx1NUY6YUihlYiIpoqUasNRfbY7fHojM438cmG5FNmjsNEvJXdBZ2kr0jLbN0feWo/snPm1ktE3hUg452uAO9SpIZMXhBBJVK+56ua7CkGODDEUeiR5Za/hmoN1gl1MGPMTSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BM4Nt1N9; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BM4Nt1N9"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7Qmx23027162
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745911608;
	bh=HqqUtqSeeEUdObhDYeko8fTkYHokAWrft4xXwVarOeY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BM4Nt1N9PrTdV25/hYFQaLrjmQo9SO4cUuP4uEoeNcKXYio9qIiAJKMis71hgDDeC
	 SrCmjiesPfcyLn4fMFoixHXFU3/nAFKA3a2MIZzGcIB5sRpa6qUvLk3tnh2o1bGeAW
	 gEdqV5J46YJBEL0xng9YANMvJqepPS1rjpN7QsMk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7QmbT050371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 02:26:48 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 02:26:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 02:26:48 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T7Qlo8109112;
	Tue, 29 Apr 2025 02:26:47 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 1/2] arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to enable Ethernet boot
Date: Tue, 29 Apr 2025 12:56:43 +0530
Message-ID: <20250429072644.2400295-2-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429072644.2400295-1-c-vankar@ti.com>
References: <20250429072644.2400295-1-c-vankar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Ethernet boot requires CPSW nodes to be present starting from R5 SPL
stage. Add bootph-all property to required nodes to enable Ethernet boot
on AM68-SK.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Link to v3:
https://lore.kernel.org/r/20250425051055.2393301-2-c-vankar@ti.com/

Changes from v3 to v4:
- As per Nishanth's suggestion, moved nodes which require "bootph-all"
  property into board specific file for AM68-SK.

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 5fa70a874d7b..e84c504c87d2 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -344,6 +344,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
 			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
 			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	mcu_mdio_pins_default: mcu-mdio-default-pins {
@@ -351,6 +352,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
 			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
 			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
@@ -412,6 +414,14 @@ J721S2_WKUP_IOPAD(0x000, PIN_INPUT, 7) /* (K26) WKUP_GPIO0_49 */
 	};
 };
 
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
+&phy_gmii_sel {
+	bootph-all;
+};
+
 &main_gpio0 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -626,6 +636,7 @@ &mcu_cpsw {
 &davinci_mdio {
 	phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
@@ -635,6 +646,7 @@ phy0: ethernet-phy@0 {
 &cpsw_port1 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&phy0>;
+	bootph-all;
 };
 
 &mcu_mcan0 {
-- 
2.34.1

