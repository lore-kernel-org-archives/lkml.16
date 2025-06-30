Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C42E9EA3;
	Mon, 30 Jun 2025 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326027; cv=none; b=kt6LUQAeWArkIixexQdnKLAN5X4aERRQqdU/aFnY8i6LhXlEgD8KPqeb+0emC0OB/wmWMJSaF7PHC/s4nL8jOmbdAxx5aixYUV2AzkcxbfM9B/xla4IA7XVUpSp2oAD9haca4edUuzK3hJETbjb02Ft1R2LezfXwk3xpdhZEwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326027; c=relaxed/simple;
	bh=KZZob1ziys11up+TERSy8DmK6bVQ82VouoWjvFI+MaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tyuVfOwqj39wqN+H3FZqKwp5B69QKKNMloqb3AfYreWEoduGlv0gp5khUbAjHgIht/Aq62N4amHjl1ofmI0YNblpm8Z2oHCeQ9P0BJMd6rEfUOIvo07s8R5HFgxCJFoOgONA/OWlhqbIxbw+26CsjIZJkD+13prHCcT5OWAmDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5/JIP5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5/JIP5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34086C4CEE3;
	Mon, 30 Jun 2025 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751326026;
	bh=KZZob1ziys11up+TERSy8DmK6bVQ82VouoWjvFI+MaM=;
	h=From:To:Cc:Subject:Date:From;
	b=D5/JIP5Eu0VhLKUHmDKQH+7FCS5H5+YTKoysCJqTYc4/ZDq3TkytfKLpB91PTi0hg
	 KPmvJGztTTjs0YOehFRQMXDK59ULEUT0iH0EnkLNMAu6q1x7cQDDOQQwUsi4FdcmNN
	 ILmSz3KMqnYsN4Thr5a/DVc6/+a7vVwZaJdA3JHCB2SJQrqB6ibGgN3ijC3WGf8uoY
	 rgvRYm2cqFLAJ94LzfekRcnEcVs92SSaZFl1FocuJT9ohwYC24z8IdzJhwFOxAzEDS
	 1Yyaxj5FjN0v+Kbs49tefL56CepqKt4wNG8pCQI6TCs/k8rZWdy17UEwuGVIWQ/VXl
	 F/IYf5XxUaZKA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Mack <daniel@zonque.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert maxim,max9485 to DT schema
Date: Mon, 30 Jun 2025 18:26:57 -0500
Message-ID: <20250630232658.3701225-1-robh@kernel.org>
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
 .../bindings/clock/maxim,max9485.txt          | 59 -------------
 .../bindings/clock/maxim,max9485.yaml         | 82 +++++++++++++++++++
 2 files changed, 82 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.yaml

diff --git a/Documentation/devicetree/bindings/clock/maxim,max9485.txt b/Documentation/devicetree/bindings/clock/maxim,max9485.txt
deleted file mode 100644
index b8f5c3bbf12b..000000000000
--- a/Documentation/devicetree/bindings/clock/maxim,max9485.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Devicetree bindings for Maxim MAX9485 Programmable Audio Clock Generator
-
-This device exposes 4 clocks in total:
-
-- MAX9485_MCLKOUT: 	A gated, buffered output of the input clock of 27 MHz
-- MAX9485_CLKOUT:	A PLL that can be configured to 16 different discrete
-			frequencies
-- MAX9485_CLKOUT[1,2]:	Two gated outputs for MAX9485_CLKOUT
-
-MAX9485_CLKOUT[1,2] are children of MAX9485_CLKOUT which upchain all rate set
-requests.
-
-Required properties:
-- compatible:	"maxim,max9485"
-- clocks:	Input clock, must provide 27.000 MHz
-- clock-names:	Must be set to "xclk"
-- #clock-cells: From common clock binding; shall be set to 1
-
-Optional properties:
-- reset-gpios:		GPIO descriptor connected to the #RESET input pin
-- vdd-supply:		A regulator node for Vdd
-- clock-output-names:	Name of output clocks, as defined in common clock
-			bindings
-
-If not explicitly set, the output names are "mclkout", "clkout", "clkout1"
-and "clkout2".
-
-Clocks are defined as preprocessor macros in the dt-binding header.
-
-Example:
-
-	#include <dt-bindings/clock/maxim,max9485.h>
-
-	xo-27mhz: xo-27mhz {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <27000000>;
-	};
-
-	&i2c0 {
-		max9485: audio-clock@63 {
-			reg = <0x63>;
-			compatible = "maxim,max9485";
-			clock-names = "xclk";
-			clocks = <&xo-27mhz>;
-			reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
-			vdd-supply = <&3v3-reg>;
-			#clock-cells = <1>;
-		};
-	};
-
-	// Clock consumer node
-
-	foo@0 {
-		compatible = "bar,foo";
-		/* ... */
-		clock-names = "foo-input-clk";
-		clocks = <&max9485 MAX9485_CLKOUT1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/maxim,max9485.yaml b/Documentation/devicetree/bindings/clock/maxim,max9485.yaml
new file mode 100644
index 000000000000..f9d8941c7235
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/maxim,max9485.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/maxim,max9485.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX9485 Programmable Audio Clock Generator
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: >
+  Maxim MAX9485 Programmable Audio Clock Generator exposes 4 clocks in total:
+
+    - MAX9485_MCLKOUT:  A gated, buffered output of the input clock of 27 MHz
+    - MAX9485_CLKOUT:   A PLL that can be configured to 16 different discrete
+                        frequencies
+    - MAX9485_CLKOUT[1,2]:  Two gated outputs for MAX9485_CLKOUT
+
+  MAX9485_CLKOUT[1,2] are children of MAX9485_CLKOUT which upchain all rate set
+  requests.
+
+properties:
+  compatible:
+    const: maxim,max9485
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock. Must provide 27 MHz
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xclk
+
+  '#clock-cells':
+    const: 1
+
+  reset-gpios:
+    description: >
+      GPIO descriptor connected to the #RESET input pin
+
+  vdd-supply:
+    description: A regulator node for Vdd
+
+  clock-output-names:
+    description: Name of output clocks, as defined in common clock bindings
+    items:
+      - const: mclkout
+      - const: clkout
+      - const: clkout1
+      - const: clkout2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-controller@63 {
+            compatible = "maxim,max9485";
+            reg = <0x63>;
+            #clock-cells = <1>;
+            clock-names = "xclk";
+            clocks = <&xo_27mhz>;
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+            vdd-supply = <&reg_3v3>;
+        };
+    };
-- 
2.47.2

