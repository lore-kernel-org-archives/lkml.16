Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03E2701A4;
	Fri,  9 May 2025 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782391; cv=none; b=Woxxxm18Mz2SBnv20j5A2RfDcVDzT+JO7R3bZ1saFPHiERNH76FiV3dJZGzZEz7xLzRaMuucnY7wwcVbckiATAyWRFSk2O6WYwmYREYxQtGrE3w215E+rKvNdTa2t7hk5/hEsMPUGBPGY4exEIzoxDfws8Zc+x5lwLdr9jEem0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782391; c=relaxed/simple;
	bh=wPS8W3Ir7SODaScp6ENDMfDFDw7lqkua34UP6QkEPng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pd+SjugQASaTCAN52vNq/zQ5CPnxS/sXXggtc1QTru8oIi5R9I8gWBtKWBi3wyhAGb0RBFY4AeLci3cVFXbb8uD2xz4wd36R9NOpF3zlRA8MHfwtIHZXAzrLEsnP9DH6/9oPV8UUWq45sWS6d9DmwZzV+dudAC8heVkP11va//U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aq8crRlO; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aq8crRlO"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JalR1350858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 04:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746782376;
	bh=uoLYLwLT+B43IHFMa2nHyDWREdBWwB5fKOnCamiqucU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aq8crRlOozvzXWdkVEMmwV5dHUC2KI6NuR0B/OilGzFFaMeu3tFrGkeE1QgzskiZ3
	 CmROepyB2prowXN+sfNwHu07HJjnoBHjuSsHQ4C+Iu2sxCb68xNL5F4W65T6X2d7Lo
	 4RFVIHnblLDPU5Omw6NBkRuelcsJvMxP47RgfNWE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JatQ123911
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 04:19:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 04:19:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 04:19:35 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5499JL7t070287;
	Fri, 9 May 2025 04:19:32 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v3 2/4] arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX
Date: Fri, 9 May 2025 14:49:09 +0530
Message-ID: <20250509091911.2442934-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
References: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

J722S EVM has the CSI2RX routed to a MIPI CSI connector and to 22-pin RPi
camera connector through an analog mux with GPIO control, model mux so
that an overlay can control the mux state according to connected cameras.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---
Changelog:
Changes in v3:
- Change "model that so that" to "model mux so that" in commit message

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 2213993acbc9..a47852fdca70 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -266,6 +266,20 @@ transceiver2: can-phy2 {
 		max-bitrate = <5000000>;
 		standby-gpios = <&exp1 17 GPIO_ACTIVE_HIGH>;
 	};
+
+	csi01_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&exp1 6 GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+	};
+
+	csi23_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&exp1 7 GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+	};
 };
 
 &main_pmx0 {
-- 
2.34.1

