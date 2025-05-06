Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F93002A8;
	Tue,  6 May 2025 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498140; cv=none; b=tXc+KGlvVAk6T8LReeeTJtRgPvWwq1BgR+34X0Mh8WDfVcL7L2cWdR+J/wZzRI/N4mbo1I2QHu1wWciFhCaCZKhRu2h86/emfMPmv/Nmil8286GMVItVGgryTKnZJ7HD6JhryLuzcAFsu5udVrRvDupJjhdfEEGGZCMAGcGgDXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498140; c=relaxed/simple;
	bh=WwQNWZIozN2u7MiGY37rkvfNiCqmdGGwWW/oTcOrhIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPmTWU0jB/tePF89zznXg+cRwXnIbK88zE9N9nfVKYvzap1VyBDrsIq1FaUP9jrQiIBvruKJZyHyN17VHZN/wPGtBfrbZT1nd5DrHqepW7o/eq0DpnEt6yH/pEHnymbjPjtYk/3HXTG/a4YM+RYO/Dosnbhzx6k851VoqzMhtE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cW3f+epT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cW3f+epT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7226C4CEE4;
	Tue,  6 May 2025 02:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498134;
	bh=WwQNWZIozN2u7MiGY37rkvfNiCqmdGGwWW/oTcOrhIo=;
	h=From:To:Cc:Subject:Date:From;
	b=cW3f+epTDMJ0pFITUeQWYQLmP+nRxKGT3UTgGn2S7txOjpaxghbPvjJdNWLL1ssFT
	 uw/j0outlVGIri6j7UiYXAnHWzhIu32Fxmp83ryGjQhlGwyh7MCU5BOfmVDumbpiXO
	 mS3uQ2/FRKJL6rR5yUlkFzvfnZDzQr7OVNXlq/cQo4TnH2CdK4+N3+E0anlJ4whiZ+
	 B60SVH1tkYvOzuTXn558X6ZoX609GxU4pXKOfDvXC3/nZxS8+VWOlZOxHHdMBnIQKK
	 ZHLqewR4eY5WJu5E6AFU32hHWPovgzVSXfBZlvamFn3WVwnaTG0SVS5NDSlyOTPEOQ
	 qlATpXNe+curw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: timer: Convert arm,mps2-timer to DT schema
Date: Mon,  5 May 2025 21:22:09 -0500
Message-ID: <20250506022210.2586404-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Arm MPS2 Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/arm,mps2-timer.txt         | 28 -----------
 .../bindings/timer/arm,mps2-timer.yaml        | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt b/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
deleted file mode 100644
index 48f84d74edde..000000000000
--- a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-ARM MPS2 timer
-
-The MPS2 platform has simple general-purpose 32 bits timers.
-
-Required properties:
-- compatible	: Should be "arm,mps2-timer"
-- reg		: Address and length of the register set
-- interrupts	: Reference to the timer interrupt
-
-Required clocking property, have to be one of:
-- clocks	  : The input clock of the timer
-- clock-frequency : The rate in HZ in input of the ARM MPS2 timer
-
-Examples:
-
-timer1: mps2-timer@40000000 {
-	compatible = "arm,mps2-timer";
-	reg = <0x40000000 0x1000>;
-	interrupts = <8>;
-	clocks = <&sysclk>;
-};
-
-timer2: mps2-timer@40001000 {
-	compatible = "arm,mps2-timer";
-	reg = <0x40001000 0x1000>;
-	interrupts = <9>;
-	clock-frequency = <25000000>;
-};
diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
new file mode 100644
index 000000000000..64c6aedd7e8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm,mps2-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM MPS2 timer
+
+maintainers:
+  - Vladimir Murzin <vladimir.murzin@arm.com>
+
+description:
+  The MPS2 platform has simple general-purpose 32 bits timers.
+
+properties:
+  compatible:
+    const: arm,mps2-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Rate in Hz of the timer input clock
+
+oneOf:
+  - required: [clocks]
+  - required: [clock-frequency]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@40000000 {
+        compatible = "arm,mps2-timer";
+        reg = <0x40000000 0x1000>;
+        interrupts = <8>;
+        clocks = <&sysclk>;
+    };
-- 
2.47.2

