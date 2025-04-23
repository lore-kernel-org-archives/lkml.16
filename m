Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE82367DF;
	Wed, 23 Apr 2025 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430930; cv=none; b=YSR0n9uAV8dZ4dj6ECOaRzNTo12IstKfgZbnZ+IHh89EfHF7lTsQdWpScXakLBOVGoyKOBCPpswdySYto00dk2g71yh4uPJNnb0kCmRF/TFjFI3+JWPqoK7Y3mTIFKrV5ISLho7YpekAMkaEJGiVoNigbxagi76Ytr65Wtut2uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430930; c=relaxed/simple;
	bh=95GyYaMMhOUhLEkY0YUOEMAKjMNDpx5JgOUzdw6llJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ds539KAWVkge6sQazSZMKlUZV9rrjnD3/OGG7Y8iFh2Ois+05PXwTTXwzhEObY1NcyTX1sHUvd3j/wKfy++jqBvtd4ngatrLYIai1vsD0nlZpm0e2Cw3iJJSXDbBf95P7lVMvv9xuIsdxAYOmyoMFeS5CSBwwCGOwDE/KaEZvpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHs4nsQ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHs4nsQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0414DC4CEEA;
	Wed, 23 Apr 2025 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745430930;
	bh=95GyYaMMhOUhLEkY0YUOEMAKjMNDpx5JgOUzdw6llJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GHs4nsQ61Ly2uCyMngdELu/v3V+ZlxOZuLakNPwJ4IUVrM1XS8/9quJsNO/EBOWHh
	 TJfcvU0ZiC3kxwl0bE53hme9tifz0iDmwVfLMwvfVDGloFBhdh1PDL826ZoYvmwjbZ
	 DgGWgDrSpPJjrKZEs4RgaYp9QZqcnzsJ2CDZIGadrE2liY76XOG9HxEeqI/5LqaSA4
	 /Un9L7sUZN1/bYJ5okw9fmz3EHye73XUzmUqNanuwMF3YufPMGwbFjcHYhdW8AEHXX
	 MwTcIZmSqMf8s7w9fYMZNPhPvtNNqaTdO+V5xeEmVjraj5ujvedwa7t3J2QioPuVTu
	 aTTNYPiUiBwhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F82C369D3;
	Wed, 23 Apr 2025 17:55:29 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 23 Apr 2025 19:55:13 +0200
Subject: [PATCH v3 1/3] dt-bindings: spmi: Add Apple SPMI NVMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-spmi-nvmem-v3-1-2985aa722ddc@gmail.com>
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745430928; l=2603;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=EOBP3/6Xq4lPlQdYDYaxZLEyni+8kaQhO4JuDxWVIpA=;
 b=mj4HNQR5aytv5l7hHefmxiR1avN1zBOqmCF3exgY6qJZC54rZ+d7n2l8vHNqLIAXmfKNZb3Zk
 FTdkXhhhwR6C9eY2SlMb3QfsIxwsum+0J3MaW2JRjXP9gzimxmp+PRS
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for exposing SPMI registers of Apple PMICs as NVMEM cells

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../bindings/nvmem/apple,spmi-nvmem.yaml           | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..80b5a6cdcec91c8eed8b66f745e91ee07ba9683d
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
index 96b82704950184bd71623ff41fc4df31e4c7fe87..f462545c54c55d4bdc22651e07a4c8e155e83016 100644
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
2.49.0


