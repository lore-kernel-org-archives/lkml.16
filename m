Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1912CDA5;
	Mon,  2 Jun 2025 05:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748842582; cv=none; b=Vd7JrQIaWNdyMZ9Zt24jhP0WcREjdEqtBPEOYExu0Ceg44aj4bZA6X2dtaU/Ywg0rt6hcEeUp7bNCknANRP9lTTlE2d6vOlK031njfSoRy66A7ll3ziP6F5XUNJky2/aZxv/I86D4+GPXu2X59Q22C/WhOU7karxP6II6g9sOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748842582; c=relaxed/simple;
	bh=3ioeH4uZthb19qLI5wYUgUMeD1rXLddPSxLk4rAXdQs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPnKHz0T4MZMmjucAhSDz258CqrkQCHlbvH3FQbdBrfJAqWBwOToNB/anxatKabQ/53I+wtV/ALImTFViQF9kjWUM3JZrfQye+tN4VupvVImmq+GYNZ5hAvzbEp3aFvNygUKOaIsBbvRWHJ4NiQzydFMtJsEgQgR5DAxMqdI79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=OUkIlmX5; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="OUkIlmX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842580; x=1780378580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ioeH4uZthb19qLI5wYUgUMeD1rXLddPSxLk4rAXdQs=;
  b=OUkIlmX5MU+CvalB5YDpEmqZd159UGmlrxzkueqh2njuocni+s6FB81Y
   +5dWFBl/VVPWaQtXY4eQOH1QC3o/9+m6ZOA0MgBjF5Ra65IlJtf21mbDK
   LWPUaEWyDl1LhMiIG4YHCy3yhw9ZwtUMNhaOtcECNEqkIgzu4KezhC1Dq
   oP1Pr7nf1HC3rxeVuMxnx7+qiGuDGgJ6M4G6JjM7y9DwjZhVYRvcFupL3
   PxvI4EvvBN4zNien3oal1odKMc7wxqA6zSQjP3yeADc9hiSJ/DvAFJCJ/
   40yXeIr/1IxwkCyVrvRmqG2zySFqx2F+O/GaAyyDQBfxu2dbhLVUwfqJa
   A==;
X-CSE-ConnectionGUID: eittDR1XTzS4g4o2E6Cy1A==
X-CSE-MsgGUID: I26Y8WSTRZ6VKcdOtra8SA==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865345"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:36:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:47 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:40 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 3/4] dt-bindings: mtd: atmel-nand: add legacy nand controllers
Date: Mon, 2 Jun 2025 11:05:06 +0530
Message-ID: <20250602053507.25864-4-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support for atmel legacy nand controllers. These bindings should not be
used with the new device trees.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt    | 116 ------------
 .../devicetree/bindings/mtd/atmel-nand.yaml   | 167 ++++++++++++++++++
 2 files changed, 167 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
