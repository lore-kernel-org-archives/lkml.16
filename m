Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580D24290C;
	Tue, 29 Apr 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944425; cv=none; b=Ak6A/QdpEoljZwkWzOvIPT2IcVe3WsT6eCJ1bd50NOyeB18aW+6fE5GKmIl31nxqXsmRC8E67Z99AgpzxgpXsbVU+cv/UYkUcWM5ebzsTMY5SGTS0aSg7S1RTqes3Pr5wrthDkq4M/zJrq2QNnvd052ddCjOqSlUXYayEtPCArE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944425; c=relaxed/simple;
	bh=nmNBCDdoatd0fv+LPbTf0/hU6m0E13jFZspSVTLPcMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnaXzlMuDrH1MLt9CKOLy/KK6DZLs7r8TiygxdHY6CtG7sZ4rPh+W0se5KY4z8JQxPyceu5e1FH0zLE+mNGTGGHeW1Lglyg+jT3ihX2kc9x+NGcSiNB1iJKBYzAgtXasd8IM0XphW1Vw25w/BmnIoAAZGO37Zg7p6RDGTP//mQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dO7Ozy2S; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dO7Ozy2S"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGXbBV3722130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745944417;
	bh=5DhLFrTh+h4y1qDC14eMnim/LkvSE5lqsWRgiWMxtaE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dO7Ozy2SHPgrmUgYwuLOhkkBHPA3vJnR9kDDfWB/pzAmdwF73VmrznyKpKGZ8bNl4
	 +PmED9Cio3Q0F6QnR4WSYGxH3+Gki3YSe9k8S+MBun3pkuIbscqD8KNTFP9ieNIPUW
	 6oD1sfLAq4GhPX0tuVLFS9R9R49GXzqi/cHJOrko=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGXb4M108647
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 11:33:37 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 11:33:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 11:33:37 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TGXb2L093065;
	Tue, 29 Apr 2025 11:33:37 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-am62a-main: Set eMMC clock parent to default
Date: Tue, 29 Apr 2025 11:33:36 -0500
Message-ID: <20250429163337.15634-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429163337.15634-1-jm@ti.com>
References: <20250429163337.15634-1-jm@ti.com>
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
correct procedure to switch PLL clock source for eMMC and MMC CLK mux is
not glich-free. As a preventative action, lets switch back to the defaults.

Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 instance")
Cc: stable@vger.kernel.org
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Udit Kumar <u-kumar1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 2 --
 1 file changed, 2 deletions(-)

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
-- 
2.49.0

