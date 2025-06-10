Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0061280319;
	Tue, 10 Jun 2025 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550003; cv=none; b=gZPcsAuQxzEAuypdDM/B7rEW/VQoqcddDqTDX40hqeT/BDEp9KrmiEpSTgvo8i116YigMTT/kaL6iUJ4CedXjw2+AT7RQrt4Av/70Ea8xmEYq5oFrDcVPyl781dipKTYIlCspkU5DgqB4h4BzK0NHYubaPPdYxLTW7Cn01tLB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550003; c=relaxed/simple;
	bh=R0DjUyymyH51702nfIhvD4gSoTHc5AdW1g9ClY+/bUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pThW4u6uZ7v6G29Q19Rxoz0bo8hJR51vm2GijrYtsaFYBJ14ZP6/6+zg73ZDQ3x4up1nVPOQYePmOGeGhGHziwYrORknKsWFOw3ndfKVOexyHg5q2Jiz30caidtURTWY0KLUdm3m1vM+R8oxPyMbQlTnCNKS5+4VLj0+GWZ0uEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=pJJz48c2 reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="pJJz48c2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550001; x=1781086001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R0DjUyymyH51702nfIhvD4gSoTHc5AdW1g9ClY+/bUU=;
  b=pJJz48c20MljV4uXyBSHKoxLtJTkiyh9Ri2cnpiBmODyV64yGP48/0C8
   mhQtx5NmpeQSBzEzsfG2HUWURfL70xYqHdkaBMUtVWLyoMwur8YqpX+mX
   HnDZAzJKbse3AYg3V7NGZiFm8kEKUN5Pb7UVgUnb49qkrU+eHzrTIFJos
   XyXpHkHrNuAsmgEIlZ6sa9qfhzL7M6wJijbWSL1qrlKkfdw4TT3gf2cs4
   6QkWlMmXXi+CL0pY+CJPf4KC/OYtk55lUEItHAf8it4sC2iYK+maPEXNZ
   qQ0V7O/aduL8DaBeOfnxrK4SlguKZzPKxCd29fcXaTgyYypt/QWfbaqUd
   Q==;
X-CSE-ConnectionGUID: K96KZstaSDax28xZBAQa8w==
X-CSE-MsgGUID: GDFfji0HQu6Wl+p8aFBa5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:39 +0300
X-CSE-ConnectionGUID: 6Lr+r0t+Qau3aGluaf0P8A==
X-CSE-MsgGUID: VUNhgET1QMGRryuleMYhgw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces04_data.me-crop.lan with SMTP; 10 Jun 2025 13:06:37 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:37 +0300
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
Subject: [PATCH v2 3/7] dt-bindings: interrupt-controller: add MIPS P8700 aclint-sswi
Date: Tue, 10 Jun 2025 13:05:36 +0300
Message-ID: <20250610100540.2834044-4-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ACLINT-SSWI variant for the MIPS P8700. This CPU has
SSWI device compliant with the RISC-V draft spec (see [1])
CPU indexes on this platform are not contiguous, instead
it uses bit-fields to encode hart,core,cluster numbers, thus
property "riscv,hart-indexes" is mandatory

Link: https://github.com/riscvarchive/riscv-aclint [1]

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 .../thead,c900-aclint-sswi.yaml               | 64 ++++++++++++++++---
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index 8d330906bbbd..c1ab865fcd64 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -4,23 +4,32 @@
 $id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: T-HEAD C900 ACLINT Supervisor-level Software Interrupt Device
+title: ACLINT Supervisor-level Software Interrupt Device
 
 maintainers:
   - Inochi Amaoto <inochiama@outlook.com>
 
 description:
-  The SSWI device is a part of the THEAD ACLINT device. It provides
-  supervisor-level IPI functionality for a set of HARTs on a THEAD
-  platform. It provides a register to set an IPI (SETSSIP) for each
-  HART connected to the SSWI device.
+  The SSWI device is a part of the ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a supported
+  platforms. It provides a register to set an IPI (SETSSIP) for each
+  HART connected to the SSWI device. See draft specification
+  https://github.com/riscvarchive/riscv-aclint
+
+  Following variants of the SSWI ACLINT supported, using dedicated
+  compatible string
+  - THEAD C900
+  - MIPS P8700
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sophgo,sg2044-aclint-sswi
-      - const: thead,c900-aclint-sswi
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-aclint-sswi
+          - const: thead,c900-aclint-sswi
+      - items:
+          - const: mips,p8700-aclint-sswi
 
   reg:
     maxItems: 1
@@ -34,6 +43,14 @@ properties:
     minItems: 1
     maxItems: 4095
 
+  riscv,hart-indexes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4095
+    description:
+      A list of hart indexes that APLIC should use to address each hart
+      that is mentioned in the "interrupts-extended"
+
 additionalProperties: false
 
 required:
@@ -43,8 +60,22 @@ required:
   - interrupt-controller
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mips,p8700-aclint-sswi
+    then:
+      required:
+        - riscv,hart-indexes
+    else:
+      properties:
+        riscv,hart-indexes: false
+
 examples:
   - |
+    //Example 1
     interrupt-controller@94000000 {
       compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
       reg = <0x94000000 0x00004000>;
@@ -55,4 +86,19 @@ examples:
                             <&cpu3intc 1>,
                             <&cpu4intc 1>;
     };
+
+  - |
+    //Example 2
+    interrupt-controller@94000000 {
+      compatible = "mips,p8700-aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+      riscv,hart-indexes = <0x0 0x1 0x10 0x11>;
+    };
+
 ...
-- 
2.43.0

