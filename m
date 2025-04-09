Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A91A21A435;
	Wed,  9 Apr 2025 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235554; cv=none; b=Dy3uKEaRIX0hy7v32+qs/kkyb4B9NAfEjxVU8DNwG952oNf7LmI9c2qMIrW1/vmfVm0/UTq69bSz1KHKFgyRbdueJSsqVTM/u0/VzssZcHnvaDYe7WmZIr3QAbxx/oQdJRCtXCCDV1RSf16z8T8QzaSOnecLyKeuKgoi4PSGuqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235554; c=relaxed/simple;
	bh=58+w0lhd+J1mGi9AuOWwOwmXB6IzavnsSwQ2CK9L2aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgOsh0TEbScHXeRD9BUGdqSIdujtZdvxIaJuc3NAbGAWyZFhxsRPgrQ2jjrwQkaISSjUozWMdBzOQL2VEaREEyT2NjDuSbKBO+VqtTDaL+nSgZA7CFVOQ3C0+/WiJPaeVT9f6B2q3tRxUhxLDFDAd8Rd3zclfm8MHjlrNUMzsXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjjcXZuq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjjcXZuq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D397CC4CEE2;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744235553;
	bh=58+w0lhd+J1mGi9AuOWwOwmXB6IzavnsSwQ2CK9L2aI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IjjcXZuqo2a7giHXOCyU7SSYrrF7tC7M3yBKQUFPkfkfZ1FQRpPkZsCz+ICpl7zI6
	 vrUoW0nRy6E1QKKASKUvrRFQs3M8ad4EQE5X6dAOZbT+mbiQBSD8TN5iNz7KIMZ2lI
	 e2syZt/RagThC6m5gdzfQb+TSQ3FAAQaokPBQxe+a1f3ppJ6FVbOy/QZ7neRwbO1KQ
	 vJjNtwSW3REmRrq+NeNRfMAUOoPNAUuNuJQzq49IwpOHsAFwS/kHXimL/dLWvPHJ0X
	 rkg+B+lutN9Yus6iQQjUZxyI56ZgEIoDX4tnI5Mh1bEu1ua/CtS1fTS4XZZ/AILWab
	 KqDaZBZ6tS6QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0A4C369A2;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 23:52:12 +0200
Subject: [PATCH v4 1/3] dt-bindings: spmi: Add Apple SPMI controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-spmi-v4-1-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744235551; l=2425;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=zl8cAzlIaOxUvOq3GfN8ra0zdMLJS6X1fL7CB5qh1Fo=;
 b=iG3+aBox6UlVraYoVxIUbfXcpwfTTfLIUW2EZkGMOQ+VEe20sGyDmFBR4Vt/Kw1EGLDZhmFwN
 qu15DziQmh8AWJtVuLlx4RskGTk8SdL+tZsR6Dzpcpl6OnZt17Q8SV3
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for the SPMI controller present on most Apple SoCs

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../devicetree/bindings/spmi/apple,spmi.yaml       | 49 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..16bd7eb2b7af2c0b176f0e5b1970f4670af691da
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/apple,spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SPMI controller
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: A SPMI controller present on most Apple SoCs
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-spmi
+          - apple,t6000-spmi
+          - apple,t8112-spmi
+      - const: apple,spmi
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
+    spmi@920a1300 {
+        compatible = "apple,t6000-spmi", "apple,spmi";
+        reg = <0x920a1300 0x100>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+            /* PMIC-specific properties */
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..5f348736ea0bbdb83fe541c872103ce4835de40b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2282,6 +2282,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
+F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c

-- 
2.49.0


