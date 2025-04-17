Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511C242907;
	Thu, 17 Apr 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891485; cv=none; b=jDWF5Q33gVvpiLwUsLtJpS8ClKgDR2Nqxret2yDgSp5BnapfoTINNy4sXD5hHUTlOPhWRRjQBnHA8juZFvixn5n4TngR/noPdny7vdwfO0ghQ+yUi5csM9LdPSm2A3q2cLwqZvpKda3RpAg0xS7LIj+FzcCECU4HIBYBF96uPSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891485; c=relaxed/simple;
	bh=avD1NpbsEJIlK9wWblnST/7Y9qFyEs5xLtYFXFF5HqI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAOO+0p1DTWG/LVGnswPdZnd1e/6ITDFsVGUyQR5T782oDK4/HWd1U2QpdmLrlUvOVrDiswUe62R8BUuLVzfjOBeT4EZZo6RdNdrJ1TegSNyFYwJIeD9GUwQDZ2dMR/wb/MI6C0prk/BxBoN3bPpThm2k0YIba82nvsx+nwsTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=haR2lQSF; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="haR2lQSF"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4Zng3094834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744891475;
	bh=bNb2Dq3nRm0e9cZYsstRIDuGhQAYPxcy2C0B5OtXSxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=haR2lQSFJFH6A+nCi48gmimFDOkgu4Gk9bRGANzDO8ngRqPZt87jtFL1swhmWEOjx
	 io3FAjcSpr6XzyBNhyXSUgnHU8nDHUoPS3+7nPvKU37LvzgH4WjbXF2a++uQ8gGbuz
	 V7E2uLRSw5i4NM7IGLK+BGrtE9tcIVZxYPJYgtxE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4Z6F083673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:04:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:04:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:04:35 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HC47VP004789;
	Thu, 17 Apr 2025 07:04:32 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 7/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address space for PCIe0 and PCIe1
Date: Thu, 17 Apr 2025 17:34:07 +0530
Message-ID: <20250417120407.2646929-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417120407.2646929-1-s-vadapalli@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The PCIe0 and PCIe1 instances of PCIe in J742S2 and J784S4 SoCs support:
1. 128 MB address region in the 32-bit address space
2. 4 GB address region in the 64-bit address space

The default configuration is that of a 128 MB address region in the
32-bit address space. While this might be sufficient for most use-cases,
it is insufficient for supporting use-cases which require larger address
spaces. Therefore, switch to using the 64-bit address space with a 4 GB
address region.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..0cbf0fba9112 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -1055,7 +1055,7 @@ pcie0_rc: pcie@2900000 {
 		reg = <0x00 0x02900000 0x00 0x1000>,
 		      <0x00 0x02907000 0x00 0x400>,
 		      <0x00 0x0d000000 0x00 0x00800000>,
-		      <0x00 0x10000000 0x00 0x00001000>;
+		      <0x40 0x00000000 0x00 0x00001000>;
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
@@ -1073,8 +1073,9 @@ pcie0_rc: pcie@2900000 {
 		device-id = <0xb012>;
 		msi-map = <0x0 &gic_its 0x0 0x10000>;
 		dma-coherent;
-		ranges = <0x01000000 0x0 0x10001000 0x0 0x10001000 0x0 0x0010000>,
-			 <0x02000000 0x0 0x10011000 0x0 0x10011000 0x0 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x40 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x40 0x00101000 0x00 0x08000000>, /* 32-bit Non-Prefetchable MEM (128 MB) */
+			 <0x43000000 0x40 0x08101000 0x40 0x08101000 0x00 0xf7eff000>; /* 64-bit Prefetchable MEM (4 GB - (129 MB + 4 KB)) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		status = "disabled";
 	};
@@ -1084,7 +1085,7 @@ pcie1_rc: pcie@2910000 {
 		reg = <0x00 0x02910000 0x00 0x1000>,
 		      <0x00 0x02917000 0x00 0x400>,
 		      <0x00 0x0d800000 0x00 0x00800000>,
-		      <0x00 0x18000000 0x00 0x00001000>;
+		      <0x41 0x00000000 0x00 0x00001000>;
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
@@ -1102,8 +1103,9 @@ pcie1_rc: pcie@2910000 {
 		device-id = <0xb012>;
 		msi-map = <0x0 &gic_its 0x10000 0x10000>;
 		dma-coherent;
-		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
-			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x41 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0x08000000>, /* 32-bit Non-Prefetchable MEM (128 MB) */
+			 <0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>; /* 64-bit Prefetchable MEM (4 GB - (129 MB + 4 KB)) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		status = "disabled";
 	};
-- 
2.34.1

