Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9441A26E709;
	Wed, 11 Jun 2025 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642239; cv=none; b=rDhMbSi6vSos/nYKays+ALzLLBiBudBezpYLXNJ14eToD0F2Y5UwPNqxeqbl5t0lWoVaf58DQiqOQUpBWz4JYAc6FEUzZRjICaMRrW515y4W5yZ5drIJHqQOZSRPMwlYrBKD6RZRdjOATg4cWUH988yvoOV2y3qTLNxl3YFyr2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642239; c=relaxed/simple;
	bh=fEWaxcPdCGYP1N191J4KPIQFYcaOBgpznYoaqqSU0o8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i3KmjBhOzWnWXwoJSr7nkmW2XbW01ql1B51amsd/t0q4Rk3Tj4iRa/93r1e98y9nAyzfU15RIebaY3mBpAmDulDrB9dAsqO9T05vXNM6ALJWIyfErgTgrkz5HkqjNCpEMHcbEyi5qD/GM1T4tokblpmD1eY2naaGRbgX1h2ceP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xqBx3Itg; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xqBx3Itg"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhpIV1352878;
	Wed, 11 Jun 2025 06:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642231;
	bh=pK++XEie+/oAxvEBIgrzqo76AvhJ2lHuoGEeVT7MV9A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xqBx3ItgdU7Nl+conEmYtGtxX3PCVXC930nUo4zgD4I4dpJM/29Uv/OPcPpz5FLlN
	 b2aC+HfUMfGnW257C2FBtUpdvNUeAkcGfmrO5DLGFzI54auyIqms+QXbmokrKB9uhu
	 +25lZkNX1R2g0VLScv8C9s0Kft9lOk5H/Ofo4wAE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBhpjU1108991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 06:43:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:50 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavG270460;
	Wed, 11 Jun 2025 06:43:47 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 3/5] arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enable in board file
Date: Wed, 11 Jun 2025 17:13:34 +0530
Message-ID: <20250611114336.2392320-4-s-vadapalli@ti.com>
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
in the SoC file "k3-j7200-mcu-wakeup.dtsi" and enable it in the board file
"k3-j7200-common-proc-board.dts".

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch was 2 different patches which have currently been
squashed:
 https://lore.kernel.org/r/20250529133443.1252293-9-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-10-s-vadapalli@ti.com/

Squashing the patches is the only change since the v1 series, in
addition to updating the commit message accordingly.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi       | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
index f684ce6ad9ad..021cdeb84ad1 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
@@ -321,6 +321,7 @@ &wkup_gpio0 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index 56ab144fea07..604295092d06 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -432,6 +432,8 @@ mcu_cpsw: ethernet@46000000 {
 			    "tx4", "tx5", "tx6", "tx7",
 			    "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1

