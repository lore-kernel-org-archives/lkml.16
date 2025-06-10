Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD98025EFB6;
	Tue, 10 Jun 2025 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749534574; cv=none; b=CZBJPLpEvcL6R1Z0oc5sfGFBLjqWgvDql2w+2qhzXxBd9c1i7W7URKWVQLyd7KSAMQvNmDpwbZlZT99jljqSEK/Dc2SCvXKnq9Lo8vEzBMZWARkmHCx/loqvs8WcDLkH/7XTEucvOBgt9XwI/ajjnUE1wG2erQ25C2sEZnokwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749534574; c=relaxed/simple;
	bh=ykHciBnkT0hXgcM958UyGsU5I55SBpDRdhHEee2wXd0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QjiWWrjbuAudcnzG8MnsSYpH0t80i6wVaN48xVHjtWuO6Zkm9ZvaoVSTNZjjR3WPnUxaHlFUShn7UAqOFLE3viB5/3LuSPe1kcAR5BSY+DN8brGekV7QQ8DYCebuN4w0yY0w20mOF0jFCbVGQjtnSVOohPjNUOMP9QKFbvjrO+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i8E94JcG; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i8E94JcG"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55A5nQjx2202934;
	Tue, 10 Jun 2025 00:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749534566;
	bh=Du2O03Hp0aOTb5aL/J9+f9wo5qv/YYwht5W3A/NuOXI=;
	h=From:To:CC:Subject:Date;
	b=i8E94JcGs9P2psU458AbJo6VWOHEvUxw9xCLLuT8me0tEIVekJFdp1So6r7oWS9sU
	 0p5ss6QJRe8gFDdSCojD8cl2byKtRZAIzdqPeThCSLHQmZ3xDnR9j3yxK0ee+zcm77
	 Sf6hIECo+4eVaeksefszz37Y+YL0f24jz0DUiSUI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55A5nQwc1900885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 00:49:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 00:49:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 00:49:24 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55A5nLp12421739;
	Tue, 10 Jun 2025 00:49:21 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase tag to "pcie0_ep"
Date: Tue, 10 Jun 2025 11:19:20 +0530
Message-ID: <20250610054920.2395509-1-h-salunke@ti.com>
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

AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
functional at all stages of PCIe boot process. Thus add the
"bootph-all" boot phase tag to "pcie0_ep" device tree node.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
475c850a7fdd Add linux-next specific files for 20250606

Changes since v1
As per feedback from Nishanth, changed the position of "bootph-all"
tag, according to ordering rules for device tree properties.

v1 : https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/

 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
index 432751774853..a7e8d4ea98ac 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
@@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
 		max-functions = /bits/ 8 <1>;
 		phys = <&serdes0_pcie_link>;
 		phy-names = "pcie-phy";
+		bootph-all;
 		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 	};
 };
-- 
2.34.1

