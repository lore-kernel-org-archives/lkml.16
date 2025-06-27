Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4DE2512DD;
	Fri, 27 Jun 2025 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751061692; cv=none; b=WT4ypsg+GiH5G48npIqjYtVC56w/2DNFLej9UVt4NkRc17wJkNTfOIaLBj3p6VmGZzda9Xj3OVg4oS8R8UYj0cAVTCMPFBfjFdOKbCplICFOw9pOvY3oQNqEdF9f7NsBK4a1kIX7ZFV0ePxKIkcg0SJqfAEEbdqKS8oEj2XVkxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751061692; c=relaxed/simple;
	bh=eB+1TBWueBXeFaf0WArLJ2C0zNUBtvNTmMb+w3Q/IcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cu36HOi3lIRqJPawO9qsuaxv3W0B4fPsvEXdS28il06e8ESrDmZdH7S7duCkqSbWyGHy/pzHEyEerxqiMBSXg40oK5oazzZ8NRxURrnkueCkEKainvpkzfyhqxtjicPTFyzom/gYucgs+cJhhufWGQ/2vB3VkxTYyXAmHZHr18Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yjj77pvC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yjj77pvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D49FC4CEE3;
	Fri, 27 Jun 2025 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751061691;
	bh=eB+1TBWueBXeFaf0WArLJ2C0zNUBtvNTmMb+w3Q/IcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Yjj77pvCtBCAgEoimi/bPHlVFa93PfBC+FasYZ+gtRlSoctqCZQh6NEym5xvEnFnA
	 jmDivoMnt6Vud2K2qwegg+uMIqtz3oBZGpcGmqAQ2B2uOoanJJJeaMu5wztObNwpC4
	 VRW60EDmeSIosHlOE6dPMrTgYirK0syvr7ZaSrwMnv1zFy7KR9SbXVecxtBCTAG8+k
	 mr+hGMgdaFOTx3lV+5RGiOc5hh8xv2nKBjRwdOH2cqhLToi7Y0uUaWUrh0CpOjF8AV
	 s6OEw+Z3pRGs5XyLVdx9lvxo4ivFM5wzt3Th+TxWaD4RBxVWOZVhShw2COIkFYEWqV
	 MPAIQ01dU1o1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT schema
Date: Fri, 27 Jun 2025 17:01:25 -0500
Message-ID: <20250627220126.214577-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Broadcom Stingray USB PHY binding to DT schema format. It's
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Fix maintainers to Scott and Ray
---
 .../bindings/phy/brcm,sr-usb-combo-phy.yaml   | 65 +++++++++++++++++++
 .../bindings/phy/brcm,stingray-usb-phy.txt    | 32 ---------
 2 files changed, 65 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
new file mode 100644
index 000000000000..6224ba0f2990
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/brcm,sr-usb-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Stingray USB PHY
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+properties:
+  compatible:
+    enum:
+      - brcm,sr-usb-combo-phy
+      - brcm,sr-usb-hs-phy
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    description: PHY cell count indicating PHY type
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,sr-usb-combo-phy
+    then:
+      properties:
+        '#phy-cells':
+          const: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,sr-usb-hs-phy
+    then:
+      properties:
+        '#phy-cells':
+          const: 0
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@0 {
+        compatible = "brcm,sr-usb-combo-phy";
+        reg = <0x00000000 0x100>;
+        #phy-cells = <1>;
+    };
+  - |
+    usb-phy@20000 {
+        compatible = "brcm,sr-usb-hs-phy";
+        reg = <0x00020000 0x100>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
deleted file mode 100644
index 4ba298966af9..000000000000
--- a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Broadcom Stingray USB PHY
-
-Required properties:
- - compatible : should be one of the listed compatibles
-	- "brcm,sr-usb-combo-phy" is combo PHY has two PHYs, one SS and one HS.
-	- "brcm,sr-usb-hs-phy" is a single HS PHY.
- - reg: offset and length of the PHY blocks registers
- - #phy-cells:
-   - Must be 1 for brcm,sr-usb-combo-phy as it expects one argument to indicate
-     the PHY number of two PHYs. 0 for HS PHY and 1 for SS PHY.
-   - Must be 0 for brcm,sr-usb-hs-phy.
-
-Refer to phy/phy-bindings.txt for the generic PHY binding properties
-
-Example:
-	usbphy0: usb-phy@0 {
-		compatible = "brcm,sr-usb-combo-phy";
-		reg = <0x00000000 0x100>;
-		#phy-cells = <1>;
-	};
-
-	usbphy1: usb-phy@10000 {
-		compatible = "brcm,sr-usb-combo-phy";
-		reg = <0x00010000 0x100>,
-		#phy-cells = <1>;
-	};
-
-	usbphy2: usb-phy@20000 {
-		compatible = "brcm,sr-usb-hs-phy";
-		reg = <0x00020000 0x100>,
-		#phy-cells = <0>;
-	};
-- 
2.47.2

