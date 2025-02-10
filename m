Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA2250BE8;
	Mon, 10 Feb 2025 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225755; cv=none; b=MOrYPLCU0Aeihe2Hcv4WiePe163DPo+f3utYpF3ZiXnYupz9OSo87EJKFJtoPxFkE8dly9/eoerv5BFqTVYd4VuoiQ8pCqwwx68MSCO+gjeAa8fdJhNtQd/7jzvW8qeWIEaycdBAel1S+bzK5aBHjf+kwHiFk2MjJ3HkTyQxb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225755; c=relaxed/simple;
	bh=AuaBOvXXgv3uC8cV1e0064fK5LNOp0uvZ+8Px3GBuvg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wxz0hT+Da3viTKdTXlwXLhqHtPIeRT30ZPhoOtBce83/WVg7VgZQC1pDa4XgshuZdFOhi/o1hTlCzB17hAuEcy2x9v5aSrfrMUbD9opYXK12GKSRyktb/FxSNpUQ94C/deWhdtm1bVSTHaimqVBwFwuNeMB3YHIsUMDWe3LcVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Gg2PL2f5; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gg2PL2f5"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVoB121123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:15:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739225731;
	bh=rtwooEUXJqbc+gp6GlVVSdw12M9QnNlfkv2N7dQ+dOw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Gg2PL2f5wODScub8A9bFewGw/TW/jHrolRFjgp4fSwcXiNdNA7eEtiLuF1VhxjYxZ
	 xrTh/o5Il+gosn6WnpxSOuYzpvSrBn9oVGqTKB7q1CyUUhn00GZg1206XJIrJOUyLe
	 +6L9bRYYM/OpNrJrFJzmVzVar1MwUYL5PJdvvtYA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVqJ016612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:15:31 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:15:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:15:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUZC112628;
	Mon, 10 Feb 2025 16:15:30 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v5 10/10] arm64: dts: ti: k3-am64: Reserve timers used by MCU FW
Date: Mon, 10 Feb 2025 16:15:30 -0600
Message-ID: <20250210221530.1234009-11-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
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

AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
main domain timers as tick timers in these firmwares. Hence keep them
as reserved in the Linux device tree.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4:
- Reserve timers for AM64 MCU FW, patch 10/10
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index f8ec40523254b..68bd6b806f8f0 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -796,6 +796,23 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+/* main_timers 8-11 are used by TI MCU FW */
+&main_timer8 {
+	status = "reserved";
+};
+
+&main_timer9 {
+	status = "reserved";
+};
+
+&main_timer10 {
+	status = "reserved";
+};
+
+&main_timer11 {
+	status = "reserved";
+};
+
 &serdes_ln_ctrl {
 	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 33e421ec18abb..07fbdf2400d23 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -710,6 +710,23 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+/* main_timers 8-11 are used by TI MCU FW */
+&main_timer8 {
+	status = "reserved";
+};
+
+&main_timer9 {
+	status = "reserved";
+};
+
+&main_timer10 {
+	status = "reserved";
+};
+
+&main_timer11 {
+	status = "reserved";
+};
+
 &ecap0 {
 	status = "okay";
 	/* PWM is available on Pin 1 of header J3 */
-- 
2.48.0

