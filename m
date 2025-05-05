Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A874265CDA;
	Mon,  5 May 2025 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456540; cv=none; b=FYDb5xbJjxNg97m+wIGDedIZdDV92gcCjVTq/AoZwgrOxCbsVwSXgqVLVJjuwq0Om9tT9EErpGFGxNWvUI5r7BTS5FJjEW4hMYI2kHldugtir40Yjr5Q/KzT1V623oEaCmzX3mcvm3oF+GKXHZ2rLpplxKkAO43neRnLIX+jc5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456540; c=relaxed/simple;
	bh=lozRBFVxQQN1nhVsQFYGSiIpmytQJaLRhJd+J1imAZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r6B6lCFsWcko1rwm8oexSQd2E+sdipceoMiWVrQYxNrLupU4mFJ63ogm60gvAtoOTG608dPXxFxbJ1lLrrT59GG3igJIEOdSjgmbJORYPIFCMw4CKfEThZEr0cAGdVoLv1eFYdouACwko8EcYAsngGFhCIwXcMB+XBwSoZkPZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXo4iqsF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXo4iqsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96F3C4CEE4;
	Mon,  5 May 2025 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456539;
	bh=lozRBFVxQQN1nhVsQFYGSiIpmytQJaLRhJd+J1imAZM=;
	h=From:To:Cc:Subject:Date:From;
	b=IXo4iqsFfsx+ZTDvKwpgJgJtebEAWbLMD4mMABQu+4WmH1fp9tjDR6As3tZRLLKdU
	 mXypz1G/wpGGHL6sRErFSzjthxSp9/fQCssVrB/8YOVYb5fE6EjW8KRCj+gfdzcs2s
	 JOust+QBbK+Rmd97sZ20ws1f9GjCweCqUsihGUCOMVzjqX/pjniHdDV5T82plOPW9/
	 XmnlQi0q8dn3gQfGAIhDqJI23nsVqIKtdHBm9EtyjPDV/N2VZ9XXfUYJ8WD7OtNrsQ
	 Ka4QMoYFx2O7TPl0Jq1bX4+Tq9jk4B5TRLE+ExUiG4zURGjcbDgowHngP2YphjRmhV
	 fNmxgB5LDzCNg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert technologic,ts4800-irqc to DT schema
Date: Mon,  5 May 2025 09:48:55 -0500
Message-ID: <20250505144856.1293370-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TS-4800 FPGA interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../technologic,ts4800-irqc.yaml              | 49 +++++++++++++++++++
 .../technologic,ts4800.txt                    | 14 ------
 2 files changed, 49 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800-irqc.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800-irqc.yaml
new file mode 100644
index 000000000000..f1a15d725cd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800-irqc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/technologic,ts4800-irqc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TS-4800 FPGA Interrupt Controller
+
+maintainers:
+  - Damien Riegel <damien.riegel@savoirfairelinux.com>
+
+description:
+  TS-4800 FPGA has an internal interrupt controller. When one of the interrupts
+  is triggered, the SoC is notified, usually using a GPIO as parent interrupt
+  source.
+
+properties:
+  compatible:
+    const: technologic,ts4800-irqc
+
+  reg:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller: true
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
+    interrupt-controller@1000 {
+        compatible = "technologic,ts4800-irqc";
+        reg = <0x1000 0x80>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <10>;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt b/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt
deleted file mode 100644
index 341ae5909333..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-TS-4800 FPGA interrupt controller
-
-TS-4800 FPGA has an internal interrupt controller. When one of the
-interrupts is triggered, the SoC is notified, usually using a GPIO as
-parent interrupt source.
-
-Required properties:
-- compatible: should be "technologic,ts4800-irqc"
-- interrupt-controller: identifies the node as an interrupt controller
-- reg: physical base address of the controller and length of memory mapped
-  region
-- #interrupt-cells: specifies the number of cells needed to encode an interrupt
-  source, should be 1.
-- interrupts: specifies the interrupt line in the interrupt-parent controller
-- 
2.47.2

