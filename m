Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AE78F39;
	Mon, 30 Jun 2025 23:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325989; cv=none; b=gqb30z+qbmfGay/UOLfUSAiMuG5VJ9IMOMw5Y83cPLF2yzt9UhsBehpBVoCma56JLNk6zT+an2Y3AxiSXX6GEXarJthVHGORMZ+V7Xdcr7nS1bpUDFCXCTKfAtVu9skqxfXSqJtIdJ4u5U9unqFITTngDUBQrWi1uyuKl1kArO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325989; c=relaxed/simple;
	bh=r7l16qxoQde34/V6her8DiDbe84BtySI1PaHWtA28ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqPhgKPi2fx6gdne9M/5xr8fCCDlSkuCaeD8LObJDoljK0d4Op3G43YwgVhOfMESjxLfEXBuUbIMk24YA4uGcwNppnQbSoZxELNxAJ7mEKNkOlS6YcToK5CGw4ECZ3KLZVDz2mcVK02V5hrJ77fSA7vf4PxcCg7IhkjtYwVVw7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6FaGLIg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6FaGLIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8535C4CEE3;
	Mon, 30 Jun 2025 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751325988;
	bh=r7l16qxoQde34/V6her8DiDbe84BtySI1PaHWtA28ik=;
	h=From:To:Cc:Subject:Date:From;
	b=Q6FaGLIgRDLiwSvVn5IGJZqw2uXEwyTv8bp215ht2NSQQ65sV+yQ2wdQw39N6OQIZ
	 aV9zY5Gh+HIK4JOjArqV9itHyj6kpw8FNBLR+WMjYK5Z5+zZkLV+l3EzVA859HxBUh
	 mIGE9kzXCc/t+KMS9h2F5QDjyN9R6Dym40FIx0a/rOL7ZCg2iREUv1KRnnM5YTGzW+
	 7tlnzimsnTdBIZ1IXTGX8kb8+eC1jCKlpO/v1k5Q9w3rfRmpVBkHdedkXSz8JKFRNu
	 Vhr+aPR0WPnCzfnIufhMQtRCZ/ZskRoKLxtf5jlpm12uu3pnnOSuFiN22Ib9LyWeg0
	 b+EZNuoUaHnYQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert qca,ath79-pll to DT schema
Date: Mon, 30 Jun 2025 18:26:24 -0500
Message-ID: <20250630232625.3700213-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/qca,ath79-pll.txt          | 33 ---------
 .../bindings/clock/qca,ath79-pll.yaml         | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qca,ath79-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt b/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
deleted file mode 100644
index 241fb0545b9e..000000000000
--- a/Documentation/devicetree/bindings/clock/qca,ath79-pll.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Binding for Qualcomm Atheros AR7xxx/AR9XXX PLL controller
-
-The PPL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
-
-Required Properties:
-- compatible: has to be "qca,<soctype>-pll" and one of the following
-  fallbacks:
-  - "qca,ar7100-pll"
-  - "qca,ar7240-pll"
-  - "qca,ar9130-pll"
-  - "qca,ar9330-pll"
-  - "qca,ar9340-pll"
-  - "qca,qca9550-pll"
-- reg: Base address and size of the controllers memory area
-- clock-names: Name of the input clock, has to be "ref"
-- clocks: phandle of the external reference clock
-- #clock-cells: has to be one
-
-Optional properties:
-- clock-output-names: should be "cpu", "ddr", "ahb"
-
-Example:
-
-	pll-controller@18050000 {
-		compatible = "qca,ar9132-pll", "qca,ar9130-pll";
-		reg = <0x18050000 0x20>;
-
-		clock-names = "ref";
-		clocks = <&extosc>;
-
-		#clock-cells = <1>;
-		clock-output-names = "cpu", "ddr", "ahb";
-	};
diff --git a/Documentation/devicetree/bindings/clock/qca,ath79-pll.yaml b/Documentation/devicetree/bindings/clock/qca,ath79-pll.yaml
new file mode 100644
index 000000000000..69863e8a4648
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qca,ath79-pll.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qca,ath79-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Atheros ATH79 PLL controller
+
+maintainers:
+  - Alban Bedel <albeu@free.fr>
+  - Antony Pavlov <antonynpavlov@gmail.com>
+
+description: >
+  The PLL controller provides the 3 main clocks of the SoC: CPU, DDR and AHB.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qca,ar9132-pll
+          - const: qca,ar9130-pll
+      - items:
+          - enum:
+              - qca,ar7100-pll
+              - qca,ar7240-pll
+              - qca,ar9130-pll
+              - qca,ar9330-pll
+              - qca,ar9340-pll
+              - qca,qca9530-pll
+              - qca,qca9550-pll
+              - qca,qca9560-pll
+
+  reg:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ref
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clock-output-names:
+    items:
+      - const: cpu
+      - const: ddr
+      - const: ahb
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@18050000 {
+        compatible = "qca,ar9132-pll", "qca,ar9130-pll";
+        reg = <0x18050000 0x20>;
+        clock-names = "ref";
+        clocks = <&extosc>;
+        #clock-cells = <1>;
+        clock-output-names = "cpu", "ddr", "ahb";
+    };
-- 
2.47.2

