Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5832192F3;
	Sat,  7 Jun 2025 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331526; cv=none; b=JrhgF7y7Yo5xYRLIGerbXa89fZ9hiHkJu3wZ2TxeFUP7H0zgleLZGhntyNerpPvYqd1qVqbZRLS/1zTckLX7SbPAaJe2ceyinil/n3veyCcKqeWmsCiXhn2c95UhABeQ/MTvDIhdFOkr0pw4DlVAoeVfIaE6ugKYx1W320ryZjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331526; c=relaxed/simple;
	bh=ea5qHAZuGW1xZWYr28L6Te4D1gCaDMmRu4ewn8DvuFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCl1KP6PSDclpc/YLrGDDfOVg56++6CCPertkjRzyytR9BWyxst/RhWpElTNshrPdURKZPEAT4G4k83MRnvxRukEqNlArPTWWAm9FQpX2yxRDvnYulYHRssjKs+14McD9B4W+BEHPLPFVwq66iQmyZUjirHAmzJO5PLeUN7ba0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ql4/wObD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ql4/wObD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E353AC4CEF0;
	Sat,  7 Jun 2025 21:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331526;
	bh=ea5qHAZuGW1xZWYr28L6Te4D1gCaDMmRu4ewn8DvuFY=;
	h=From:To:Cc:Subject:Date:From;
	b=ql4/wObDTEORzkHj/UTH276EqnroWJzooq5a7dKJe10eWXzvtGR8Q3Mx+SR/tOu8Z
	 XRbZRFW6zrU2rSLNbbKpHBbn51RMz2udNOXO5ANvJAQq/IpIB8dSpFD93jLihih09Z
	 Z8hPCCsKtbOrXLnXGth+XbEMFOtpI2NKLL/oxbBkVHNPf+iF3MnNr6IWOnDgUVJG7x
	 GV8ZDyVbtCYENKkEaSzopK1rZ9F3D3KXR5Q5aTR4mlKBrkE9RDCjoqujlcTzKjZShh
	 vsYefLGHTUO2RDj9YaEfCF0O4qNNOTC4l8NGB0NNi0RHCCIewAaayy1n444vd/NknP
	 LiXI9M9iBugFQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert hisilicon,hi6220-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:23 -0500
Message-ID: <20250607212524.741770-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the HiSilicon HI6220 USB PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../phy/hisilicon,hi6220-usb-phy.yaml         | 35 +++++++++++++++++++
 .../bindings/phy/phy-hi6220-usb.txt           | 16 ---------
 2 files changed, 35 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/hisilicon,hi6220-usb-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-hi6220-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/hisilicon,hi6220-usb-phy.yaml b/Documentation/devicetree/bindings/phy/hisilicon,hi6220-usb-phy.yaml
new file mode 100644
index 000000000000..376586a666e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/hisilicon,hi6220-usb-phy.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/hisilicon,hi6220-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon hi6220 USB PHY
+
+maintainers:
+  - Zhangfei Gao <zhangfei.gao@linaro.org>
+
+properties:
+  compatible:
+    const: hisilicon,hi6220-usb-phy
+
+  '#phy-cells':
+    const: 0
+
+  phy-supply:
+    description: PHY power supply.
+
+  hisilicon,peripheral-syscon:
+    description: Phandle to the system controller for PHY control.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+additionalProperties: false
+
+examples:
+  - |
+    usbphy {
+        compatible = "hisilicon,hi6220-usb-phy";
+        #phy-cells = <0>;
+        phy-supply = <&fixed_5v_hub>;
+        hisilicon,peripheral-syscon = <&sys_ctrl>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-hi6220-usb.txt b/Documentation/devicetree/bindings/phy/phy-hi6220-usb.txt
deleted file mode 100644
index f17a56e2152f..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-hi6220-usb.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Hisilicon hi6220 usb PHY
------------------------
-
-Required properties:
-- compatible: should be "hisilicon,hi6220-usb-phy"
-- #phy-cells: must be 0
-- hisilicon,peripheral-syscon: phandle of syscon used to control phy.
-Refer to phy/phy-bindings.txt for the generic PHY binding properties
-
-Example:
-	usb_phy: usbphy {
-		compatible = "hisilicon,hi6220-usb-phy";
-		#phy-cells = <0>;
-		phy-supply = <&fixed_5v_hub>;
-		hisilicon,peripheral-syscon = <&sys_ctrl>;
-	};
-- 
2.47.2

