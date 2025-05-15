Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9035970;
	Thu, 15 May 2025 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305222; cv=none; b=HLWHHwhGXHGNoNU59wGBzH2xtDpikIklGiIyilxYzjNi2qCc5otMS5GLXClLqK97fNsHkrRT9/BFEUF2bINYmuyMII/acMY1l0iME+8yRVkEUXIT1SxMgMe8mnGNwlnjAQ9fG6usriGPZGCvgDZV4ab9HRDaMXdLnCs8v6UbQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305222; c=relaxed/simple;
	bh=jOy+gdB5snTg+AWaYBwU4zrEGtaSgqQCzCFFbsWkaZ4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HDWrW7X7dOCs2SXd2SNsR/yXz0AKkaF0MbDnIVV8TeiRA+2RQYAJqzKvlMSmzWUYBh2fEMGDcOuvorJiuUlBvJbLgPFnu/3gN60xzAHDzwMGYpRBQZbUMPpX93/+AVAdt+JZ7rPjsaVtaXBHCTSXGqtGT69NAkY9gkDv+qoX8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=SK+GnLaa; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SK+GnLaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747305220; x=1778841220;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jOy+gdB5snTg+AWaYBwU4zrEGtaSgqQCzCFFbsWkaZ4=;
  b=SK+GnLaaH07XxhL8iGW5yt/cXtd+Lr8IboOxqctj0X/ujAW5j3gogUrV
   /W5LpNLRVa63MrSfBuNyJhhRwHldp3vnklRqAFNV063ruyhfKJSdc9vbz
   7/lJH8TV2WujghT3bEbpeGQYbCMBOWyLAbHwf8JFN9PCFArP/SqFkRqts
   t/A/tjtCsLNKXekQ3L7gX/2uEMJEgyLCKPlxfw73kWGZO2+NdeiUwmdld
   o6dF4E0y7SMo+mZjQ7FK+1Fl7eG4YhDNU3zfekU8JIdFAmQu9YpZ5PZhF
   FCQ0N/YPezAgVZ5MHB+lVPvDIF4nq3TTxjaTEkfS8xNeSncaDk+jvBKfR
   A==;
X-CSE-ConnectionGUID: YDYKtXNcQOipD744zTQ15A==
X-CSE-MsgGUID: ZMEcAudjRRmAFgfZqoRjuQ==
X-IronPort-AV: E=Sophos;i="6.15,290,1739862000"; 
   d="scan'208";a="209126771"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2025 03:33:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 15 May 2025 03:33:08 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 15 May 2025 03:33:04 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH] ARM: dts: microchip: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
Date: Thu, 15 May 2025 16:02:51 +0530
Message-ID: <20250515103251.210468-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The naming scheme for delay properties includes "delay" in the name,
so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns to keep
that consistent.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts        | 2 +-
 arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi   | 2 +-
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
index cdc56b53299d..c1ff3248bd8f 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
@@ -609,7 +609,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
index 8ac85dac5a96..13c28e92b17e 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
@@ -44,7 +44,7 @@ flash@0 {
 					compatible = "jedec,spi-nor";
 					reg = <0>;
 					spi-max-frequency = <104000000>;
-					spi-cs-setup-ns = <7>;
+					spi-cs-setup-delay-ns = <7>;
 					spi-tx-bus-width = <4>;
 					spi-rx-bus-width = <4>;
 					m25p,fast-read;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b3..9543214adc9f 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		m25p,fast-read;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
index 9fa6f1395aa6..fbae6a9af6c3 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
@@ -714,7 +714,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
-		spi-cs-setup-ns = <7>;
+		spi-cs-setup-delay-ns = <7>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
-- 
2.25.1

