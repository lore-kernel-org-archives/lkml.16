Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF79B20DD47;
	Sat,  5 Jul 2025 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720523; cv=none; b=u0W9BlkC7TO1x7x3AQRZ0M2TDKkmyf9ZuEmYaUsvKEIEgkUaOLg/QigAnHMF7qhGBG2p36LK2UproaFHr6qawf6ldK68mRLnVb8a2AZpE8vJ8kGRLMVYNRE6OiRXrH0zR+fn7ujYJyCNWvBOXlvp/hctTkWVgEvkMCVFzRTWTkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720523; c=relaxed/simple;
	bh=ClEZVwhmbkNN+DYn4N/u/hmThZk0uTkhPgmsjHGbk/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCLxi6BKP3UT5xWhIdL/9yv50MEMsJ7bmIdIedlFsq3/yHTOt5v2fEBwOZGdEMZOcv13S8VeHCpIn6bIepPVFYeXvnxZoyCrXDbQJRGMlYRyw/+ZkxAV6R7ViJXGGHv5DDy0EM3a+J29Kr6/80eJAIl1lr6mrAjUwhFAU29N8jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jGc9BlwX; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jGc9BlwX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751720518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbwQTtgBBjV1PrfOsd92CG44T6/rae0SpShqAS13m7Q=;
	b=jGc9BlwXBe+isXmogOgcp3BKCMmBTbTFTV/qgavtbQN8KhNx0KLvtRAulA4p8dTjzVz+cd
	FoXcm/9r06qUMBSHRXhu/17U6GQDw8PaPpm+Vz2HGC7bBrSIjMnJkME90gQdFoXeoGtkAa
	bFbXBrKM9sS6x3yQOzY8jmQBzePGOMc=
From: Ze Huang <huang.ze@linux.dev>
Date: Sat, 05 Jul 2025 21:01:25 +0800
Subject: [PATCH v5 1/2] dt-bindings: usb: dwc3: add support for SpacemiT K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dwc3_generic-v5-1-9dbc53ea53d2@linux.dev>
References: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
In-Reply-To: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huang.ze@linux.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751720506; l=3493;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=ClEZVwhmbkNN+DYn4N/u/hmThZk0uTkhPgmsjHGbk/M=;
 b=OqKB6TRsZZ1U5MkWADMzwiSSFDdpN3tgEDaGwFid3eJwJ919oPhdDqAN5z9opFO9hJGVX+p7W
 mqQZFsmKZnSAeii0xM+wHgIUfpYVTrSdl7Dr/MJJWr/jM11rzmpmcIP
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
in the SpacemiT K1 SoC. The controller is based on the Synopsys
DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
DRD mode.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c967ad6aae50199127a4f8a17d53fc34e8d9480b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
+
+maintainers:
+  - Ze Huang <huang.ze@linux.dev>
+
+description: |
+  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host functions
+  for USB 3.0 and DRD for USB 2.0.
+
+  Key features:
+  - USB3.0 SuperSpeed and USB2.0 High/Full/Low-Speed support
+  - Supports low-power modes (USB2.0 suspend, USB3.0 U1/U2/U3)
+  - Internal DMA controller and flexible endpoint FIFO sizing
+
+  Communication Interface:
+  - Use of PIPE3 (125MHz) interface for USB3.0 PHY
+  - Use of UTMI+ (30/60MHz) interface for USB2.0 PHY
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: usbdrd30
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    items:
+      - description: phandle to USB2/HS PHY
+      - description: phandle to USB3/SS PHY
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  resets:
+    items:
+      - description: USB3.0 AHB reset line
+      - description: USB3.0 VCC reset line
+      - description: USB3.0 PHY reset line
+
+  vbus-supply:
+    description: A phandle to the regulator supplying the VBUS voltage.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@c0a00000 {
+        compatible = "spacemit,k1-dwc3";
+        reg = <0xc0a00000 0x10000>;
+        clocks = <&syscon_apmu 16>;
+        clock-names = "usbdrd30";
+        interrupts = <125>;
+        phys = <&usb2phy>, <&usb3phy>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&syscon_apmu 8>,
+                 <&syscon_apmu 9>,
+                 <&syscon_apmu 10>;
+        vbus-supply = <&usb3_vbus>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub_2_0: hub@1 {
+            compatible = "usb2109,2817";
+            reg = <1>;
+            vdd-supply = <&usb3_vhub>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 3 28 1>;
+        };
+
+        hub_3_0: hub@2 {
+            compatible = "usb2109,817";
+            reg = <2>;
+            vdd-supply = <&usb3_vhub>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 3 28 1>;
+        };
+    };

-- 
2.50.0

