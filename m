Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549E24C092
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451485; cv=none; b=hxaqUTn9WNGZa9m/Ow2i0StOlJfQlH9ZyMcL9kDpWXqjGO+OQ9eFfJSgVqYvYDMFrBCrf9WbD2hVA1b1P/w2pXISpKH2ERKw7AKt3t3xJiamSw2nRRW8pJcYwgX+NMm2JEN2vIa+2z2XxRwv1uHqXZWtFB2deX/dmaRoE0w06Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451485; c=relaxed/simple;
	bh=y77X37gAugX91JrGBbDc9vema3Ytb2kMk2Zu6xzLV/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ebikLGtnYBhguXQAR/kufqmV5gtCaA2FWkE2Jih9h8IsScfRNmR+dx5zpZ5isEizlD6aFUF/IZon1mfrE/5wsCHK8KfkrPqyjnLOJHt8420TTSQ8dBbjGIZfGV63XThyxNVS+G5/9vqZS8apLp/ILki5Hdy1LHuqUHWoYfaZLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uBvo7-0000dt-Kd; Mon, 05 May 2025 15:24:31 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uBvo6-001ElS-37;
	Mon, 05 May 2025 15:24:30 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uBvo6-00Ce6n-2o;
	Mon, 05 May 2025 15:24:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 May 2025 15:24:24 +0200
Subject: [PATCH] arm64: dts: ti: k3-am625-sk: Add power/temperature sensors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAe8GGgC/x2MQQqAMAzAviI9W5jFKfgV8bBp1SJusoIIsr87J
 KcckheUk7DCUL2Q+BaVGIo0dQXz7sLGKEtxIEPWFNCdHVnUA5WDxqToPVnL5J1reyjZlXiV51+
 OU84fngVTXmIAAAA=
X-Change-ID: 20250505-am625-sk-sensors-bb255e2baa47
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746451470; l=2443;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=y77X37gAugX91JrGBbDc9vema3Ytb2kMk2Zu6xzLV/8=;
 b=kHuheosHNgMn75rW9pnvt3xs2K4Lnln8qgA5qFhk2utGwFiN33cb+Gr6UfNBBHalVJ2x1enMi
 R02UGWmyz2EDvENq1aDh7qV3X9tJCZ64/vB1fgIe50zT9i+ts7Reka6
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

The AM625-SK has six power sensors and two temperature sensors connected
to I2C. Add them to the device tree.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
The AM625-SK has six power sensors and two temperature sensors connected
to I2C. Add them to the device tree.
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 2fbfa371934575efc4e9118a705f062bdea55f4f..e900d3134c72dc2616e3820b273d84b0db64bed5 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -193,6 +193,74 @@ exp1: gpio@22 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina231";
+		reg = <0x40>;
+		#io-channel-cells = <1>;
+		label = "vdd_core";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina231";
+		reg = <0x41>;
+		#io-channel-cells = <1>;
+		label = "vddr_core";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina231";
+		reg = <0x45>;
+		#io-channel-cells = <1>;
+		label = "dvdd_1v8";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@47 {
+		compatible = "ti,ina231";
+		reg = <0x47>;
+		#io-channel-cells = <1>;
+		label = "vdd_ddr";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp100";
+		reg = <0x48>;
+		label = "soc";
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp100";
+		reg = <0x49>;
+		label = "ddr";
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@4c {
+		compatible = "ti,ina231";
+		reg = <0x4c>;
+		#io-channel-cells = <1>;
+		label = "dvdd_3v3";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@4d {
+		compatible = "ti,ina231";
+		reg = <0x4d>;
+		#io-channel-cells = <1>;
+		label = "vdda_1v8";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
 };
 
 &sdhci1 {

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250505-am625-sk-sensors-bb255e2baa47

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

