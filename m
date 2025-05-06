Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3630035A;
	Tue,  6 May 2025 02:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498180; cv=none; b=Osd/80y1OF81U+8QGuX2/UMU7k/zaf6aAM9pqPGUOBSTNdNntMLlzDqCcwAfPi1WUeXwImwa0wyso/DBnLM2BzkYqNYxxrtorSkNjcNuq3uvlpv4ToNdwdII135s/8ENzg4VsmzqAMsdcApTdWRgU+29oIDGP/KHMry2W0A0BQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498180; c=relaxed/simple;
	bh=XwiTbvDuJHg5Jgrcity3qbKdTBBkmo8hT+hmUxszMb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0L0chuvxQ49kNeWTDs2A2TKmUsb+ELTvXsDRkVwsRkMsZu1eZ2QBKSx8FPupJUJufilN/alTw4zgQ/uhRP4iCzvqzTWE3IyJspaWjyXm+jCS1f+vI5DG4pEnDUQj5nQ1RsPlnzdIEGVDyE8kzy8rwNrjwsxLTsKzWNAnSPfL58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btHqNNW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btHqNNW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2637C4CEE9;
	Tue,  6 May 2025 02:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498180;
	bh=XwiTbvDuJHg5Jgrcity3qbKdTBBkmo8hT+hmUxszMb8=;
	h=From:To:Cc:Subject:Date:From;
	b=btHqNNW+22KBQ+qbZLQ3VNeBMZxDFeftirgKMYYGUodHNQaibrfNRxTKgYRLzZ7u8
	 8/idVbWUPk8S3St63L4VMYndKgQaAFuJL3ksvZeek+Q7lcwucrFUSjLCudqxzXJXUE
	 T4IPM0vfQwGvtsybYUQGhX/edxLzQC4zN/AdTm98h9rm1KL2vQIvIMfAy6LmY/Utnj
	 5Y9hfQo++C8vQPUi+J6S9MTMhaR4mzqGzPw2tWlC95VboAZ3IfUoA8fiD/fL1aKNEp
	 59K9/S44Hlp3AcUHWyVNYYAlv7eF7URfUebFSAS2oll58Aww4kX4AZ1QQ6w69TKlvj
	 gnRgVBnL2fVMA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Tang <dt.tangr@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert lsi,zevio-timer to DT schema
Date: Mon,  5 May 2025 21:22:56 -0500
Message-ID: <20250506022257.2588136-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI NSPIRE Timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/lsi,zevio-timer.txt        | 33 -----------
 .../bindings/timer/lsi,zevio-timer.yaml       | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/lsi,zevio-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/lsi,zevio-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/lsi,zevio-timer.txt b/Documentation/devicetree/bindings/timer/lsi,zevio-timer.txt
deleted file mode 100644
index b2d07ad90e9a..000000000000
--- a/Documentation/devicetree/bindings/timer/lsi,zevio-timer.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-TI-NSPIRE timer
-
-Required properties:
-
-- compatible : should be "lsi,zevio-timer".
-- reg : The physical base address and size of the timer (always first).
-- clocks: phandle to the source clock.
-
-Optional properties:
-
-- interrupts : The interrupt number of the first timer.
-- reg : The interrupt acknowledgement registers
-	(always after timer base address)
-
-If any of the optional properties are not given, the timer is added as a
-clock-source only.
-
-Example:
-
-timer {
-	compatible = "lsi,zevio-timer";
-	reg = <0x900D0000 0x1000>, <0x900A0020 0x8>;
-	interrupts = <19>;
-	clocks = <&timer_clk>;
-};
-
-Example (no clock-events):
-
-timer {
-	compatible = "lsi,zevio-timer";
-	reg = <0x900D0000 0x1000>;
-	clocks = <&timer_clk>;
-};
diff --git a/Documentation/devicetree/bindings/timer/lsi,zevio-timer.yaml b/Documentation/devicetree/bindings/timer/lsi,zevio-timer.yaml
new file mode 100644
index 000000000000..358455d8e7a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/lsi,zevio-timer.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI-NSPIRE timer
+
+maintainers:
+  - Daniel Tang <dt.tangr@gmail.com>
+
+properties:
+  compatible:
+    const: lsi,zevio-timer
+
+  reg:
+    minItems: 1
+    items:
+      - description: Timer registers
+      - description: Interrupt acknowledgement registers (optional)
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - if:
+      required: [ interrupts ]
+    then:
+      properties:
+        reg:
+          minItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@900d0000 {
+        compatible = "lsi,zevio-timer";
+        reg = <0x900D0000 0x1000>, <0x900A0020 0x8>;
+        interrupts = <19>;
+        clocks = <&timer_clk>;
+    };
+  - |
+    timer@900d0000 {
+        compatible = "lsi,zevio-timer";
+        reg = <0x900D0000 0x1000>;
+        clocks = <&timer_clk>;
+    };
-- 
2.47.2

