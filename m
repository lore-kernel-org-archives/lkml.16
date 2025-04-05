Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E322171A7;
	Sat,  5 Apr 2025 00:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812133; cv=none; b=J/Z+FjSJtEzciQ2eR5U2OqkTcsBTIwPTNZaWhfpI5xQxC7kjYXVXUOLovKx+CeT5DS2UsO26AynZHxzoQenacFUfqY1dcSAUSFkAe2F8e5gSHFa9Phv0+6ub4WDKm7hZNdwGGHpDSViXCA+pJW9xLoV3p9uXO9laa3YolIhajX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812133; c=relaxed/simple;
	bh=bwYTBuvzOhLMAMSvjeTqAcNEmRlazQOCEzKMKTxaAo8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlmEpwszuBtfLUUkAIf9dOCqVdO7MytD5Lu7Sx3BFLBXtRB59yCmEOv8q7PmLOvibcyxjoELYdnTUUl0IaYiHFEP4n+qovDTDRqCwr36YXcJK7VXBmY//Bz5+VnOE6TcjQZoayzOVqJO71GwwMg5ve7kqs2vR7QkGxdUfNrKjLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Tpn50V9a; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Tpn50V9a"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FIQR464790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 19:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743812119;
	bh=0x4HYCG6udDh+zdPSfjRlPnIjrs/dPAOW/52VBr2Zg8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Tpn50V9aymVnlRWv/p1XCYXgXrFEPpb+UWktaeQlEGG+azIBIMHTqzKnRPAjCScxo
	 d9lbp08QkXf6HZk8/dVo/fMqY7n33xWT4fPFZBiZisQmd5DnxnzNtefpM9wlG7dHBV
	 MGTkTtV6iCH06cuRCLggSlcQXzORnX61gjNxS3FY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FIN4038158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 19:15:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 19:15:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 19:15:18 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5350FI5c065952;
	Fri, 4 Apr 2025 19:15:18 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>
Subject: [PATCH v6 03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
Date: Fri, 4 Apr 2025 19:15:10 -0500
Message-ID: <20250405001518.1315273-4-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405001518.1315273-1-jm@ti.com>
References: <20250405001518.1315273-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Hari Nagalla <hnagalla@ti.com>

AM62A SoCs have a single R5F core in the MCU voltage domain.
Add the R5FSS node with the child node for core0 in MCU voltage
domain .dtsi file.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 9ed9d703ff24d..ee961ced7208f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -174,4 +174,29 @@ mcu_mcan1: can@4e18000 {
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
 		status = "disabled";
 	};
+
+	mcu_r5fss0: r5fss@79000000 {
+		compatible = "ti,am62-r5fss";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x79000000 0x00 0x79000000 0x8000>,
+			 <0x79020000 0x00 0x79020000 0x8000>;
+		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		mcu_r5fss0_core0: r5f@79000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x79000000 0x00008000>,
+			      <0x79020000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			resets = <&k3_reset 9 1>;
+			firmware-name = "am62a-mcu-r5f0_0-fw";
+			ti,atcm-enable = <0>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <0>;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <9>;
+			ti,sci-proc-ids = <0x03 0xff>;
+		};
+	};
 };
-- 
2.49.0

