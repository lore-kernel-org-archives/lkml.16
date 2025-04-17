Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE9B2040B2;
	Thu, 17 Apr 2025 23:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932650; cv=none; b=eWPK/7hAY2N/5QlRngrXkgPvPwwS2XHAwhCR9qKTwrjwvO6cxHZMm4FJEl7jTd5Ou0o+fKn6xZHj0EQMgkYVUmrGfg+8F8geN6caG33fH4NFfPif6ePYtshen7Z3zbx2P6G+4IzxinjOWggOHr6cjU5anxWtsgCvLFSjwFGDEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932650; c=relaxed/simple;
	bh=JF+w8wmf10+jcWDvzLRc7NzcG6KMv0F4Ct0bjQsGJgU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENxS8DG+1XC/XxVb8QZuIXQkuXVnVaXF8RMEEuZCkgPz/cBJByTv82xbjPoSOjrc1EcnfMRaq8SCcHgD15JOwtAuaMpPVhhIQO0a68mXhsn+M7kZIsXRrvXIrhcstg4YdjtNolrYjybOYAgMnej8vAB8/oVKRgbHU+1kTR8RiK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bf+sOS8P; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bf+sOS8P"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUe2A781170
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744932640;
	bh=9nJp0mD9Fz2Zcm3q8ukJFhKlX3gPM3uekDV5Vo0ilmc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Bf+sOS8PT6glExPtEr3RHEdxortS9MoCHMBv7L+Fa5w2Pcpb95Cy+FOdsyor4T5lD
	 fUeCPCEe7D4eH7938zwr1YsQLeTx1md4PDiuRwACdz2dpRDZKBkWZhqMAWxRuYF6OQ
	 bUGjOLbXeXQviUuOTjukGAr4PxmIc4jTLvhYcmU0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUe9v096088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 18:30:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 18:30:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 18:30:40 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HNUePf023286;
	Thu, 17 Apr 2025 18:30:40 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to default
Date: Thu, 17 Apr 2025 18:30:36 -0500
Message-ID: <20250417233040.3658761-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417233040.3658761-1-jm@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
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
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 7d355aa73ea21..0c286f600296c 100644
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
index a1daba7b1fad5..455ccc770f16a 100644
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
index 6e3beb5c2e010..f9b5c97518d68 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -564,8 +564,6 @@ sdhci0: mmc@fa10000 {
 		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
 		clocks = <&k3_clks 57 1>, <&k3_clks 57 2>;
 		clock-names = "clk_ahb", "clk_xin";
-		assigned-clocks = <&k3_clks 57 2>;
-		assigned-clock-parents = <&k3_clks 57 4>;
 		bus-width = <8>;
 		mmc-ddr-1_8v;
 		mmc-hs200-1_8v;
-- 
2.49.0

