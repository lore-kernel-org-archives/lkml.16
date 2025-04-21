Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9374A219A9B;
	Mon, 21 Apr 2025 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271994; cv=none; b=bWGUDDQkak87sSw2R2W/CNi4YrHsVpdaP4+VfGoJAcdYSqW8UPrJHvJLetC1rD8XgAAABC8BV9FPGMITSQnJwatzwarC5rhKL4bmSmlhBv3TLO/RIKm8L7H008w3sAp9NhpOWLRYK6FTeUVn3JiZZmVkc7/1/jOdQ/2iDUaVIGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271994; c=relaxed/simple;
	bh=2G3nmEb6Y+3C3RvvsrKJUyxQELjev/QTzJk/Lsg0RbM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVDWYAb1XGkutmLVu+xjCfbwfSawOTmUAAF6KgYFjELByd3Fml5ZZhuuMqV1KBGwAd2VIID5HpJaNso1Dr3PUmujDeCYpE8ygnkq0OGo2/xxdK6bgoMmnUTa1P04LdN5hyPhkdPKzTwk6Y0KIG5yGnyaM9b+xXGKvY8jn1HzLhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kG6yoPN+; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kG6yoPN+"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkNRr1033932
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745271983;
	bh=M38xF51b1ggw3drmG6MuoYV6Zybl+JKQwAP6cHLbmCk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kG6yoPN+Nc/Zj/MCmq5rlJQ5L/l7818Sz+RuFt9FF6JSEs3s9RMtSeitKAYCGzkhQ
	 TJcvUfsCXl1IcWml/y30yPQ6N221yPmvor5/mrVYiG4V2vuSFrWrgHnJCKhspbSgB9
	 MICwxwU2TFzLWL1eD4McI5+/WOj6F9E9VPmwFJHU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkNRU130992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:46:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:46:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:46:23 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLkLqN038764;
	Mon, 21 Apr 2025 16:46:22 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 3/3] arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101 panel
Date: Mon, 21 Apr 2025 16:46:20 -0500
Message-ID: <20250421214620.3770172-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421214620.3770172-1-afd@ti.com>
References: <20250421214620.3770172-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add the 5v0 supply that is provided over the display panel cable and
used by the LCD. This is required by "simple panels" or we get the
following warning from DTBS_CHECK:

k3-am654-gp-evm.dtb: display0: 'power-supply' is a required property

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti/k3-am654-base-board-rocktech-rk101-panel.dtso | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso b/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso
index 364c57b3b3a06..7a3953d64fd84 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso
@@ -15,8 +15,20 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 &{/} {
+	vcc_5v0: lcd-regulator {
+		/* Output of LM5140 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&evm_12v0>;
+	};
+
 	display0 {
 		compatible = "rocktech,rk101ii01d-ct";
+		power-supply = <&vcc_5v0>;
 		backlight = <&lcd_bl>;
 		enable-gpios = <&pca9555 8 GPIO_ACTIVE_HIGH>;
 		port {
-- 
2.39.2