deleted file mode 100644
index 1934614a9298..000000000000
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ /dev/null
@@ -1,116 +0,0 @@
-Deprecated bindings (should not be used in new device trees):
-
-Required properties:
-- compatible: The possible values are:
-	"atmel,at91rm9200-nand"
-	"atmel,sama5d2-nand"
-	"atmel,sama5d4-nand"
-- reg : should specify localbus address and size used for the chip,
-	and hardware ECC controller if available.
-	If the hardware ECC is PMECC, it should contain address and size for
-	PMECC and PMECC Error Location controller.
-	The PMECC lookup table address and size in ROM is optional. If not
-	specified, driver will build it in runtime.
-- atmel,nand-addr-offset : offset for the address latch.
-- atmel,nand-cmd-offset : offset for the command latch.
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-
-- gpios : specifies the gpio pins to control the NAND device. detect is an
-  optional gpio and may be set to 0 if not present.
-
-Optional properties:
-- atmel,nand-has-dma : boolean to support dma transfer for nand read/write.
-- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
-  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
-  "soft_bch".
-- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
-  capable of BCH encoding and decoding, on devices where it is present.
-- atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
-  Controller. Supported values are: 2, 4, 8, 12, 24. If the compatible string
-  is "atmel,sama5d2-nand", 32 is also valid.
-- atmel,pmecc-sector-size : sector size for ECC computation. Supported values
-  are: 512, 1024.
-- atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM
-  for different sector size. First one is for sector size 512, the next is for
-  sector size 1024. If not specified, driver will build the table in runtime.
-- nand-bus-width : 8 or 16 bus width if not present 8
-- nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
-
-Nand Flash Controller(NFC) is an optional sub-node
-Required properties:
-- compatible : "atmel,sama5d3-nfc".
-- reg : should specify the address and size used for NFC command registers,
-        NFC registers and NFC SRAM. NFC SRAM address and size can be absent
-        if don't want to use it.
-- clocks: phandle to the peripheral clock
-Optional properties:
-- atmel,write-by-sram: boolean to enable NFC write by SRAM.
-
-Examples:
-nand0: nand@40000000,0 {
-	compatible = "atmel,at91rm9200-nand";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	reg = <0x40000000 0x10000000
-	       0xffffe800 0x200
-	      >;
-	atmel,nand-addr-offset = <21>;	/* ale */
-	atmel,nand-cmd-offset = <22>;	/* cle */
-	nand-on-flash-bbt;
-	nand-ecc-mode = "soft";
-	gpios = <&pioC 13 0	/* rdy */
-		 &pioC 14 0 	/* nce */
-		 0		/* cd */
-		>;
-	partition@0 {
-		...
-	};
-};
-
-/* for PMECC supported chips */
-nand0: nand@40000000 {
-	compatible = "atmel,at91rm9200-nand";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	reg = < 0x40000000 0x10000000	/* bus addr & size */
-		0xffffe000 0x00000600	/* PMECC addr & size */
-		0xffffe600 0x00000200	/* PMECC ERRLOC addr & size */
-		0x00100000 0x00100000	/* ROM addr & size */
-		>;
-	atmel,nand-addr-offset = <21>;	/* ale */
-	atmel,nand-cmd-offset = <22>;	/* cle */
-	nand-on-flash-bbt;
-	nand-ecc-mode = "hw";
-	atmel,has-pmecc;	/* enable PMECC */
-	atmel,pmecc-cap = <2>;
-	atmel,pmecc-sector-size = <512>;
-	atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
-	gpios = <&pioD 5 0	/* rdy */
-		 &pioD 4 0	/* nce */
-		 0		/* cd */
-		>;
-	partition@0 {
-		...
-	};
-};
-
-/* for NFC supported chips */
-nand0: nand@40000000 {
-	compatible = "atmel,at91rm9200-nand";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-        ...
-        nfc@70000000 {
-		compatible = "atmel,sama5d3-nfc";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		clocks = <&hsmc_clk>
-		reg = <
-			0x70000000 0x10000000	/* NFC Command Registers */
-			0xffffc000 0x00000070	/* NFC HSMC regs */
-			0x00200000 0x00100000	/* NFC SRAM banks */
-		>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.yaml b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
new file mode 100644
index 000000000000..a437d40a523f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/atmel-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel NAND flash controller
+
+maintainers:
+  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
+
+description:
+  Atmel nand flash controller. These are legacy bindings and
+  deprecated. Find the latest in microchip,nand-controller.yaml
+
+properties:
+  $nodename:
+    pattern: "^nand(@.*)?"
+
+  compatible:
+    enum:
+      - atmel,at91rm9200-nand
+      - atmel,sama5d2-nand
+      - atmel,sama5d4-nand
+
+  reg:
+    description:
+      The localbus address and size used for the chip, and hardware ECC
+      controller if available. If the hardware ECC is PMECC, it should
+      contain address and size for PMECC and PMECC Error Location
+      controller. The PMECC lookup table address and size in ROM is
+      optional. If not specified, driver will build it in runtime.
+
+  nand-on-flash-bbt:
+    description:
+      enable on flash bbt option if not present false
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nand-ecc-mode:
+    description:
+      operation mode of the NAND ecc
+    enum:
+      [none, soft, hw, hw_syndrome, hw_oob_first, soft_bch]
+    default: soft
+    $ref: /schemas/types.yaml#/definitions/string
+
+  nand-bus-width:
+    description:
+      nand bus width
+    enum:
+      [8, 16]
+    default: 8
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  gpios:
+    minItems: 2
+    items:
+      - description: Ready/Busy
+      - description: Chip Enable
+      - description: Optional Card detect GPIO; can be 0 if unused
+
+  atmel,nand-addr-offset:
+    description:
+      offset for the address latch.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+
+  atmel,nand-cmd-offset:
+    description:
+      offset for the command latch.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+
+  atmel,nand-has-dma:
+    description:
+      support dma transfer for nand read/write.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  atmel,has-pmecc:
+    description:
+      enable Programmable Multibit ECC hardware, capable of BCH encoding
+      and decoding, on devices where it is present.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  atmel,pmecc-cap:
+    description:
+      error correct capability for Programmable Multibit ECC Controller.
+    enum:
+      [2, 4, 8, 12, 24, 32]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  atmel,pmecc-sector-size:
+    description:
+      sector size for ECC computation.
+    enum:
+      [512, 1024]
+    default: 512
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+
+  atmel,pmecc-lookup-table-offset:
+    description:
+      Two offsets of lookup table in ROM for different sector size. First
+      one is for sector size 512, the next is for sector size 1024. If not
+      specified, driver will build the table in runtime.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    default: 512
+
+required:
+  - compatible
+  - reg
+  - atmel,nand-addr-offset
+  - atmel,nand-cmd-offset
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand@40000000 {
+        compatible = "atmel,at91rm9200-nand";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0x40000000 0x10000000
+               0xffffe800 0x200>;
+        atmel,nand-addr-offset = <21>;	/* ale */
+        atmel,nand-cmd-offset = <22>;	/* cle */
+        nand-on-flash-bbt;
+        nand-ecc-mode = "soft";
+        gpios = <&pioC 13 0	/* rdy */
+                 &pioC 14 0     /* nce */
+                 0		/* cd */
+                >;
+    };
+  - |
+    /* for PMECC supported chips */
+    nand@40000000 {
+        compatible = "atmel,at91rm9200-nand";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0x40000000 0x10000000	/* bus addr & size */
+               0xffffe000 0x00000600	/* PMECC addr & size */
+               0xffffe600 0x00000200	/* PMECC ERRLOC addr & size */
+               0x00100000 0x00100000>;	/* ROM addr & size */
+
+        atmel,nand-addr-offset = <21>;	/* ale */
+        atmel,nand-cmd-offset = <22>;	/* cle */
+        nand-on-flash-bbt;
+        nand-ecc-mode = "hw";
+        atmel,has-pmecc;	/* enable PMECC */
+        atmel,pmecc-cap = <2>;
+        atmel,pmecc-sector-size = <512>;
+        atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
+        gpios = <&pioD 5 0	/* rdy */
+                 &pioD 4 0	/* nce */
+                 0		/* cd */
+                >;
+    };
-- 
2.34.1

