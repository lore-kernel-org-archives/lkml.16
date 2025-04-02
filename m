Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80F239089;
	Wed,  2 Apr 2025 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593539; cv=none; b=c8FhZcwq3EZHQrmpezqfG8jJo0Up2GiwyCn0hIU8y3g7PK8vdMTWXUbv5Mdyc4qllFhwYAoytJ8+HWRPRZYbFjJwlxi7owTsCMmrqivz5vUU6QgB+VSYTuEbGs6yuLTgYZapOPIsTHhxUfTstcOAOf+btmS7R2WvKU/IKh3zdoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593539; c=relaxed/simple;
	bh=RMUTeToDNw6n/NFM9ZDo6YcN8k1+VRdwpr4TMdM5BVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eY3P6uqQ3uG91DUY9EGUdDl15fRqynH5VPFMMiFxJ58g0rQf67pO+AwckQJNmks2aPopUbWwftTsBoFp095uD2oVQtmBoU1/RbWEX7/oF1bDmx7xOjcLazPhIrGJl37zC9mFbwrCBCt/mdcKl1LksBBC6O6pY5qQ3Y9eR+LaNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kZqO0l+L; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kZqO0l+L"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWCCh3915810
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593533;
	bh=+CQDuHs7zFUqfObgU50fZXkBp76ORP87Ik1HRSIRSR8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kZqO0l+LgRTrtMcbrLGyNgLMqXzX9ujkYb5KNB6czl2GGifBjhQYhxcmuZsue8nzc
	 SOvqPzloa392EI0Bkprty8sui5NP3/dRWtT3G7A6F4HL6scw0Kn0VK6AB2xU+/rPN/
	 N6ga/OMTIL0bvquybA5NqQrqTBkt7kfkyyVbrr/A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWC9a103504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:12 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BWBun017482;
	Wed, 2 Apr 2025 06:32:11 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 5/5] arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region
Date: Wed, 2 Apr 2025 17:02:01 +0530
Message-ID: <20250402113201.151195-6-j-choudhary@ti.com>
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
[j-choudhary@ti.com: Add changes to k3-am642-evm-pcie0-ep.dtso]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi          | 7 ++++++-
 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index 324eb44c258d..d872a624601c 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -51,6 +51,11 @@ chipid@14 {
 			reg = <0x00000014 0x4>;
 		};
 
+		pcie0_ctrl: pcie-ctrl@4070 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x4070 0x4>;
+		};
+
 		serdes_ln_ctrl: mux-controller@4080 {
 			compatible = "reg-mux";
 			reg = <0x4080 0x4>;
@@ -1036,7 +1041,7 @@ pcie0_rc: pcie@f102000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&main_conf 0x4070>;
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 		max-link-speed = <2>;
 		num-lanes = <1>;
 		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
index 6b029539e0db..432751774853 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
@@ -46,6 +46,6 @@ pcie0_ep: pcie-ep@f102000 {
 		max-functions = /bits/ 8 <1>;
 		phys = <&serdes0_pcie_link>;
 		phy-names = "pcie-phy";
-		ti,syscon-pcie-ctrl = <&main_conf 0x4070>;
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 	};
 };
-- 
2.34.1

