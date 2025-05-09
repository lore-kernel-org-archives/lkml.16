Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0EA2900BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793504; cv=none; b=MFmO5CwBshedp//7bdn7beFzdI+pPORD3gFm5DEmLyYpqsDAIYoCUk5ryzSMV6sL+8Fj2fA4Ua8kzLOPirpOPFaB8ebzOuH7V5+Gp41QOJqWoINzm6lTx99iqgpUzhEx71skQdaE6w03lrwUGHU8m2e6LMnR6rocVyWssMbBHKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793504; c=relaxed/simple;
	bh=WF0ApFUf7eXA928KnHMjP6pRsHIxtL7KqqA4YWZKbns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtBDaOlrpDou6MGcAkVjM9jfVaeTSMhBDJCM0cT9NiTjLrc+Y7segtM98j2rVd5qUeVUEAP8oboasnMYt6vX6mH8qWUggHkKZv481vTYXQ2C/Hpl0Yy3fhW6ao8yOwCau0h96fvareOIOvPDQi0MY3EElJJEsKOeF9JlMyKyb4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGO9LYJ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGO9LYJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5223C4CEE4;
	Fri,  9 May 2025 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746793503;
	bh=WF0ApFUf7eXA928KnHMjP6pRsHIxtL7KqqA4YWZKbns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGO9LYJ5H03e9N9s96h1IZgJp1156xfnKkFOqOKMx4Dnw1n636c/l9SGVOz5RBaoU
	 do+11aof+H+Yc4ZobMxUmfT7AeZvzqA+jMsWazqmuy1GA0MZGKfmBaKQhyKlDEy3FK
	 REJYD5/vX0VL5EhJdCOeFCecroRhS98X+tRgVYJgBjvs945HNB5rsWQLtT55er3PxC
	 0eO8XdsdiO6aNI5wrTD0jz2fhAn96hcJvHQFHySplNgJV+amVX6Lu1/izhM1+KdTSJ
	 IzX9lOX3ge8MtpoOTr9D2P4URoRLv7bSUxxNd9tergIG38UumkVh8F0aLZTGSkA+NG
	 SnIS5UwNIZwNg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 2/3] dt-bindings: spmi: Add Apple SPMI NVMEM
Date: Fri,  9 May 2025 13:24:51 +0100
Message-ID: <20250509122452.11827-3-srini@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509122452.11827-1-srini@kernel.org>
References: <20250509122452.11827-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for exposing SPMI registers of Apple PMICs as NVMEM cells

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 .../bindings/nvmem/apple,spmi-nvmem.yaml      | 54 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
new file mode 100644
index 000000000000..80b5a6cdcec9
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SPMI NVMEM
+
+description: Exports a series of SPMI registers as NVMEM cells
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,maverick-pmic
+          - apple,sera-pmic
+          - apple,stowe-pmic
+      - const: apple,spmi-nvmem
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    pmic@f {
+        compatible = "apple,maverick-pmic", "apple,spmi-nvmem";
+        reg = <0xf SPMI_USID>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            boot_stage: boot-stage@6001 {
+                reg = <0x6001 0x1>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3cbf9ac0d83f..9936fa9fe87c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
 F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
+F:	Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
-- 
2.43.0

