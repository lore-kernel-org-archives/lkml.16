Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFC725DAE4;
	Fri,  2 May 2025 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203175; cv=none; b=q8HKTQ1PJhDL2vg5O1FZjHNBD9zcOFAHyUv6erCKxTE67Wsy4X370bBl5LtfTckekLUJr6WaMOUbV02F957w62pMaTjQKkoxyA6U4mHoSa1HjOiF60jnguUAz3NAc2DGacnTKJIlfk4/A34oQPaoLAOtRjk5qnMI7g3myPkjXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203175; c=relaxed/simple;
	bh=gbQN95tWrqKd8Hg4E5KTcV06ya0SAF4qg6yuFurcvZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGNk2PB4YZaV0xSYY2EsWCZJ1yICk+JmwHZeFiTJrBuKZM4XARwbKGmtF/aSu4SKfzEX8FwP6YbXws5Ym1OyMcWpmKNIH2bbfTXT21mHrpWhwlnzVjFGBw2E7xqrXJlxOgiGcGAMWCkyBjR63Do6fWXjZMNf86gduoVEALkWgQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ekP8Ur60; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ekP8Ur60"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPpc3448858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746203151;
	bh=16Jtfa8zqRduD5bzBqBFlLax/AqYDVwaMHqP+NoVmxM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ekP8Ur6009k0t27DhpEprqwLOZOH4maSjgxyg+8tHFWGLaAa9cBBwdmaz3OqR9YHr
	 5QyraGEHgtwlU0vdZ8X6NJEpgO7NNYtF5js0rR6xm8C16lTRK5VQ91nnx61+HhTvLU
	 QilQlFDO+K47ho6Ts6YPobg2w6Vieddrs1aAdfTw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPpxR067523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:25:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:25:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:25:50 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GPex7028994;
	Fri, 2 May 2025 11:25:46 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v2 1/4] arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
Date: Fri, 2 May 2025 21:55:36 +0530
Message-ID: <20250502162539.322091-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502162539.322091-1-r-donadkar@ti.com>
References: <20250502162539.322091-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add regulator node for AM62P-SK

VCC_3V3_MAIN is the output of LM5141-Q1, and it serves as an input to
TPS22965DSGT which produces VCC_3V3_SYS [1]

VCC_3V3_SYS servers as vin-supply for peripherals like CSI [1].

Link: https://www.ti.com/lit/zip/sprr487 [1]
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index c2f55cc5a8ebc..0af33fccb96bf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -115,6 +115,28 @@ vddshv_sdio: regulator-3 {
 		bootph-all;
 	};
 
+	vcc_3v3_main: regulator-4 {
+		/* output of LM5141-Q1 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_main";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_sys: regulator-5 {
+		/* output of TPS222965DSGT */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_main>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.34.1

