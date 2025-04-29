Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB452C259D;
	Tue, 29 Apr 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936629; cv=none; b=gY+oLC4T4BpC5tl/i0KNZZZoCsV+WmR0uhFfQZoQ10ICKnza10KHTpcEAF4ejJYP5KIdMl0UkyKFKJKHcxbdOV+toOs+aom140LuwPl6fpKvzXkcYXZVklwfx6X11+g7flfl4BJD522iytAf12T6rBktrsx/dLCdV+SFFSHNE2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936629; c=relaxed/simple;
	bh=wnFuWF1qkGD8gtloaR8bZH+fQAddlkDDvUzoHzQnTnw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QOiYF2HFgxHr7kFD0YhkT7j/JoQJZvaQ/NNyWxZlCN2ItCMQONxCWB4yUMIi/MqtQe3atefeMqdhGEp+ReYy7cA+UFW0z5CHYQHOU4Vk0DkCwPXrXfeljK1kQT2sV5ow7miS7/HOcBgAx1ylnQ2p6rF0Nn1e7Rl7tjtklEr7YAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gfOy8uHh; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gfOy8uHh"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TENXi53693953
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 09:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745936613;
	bh=s7MUa9Mrt3b4XrsrztK/DyPSINZDhXWUGMI9GzjPTgU=;
	h=From:To:CC:Subject:Date;
	b=gfOy8uHh2rwblj0oTOKmEoadArZo3Qvbn4VZvH5mqyIHYsDYyMZS/2Q+0ZhMxnSQc
	 klzxFXQmm1s3FqHCgIM7cWj+2p9dCLAis9OCJhzjtLFjyRN+XK6bmNtVsMD/X8IBHD
	 oa2YJcAGA/XK9gdYtv4+FCHHE6oRAXWfR2UVd7Ik=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TENX18063037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 09:23:33 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:23:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:23:33 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TENX5U067841;
	Tue, 29 Apr 2025 09:23:33 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am6*: Set eMMC clock parents to default
Date: Tue, 29 Apr 2025 09:23:32 -0500
Message-ID: <20250429142333.4140010-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
for eMMC. This change is necessary since DM is not implementing the
correct procedure to switch PLL clock source for eMMC and we have a
non-glich-free mux. To remove any potential issues, lets switch back to
the defaults.

Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral nodes")
Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 instance")
Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
Cc: stable@vger.kernel.org
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Udit Kumar <u-kumar1@ti.com>
---
This patch was split from "Misc MMC udates" patch series [0] to help
with backporting.
[0] https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 7d355aa73ea2..0c286f600296 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -552,8 +552,6 @@ sdhci0: mmc@fa10000 {
 		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
 		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
 		clock-names = "clk_ahb", "clk_xin";
-		assigned-clocks = <&k3_clks 57 6>;
-		assigned-clock-parents = <&k3_clks 57 8>;
 		bus-width = <8>;
 		mmc-ddr-1_8v;
 		mmc-hs200-1_8v;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index a1daba7b1fad..455ccc770f16 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -575,8 +575,6 @@ sdhci0: mmc@fa10000 {
 		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
 		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
 		clock-names = "clk_ahb", "clk_xin";
-		assigned-clocks = <&k3_clks 57 6>;
-		assigned-clock-parents = <&k3_clks 57 8>;
 		bus-width = <8>;
 		mmc-hs200-1_8v;
 		ti,clkbuf-sel = <0x7>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 7b65538110e8..fa55c43ca28d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -573,8 +573,6 @@ sdhci0: mmc@fa10000 {
 		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
 		clocks = <&k3_clks 57 1>, <&k3_clks 57 2>;
 		clock-names = "clk_ahb", "clk_xin";
-		assigned-clocks = <&k3_clks 57 2>;
-		assigned-clock-parents = <&k3_clks 57 4>;
 		bus-width = <8>;
 		mmc-ddr-1_8v;
 		mmc-hs200-1_8v;

base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
-- 
2.49.0

