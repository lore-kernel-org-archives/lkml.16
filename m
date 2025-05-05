Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52671264A9F;
	Mon,  5 May 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456517; cv=none; b=TtLfZtHiVSXLGq/H2WJXl9xw2nlItnmMZXqxNqzpFI44anWHJ/4foaSuf/bZs/bIfCxRMavbtg9b4RMoBnqB0PHighOM0GVCzu75qJ8nGlVkgwlntloA5tjbLaZe56WYCYLJUDHHf1aEddG+u00YDeLbUnHIKffgkJfcyuaRtCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456517; c=relaxed/simple;
	bh=jwgiKD3OjmybRDzCH8qb24nrslZzM56UFE7WhCbENJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gH0hhEKuvnY7A7yzm8ZzhX1olgVROxLJLM7d0dZtkYKBnX9C9yoZ0/zrUab1AWSLnAYB8d0sBgD0IzKYhtNr7yw4w4+wZXz9qnHj5vg1+sApagMvzgNUZ3bCqJGLtBuC6WDRQCOTNCjSqXn78UddOU37w6ebfL+xBvB3UmbGZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+oqEuFG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+oqEuFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4F1C4CEE4;
	Mon,  5 May 2025 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456516;
	bh=jwgiKD3OjmybRDzCH8qb24nrslZzM56UFE7WhCbENJU=;
	h=From:To:Cc:Subject:Date:From;
	b=r+oqEuFGgWY8szdwj9GOSBUVlBEyrXYk5IpjC5rKH28xwiSoyle1GD1fXALVc2WCZ
	 1gC6BFzQRS29UQm2b03/RoM4UQ9qm5gt68LT2aYqPHRiwV+9Y0h/0HjMFvTLcVxRva
	 VfjmVkBSHq7/DKgb2T7yH2Het3GEglaBGc2roSHtv/gltQSgUJpsCjfB7H/lK4bZ3G
	 UyanHFlZVVd3+sifol3UVKfJmdFxAlsd/vAvJv4WveKGhiNpWt0YiR+c23iCbrQO5Y
	 hwVuk8H735rAhHLHsA15d1jgqoaiQkQPg1D02bruHo8XTbWKzbzdJi0Wzi2VBMTMyD
	 ySRzzPh+nmEJA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert snps,archs-intc to DT schema
Date: Mon,  5 May 2025 09:48:33 -0500
Message-ID: <20250505144834.1292666-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ARC-HS incore interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/snps,archs-intc.txt  | 22 ---------
 .../interrupt-controller/snps,archs-intc.yaml | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
deleted file mode 100644
index 69f326d6a5ad..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* ARC-HS incore Interrupt Controller (Provided by cores implementing ARCv2 ISA)
-
-Properties:
-
-- compatible: "snps,archs-intc"
-- interrupt-controller: This is an interrupt controller.
-- #interrupt-cells: Must be <1>.
-
-  Single Cell "interrupts" property of a device specifies the IRQ number
-  between 16 to 256
-
-  intc accessed via the special ARC AUX register interface, hence "reg" property
-  is not specified.
-
-Example:
-
-	intc: interrupt-controller {
-		compatible = "snps,archs-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		interrupts = <16 17 18 19 20 21 22 23 24 25>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
new file mode 100644
index 000000000000..9d248ef7fe3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARC-HS incore Interrupt Controller
+
+maintainers:
+  - Vineet Gupta <vgupta@kernel.org>
+
+description:
+  ARC-HS incore Interrupt Controller provided by cores implementing ARCv2 ISA.
+  intc accessed via the special ARC AUX register interface, hence "reg" property
+  is not specified.
+
+properties:
+  compatible:
+    const: snps,archs-intc
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    description: List of IRQ numbers between 16 and 256
+    items:
+      items:
+        - minimum: 16
+          maximum: 256
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "snps,archs-intc";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <16>, <17>, <18>, <19>, <20>, <21>, <22>, <23>, <24>, <25>;
+    };
-- 
2.47.2

