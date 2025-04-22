Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6B628BAA2;
	Tue, 22 Apr 2025 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325163; cv=none; b=j0/YYftlg51op6EBokTeK0KoY2H9N8qWQ++fYLIiBdh7HRwa1OZagiRU2L/lhO33krc8pretaodx9ErIfcSVQp+qoMqAY1ufk+epsEbxQNzBUiPuWBQPmZg6B9t3zIpNph1PNJYj9K6ssPTo2WE7OWu9pH0xGj/r9dDJWGBudsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325163; c=relaxed/simple;
	bh=2xQU8BaV38kff2mc7nWiXV/wXGFel8LmTfX3EHVK1Dc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRbR/g7cNFVPqom97ilpbYczoKNB2D7Cd0XABOziodya0pLgVnFvqvS10N603mA9KvGSfm9HH5vYp3rXdoDM0o+h8ACpJHOYxKSZ47iDNkbO7RIABMjUUgp8nco4+2oI6VUMxX8vXCg00OuqIr2ADZ89tEM3uXmZEOnUOQoC3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i+Wt4AXY; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i+Wt4AXY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWWYQ1209463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745325152;
	bh=ifIZS36bPmBp16e6k20HHvVOE/BgKCs/pEKPzQ6EFhs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=i+Wt4AXY+fvWCNpUqCKrKx8B375RdoStLSlVOpXm4oEFc98GMjiANe2MDaQR18Ggi
	 f95fSAB9o/RmRRvLPYJA8uh38Y3ZvOCc/ovSbcsVw6tPloC9k4pbSHbyV/mth9ep2G
	 8LCjOMqN71rN9HyyqYoKaljb0D+0/pOBq1sER7UA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWWv3042976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:32:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:32:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:32:31 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MCWIKv117965;
	Tue, 22 Apr 2025 07:32:28 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <parth105105@gmail.com>, <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-j784s4-j742s2-evm-common: enable ACSPCIE0 output for PCIe1
Date: Tue, 22 Apr 2025 18:02:18 +0530
Message-ID: <20250422123218.3788223-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422123218.3788223-1-s-vadapalli@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The PCIe reference clock required by the PCIe Endpoints connected to the
PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
and J742S2-EVM is driven by the ACSPCIE0 module. Add the device-tree
support for enabling the same.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

The previous versions of this series were a single patch. Based on the
feedback received on previous versions, the SoC and Board support has
been split in order to allow reuse for other Boards based on the same
SoC.

v2 patch:
https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
Changes since v2 patch:
- The SoC and board changes have been split across:
  k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
  respectively.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index 2664f74a9c7a..fa656b7b13a1 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -5,6 +5,9 @@
  * EVM Board Schematics(j784s4): https://www.ti.com/lit/zip/sprr458
  * EVM Board Schematics(j742s2): https://www.ti.com/lit/zip/SPAC001
  */
+
+#include <dt-bindings/phy/phy-cadence.h>
+
 / {
 	chosen {
 		stdout-path = "serial2:115200n8";
@@ -1407,10 +1410,13 @@ &main_mcan4 {
 
 &pcie1_rc {
 	status = "okay";
+	clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
+	clock-names = "fck", "pcie_refclk";
 	num-lanes = <2>;
 	reset-gpios = <&exp1 2 GPIO_ACTIVE_HIGH>;
 	phys = <&serdes0_pcie1_link>;
 	phy-names = "pcie-phy";
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x1>;
 };
 
 &serdes1 {
-- 
2.34.1

