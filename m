Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B634B1E6D;
	Wed, 21 May 2025 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788391; cv=none; b=AxQDivXwMX0fOkF1VJ8pqKNbaZiUIXSeOArGyKIbn7wkCZeznrZzgsKUc6cFeLciAUsixAWYTY32rHzCOwyXCMikjqEJhHz4odqzEOi6AYzg5oti0HfuQkH9abRZuZVn5FqifA9NbpTZrKI5qErmHRNQvWCFPzoKCk5egL6fBK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788391; c=relaxed/simple;
	bh=6eRPXWYKV5B62KMfC9wBJCSY8UIUCsWL77sMjILQEIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uANr7XRy3o3VSY0gV//oN9q10v/xVlaH3dX3j7+iSQHZ3kJX3pag3uN7fCw7PkBPh4ArBqHAE1K2nM4KmIIITGj484w7k2zLucEMC3iYBV83+SCTGFXXAN37HA8drQfCutFzFt3EhgyMeZn3UuF7A7jyoD+aDnlu7ITrvl6oGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFUMjet/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFUMjet/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7795CC4CEE9;
	Wed, 21 May 2025 00:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788390;
	bh=6eRPXWYKV5B62KMfC9wBJCSY8UIUCsWL77sMjILQEIY=;
	h=From:To:Cc:Subject:Date:From;
	b=NFUMjet/QWZMEWXWiCRQdYRgMXmihjsvbK2+0tbgtpRxnY6BARb3Xy7W04aBF1a60
	 OX6mjmlmErYlVQP+07yCnKUIhE9+QyIeD2lacyGr65Nj1sawKAQyWI+MO6ILvvkMEf
	 CZDgGBWbSF+Oa0PYfy6H2zmkwfNarXiQwY/4xsgoLGsWOTdj/ReJGGCNetjtI7HL3N
	 p/W9LIGn6AG08wwVEu3ZN5OAiXnpfDJRH/aVvA0C/flmmeA5nqjSNC2GMlq660Gy0u
	 M6zdBgY19dOfb7OxWxFZAhtrgl13TYw2QMn4uvD8K0b9fp8S6iN472UjQ7IKFsmgKb
	 eXxqGWuiVrsqw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert brcm,bcm2835-cprman to DT schema
Date: Tue, 20 May 2025 19:46:24 -0500
Message-ID: <20250521004625.1791913-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Broadcom BCM2835 CPRMAN clock binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/brcm,bcm2835-cprman.txt    | 60 -------------------
 .../bindings/clock/brcm,bcm2835-cprman.yaml   | 58 ++++++++++++++++++
 2 files changed, 58 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
deleted file mode 100644
index 9e0b03a6519b..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-Broadcom BCM2835 CPRMAN clocks
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The CPRMAN clock controller generates clocks in the audio power domain
-of the BCM2835.  There is a level of PLLs deriving from an external
-oscillator, a level of PLL dividers that produce channels off of the
-few PLLs, and a level of mostly-generic clock generators sourcing from
-the PLL channels.  Most other hardware components source from the
-clock generators, but a few (like the ARM or HDMI) will source from
-the PLL dividers directly.
-
-Required properties:
-- compatible:	should be one of the following,
-	"brcm,bcm2711-cprman"
-	"brcm,bcm2835-cprman"
-- #clock-cells:	Should be <1>. The permitted clock-specifier values can be
-		  found in include/dt-bindings/clock/bcm2835.h
-- reg:		Specifies base physical address and size of the registers
-- clocks:	phandles to the parent clocks used as input to the module, in
-		  the following order:
-
-		  - External oscillator
-		  - DSI0 byte clock
-		  - DSI0 DDR2 clock
-		  - DSI0 DDR clock
-		  - DSI1 byte clock
-		  - DSI1 DDR2 clock
-		  - DSI1 DDR clock
-
-		  Only external oscillator is required.  The DSI clocks may
-		  not be present, in which case their children will be
-		  unusable.
-
-Example:
-
-	clk_osc: clock@3 {
-		compatible = "fixed-clock";
-		reg = <3>;
-		#clock-cells = <0>;
-		clock-output-names = "osc";
-		clock-frequency = <19200000>;
-	};
-
-	clocks: cprman@7e101000 {
-		compatible = "brcm,bcm2835-cprman";
-		#clock-cells = <1>;
-		reg = <0x7e101000 0x2000>;
-		clocks = <&clk_osc>;
-	};
-
-	i2c0: i2c@7e205000 {
-		compatible = "brcm,bcm2835-i2c";
-		reg = <0x7e205000 0x1000>;
-		interrupts = <2 21>;
-		clocks = <&clocks BCM2835_CLOCK_VPU>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml
new file mode 100644
index 000000000000..8586033794ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm2835-cprman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 CPRMAN clocks
+
+maintainers:
+  - Stefan Wahren <wahrenst@gmx.net>
+
+description:
+  The CPRMAN clock controller generates clocks in the audio power domain of the
+  BCM2835.  There is a level of PLLs deriving from an external oscillator, a
+  level of PLL dividers that produce channels off of the few PLLs, and a level
+  of mostly-generic clock generators sourcing from the PLL channels.  Most other
+  hardware components source from the clock generators, but a few (like the ARM
+  or HDMI) will source from the PLL dividers directly.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-cprman
+      - brcm,bcm2835-cprman
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: External oscillator clock.
+      - description: DSI0 byte clock.
+      - description: DSI0 DDR2 clock.
+      - description: DSI0 DDR clock.
+      - description: DSI1 byte clock.
+      - description: DSI1 DDR2 clock.
+      - description: DSI1 DDR clock.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+
+examples:
+  - |
+    clock-controller@7e101000 {
+        compatible = "brcm,bcm2835-cprman";
+        reg = <0x7e101000 0x2000>;
+        #clock-cells = <1>;
+        clocks = <&clk_osc>;
+    };
-- 
2.47.2

