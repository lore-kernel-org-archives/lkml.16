Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30182690D4;
	Mon,  5 May 2025 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456429; cv=none; b=GEe/D7cAtXjksyevFWnSZsQPc1H6I8pSGi40GqQCLV2bv4TAyUs6/K4MyoievJpkxn4hE8lQVsfsMxJ3NKlKCUlPgvezaKSKrTxTrrXV+4c08/1YqIlf8ypA0cy13r7Tu2LjnVHbUw9bF/hRr67nrwhnjDB5soIl0NCxSQ9Z3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456429; c=relaxed/simple;
	bh=UhWgvkCcD9aI+r9CDaeVfvs8I4ZvIWAAmD3bCTITCgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGcSAjDqIYlRhuG6Gm+WXOLdw4gxiUYUwcPJrWXkKf9aoVjeiDnroHhdtSomVUdLPowyAMdsFN1VrL/CWfecBYSt3K4Lq9tUuX4VL2z+dk2N/9NU9UY80ug/4K3eCVSqdNtUJiLRRs9U9e4ur9Elaat3Ap0XEENffos7INULotc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdpTuoYw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdpTuoYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882B3C4CEE4;
	Mon,  5 May 2025 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456429;
	bh=UhWgvkCcD9aI+r9CDaeVfvs8I4ZvIWAAmD3bCTITCgc=;
	h=From:To:Cc:Subject:Date:From;
	b=kdpTuoYwtBh/Ue2TU+QJzhakVyPsNm2YxP8wnyVPd/BwACWOwn8/R4rs35drVVtnc
	 MBo4oBHFG5KV4HeZ8VlMGBu7Y/G8u7etydmfmvqYiAXZKij/z7V2BTcUC1wmwLy995
	 /RTPl6DaRguOvD/CLzOY9yG6r8T8EWBs/57rR3TazwUlm8EadZU8efkX5LUFVz6WwU
	 wq+VIY4qhEM6djml4Eq8Cwdnymff0SYbr8ISCEfltG4QYsfnAaHQrBSzDw49lfBTHN
	 Tp08xZJ+GsrB4vP1CK/NV4ByojXJrqYpjCPKZlFx70kTIoGIEtbUtovNTCiQDYLf98
	 MIIaHYpFijycg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rich Felker <dalias@libc.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert jcore,aic to DT schema
Date: Mon,  5 May 2025 09:47:05 -0500
Message-ID: <20250505144707.1289503-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the J-Core advanced interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/jcore,aic.txt        | 26 -----------
 .../interrupt-controller/jcore,aic.yaml       | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/jcore,aic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt b/Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
deleted file mode 100644
index ee2ad36f8df8..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-J-Core Advanced Interrupt Controller
-
-Required properties:
-
-- compatible: Should be "jcore,aic1" for the (obsolete) first-generation aic
-  with 8 interrupt lines with programmable priorities, or "jcore,aic2" for
-  the "aic2" core with 64 interrupts.
-
-- reg: Memory region(s) for configuration. For SMP, there should be one
-  region per cpu, indexed by the sequential, zero-based hardware cpu
-  number.
-
-- interrupt-controller: Identifies the node as an interrupt controller
-
-- #interrupt-cells: Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-
-
-Example:
-
-aic: interrupt-controller@200 {
-	compatible = "jcore,aic2";
-	reg = < 0x200 0x30 0x500 0x30 >;
-	interrupt-controller;
-	#interrupt-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/jcore,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/jcore,aic.yaml
new file mode 100644
index 000000000000..df8abc24591c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/jcore,aic.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2018 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/jcore,aic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: J-Core Advanced Interrupt Controller
+
+maintainers:
+  - Rich Felker <dalias@libc.org>
+
+properties:
+  compatible:
+    enum:
+      - jcore,aic1
+      - jcore,aic2
+
+  reg:
+    description: Memory region(s) for configuration. For SMP, there should be one
+      region per CPU, indexed by the sequential, zero-based hardware CPU number.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    aic: interrupt-controller@200 {
+        compatible = "jcore,aic2";
+        reg = <0x200 0x30>, <0x500 0x30>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2

