Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C233380B4;
	Tue,  6 May 2025 02:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498184; cv=none; b=crfWMJHjLf+qCvtoYXJZhtmaNPaIMKCAFMVG01JwTO9WrulJO3DbzUngB9ngApZWAeYzn+i1TBU94TVoPZlHI9HIJNQsajSFCOsKin/g2AWAZHC3jXHIGZMlgo9ND56MKFAcGZsfm41PrcsxhaKGRERPGZNVbZN7Ot9LrrnuBTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498184; c=relaxed/simple;
	bh=2epdz0879bY+tfeEnXd+91dNg8Yi5+WF8Wp8wAbzjPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NKSFi2M5CkulBZ+Rzg9KqzKzHwqBsoIc72tI7n9Nk/XHQRdSIwVeuoEslFOcM9MaApGCDzpKU852Xuk+yfS80HVy10BNbEAajg44cBxkWEmGhXmA4hPrbq/RxjZo3Ey5lYo6PB4GI4Uh1V6CwAssG7NBJFBbKbAkmm6pcsj9OcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXSpJL5P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXSpJL5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4746C4CEE4;
	Tue,  6 May 2025 02:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498184;
	bh=2epdz0879bY+tfeEnXd+91dNg8Yi5+WF8Wp8wAbzjPQ=;
	h=From:To:Cc:Subject:Date:From;
	b=OXSpJL5PIzadWkbT8sHp3P9p1iKzntSrKV8EoZBx5/ZxXIc7YdifWQO7aOP0jGeYc
	 sqtZb8la65JVUgsPtXAaV23lT9Fc60xxVTO46PlCca1EzwyYCvh9CBQf/eEAvM8IcY
	 neF0HfIUQbGSqIH87qqgWjBkvveDF5R2h4FzCgIeGTF+wBJHONc0eAYH6cRnHdSc2x
	 Tixb5OvBMQuzV2vecIh/MVnUfJWivTwWiqg+PP8KIR++usoCw/cVYD3Ff8Xvk51YNE
	 nrW3ioSA+/a4k8znbFGL7LrBsuhLoyZnal5NKlFciOP7F/X575a0ePcLDNp+DaP80o
	 TjjYsoeIixu5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
Date: Mon,  5 May 2025 21:23:00 -0500
Message-ID: <20250506022301.2588282-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada 37x/380/XP Timer binding to DT schema format.
Update the compatible entries to match what is in use.
"marvell,armada-380-timer" in particular was missing.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../timer/marvell,armada-370-timer.yaml       | 88 +++++++++++++++++++
 .../timer/marvell,armada-370-xp-timer.txt     | 44 ----------
 2 files changed, 88 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml b/Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
new file mode 100644
index 000000000000..bc0677fe86eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/marvell,armada-370-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 370, 375, 380 and XP Timers
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: marvell,armada-380-timer
+          - const: marvell,armada-xp-timer
+      - items:
+          - const: marvell,armada-375-timer
+          - const: marvell,armada-370-timer
+      - enum:
+          - marvell,armada-370-timer
+          - marvell,armada-xp-timer
+
+  reg:
+    items:
+      - description: Global timer registers
+      - description: Local/private timer registers
+
+  interrupts:
+    items:
+      - description: Global timer interrupt 0
+      - description: Global timer interrupt 1
+      - description: Global timer interrupt 2
+      - description: Global timer interrupt 3
+      - description: First private timer interrupt
+      - description: Second private timer interrupt
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: nbclk
+      - const: fixed
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,armada-375-timer
+              - marvell,armada-xp-timer
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
+examples:
+  - |
+    timer@20300 {
+        compatible = "marvell,armada-xp-timer";
+        reg = <0x20300 0x30>, <0x21040 0x30>;
+        interrupts = <37>, <38>, <39>, <40>, <5>, <6>;
+        clocks = <&coreclk 2>, <&refclk>;
+        clock-names = "nbclk", "fixed";
+    };
diff --git a/Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt b/Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
deleted file mode 100644
index e9c78ce880e6..000000000000
--- a/Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Marvell Armada 370 and Armada XP Timers
----------------------------------------
-
-Required properties:
-- compatible: Should be one of the following
-              "marvell,armada-370-timer",
-	      "marvell,armada-375-timer",
-	      "marvell,armada-xp-timer".
-- interrupts: Should contain the list of Global Timer interrupts and
-  then local timer interrupts
-- reg: Should contain location and length for timers register. First
-  pair for the Global Timer registers, second pair for the
-  local/private timers.
-
-Clocks required for compatible = "marvell,armada-370-timer":
-- clocks : Must contain a single entry describing the clock input
-
-Clocks required for compatibles = "marvell,armada-xp-timer",
-				  "marvell,armada-375-timer":
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names : Must include the following entries:
-  "nbclk" (L2/coherency fabric clock),
-  "fixed" (Reference 25 MHz fixed-clock).
-
-Examples:
-
-- Armada 370:
-
-	timer {
-		compatible = "marvell,armada-370-timer";
-		reg = <0x20300 0x30>, <0x21040 0x30>;
-		interrupts = <37>, <38>, <39>, <40>, <5>, <6>;
-		clocks = <&coreclk 2>;
-	};
-
-- Armada XP:
-
-	timer {
-		compatible = "marvell,armada-xp-timer";
-		reg = <0x20300 0x30>, <0x21040 0x30>;
-		interrupts = <37>, <38>, <39>, <40>, <5>, <6>;
-		clocks = <&coreclk 2>, <&refclk>;
-		clock-names = "nbclk", "fixed";
-	};
-- 
2.47.2

