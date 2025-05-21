Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116794431;
	Wed, 21 May 2025 00:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788382; cv=none; b=SkZMAWpt265vMQUFTIRIt0jgBzDb/GohnK0atOIIJhACtdLUghjaWmV4sBcjHBmlFwVg2aOz4bz/6ZDrBiNMICJMZIYkRRwrrF34siayOBJhDkzsfrVe65mNXXCV/P+2X5pjJAF4plTDjJCK+ARAmY+3bCs8pPmjew+BDWqBLg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788382; c=relaxed/simple;
	bh=eT7rCJDedvhYv0LLLXkdAlXMO+mcKNxar1XfdJvSHBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PbZT9p3hhvUHwLOlTqw2HMUaNDyDQMy2Vh6VZUnL1qN5VItqiHd6zoCQffM8VWRrKqJ/i5Tt+S9IGMJ3tg0DYcpWSxi82Br0zHFJvi1rEESnE+Erp6ror0dVxPQ7KQ19/kr8iOIPONTcCJ3dJ9y00osLCPPAO/BgbJo1+hYHzYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=io+pgwBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="io+pgwBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5CAC4CEE9;
	Wed, 21 May 2025 00:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788381;
	bh=eT7rCJDedvhYv0LLLXkdAlXMO+mcKNxar1XfdJvSHBE=;
	h=From:To:Cc:Subject:Date:From;
	b=io+pgwBAImJhUqtsYNgnCSCYazspIutuSJgj/MwZQXnk9pLkl8WLFATx2xEHU7xDT
	 3IWfgxiMLwcgwTEOfH9NLdXJjp2Qv1Qpsghe7R/Fz3dIP99dEUBprJwEs5EiNjtkMz
	 cQZCVg93x0kXT1X3BDTcQyezd/oWuf+r3cw8BlbhyCyKvfXr0fbNQX4vs613rmI19I
	 bPrxtHwX2OgTJ9i9Gm8W1UnJez3SEXGbURvjKmp66QSf40CYhxihqw4kkebPvSNq4k
	 Ubta7tFLsk/e4tGeQ9Bm24oISd1RPWBjHklS3jgByg9rQoVR8Idxc9T6gSmF+dwZ2n
	 Wa2d1cKVlUsXg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert brcm,bcm53573-ilp to DT schema
Date: Tue, 20 May 2025 19:46:15 -0500
Message-ID: <20250521004618.1791669-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Broadcom BCM53573 ILP clock binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/brcm,bcm53573-ilp.txt      | 36 ---------------
 .../bindings/clock/brcm,bcm53573-ilp.yaml     | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
deleted file mode 100644
index 2ebb107331dd..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Broadcom BCM53573 ILP clock
-===========================
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-This binding is used for ILP clock (sometimes referred as "slow clock")
-on Broadcom BCM53573 devices using Cortex-A7 CPU.
-
-ILP's rate has to be calculated on runtime and it depends on ALP clock
-which has to be referenced.
-
-This clock is part of PMU (Power Management Unit), a Broadcom's device
-handing power-related aspects. Its node must be sub-node of the PMU
-device.
-
-Required properties:
-- compatible: "brcm,bcm53573-ilp"
-- clocks: has to reference an ALP clock
-- #clock-cells: should be <0>
-- clock-output-names: from common clock bindings, should contain clock
-		      name
-
-Example:
-
-pmu@18012000 {
-	compatible = "simple-mfd", "syscon";
-	reg = <0x18012000 0x00001000>;
-
-	ilp {
-		compatible = "brcm,bcm53573-ilp";
-		clocks = <&alp>;
-		#clock-cells = <0>;
-		clock-output-names = "ilp";
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml
new file mode 100644
index 000000000000..cd291f428a8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm53573-ilp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM53573 ILP clock
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: >
+  ILP clock (sometimes referred as "slow clock") on Broadcom BCM53573 devices
+  using Cortex-A7 CPU.
+
+  ILP's rate has to be calculated on runtime and it depends on ALP clock which
+  has to be referenced.
+
+  This clock is part of PMU (Power Management Unit), a Broadcom device handling
+  power-related aspects. Its node must be sub-node of the PMU device.
+
+properties:
+  compatible:
+    items:
+      - const: brcm,bcm53573-ilp
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names:
+    items:
+      - const: ilp
+
+additionalProperties: false
+
+examples:
+  - |
+    ilp {
+        compatible = "brcm,bcm53573-ilp";
+        clocks = <&alp>;
+        #clock-cells = <0>;
+        clock-output-names = "ilp";
+    };
-- 
2.47.2

