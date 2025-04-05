Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED517A2E5;
	Sat,  5 Apr 2025 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812141; cv=none; b=aB899e6wbjI08Z+tEq3QX07ixCSZuo6MNkwC+XHaQTYwXPPWs5jsEuAwIaxsAFGOud0NA54FKnEsF1Ts4FUexxln6JBClOXxwmkEVkEbl3Qo/k4PD+jcjUNthlIFGEw2OSX1C3Oaf1awcvJiamdcimjVNjUFAOlNQjUEa7jl5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812141; c=relaxed/simple;
	bh=/gDqjyJoVjgQ+S4Kg1uFXudcEbZNcFups73llq8NASE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIhv5yOPgFIL4fABONvRBBngLG5WVqf4MRtw1oFgLrM+dufw9iuUZ6jGByQna5cibS1e6pKFZz7KgzNGPm4AtZM1zm6whq5IZo6BKT26xqG07ejXN7/+9sUat2k7actWoMPB9rtb7yhHQ5ODz7HxM5SDEvANGA4miNzyeuXWTZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xOAgztZe; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xOAgztZe"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FJS8464798
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 19:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743812119;
	bh=+kbMmR2tIQt85OejEztUOpNk2QJKMnsU0zN6RrSPaRc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xOAgztZekWbAPxN6egfSA7+BCXEasNCMnAP0BknLn3wKS36bdLZI2gAhi7mMsh0o0
	 el2VX+ZeIHnhuZUJn6dPtX2fBpjsKMcGJCkirKSKdDDcGuB/3yBf5RVbFmBT3tDlEw
	 9Nm4BVwtjru49xoCt9sjM0FxjuCAniT2Ql/rRpKI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5350FJsV092676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 19:15:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 19:15:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 19:15:19 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5350FI5k065952;
	Fri, 4 Apr 2025 19:15:19 -0500
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
Subject: [PATCH v6 11/11] arm64: dts: ti: k3-am64: Reserve timers used by MCU FW
Date: Fri, 4 Apr 2025 19:15:18 -0500
Message-ID: <20250405001518.1315273-12-jm@ti.com>
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

AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
main domain timers as tick timers in these firmwares. Hence keep them
as reserved in the Linux device tree.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
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
2.49.0

