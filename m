Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F601EA7F4;
	Sat,  7 Jun 2025 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331519; cv=none; b=cGXTXsLpe0ZWuk6wFMsfEvU9TWpEe03272F6yVYKS0NpTgi9vhWDlishq7VVEkVgwPOdN98pU+ib8WNd3q1NyTd+mWzHMpXRFWvOWxQELKHcL5caTzxNSYMghzktNoaI9rKJjIkFOee1JYLC6fbOdvREDjpvKjCVKjdnEpSKGos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331519; c=relaxed/simple;
	bh=hcpRc03uTwCBnX4GqkQF3VToaCPvgvdHxKanP27miCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVhGlwjVODmotggCSAtY5LGD2Nyeu/iVPeBoAUiOh0lgp703POwpPGjaEod9vhOHqp0cbsC10Z4c5EGEn2hG9U55DBDMTw4b7RvEHRrQYcqDms882yo/Cjyh6691U96fZL2Qy4aVCKyGNu+NnETC+csaJvKb5jPSFB7Rw+rrMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rez3EuCu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rez3EuCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4583EC4CEE4;
	Sat,  7 Jun 2025 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331518;
	bh=hcpRc03uTwCBnX4GqkQF3VToaCPvgvdHxKanP27miCY=;
	h=From:To:Cc:Subject:Date:From;
	b=Rez3EuCuw74/jBZ4/e14ICh7TUO7ddULW25b6v3uFyWohcdFSS00Wid9IlId/jmLO
	 wi+BDg7PueAUDFIvgGY7ytIughYtjXCXrsFxqQciPfRNpfOemfp0wqMZokubb32jYX
	 qdd5qhQfCtTa2tWVHrAyfAbcDD5pcvJRtNqjy/lpEobKps7QsZuHzq1Bt2qzQq7NKm
	 LkgmKI47zqM26ASBs1wWhrzdw/e7Mg2/90qz2qIcxser8Wj7c2nMQYqtU3hyGlzuX7
	 H7GoJArUvym4w6CZaRYrRYy18xOZEivvT8Sb+MFyx5aC1cvctJCOK4vBMHAoMlRxNq
	 W4/WlQAFgnrjQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Srinath Mannam <srinath.mannam@broadcom.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:13 -0500
Message-ID: <20250607212515.741397-1-robh@kernel.org>
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
 .../bindings/phy/brcm,sr-usb-combo-phy.yaml   | 64 +++++++++++++++++++
 .../bindings/phy/brcm,stingray-usb-phy.txt    | 32 ----------
 2 files changed, 64 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
new file mode 100644
index 000000000000..b9aeaab02ef3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/brcm,sr-usb-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Stingray USB PHY
+
+maintainers:
+  - Srinath Mannam <srinath.mannam@broadcom.com>
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

