Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FC217F30;
	Fri,  2 May 2025 22:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223420; cv=none; b=ZV65jsAFgO/CFCBZT5rq9c+nmevsWkpaZbiKKb/f2a1zbnnmtqdMxsNDIklHLOFI6L/0ZZET/20+fS4Bn+AMhwAMYE1kxoW+Ep7mNdH09EDHXNhAgCF8X5Gr7auiqyUY6JkL1vM99qAoa8I3Z4pnL9INUL5xTqclZwV/du0Pi8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223420; c=relaxed/simple;
	bh=VaL1B5OBwZwxQjZPih7Plln1qwSDGppxGerayOT5hbA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbPguHdFV59wTKQTKLB2lSgm+sc5axwO96PBv7H+TLhvo7pLWFj+FdRqX5d3XIY0JiJEmItf79HwcU38xeWgd74hCfLRDUEtj3A3F0rTV8NipgSuLoYW0vsfTm4nTUrOqfADZjQX+zFID91FhijA2jPDIc9NDbwzSI3raMx9KlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lUM3nY/A; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lUM3nY/A"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3Qp83963040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 17:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746223406;
	bh=n8hiuaBdlBPlSW1wg8Xm8Bv5J0JE57EqC9y+V2JXqW8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lUM3nY/AUbUZGTPtMXw/MrBtBUo0YTKJ0sx/s8dKdDZwLKuduPJDL5QmakzSsI5OL
	 s4UKEiGvK42DP93Fvp76K5DjoWy5ORbn4TV9+CR6VO1gs7zSreB5OlI2dU6yIYwMai
	 0V/gCsw1ZjzFAIPQGRdWmEqOpcWKzdiPrivi4Jl4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3Qcf031666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 17:03:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 17:03:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 17:03:26 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542M3PBw006849;
	Fri, 2 May 2025 17:03:25 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hari
 Nagalla <hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Andrew Davis <afd@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 04/11] arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
Date: Fri, 2 May 2025 17:03:18 -0500
Message-ID: <20250502220325.3230653-5-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502220325.3230653-1-jm@ti.com>
References: <20250502220325.3230653-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Devarsh Thakkar <devarsht@ti.com>

AM62A SoCs have a single R5F core in wakeup domain. This core is
also used as a device manager for the SoC.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index b2c8f5351743..259ae6ebbfb5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -103,6 +103,31 @@ wkup_rti0: watchdog@2b000000 {
 		status = "reserved";
 	};
 
+	wkup_r5fss0: r5fss@78000000 {
+		compatible = "ti,am62-r5fss";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x78000000 0x00 0x78000000 0x8000>,
+			 <0x78100000 0x00 0x78100000 0x8000>;
+		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		wkup_r5fss0_core0: r5f@78000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x78000000 0x00008000>,
+			      <0x78100000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			resets = <&k3_reset 121 1>;
+			firmware-name = "am62a-wkup-r5f0_0-fw";
+			ti,atcm-enable = <1>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <1>;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <121>;
+			ti,sci-proc-ids = <0x01 0xff>;
+		};
+	};
+
 	wkup_vtm0: temperature-sensor@b00000 {
 		compatible = "ti,j7200-vtm";
 		reg = <0x00 0xb00000 0x00 0x400>,
-- 
2.49.0

