Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5040263F54;
	Mon,  5 May 2025 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456497; cv=none; b=Eps290Smo6J0iRr5rB+qY0Lj0g8f5msiZ4IV5rsyrJXT/X2hshAnwjicxEnx8s/CYaOyNGboUlWN5Y9mHINGiecr8qbdjYEnhzq6WUXZJGomiCuMfa7Cj40Az+EfDJvhpIRdePpf3TA0B/pDFWUnyeb2mG6scZVIBr+Lqrcfg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456497; c=relaxed/simple;
	bh=QnyRJ5C9wOhyAKrF5/eCnocsA74CPJWlyKdxWl3vdAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLgSTqLyYEUJHa5mWnNdxTubYd46ZuCrf7F3HJFQb41XJ/jSjuMbfmb2bHGYjuKvgefYoSH0X8+hk0EK2MdoxrcXppDMCLVL15cKVt9dqLylt4mr4z14iiOIiNOGCeItfE2WARDT5n255l2Aa30V2FaCuTAhQLxm35QQdaCZ3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNX5MJ38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNX5MJ38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E074C4CEE4;
	Mon,  5 May 2025 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456496;
	bh=QnyRJ5C9wOhyAKrF5/eCnocsA74CPJWlyKdxWl3vdAI=;
	h=From:To:Cc:Subject:Date:From;
	b=qNX5MJ38z8cLx84z3dffHZRYJSUw9H3bKXN6+14Fcguxesto3JKKG2nxqn23BLNko
	 LIf98f9pq2dWRouIqtJSh+ST5VYD+DwwNYtOCJUKpxV/0gpEvMYLAx8zK4f5XKqPGU
	 PDpvKu1mgkhjDfHdgYzagnmVexhbaS5xagULi6XlikgGMiQwggGh8JD/Ox6JGF+Ub9
	 jkQAQ4o7AVDZVe1SjEBovJPWWh1HPxk4oxw7ASFNp3+SbHKiBIbs8eAMk88PlqmK4w
	 FgnzTCuFVMgisB3/H42M8p4fwh9Ri3aWUT9MSpATtTkxXA9devb88hK89DLK5nAceG
	 IyY6y5Ra71agg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stafford Horne <shorne@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert openrisc,ompic to DT schema
Date: Mon,  5 May 2025 09:48:12 -0500
Message-ID: <20250505144813.1291810-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OpenRISC OMPIC interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/openrisc,ompic.txt   | 22 ---------
 .../interrupt-controller/openrisc,ompic.yaml  | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt b/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt
deleted file mode 100644
index caec07cc7149..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Open Multi-Processor Interrupt Controller
-
-Required properties:
-
-- compatible : This should be "openrisc,ompic"
-- reg : Specifies base physical address and size of the register space. The
-  size is based on the number of cores the controller has been configured
-  to handle, this should be set to 8 bytes per cpu core.
-- interrupt-controller : Identifies the node as an interrupt controller.
-- #interrupt-cells : This should be set to 0 as this will not be an irq
-  parent.
-- interrupts : Specifies the interrupt line to which the ompic is wired.
-
-Example:
-
-ompic: interrupt-controller@98000000 {
-	compatible = "openrisc,ompic";
-	reg = <0x98000000 16>;
-	interrupt-controller;
-	#interrupt-cells = <0>;
-	interrupts = <1>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml b/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml
new file mode 100644
index 000000000000..4efbfba3aa6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/openrisc,ompic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Open Multi-Processor Interrupt Controller
+
+maintainers:
+  - Stafford Horne <shorne@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - const: openrisc,ompic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@98000000 {
+        compatible = "openrisc,ompic";
+        reg = <0x98000000 16>;
+        interrupt-controller;
+        #interrupt-cells = <0>;
+        interrupts = <1>;
+    };
-- 
2.47.2

