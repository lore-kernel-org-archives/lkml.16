Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973DB1EA7F4;
	Sat,  7 Jun 2025 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331513; cv=none; b=R0lilapFdQiHJ0ymmD9IZrEvGlj1YZwYKVzbNs8vXFP0bJO8NQJkkVFsWzOI1J2rFg3ubATOtdWi/QXmT1FfHykXDu/5AMwCIzrFBBUfwCFvfvNlZwUdIrBcXTybIbu+/ltxf9FL7cAVJNYD1TGQvXlQDdW6w4T8DC46zYhn1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331513; c=relaxed/simple;
	bh=qx2zwBcl3wNpob4mAq9+wFt2npdqpRCKjBcRH1CJvIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ryvtQtWAQjqQ8JWrCTbs3ORINapqPIJbhWM1y8RCo+YWvw618E2BW0mr0MNAmcNUmJZEV/u5FaT4lxEfn2QElSnqJvvFF9OI5NGp7g0mXXwxGQtZmM12T5WCXjAIKED9iIkO08Yd6VOeqXZq5SwSrmPAQAFZZUDwMeKBosRRMFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPhiHrbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPhiHrbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F46C4CEE4;
	Sat,  7 Jun 2025 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331513;
	bh=qx2zwBcl3wNpob4mAq9+wFt2npdqpRCKjBcRH1CJvIA=;
	h=From:To:Cc:Subject:Date:From;
	b=IPhiHrbH5f8+A5NmvaBnF/m7CUnZogDiCEHj3to5pHvZ4G0bABPm3a4zVBwHosSv5
	 JtSCG1UbWjhWxWbYRfagN+KJFNN3sOu/JOMHB/UJ0Pe7VZOkZCln0VlIH5c8LKvD1S
	 PCyPezXgfuTtyj3QEwj3rPRQZqJA/bxBZEFvxRvUsQySO0whZkkqacWwbYQ7n6NYjg
	 zCdE3LoOyxidwqS2aWVBLFDzjrgvQkJxBgWmrrFJcVW5KAg6wMyZdgxdEQf1gWvRau
	 p4Qw3CO4uPqio7q3RpCQdDH+LrL498gaaS2kuFDHEEHDtIHpj3Sm0fVGEe6CS9R7jA
	 Bquw7I1HhMVJA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <ray.jui@broadcom.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert brcm,sr-pcie-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:07 -0500
Message-ID: <20250607212508.741193-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Broadcom Stingray PCIe PHY binding to DT schema format. It's
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/brcm,sr-pcie-phy.txt         | 41 -----------------
 .../bindings/phy/brcm,sr-pcie-phy.yaml        | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
deleted file mode 100644
index e8d82286beb9..000000000000
--- a/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Broadcom Stingray PCIe PHY
-
-Required properties:
-- compatible: must be "brcm,sr-pcie-phy"
-- reg: base address and length of the PCIe SS register space
-- brcm,sr-cdru: phandle to the CDRU syscon node
-- brcm,sr-mhb: phandle to the MHB syscon node
-- #phy-cells: Must be 1, denotes the PHY index
-
-For PAXB based root complex, one can have a configuration of up to 8 PHYs
-PHY index goes from 0 to 7
-
-For the internal PAXC based root complex, PHY index is always 8
-
-Example:
-	mhb: syscon@60401000 {
-		compatible = "brcm,sr-mhb", "syscon";
-		reg = <0 0x60401000 0 0x38c>;
-	};
-
-	cdru: syscon@6641d000 {
-		compatible = "brcm,sr-cdru", "syscon";
-		reg = <0 0x6641d000 0 0x400>;
-	};
-
-	pcie_phy: phy@40000000 {
-		compatible = "brcm,sr-pcie-phy";
-		reg = <0 0x40000000 0 0x800>;
-		brcm,sr-cdru = <&cdru>;
-		brcm,sr-mhb = <&mhb>;
-		#phy-cells = <1>;
-	};
-
-	/* users of the PCIe PHY */
-
-	pcie0: pcie@48000000 {
-		...
-		...
-		phys = <&pcie_phy 0>;
-		phy-names = "pcie-phy";
-	};
diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.yaml
new file mode 100644
index 000000000000..60ccc0813ed5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/brcm,sr-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Stingray PCIe PHY
+
+maintainers:
+  - Ray Jui <ray.jui@broadcom.com>
+
+description: >
+  For PAXB based root complex, one can have a configuration of up to 8 PHYs.
+  PHY index goes from 0 to 7.
+
+  For the internal PAXC based root complex, PHY index is always 8.
+
+properties:
+  compatible:
+    const: brcm,sr-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 1
+
+  brcm,sr-cdru:
+    description: phandle to the CDRU syscon node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  brcm,sr-mhb:
+    description: phandle to the MHB syscon node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@40000000 {
+        compatible = "brcm,sr-pcie-phy";
+        reg = <0x40000000 0x800>;
+        brcm,sr-cdru = <&cdru>;
+        brcm,sr-mhb = <&mhb>;
+        #phy-cells = <1>;
+    };
-- 
2.47.2

