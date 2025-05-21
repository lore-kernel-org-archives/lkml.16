Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C3233738;
	Wed, 21 May 2025 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811068; cv=none; b=k3k77mmvmpqNrdfl0xnvejdmlPPlyRBV/LghhKhYhxCfYcab84MbWDO5WASiIXnTKIYo53zJi/K0yGjGVBev4pjFPN8fgYzYa85bEywvScACgWKBypCoXDtSnwpQzILEgrV0qxAbS5pQp308jDoGfqiV8PX+TCQq+Y+mifD8YKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811068; c=relaxed/simple;
	bh=Iv5T9qJGjAuYhEOrek8F9qUC06vafgVKFIQs02HNtUo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L11XpF2IpyWqR/08cnmJzlnzUBjEQEjuO9jWQEWjJrXsuHlijgXx6DvsO3ZGB1Q2Z8EWRokgbDpb9j7y8YkT6e9r/6CR7dKBC9Hd2Qk6GE8aYxvA3NWVHUG/sqVDbsjusYYfNlAIQPKYHn4/48rJG6hMk9au4yZSRIRpVQKvIoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=SMRTIU4T; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SMRTIU4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747811067; x=1779347067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iv5T9qJGjAuYhEOrek8F9qUC06vafgVKFIQs02HNtUo=;
  b=SMRTIU4TloJqvgfOz0RwlYAd+hz57gl7iSdsnreMl7gDwr5Gk8WR5U8T
   xD+bQF/ggoDzjDFhI93z5Ckb2g9A3r+PFC7YHCT8guEM9JSdiqg92Yfky
   EIe/bRQI5KM0z/DHWiUVrMBke9vyx8wE+C8yOaecb9sLeD8S+I/+/X76W
   ihGvOrFfydyZCkEMU+wz5stFjKoM01zC8UWzGBLikqRd209Qw+nuFZnHH
   8sUtnmdGLCxD+R6PUBvi8Q541A6K718EC1yKTpeSchqaJqebwWyIcUp4p
   vfuY9HQ16BokDlcHeAQQqS3JJ/fLLro5PLEjeekeEqGkEjDhZkUNH6xSE
   w==;
X-CSE-ConnectionGUID: FbsnMwfxQ/m/aHhgRKMOWQ==
X-CSE-MsgGUID: ZgkLjbi9R16/ingWuhQZ9g==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41888230"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 May 2025 00:04:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 21 May 2025 00:04:16 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 21 May 2025 00:04:09 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add nvmem-layout in QSPI for EUI48 MAC Address
Date: Wed, 21 May 2025 12:33:36 +0530
Message-ID: <20250521070336.402202-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521070336.402202-1-manikandan.m@microchip.com>
References: <20250521070336.402202-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add nvmem-layout in QSPI to read the EUI48 Mac address by the
net drivers using the nvmem property.The offset is set to 0x0
since the factory programmed address is available in the
resource managed space and the size determine if the requested
address is of EUI48 (0x6) or EUI-64 (0x8) type.
This is useful for cases where U-Boot is skipped and the Ethernet
MAC address is needed to be configured by the kernel

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index b34c5072425a..be06df1b7d66 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -210,6 +210,9 @@ &macb0 {
 	#size-cells = <0>;
 	phy-mode = "rmii";
 
+	nvmem-cells = <&mac_address_eui48>;
+	nvmem-cell-names = "mac-address";
+
 	ethernet-phy@0 {
 		reg = <0x0>;
 		interrupt-parent = <&pioA>;
@@ -238,6 +241,16 @@ qspi1_flash: flash@0 {
 		m25p,fast-read;
 		status = "disabled";
 
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_address_eui48: mac-address@0 {
+				reg = <0x0 0x6>;
+			};
+		};
+
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
-- 
2.25.1

