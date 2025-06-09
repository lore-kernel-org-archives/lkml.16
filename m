Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229861F8AC5;
	Mon,  9 Jun 2025 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459297; cv=none; b=L5nCyEpq7fhNnh5nbuipYUVgA5NCwi7mDQvajP1GOwOh6gQjHq7cEblBa8vWBwVcXNQHvc4GVqecn4Vomuz0ZjxNNkz+yiXe1aeLNZhvAR0yyVWFBfAhJjAQkOrdY0HXKKFYNyGSASSVRblRG9Xm+VcXUUMedDlRhRr8yeroqQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459297; c=relaxed/simple;
	bh=C51/7vaB9OCZ1AukCQuPqIi38RMlWpr/hcjbdRh7rU0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kpqwh7+nMmxWg5ggw6aW5OIWC6sG+/Usgu9vaoV7bBqdkwqQTwSEFZMX5UrQcGDqonZyc/BQdafFyG/fb+ttv3dJ7j6ts4l9J26w/KQP+bdd20SauIdHn+LEC4NbWlb51k0DG8bvALrfiZ6p+iYwX7wqkMVG3VK22+gbJI83lhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eqbp3nyA; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eqbp3nyA"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5598sYhh723398;
	Mon, 9 Jun 2025 03:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749459274;
	bh=D3AW8Z2GaXCnvayX3h6iYYRk4HsizirZYceih+sKzFI=;
	h=From:To:CC:Subject:Date;
	b=eqbp3nyAe/EaVd8yge9lYWCGvjgXz6w1NmkIT4l4/6H+TWfBYeZaWzY64zk588VfI
	 48PjphRpRxbJgCdvhnJCWR2o5NpaKAs5MGzJy0VQKum0pcDcQ3Z6SaDnIcDkDdSgt4
	 yUYxTEjS1FjGB9+d/WjU/Wk1TzmbPrdFDgoudG2w=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5598sYuN4149176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 03:54:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 03:54:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 03:54:34 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5598sTbD1008464;
	Mon, 9 Jun 2025 03:54:30 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase tag to "pcie0_ep"
Date: Mon, 9 Jun 2025 14:24:29 +0530
Message-ID: <20250609085429.2334652-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

AM64X SoC has one instance of PCIe PCIe0. To support PCIe boot on
AM64X SoC PCIe0 instance needs to be in endpoint mode and it needs to
be functional at all stages of PCIe boot process. Thus add the
"bootph-all" boot phase tag to "pcie0_ep" device tree node.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
475c850a7fdd Add linux-next specific files for 20250606

 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
index 432751774853..268a3183753e 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
@@ -30,6 +30,7 @@ &cbass_main {
 	interrupt-parent = <&gic500>;
 
 	pcie0_ep: pcie-ep@f102000 {
+		bootph-all;
 		compatible = "ti,am64-pcie-ep", "ti,j721e-pcie-ep";
 		reg = <0x00 0x0f102000 0x00 0x1000>,
 		      <0x00 0x0f100000 0x00 0x400>,
-- 
2.34.1

