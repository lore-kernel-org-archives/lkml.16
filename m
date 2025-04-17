Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D6C202C36;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744920894; cv=none; b=oMEasi75HFkX2Bu0+2pJGDabJtUxE77uNmi7FJbzq15iL4jf1peN+m7P4pln5KscKLawzCGUPNlWFEwk/IwfA1WO/vQV/gPQDesawSeTzpH0echp7b8OnH3LFFlq5EfWDVAYF3kwZDhBblhlVFqQV5EjH7x4z9l6iw+XuWxeFC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744920894; c=relaxed/simple;
	bh=aMdEh0YzLhR0ClRxPLS5MigjInPEcB5sd9INEKNsS88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bgtid/YLNSsoT02aMRUEdIcIosvgEF7qSlbzOMpxdbtR6ehB/rsKLr59pXLNQSzLRXszCLcxFVysSWgu76+A8/2kZYmzxLWyPqRmSX6BU5rXbswSGEqSVTCeJ8HChS3UzP58IaHlt+5wfE4R+4FuQyHOYXmzVWd6910GR9Tvopw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIx9Dsuh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIx9Dsuh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D49EC4CEEA;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744920893;
	bh=aMdEh0YzLhR0ClRxPLS5MigjInPEcB5sd9INEKNsS88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EIx9DsuhfuFuwmHju7KgUg3LgdojFfQ6201BXFB78CUJ3NVL1Mw0QxfQMq3tMPgUC
	 aJXjFcGZhU5GQI71AcIVlJaEvCjX8Y87c/OkjrOfnvcy3DJ+EwlWuf/mSKeYPFuNzI
	 q0jVrTPWG0K+GHHNKoiCqpSD0jMbK+uh3nVCFbmgDo14JzpIqM66U3nkFWpxxjYlGx
	 tQcsDZs+8DTQo0d29sg41oterajbSFdplWu4KDStMoIn6XmR0Xg8HM80Q9PC+Qf8VG
	 W4zj8MSlQgBQmhGdpCR2z4Gp3fBo0OcTTOElM8Q3LlI64Kg8Ypzw8LVf5bYnnAYVJ2
	 7DcT2DdwNqL9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CFCC369CA;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 17 Apr 2025 22:14:49 +0200
Subject: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
In-Reply-To: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744920892; l=2493;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=qFT9kwFfU2f7bD/dtTWCsGgokdHWxW+ICVtDXhupydE=;
 b=7IzgqtLCTQW165We2ILZabYySsAbC1WMcO6dkhnI7toHak+Agj/KAjWbRRLLMVuRpw6guwkRE
 oiqh8S7uXCKAe+ZjaHXP/rZjUDEKFY1nnujyaguKlLQa72zBDU45qgE
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for exposing SPMI registers as NVMEM cells

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d16b27128f97b5d38fb6ddb5109c70cda5e2ee15
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spmi-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic SPMI NVMEM
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
+      - const: spmi-nvmem
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
+        compatible = "apple,maverick-pmic", "spmi-nvmem";
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
index 96b82704950184bd71623ff41fc4df31e4c7fe87..e7b2d0df81b387ba5398957131971588dc7b89dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
 F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
+F:	Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*

-- 
2.49.0


