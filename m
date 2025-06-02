Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5F51A3144;
	Mon,  2 Jun 2025 05:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748842555; cv=none; b=g/jyfzU5oqVF1roiTYSTvNSWIQrmJCvR45OghgQG2zQIVpPNxQhYclB222aaS9G65EIR8Kf9Y/UGGEQtRD9cAqPesIIXYOiELUG+cfO7iYPJYB8vTyJurN2VYZnNjCC1klz2k3hOBG9RVHlOh6XvDOwnSYHmdCA1PYHMiNKw1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748842555; c=relaxed/simple;
	bh=zfXAqBTrTB87RFz2hSScGbQmoo9mMpeMvJVYOho6stI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+djTlqN9FN7R9GyhvN/2V8RWLWzhW1071eSCxMZ89bOIGx0adTFKRYLRm8R4r7L0IdHv3h36Lm0++2TrRp3WmURwpiif6/QGgf5lrSvo8vP9UwjjWMl4Fv0oxdmhoWFNvxxL0JEnR06FR1D2SKUW8MJ1a4E29u5vRZputy6oM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HCDwaD9g; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HCDwaD9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842554; x=1780378554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfXAqBTrTB87RFz2hSScGbQmoo9mMpeMvJVYOho6stI=;
  b=HCDwaD9g9s4R7PKjM5NGfQny1bDVp9QQEiv2i6eXZ77gONqBuMisleB+
   meJmF7N86RQxAMEi+3HDUzxrlb1/wjPaxqyUcuAeWeGhAts2Es59sSQPp
   8rNlGoD3oMLMvKCxNARt63L7B7crNfXRqNOLyEUghPFCZOXYjlFBOL2xh
   A179c4o5Px0z/L5NeKbkQWMFteUXA1r5hf1zAC1dbcNsKhZVVabXF5/kL
   IL3WipT9JTk0LIUp+vgW57RaI8eOqGpZWnTiQ7DunLykkrUZiv17wp60t
   LBQS/Rto1iE/ppyeqzAxG+BQnmPHXQeY7mNhjW3pUIpdk/wAy92XFwm0b
   w==;
X-CSE-ConnectionGUID: 8pkaetzaTf2iFp4Ql+AwUg==
X-CSE-MsgGUID: NuzFr63zRbW0y6GbopYTbQ==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865333"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:35:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:39 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:33 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: mtd: microchip-nand: add atmel pmecc
Date: Mon, 2 Jun 2025 11:05:05 +0530
Message-ID: <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>
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

Add bindings for programmable multibit error correction code controller
(PMECC).

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt    | 61 ------------------
 .../bindings/mtd/microchip,pmecc.yaml         | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index dbbc17a866f2..1934614a9298 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -1,64 +1,3 @@
-* ECC engine (PMECC) bindings:
-
-Required properties:
-- compatible: should be one of the following
-	"atmel,at91sam9g45-pmecc"
-	"atmel,sama5d4-pmecc"
-	"atmel,sama5d2-pmecc"
-	"microchip,sam9x60-pmecc"
-	"microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc"
-- reg: should contain 2 register ranges. The first one is pointing to the PMECC
-       block, and the second one to the PMECC_ERRLOC block.
-
-Example:
-
-	nfc_io: nfc-io@70000000 {
-		compatible = "atmel,sama5d3-nfc-io", "syscon";
-		reg = <0x70000000 0x8000000>;
-	};
-
-	pmecc: ecc-engine@ffffc070 {
-		compatible = "atmel,at91sam9g45-pmecc";
-                reg = <0xffffc070 0x490>,
-                      <0xffffc500 0x100>;
-	};
-
-	ebi: ebi@10000000 {
-		compatible = "atmel,sama5d3-ebi";
-		#address-cells = <2>;
-		#size-cells = <1>;
-		atmel,smc = <&hsmc>;
-		reg = <0x10000000 0x10000000
-		       0x40000000 0x30000000>;
-		ranges = <0x0 0x0 0x10000000 0x10000000
-			  0x1 0x0 0x40000000 0x10000000
-			  0x2 0x0 0x50000000 0x10000000
-			  0x3 0x0 0x60000000 0x10000000>;
-		clocks = <&mck>;
-
-                nand_controller: nand-controller {
-			compatible = "atmel,sama5d3-nand-controller";
-			atmel,nfc-sram = <&nfc_sram>;
-			atmel,nfc-io = <&nfc_io>;
-			ecc-engine = <&pmecc>;
-			#address-cells = <2>;
-			#size-cells = <1>;
-			ranges;
-
-			nand@3 {
-				reg = <0x3 0x0 0x800000>;
-				atmel,rb = <0>;
-
-				/*
-				 * Put generic NAND/MTD properties and
-				 * subnodes here.
-				 */
-			};
-		};
-	};
-
------------------------------------------------------------------------
-
 Deprecated bindings (should not be used in new device trees):
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml b/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
new file mode 100644
index 000000000000..89680a051981
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/microchip,pmecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip pmecc controller
+
+maintainers:
+  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
+
+description:
+  Bindings for microchip Programmable Multibit Error Correction Code
+  Controller (PMECC). pmecc is a programmable BCH encoder/decoder. This
+  block is passed as the value to the "ecc-engine" property of microchip
+  nand flash controller node.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - atmel,at91sam9g45-pmecc
+          - atmel,sama5d2-pmecc
+          - atmel,sama5d4-pmecc
+      - items:
+          - enum:
+              - microchip,sam9x7-pmecc
+              - microchip,sam9x60-pmecc
+          - const: atmel,at91sam9g45-pmecc
+
+  reg:
+    items:
+      - description: PMECC controller registers
+      - description: PMECC_ERRLOC controller
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sam9x7-pmecc
+    then:
+      required:
+        - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ecc-engine@ffffc070 {
+        compatible = "microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc";
+        reg = <0xffffe000 0x300>,
+              <0xffffe600 0x100>;
+        clocks = <&pmc 2 48>;
+    };
-- 
2.34.1

