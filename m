Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B622129F;
	Thu, 24 Apr 2025 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484268; cv=none; b=hSFWiEfwZuc6P1K8aqsj9cmmQxaBC+5kZc0hQAHMtmDwa4/9zAMkS7J6OHAO9atWnjRK656MgeuRHGBAA5ETYgm8UGvOwb6MkaN1aMllhLuUiiNgDrQIYdVUmGa66g/X9jsM05WduH61v/AeDKiOBG1Oix6Y+mN8QgfXwFwMSPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484268; c=relaxed/simple;
	bh=IVpug+m3gWxIXV4zN8fOjdYZHgS7Tn54meRbedloeew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CnzrvF6PeKUHV8b+Y7jXCpzCylkeESOxQb0ko/v3yrvCl9dFL6srUio/J9g0Z9SwvieE9HVu7pO04VHWH9ozFByRioOkczn26Zszqu/ahx4P/wYW9/jMYmA8l2prnv3W8fkOXABL0ZONchKbWMn/3iKhafvBphjOo2WKMI4bWz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TDgGrgg5; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TDgGrgg5"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iKS31804371
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484261;
	bh=bt4bJ+f8aJF8JA4JoxVha75ahB4eqXqYACSbuvx5hOI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TDgGrgg5eyHPoq67OxCnONXk9+4bhUUUEFHc2tvGTRHH0hIFCeDq0gJ7gcQpHqEDW
	 W1BDwQfuX1w/gbNZKTnNa6JtBR5SFrv5p5T3jLhTXs+HyGsWK4d9uyR5daEbPup468
	 yLOfNxtsVnBlM0O6jwVRVgB34Ady2uMhoxOJurVY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iKfj004741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:20 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:20 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iJ1S067224;
	Thu, 24 Apr 2025 03:44:19 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Reserve 1920MiB of global CMA
Date: Thu, 24 Apr 2025 14:14:13 +0530
Message-ID: <20250424084415.66457-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Reserve 1920MiB of global CMA pool which is also marked as re-usable
so that OS can also use this region if peripheral drivers are not
using it.

J784S4 has different multimedia components such as Camera, Dual-
Display and H264 Video Codec which uses CMA for buffer allocations.
Assuming the worst case scenario where all three run in parallel,
below is the calculation:

1) IMX390 camera sensor 1920x1080
-> 1920 width x 1080 height x 2 bytesperpixel x 4 buffers :
   15.820 MiB which is ~16MiB
   J784S4 can support 12 cameras so ~192MiB

2) 3840x2160@60fps MHDP via DisplayPort0
-> 3840 width x 2160 height x 4 bytesperpixel x 2 buffers :
   63.281 MiB which is ~64 MiB

3) 2560x1440@60fps DSI via DisplayPort1
-> 2560 width x 1440 height x 4 bytesperpixel x 2 buffers :
   28.125 MiB which is ~29 MiB

4) H264 Video Codec 1920x1080 resolution:
-> For 1080p resolution codec application, we require ~98-100 MiB
   per channel. We require ~1600MiB for 16 channel codec application.

Total comes about 1885MiB. Adding 32MiB for other peripherals and
and additional 3MiB for rounding it off to 1920MiB.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index 2664f74a9c7a..33b54afe0a06 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -27,6 +27,14 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x78000000>;
+			linux,cma-default;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>;
 			no-map;
-- 
2.34.1

