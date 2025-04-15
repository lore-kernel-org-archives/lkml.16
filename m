Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3824C095;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753963; cv=none; b=jp6+AZzqR3/Z5whovKZnFqQj5mWHxZk8YeOYalkprifEcP+kXaXKIOqJe5XBNdMfa/x5026QxlnaoVWbXPMU4R6BylSriRCFlBn+DEI8bvXw6f7DsjG4xukjVrHkjZpoBs+qBfOPSBy2IjfBF6T2VVWIPPhWRV31OIQwyh4TrI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753963; c=relaxed/simple;
	bh=wfntpCJd/e5roM+54wRFN7CgYmeIDo3y6frBznii81c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AroypQfXYfaBDZCgYcnN63WivEc0+cYDrPKgk1wZjbLOtjgqV/d+AztX2bV8kmfRxSv9AsJWiiPeRO0kJPF8NuiU0fxdIQOHF8238QC4DRrQvLVxiQ37nop9o+ZPQiGFR+vrCwJ61dBT31T2yBShs3sH0si71bBAWbMq3FRiDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKhQLP6F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKhQLP6F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82C7AC4CEEB;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753963;
	bh=wfntpCJd/e5roM+54wRFN7CgYmeIDo3y6frBznii81c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eKhQLP6FH7xmcUyckmyjejCwflDtvSAli4tTNgAZ+aBAlUsHToD25NrJuJU+e3udZ
	 r40l9Qfi4TCmgk0pQ9z+CIX6bgDzYw1cmG/wQBCwEPx5xp78EyAcx8KElYzDmVYfLL
	 lysGeEPwHjH9mFqlhOjLZbIdzJYSSyhzIAcWmeRjHJDYi+I8a6APETeTlc7qeiUMqK
	 SV3beJlcx2XRY5xu5smvyLt5iwmYreb2Yh0GM9cJPUWBbWNGhZQu87ZF+QB/dK180B
	 NqnVI4iOviuRosjQgQ9ZiF/j2kMgpp5AXdIv7pVlUDNZy2tQRkBl63ET78aV/nWu/4
	 /mnX4gui5bMHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72187C369AB;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 15 Apr 2025 23:52:34 +0200
Subject: [PATCH 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744753962; l=2233;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=591KYbP5CwVkqQ6YYbLbnzAujw1V85G/WXwDPpVeG5A=;
 b=dtHz27lt85WFhI+s2T92MhW7ImjxiLCLFGTibgzijQjFJYGkCw1YoJ6DMIPShYH1XV08HvqP6
 vT8H80dEvlNDXgEm50C3wLDnRILWCNSnLf4fl0U5MKN3bFeT8X5KjrN
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
 .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 44 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0041babefc37ed4d82d7d6f68fc67d29eed53d9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
@@ -0,0 +1,44 @@
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
+          - apple,maverick-pmu
+          - apple,sera-pmu
+          - apple,stowe-pmu
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
+    pmu@f {
+        compatible = "apple,maverick-pmu", "spmi-nvmem";
+        reg = <0xf SPMI_USID>;
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


