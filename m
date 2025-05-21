Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7701E4A4;
	Wed, 21 May 2025 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788403; cv=none; b=dz231Sgkw5YgUF8Ztc2BaVtwbAMSuPNq7dSbn4VVELo4rr/7laXA8oL7m2rnV7yzuPjvMOFYIXoosYMH7O9FSYl40ulFE59SXOnbFG7ib5zHut6xYUpZBga2RS6CYFVY9edhxrlZoTNYSjx+TokE8ae7wxM9bQ6YJ6cLDALitc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788403; c=relaxed/simple;
	bh=vnlgX4Fwf1dP5efupjAMD1twhvn6zgt6TRt7GMaEvWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gFSwn8a+zDjHuKWepfUUXcNErW7mUGRvoIOIJ/A/CbmvIVFvcGa2CjgBnpwJihZJfQQksMxHT8yl7wDD6U0Rx0QRyneCXDBLhapo+G0zHNrBbNpiSndf0SB3kgH/s5XrQIKJ02HaAE1G7/Xcy7E9fspYSAGw7IyMmKNPxCAumAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJC2jm9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJC2jm9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1175C4CEE9;
	Wed, 21 May 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788403;
	bh=vnlgX4Fwf1dP5efupjAMD1twhvn6zgt6TRt7GMaEvWc=;
	h=From:To:Cc:Subject:Date:From;
	b=IJC2jm9Wiy11/yKzj6dECpwxEMCMxuv0gZMVjJK4ooKxKs8m9DVgoNRnXYLcfxMtm
	 CA1IVDkVUqfhS46b8YYOuWsZyqgY4CAQGX6c7nfxuN+eNo7Ri50xwbn3gd0L5QBN/q
	 /YEXkIKeAH/Id9PL0DS3g91aO3SERGb44qoKCYw9ndo2hLMCtXl/y2QtwN1PFdNNNM
	 mLu7Njm5aHbstGpLWa5fk3PDHb+0XmVK0xQCQRJoHoFGPihNgPY95Y9hQfArL/A0Ga
	 ZudxbJpFmnWQetoO2lYo0Lh3sQBkpIc2yHsnb2q2bvvoGzV29FVax6J2e4xIAukOkP
	 7xeiyiNrXlztw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-aux to DT schema
Date: Tue, 20 May 2025 19:46:33 -0500
Message-ID: <20250521004634.1792167-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Broadcom BCM2835 auxiliary peripheral clock binding to DT
schema format. It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/brcm,bcm2835-aux-clock.txt | 31 ------------
 .../bindings/clock/brcm,bcm2835-aux.yaml      | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
deleted file mode 100644
index 4acfc8f641b6..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Broadcom BCM2835 auxiliary peripheral support
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The auxiliary peripherals (UART, SPI1, and SPI2) have a small register
-area controlling clock gating to the peripherals, and providing an IRQ
-status register.
-
-Required properties:
-- compatible:	Should be "brcm,bcm2835-aux"
-- #clock-cells:	Should be <1>. The permitted clock-specifier values can be
-		  found in include/dt-bindings/clock/bcm2835-aux.h
-- reg:		Specifies base physical address and size of the registers
-- clocks:	The parent clock phandle
-
-Example:
-
-	clocks: cprman@7e101000 {
-		compatible = "brcm,bcm2835-cprman";
-		#clock-cells = <1>;
-		reg = <0x7e101000 0x2000>;
-		clocks = <&clk_osc>;
-	};
-
-	aux: aux@7e215004 {
-		compatible = "brcm,bcm2835-aux";
-		#clock-cells = <1>;
-		reg = <0x7e215000 0x8>;
-		clocks = <&clocks BCM2835_CLOCK_VPU>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml
new file mode 100644
index 000000000000..cfe4e791bbed
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-aux.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm2835-aux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 auxiliary peripheral support
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description:
+  The auxiliary peripherals (UART, SPI1, and SPI2) have a small register area
+  controlling clock gating to the peripherals, and providing an IRQ status
+  register.
+
+properties:
+  compatible:
+    const: brcm,bcm2835-aux
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+
+    clock-controller@7e215004 {
+        compatible = "brcm,bcm2835-aux";
+        reg = <0x7e215000 0x8>;
+        #clock-cells = <1>;
+        clocks = <&clocks BCM2835_CLOCK_VPU>;
+    };
-- 
2.47.2

