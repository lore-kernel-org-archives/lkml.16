Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F61F4626;
	Thu,  5 Jun 2025 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105329; cv=none; b=D7mSBIm5vQpxON4NIZSjIKNSwtzckyV8oXV1U3jwoTTJk+XmAhj/7NOD+Zcc3vREpil69ngMqqFvAeKAMKg1GC4yttBN1eoVQ15/vy1vKZRK3yEG0d0MXdTeu/iW+XBMomHxDp1+su1lZHwgf0A8S/hxF9F0Xavq9xSGG7PNj1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105329; c=relaxed/simple;
	bh=0NDZlSjwj7JeXYucz/nNwwdorPxcDXzfwZb4HakkOQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzKZYbuqt2JTBP1yopZobfdgsPMF9HPMNb57IZ1XEg8gr95v1qVlIga4kkyM9mF/4eG1ppaskv+s72BDc1F20Ckg5DcWnsyQISENFR4D5hRkyyqJ0qr76jb/BDzR7DiND98ok0AscNUsGAPBKs0npTSsD3F1ijmo1GV3ivSOsaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JHy/TmF+; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JHy/TmF+"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556ZJwj1031528;
	Thu, 5 Jun 2025 01:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105319;
	bh=ZLwho06vrhR2st2QbPaI2lCYTW/PqUtL05pCheR4f6I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JHy/TmF+N5zOIkgG/JkWvCtoShNuSUSQ4WJlDioN7kZzmDai/icZz1q1MkLQpIER/
	 +YrJpdo5B3rdtyjoEuHKFUjtY3zzoUvv2yZf+K+MKfZUVgBc5WRyf5V4gBJKGKNndQ
	 D5CDbJCVS0142sBuXczgvNaBOyK8NPXLfcn4iE0M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556ZJY3948598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:35:19 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:35:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:35:18 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556Z7Va3168702;
	Thu, 5 Jun 2025 01:35:15 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node
Date: Thu, 5 Jun 2025 12:05:06 +0530
Message-ID: <20250605063506.2005637-3-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605063506.2005637-1-n-francis@ti.com>
References: <20250605063506.2005637-1-n-francis@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add DT node for PBIST_14 that is responsible for triggering the PBIST
self-tests for the MAIN_R5_2_x cores.

Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
Changes since v3:
- add support for J742S2 as well by moving node to common DTSI

 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..50954e9d5779 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2670,4 +2670,15 @@ mcasp4: mcasp@2b40000 {
 		power-domains = <&k3_pds 269 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 	};
+
+	bist_main14: bist@33c0000 {
+		compatible = "ti,j784s4-bist";
+		reg = <0x00 0x033c0000 0x00 0x400>,
+		      <0x00 0x0010c1a0 0x00 0x01c>;
+		reg-names = "cfg", "ctrl_mmr";
+		clocks = <&k3_clks 237 7>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+		bootph-pre-ram;
+		ti,sci-dev-id = <234>;
+	};
 };
-- 
2.34.1

