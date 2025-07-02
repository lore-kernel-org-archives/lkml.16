Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2346248F73;
	Wed,  2 Jul 2025 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495174; cv=none; b=JN3BaMtBAsSQVaV6UDlKp/3ptKyjweB3caoGRj4+/AN+jEJ2d3+c1ZXYAYi10wK7/278bEWmy6UlTJUkCJDQ8wFyyf8HHbQrMbl7lW25mx3MHPl/dl5oVUh1hS0qk1OaclWW1M/OyMqi4yy6ArPFMR3V2I78E3S8R1wtGiq8Nis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495174; c=relaxed/simple;
	bh=dacwxQot5cTPfk/0nUyAKwN/5LhUbqBz/LMm2yV1KSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WfpUgASOqgqlZ56BcVR/WL8uItSJTsg28Q29gTlAOo2YFqJRVEgQ1GTtX1Q/KIwH9Swzh+nnSwCWUkCgDpqc/B9/Q4KOAMHKPQhDy7lu+F691bf+e/Apd6GajOnauFnN+Bb/Xh/7I8PlKnJPCGoGAezRKu2cE8MRzeeLagps9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtenlx/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtenlx/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607DDC4CEF0;
	Wed,  2 Jul 2025 22:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751495173;
	bh=dacwxQot5cTPfk/0nUyAKwN/5LhUbqBz/LMm2yV1KSw=;
	h=From:To:Cc:Subject:Date:From;
	b=dtenlx/2kfT9aRHRGEx2DfX8I6uHhEjviUxG/swXPMDW2CnWRPq6xHYGMSDFElC16
	 LXZd5KerMFxMqJx/swr+v9mT0wxhHhr2S/q7oXoiBw69Wq4f1xUx+MpPMHW4yCh1y4
	 NqIGOUr7svG1luMn+6xWS9dvF4Y+jaJXKIsAN8XvKnQ1isa9C2UY35FdCRZWOXVh8L
	 ugx70WrRAIMemevnoqlO9dgon9ewY5znS/VW/pDRwH117vvUZMoVzIbwjqpPTja+Xd
	 14O/d01yt1nPIBhexIRjmyRtrjmfF8K1MTzXI66eksHr2yJQ+2avm3uQHbzfKCd45d
	 +NZqN2ZHiEClA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: Convert snps,dw-reset to DT schema
Date: Wed,  2 Jul 2025 17:26:08 -0500
Message-ID: <20250702222609.2760718-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Synopsys Designware Reset Controller binding to schema. It
is a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/reset/snps,dw-reset.txt          | 30 --------------
 .../bindings/reset/snps,dw-reset.yaml         | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/snps,dw-reset.txt b/Documentation/devicetree/bindings/reset/snps,dw-reset.txt
deleted file mode 100644
index 0c241d4aae76..000000000000
--- a/Documentation/devicetree/bindings/reset/snps,dw-reset.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Synopsys DesignWare Reset controller
-=======================================
-
-Please also refer to reset.txt in this directory for common reset
-controller binding usage.
-
-Required properties:
-
-- compatible: should be one of the following.
-	"snps,dw-high-reset" - for active high configuration
-	"snps,dw-low-reset" - for active low configuration
-
-- reg: physical base address of the controller and length of memory mapped
-	region.
-
-- #reset-cells: must be 1.
-
-example:
-
-	dw_rst_1: reset-controller@0000 {
-		compatible = "snps,dw-high-reset";
-		reg = <0x0000 0x4>;
-		#reset-cells = <1>;
-	};
-
-	dw_rst_2: reset-controller@1000 {
-		compatible = "snps,dw-low-reset";
-		reg = <0x1000 0x8>;
-		#reset-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/reset/snps,dw-reset.yaml b/Documentation/devicetree/bindings/reset/snps,dw-reset.yaml
new file mode 100644
index 000000000000..1dde7b6e8623
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/snps,dw-reset.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/snps,dw-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Reset controller
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - snps,dw-high-reset
+      - snps,dw-low-reset
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+  reset-controller: true
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@0 {
+        compatible = "snps,dw-high-reset";
+        reg = <0x0000 0x4>;
+        #reset-cells = <1>;
+    };
-- 
2.47.2

