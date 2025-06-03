Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32DE284B49;
	Tue,  3 Jun 2025 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944588; cv=none; b=M+EcRsTdlPKQotaSJNqTCCHUylSxPvrYO17/8igAYAylf4sxzcX/tY8eEwX5ICaNZw5yj0ijpDMHRKOPcoL6Rqb6OrzAuG7YhJ6YdU2IX/BDsVMe90u0eie44XaURQwZRlXaNbxYlE+E3L/nPp4UJ3Z6PgBKH2DBUcLdVoyfPSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944588; c=relaxed/simple;
	bh=QjDz9v+0IohkDDVc2tN5IWX7BmpUj2LadGQN1Zz1Jn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7RdSZ3KVRrN7u2BLtuhzlZhWNe8HCP8KTs5woTqza7awtTcVPiCIEg/rs3EvJQ2GymaGBKsCrC3CGXiEW+R4Mzfr5yY2gcbRAhreFl4J2zA4gK+MWQmq08gzoJDj3LVrj77FbV60j/IdrpUC6UNLWPOZbGJBETIJ7NlguFj64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bmAaamDr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bmAaamDr"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uFoN3466480;
	Tue, 3 Jun 2025 04:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944575;
	bh=QF477EIKbx8OYvgM9xdHd1qBazuZc20zUZwArftSMxs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bmAaamDrB073eEz70+MBBId7DSQ5gkWLIcKnbVMwzboP9jm5APZ3mrQUN0Y5ZifTA
	 hOripqU/m8pg4tHyfI3S+zQ+UNF77QQQH5zTwgjKWDYDIy9CrQiZKyNJum6sg0nq63
	 jiJLB6aeBAWAdhOEaY73jzSw0Iq7rqFzGMmtCdoE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uFE33661749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:15 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539uEah254840;
	Tue, 3 Jun 2025 04:56:14 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-j721s2-main: Make the "scm_conf" node a "simple-bus"
Date: Tue, 3 Jun 2025 15:26:08 +0530
Message-ID: <20250603095609.33569-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603095609.33569-1-j-choudhary@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
"scm_conf" node to "simple-bus".
Also remove "reg" property as it is not needed by "simple-bus".

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 83cf0adb2cb7..605f753d3258 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -37,9 +37,8 @@ l3cache-sram@200000 {
 		};
 	};
 
-	scm_conf: syscon@104000 {
-		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
-		reg = <0x00 0x00104000 0x00 0x18000>;
+	scm_conf: bus@104000 {
+		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00104000 0x18000>;
-- 
2.34.1

