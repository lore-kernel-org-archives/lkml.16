Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C47295528;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151247; cv=none; b=fG0yOHLRy0B/K5xdJ48AGlBNxnVnFf0EadZyZGpbVzbZfNIdooDMFAufGSCxYc4hJeFF7+PWvW993uNBsjYPtXcSSlFk/mSFnTX5tdGJCYD1DlfliKLoO7pa0jgchM5JMzm28/lqE2+FenYQEFuuna6agH/NgtxnjPdA0xbZNkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151247; c=relaxed/simple;
	bh=LVht+9sV1xKC2IxkJr8nOMxbiinkz8Wotsr17dJSVnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcDFmtmxF/Nyozv3VRKaJlHZkqA2A5pp22pBpGZyaTAANS92Xc9PmHC5gw1jIbFAhdbyd4ihdvx5VRj0BzmOBceKL/imjOFpbWb0Xzd0vkLpEh/zdtFzaJkfHFrLBrvEzDqNzR6wZitFHU6e+BI2rZ1AM+rjzJGmF4cEAzBvBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiJ643pW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiJ643pW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A278C4CEF4;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=LVht+9sV1xKC2IxkJr8nOMxbiinkz8Wotsr17dJSVnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZiJ643pWiECMkR4MlVHS3tyl/tyLl4SqhSFwISTvAVoEu3JdQ1oYlBlC9hyRkuE0D
	 0XjTVwjdHLHic4zB2ZniOX6tnkjI9dWw+WERPDzFmjBScn96AiSqY1kdxa/IXMy5GI
	 tR/IQWFxuvNgPE/cK75DD1/UErcS2zH5n5h7xe6Z1lRfPQ06TGlfMNyMkU+5uQJsU4
	 WBOx/s6HdEJ3DNP7Pdm+R4oF48hUmJ275RSvACpD/UQ5LEUm9eKqCEFd/RCbxNja1f
	 9IgR0Oo8t4/kF07HafW640oIG7OtFcSwOjpqquDyyihonS3vzniMwB6qBa0mhG0Bwi
	 GpUMTkoLkmnHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A05BC7115A;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:43 +0200
Subject: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=2895;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=fLuP6l4pge2OTjFyNlRHCdovdOVbah0f1mpcQE7Vn4A=;
 b=iM0cTXpH/DwAzcZlyAonVYAbPzQZPRRtV6DKJjpdidZlu4LHinT+I+CdhJ85/XpAL9xC1JBDF
 /7tnNDJymhMAFmqdlEvoCE6njPm3L1Br/wa3FmtQfRJOviM+mrtKQlx
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
Add the variant and allow for the additional reset.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 5ac994b3c0aa..6755738b13ee 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3326-csi-dphy
       - rockchip,rk3368-csi-dphy
       - rockchip,rk3568-csi-dphy
+      - rockchip,rk3588-csi-dphy
 
   reg:
     maxItems: 1
@@ -39,18 +40,49 @@ properties:
     maxItems: 1
 
   resets:
-    items:
-      - description: exclusive PHY reset line
+    minItems: 1
+    maxItems: 2
 
   reset-names:
-    items:
-      - const: apb
+    minItems: 1
+    maxItems: 2
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Some additional phy settings are access through GRF regs.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-csi-dphy
+              - rockchip,rk1808-csi-dphy
+              - rockchip,rk3326-csi-dphy
+              - rockchip,rk3368-csi-dphy
+              - rockchip,rk3568-csi-dphy
+    then:
+      properties:
+        resets:
+          items:
+            - description: exclusive PHY reset line
+
+        reset-names:
+          items:
+            - const: apb
+
+      required:
+        - reset-names
+    else:
+      properties:
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
+
 required:
   - compatible
   - reg
@@ -59,7 +91,6 @@ required:
   - '#phy-cells'
   - power-domains
   - resets
-  - reset-names
   - rockchip,grf
 
 additionalProperties: false
@@ -78,3 +109,22 @@ examples:
         reset-names = "apb";
         rockchip,grf = <&grf>;
     };
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi_dphy0: phy@fedc0000 {
+            compatible = "rockchip,rk3588-csi-dphy";
+            reg = <0x0 0xfedc0000 0x0 0x8000>;
+            clocks = <&cru PCLK_CSIPHY0>;
+            clock-names = "pclk";
+            #phy-cells = <0>;
+            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
+            rockchip,grf = <&csidphy0_grf>;
+            status = "disabled";
+        };
+    };

-- 
2.39.5


