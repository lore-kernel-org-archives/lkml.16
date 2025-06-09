Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6A25FA2C;
	Mon,  9 Jun 2025 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476955; cv=none; b=h36P3b5ejVxl9A8C4CTF79xLeIcnTMxPBxdO5q7BhDOYu6ildk9Ygy7jMBqM3SG7GdLkleyDJgYKhz/QHSFcLsSsJ3/HzZDfz02jSy4nhmm3NYXZT8ifA5rjkho4PbbhzZt7Jv+ugTEsRZkyE0m5To+qeKS/OfFEdRJrCrdOPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476955; c=relaxed/simple;
	bh=kjHMjCHOrmu4ZU1b0Blwlqeccd/ZypQ5pwcPpKiOjGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHSQkX0oWAVthkbwt/TCR1/o1tm5bcZ2yEchKXJyIiF1IcyM3qvzicvWYp6+o5dbtAQT9UEuygPPeCxkfoB7s+HggGYQvyoa+SwV/SaM2AcF5H9T0RT0uhawkoP8PLcqFkY8PGE0uKUkhOJ76LQGk3/Lk1gF29o72vwxMnxhnZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=I5SJe+BP reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="I5SJe+BP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749476953; x=1781012953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kjHMjCHOrmu4ZU1b0Blwlqeccd/ZypQ5pwcPpKiOjGk=;
  b=I5SJe+BPhHRug0zE+Ol/lwDS50ido6c7oh73J1MDWJyi3gpxNzbhgbya
   VU1Cw6eKzP8eWOzJDXzNIZTXB+Ejx7EkafW/0k7Jy25vgf2Jv63CYs+GH
   JtJjAJiW8Z9N0uCQDD9pJ0BENkd3Rip4Ygobw8OUUHHAmwxslqu8J0Giv
   +DKDL2A4bLTe7NipZRlV1UrPrvOpwCeIYL4piceu+YcOiKN8egDyqeylq
   wTbm36dSul1GeNDX78apU65Q+v+nxab1QvRMrgZJlLrMgVpWbBv0N6sfA
   qzMBrPRyZX6iyWNpq9dH41aplgVoO4U9YEL+Xo99v9EnxmUTFm072TClQ
   w==;
X-CSE-ConnectionGUID: 77rEMxDSR6CSt0vSI5PimA==
X-CSE-MsgGUID: 6xtuKL53Qu22KTSz+6iNpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:48:00 +0300
X-CSE-ConnectionGUID: KVlrIBAwSKa0Z5qGDDArcA==
X-CSE-MsgGUID: PSXOWlntRkO5W187C3w9pg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 09 Jun 2025 16:47:58 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:47:59 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v1 3/7] dt-bindings: interrupt-controller: add generic Risc-v aclint-sswi
Date: Mon,  9 Jun 2025 16:47:45 +0300
Message-ID: <20250609134749.1453835-4-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add generic, Risc-V spec compliant (see [1]) aclint-sswi binding

Thead specific binding preserved, and converted to variant of the
generic aclint-sswi

Link: https://github.com/riscvarchive/riscv-aclint [1]

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 .../riscv,aclint-sswi.yaml                    | 89 +++++++++++++++++++
 .../thead,c900-aclint-sswi.yaml               | 58 ------------
 2 files changed, 89 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
new file mode 100644
index 000000000000..cffddfcfcfea
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-sswi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Risc-V ACLINT Supervisor-level Software Interrupt Device
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The SSWI device is a part of the Risc-V ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a THEAD
+  platform. It provides a register to set an IPI (SETSSIP) for each
+  HART connected to the SSWI device. See specification
+  https://github.com/riscvarchive/riscv-aclint
+
+  T-HEAD C900 ACLINT is a variant of the ACLINT, using dedicated
+  compatible string
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-aclint-sswi
+          - const: thead,c900-aclint-sswi
+      - items:
+          - const: riscv,aclint-sswi
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 0
+
+  interrupt-controller: true
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+  riscv,hart-indexes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 16384
+    description:
+      A list of hart indexes that APLIC should use to address each hart
+      that is mentioned in the "interrupts-extended"
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupts-extended
+
+examples:
+  - |
+    //Example 1
+    interrupt-controller@94000000 {
+      compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+    };
+
+  - |
+    //Example 2
+    interrupt-controller@94000000 {
+      compatible = "riscv,aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+      riscv,hart-indexes = <0 1 0x10 0x11>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
deleted file mode 100644
index 8d330906bbbd..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ /dev/null
@@ -1,58 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: T-HEAD C900 ACLINT Supervisor-level Software Interrupt Device
-
-maintainers:
-  - Inochi Amaoto <inochiama@outlook.com>
-
-description:
-  The SSWI device is a part of the THEAD ACLINT device. It provides
-  supervisor-level IPI functionality for a set of HARTs on a THEAD
-  platform. It provides a register to set an IPI (SETSSIP) for each
-  HART connected to the SSWI device.
-
-properties:
-  compatible:
-    items:
-      - enum:
-          - sophgo,sg2044-aclint-sswi
-      - const: thead,c900-aclint-sswi
-
-  reg:
-    maxItems: 1
-
-  "#interrupt-cells":
-    const: 0
-
-  interrupt-controller: true
-
-  interrupts-extended:
-    minItems: 1
-    maxItems: 4095
-
-additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - "#interrupt-cells"
-  - interrupt-controller
-  - interrupts-extended
-
-examples:
-  - |
-    interrupt-controller@94000000 {
-      compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
-      reg = <0x94000000 0x00004000>;
-      #interrupt-cells = <0>;
-      interrupt-controller;
-      interrupts-extended = <&cpu1intc 1>,
-                            <&cpu2intc 1>,
-                            <&cpu3intc 1>,
-                            <&cpu4intc 1>;
-    };
-...
-- 
2.43.0

