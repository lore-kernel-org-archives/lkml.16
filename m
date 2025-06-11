Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043D273D76;
	Wed, 11 Jun 2025 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642241; cv=none; b=QRQE1HWoLCSYGNL5hrB+RkhFpXcdQnzeXGN/53scxGU7w/AslTuvTReeyJKwvD5WYb2CmMI47pUsZdBugIH2cJECcKQS7GcuvPjZrpp1v4atM7Gy4PPM3lIUxReYEurETADLTYjCBwpcmZpoGU8zOu3GeApQtq7iUOkkx4xJh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642241; c=relaxed/simple;
	bh=ytL3WhPyl0ZPJpnKCMwYPNfnsP7pByrk1w/9nlXvp5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fer4F34wA2Oj9H3GaNPyJCJPYDe/zdUdHtq5eP3aLK4r95XXRy51Vdh6o2ESRYeTcI20WhFMA11R0lc22dC0/EH1ldXfkwSrSbtTS3NzGr9HvZ6CVZ/9IItJjJzMZs5W4R7oaS73TMCV+GZac5Y54GVT++MN28y8WN66lfHZiWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Qs+RmaFl; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Qs+RmaFl"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhs4d2587925;
	Wed, 11 Jun 2025 06:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642234;
	bh=kUOY1NRrOMBzYxP8VAoyU2DCMy0pPGspuBpJGnV4LNU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Qs+RmaFlsbrEwNgOzuTW42/3RgwgvEsfGBJfKK/eGw4jOCACPJQYYIV8bghDSvO33
	 9csv96KpLyOFzVT8vGnQPT5sfX+6mkzIuLRdHaUW9kpXb+4G41c//AodjC+fRw3Jj9
	 nqV0Dy1XDbLnSVMETyKi8zoIzTTZSqBVBHHhaQwc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBhsLP986157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:54 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 06:43:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:53 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavH270460;
	Wed, 11 Jun 2025 06:43:51 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-j721e: disable "mcu_cpsw" in SoC file and enable it in board file
Date: Wed, 11 Jun 2025 17:13:35 +0530
Message-ID: <20250611114336.2392320-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611114336.2392320-1-s-vadapalli@ti.com>
References: <20250611114336.2392320-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Following the existing convention of disabling nodes in the SoC file and
enabling only the required ones in the board file, disable "mcu_cpsw" node
in the SoC file "k3-j721e-mcu-wakeup.dtsi" and enable it in the board file
"k3-j721e-common-proc-board.dts".

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch was 2 different patches which have currently been
squashed:
 https://lore.kernel.org/r/20250529133443.1252293-11-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-12-s-vadapalli@ti.com/

Squashing the patches is the only change since the v1 series, in
addition to updating the commit message accordingly.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi       | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 45311438315f..eda85dafb794 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -767,6 +767,7 @@ exp5: gpio@20 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index b02142b2b460..dd923540ca0a 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -551,6 +551,8 @@ mcu_cpsw: ethernet@46000000 {
 			    "tx4", "tx5", "tx6", "tx7",
 			    "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1

