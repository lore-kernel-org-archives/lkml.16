Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D0275114;
	Tue, 29 Apr 2025 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909216; cv=none; b=ssGcA79vvyCXEPPAkHziIPKh3nwu/XfMKEKRvEXPN5HqPbP379ypc6uYbEtuqLRmvpRdUmuED0JA4pS7c0Fp47ku8QKr2JmyBgiBGbcJSkNcb1srhkuj7UEDg4oU9V/SoC3meiZTDgMOSofL5X7eZ/sDJwp9IvizkWGxdslQ3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909216; c=relaxed/simple;
	bh=ieiXV0ThKdfuBnVXzi3wa16gcjZ8T7wrdtl4EAofTag=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rbMp8mBdlMyuGLKJdPBE0yQy7qUl7DdLmt9CBkdFKqwd8QpACJ4RalM+juIKU+8eew2x6eCtyNlfuVgysEYa91LIsR7vOOG8OkIDi8kbtI4VsCmU24YIPpD0AT2fgfsW7HF4leQvtjBM6BCXomjcO8Gqv4TwPcvuhox8gclruzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=GB8a2NwD; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GB8a2NwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1745909215; x=1777445215;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ieiXV0ThKdfuBnVXzi3wa16gcjZ8T7wrdtl4EAofTag=;
  b=GB8a2NwDvJM/kCz7g1NcXPLbO5J1e4mhkafGrOFH5IW2Kz9LcUJjSbib
   Jdz/tVSzTZxpuqj7VcHib2mxzuxoGqu1GM3cQr7bd8PDuUQ/M0MzqiR4g
   WxSuibQmwvieI30eTvOXUac8HAWsgtYnm4UsD0K7lTsHQYpEK57OXBc3y
   mn1tJkOKqG9FvH+3glyoxI2304nvZxXC8TMAOpOoqPDZCzrPymd2wLqAq
   LASQEXEyd5ys/jNvx2SFymBJhKFDxNIWug3k00veAlmdLmVLMgtJIh942
   IcigejfA2y2xlcJ+nau0f5SxY/tdYAIEDiN8uPnIpHwsgo6FaKIYG001g
   w==;
X-CSE-ConnectionGUID: webqCOvUQk+OxUCosxyWJQ==
X-CSE-MsgGUID: kiPcj2hiQICAXrUgF+n1kw==
X-IronPort-AV: E=Sophos;i="6.15,248,1739862000"; 
   d="scan'208";a="272370086"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Apr 2025 23:46:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 23:46:07 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 28 Apr 2025 23:46:05 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash
Date: Tue, 29 Apr 2025 09:45:47 +0300
Message-ID: <20250429064547.5807-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add fixed-partitions for spi-nor flash to match the at91 boot flow
and layout of the nand flash.
Partitions can be listed from /proc/mtd:

[root@sama7g54 ~]$ cat /proc/mtd | grep qspi
mtd6: 00040000 00001000 "qspi1: at91bootstrap"
mtd7: 00100000 00001000 "qspi1: u-boot"
mtd8: 00040000 00001000 "qspi1: u-boot env"
mtd9: 00080000 00001000 "qspi1: device tree"
mtd10: 00600000 00001000 "qspi1: kernel"

[root@sama7g54 ~]$ mtdinfo /dev/mtd10
mtd10
Name:                           qspi1: kernel
Type:                           nor
Eraseblock size:                4096 bytes, 4.0 KiB
Amount of eraseblocks:          1536 (6291456 bytes, 6.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:20
Bad blocks are allowed:         false
Device is writable:             true

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 .../dts/microchip/at91-sama7g54_curiosity.dts | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
index 2dec2218f32c..eb5f27ce1942 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
@@ -369,6 +369,38 @@ flash@0 {
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
+		label = "at91-qspi";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			at91bootstrap@0 {
+				label = "qspi1: at91bootstrap";
+				reg = <0x0 0x40000>;
+			};
+
+			bootloader@40000 {
+				label = "qspi1: u-boot";
+				reg = <0x40000 0x100000>;
+			};
+
+			bootloaderenv@140000 {
+				label = "qspi1: u-boot env";
+				reg = <0x140000 0x40000>;
+			};
+
+			dtb@180000 {
+				label = "qspi1: device tree";
+				reg = <0x180000 0x80000>;
+			};
+
+			kernel@200000 {
+				label = "qspi1: kernel";
+				reg = <0x200000 0x600000>;
+			};
+		};
 	};
 };
 

base-commit: ca91b9500108d4cf083a635c2e11c884d5dd20ea
-- 
2.49.0

