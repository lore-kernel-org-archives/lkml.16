Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B6221274;
	Fri, 11 Apr 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368734; cv=none; b=ro8bjAXIRI5EQAkk8PrS9PTc+VEVkmuBGSnHZQeUs3h+8WHmJ7sg//j6PF9up9G86+Nz496wh7Q4nU67Ran0WDv2v8MO6m2pfdTlfWf7yjEnQXNjrKS03adrXVmgIa82kn/c9DFz9DKKYFMTDJzZ7DwuH85vDhQCmH4YNYsvsu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368734; c=relaxed/simple;
	bh=e7rTzaxEDMtzj3O1JeorM3VQJ9CRwmv4f3jaAX+G3hU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CkixH+dcLo56ret6MfSn0b/F0URVRPh0OLlsPzmLRWrgUZr4QCKtDrH0YPut5z75KaB30vHjvxWpFPVuY19lbklTB2+c6eYTtPIYshRSJgBCX+WkEuUp1iNese9tEdAYE/zmhneBYN2MoctlfG3RZ4Hvr5a/rpSVVjgkmPOZ9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wtIpXYTs; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wtIpXYTs"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq5uJ2052619
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368725;
	bh=v9CwQG06iVfzUY7Hr2VLztVA/f9MsGJv3S5NboKjkqw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wtIpXYTsoK34+Z4WS9J1ZkVVP6F7zW0PvFGx3aC+jWqi2QizJ/kzv0UELUecxorO6
	 GZF81G9jE0TcVFxk/msVlT06PGREeNUujnIhc9MtNSrmi/46A7N94XYGtmfkgqq1gF
	 VLignAOkrbj6KXQShF2qGiKEDZhEc070npKmXT4M=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BAq5Tn010588
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:52:05 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:52:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:52:04 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BAq3Sh030095;
	Fri, 11 Apr 2025 05:52:04 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
Date: Fri, 11 Apr 2025 16:21:52 +0530
Message-ID: <20250411105155.303657-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411105155.303657-1-j-choudhary@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add dt node for main_i2c4 instance along with required pinmuxing.
Also add the gpio expander 'exp4' required by display connector.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index e2fc1288ed07..f691ae4c19e6 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -148,6 +148,13 @@ J721S2_IOPAD(0x060, PIN_INPUT_PULLUP, 13) /* (AC27) MCASP2_AXR1.I2C3_SDA */
 		>;
 	};
 
+	main_i2c4_pins_default: main-i2c4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) I2C4_SCL */
+			J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) I2C4_SDA */
+		>;
+	};
+
 	main_i2c5_pins_default: main-i2c5-default-pins {
 		pinctrl-single,pins = <
 			J721S2_IOPAD(0x01c, PIN_INPUT, 8) /* (Y24) MCAN15_TX.I2C5_SCL */
@@ -370,6 +377,20 @@ exp2: gpio@22 {
 	};
 };
 
+&main_i2c4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c4_pins_default>;
+	clock-frequency = <400000>;
+
+	exp4: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
 &main_i2c5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c5_pins_default>;
-- 
2.34.1

