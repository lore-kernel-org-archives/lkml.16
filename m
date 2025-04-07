Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD2245028;
	Mon,  7 Apr 2025 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029587; cv=none; b=jhMVmLIVgmahhfhJxPXmbnUuRZSfhYmyX9/sa1Qz0VkIKHijE//KN/P8UR/EJXIJONYX+oY7PB0Wz58jPUFBoC+MS7/BKAko1T6Mb8wyTIV30V01IiebVIEr+mNOWIGF5b9Kfc43CiQqRIjSeB93y1x349dZkyIfuW4hNTs2m2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029587; c=relaxed/simple;
	bh=06AK6QCzrNsaSeCaNUjtkIsTuO5Ff1yFycP5j8rIQ+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SMxhPrsD5KaGBsVHx8ddsNVALggF3q5LT8iBXKhzKD5SSq5pMfks8nwaV0a/JJHdM2dBeKHcoPOAjJyVjSDr7c00Ns4++aWdFbEYheGc0ctgJCaWdKmcWyP8RbCu07FpPWLEgCakMadEdHFYhH0ax9QOXzYCDj2wB1c4g3gz+X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10ef566e8;
	Mon, 7 Apr 2025 20:39:33 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 07 Apr 2025 20:38:46 +0800
Subject: [PATCH 1/7] dt-bindings: phy: spacemit: add K1 USB2 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huangze@whut.edu.cn>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744029565; l=1364;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=06AK6QCzrNsaSeCaNUjtkIsTuO5Ff1yFycP5j8rIQ+U=;
 b=+MH2aDlKTFotCOTZXikiqGkLorQrDwaSqn6wMYfOjPhCwXXNRPWZ4rUwPOHEo5CemkiEoQK8/
 o+aENhF7C6LAR018bXmzp9EpK+1oTekInmDmnqqe1Ep5K/78fjSMTK4
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUtOVkpLTEofGEJLS0NKSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-HM-Tid: 0a96104362f403a1kunm10ef566e8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pyo6OCo5AjJKF0wOEhUuGjM9
	LSNPCzNVSlVKTE9PS0lCTkNLTUpJVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUlCQkI3Bg++

Add support for USB2 PHY found on SpacemiT K1 SoC.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ea999cff9c250b144dd049e5ac3c084b22bd56ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC USB 2.0 PHY
+
+maintainers:
+  - Ze Huang <huangze@whut.edu.cn>
+
+properties:
+  compatible:
+    const: spacemit,k1-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@c09c0000 {
+        compatible = "spacemit,k1-usb2-phy";
+        reg = <0xc09c0000 0x200>;
+        clocks = <&syscon_apmu 15>;
+        #phy-cells = <0>;
+    };

-- 
2.49.0

