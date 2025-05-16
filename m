Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10C9231821;
	Fri, 16 May 2025 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389234; cv=none; b=NiAd744GkSyaJ+6dxQOQyEHS9zhEwcIlb0FcUyDAG9ISJEbmL+bxvYNtKnIOi7YtvBuWIH/C5PvR/R9oWpPBHQ6m0FFbayRgOf0gPS5BE1Y18u5hj+Sxs0GfGYc54B3tCrPhYyR7Lq8NSheQMjLgMyLtcnrS0krUAHDnyUBc2E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389234; c=relaxed/simple;
	bh=bCqTG1438dYtVjz6t2eraDVHWLpId1AIgdo8T587GWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWZTZbEv74wdt7G7k0232Z0YTZW6NmyeIUoHvB/G4VBHC7fcHWAVRj+P9jJ6DbRckADrQBCU3fGEuPsyxEGxoBzuZrxGWcBfsUxLCLtI3gGCdrsvkuj35cLgrb3q7DPnRXkIebLBKckOVLnJzoGU9kYXJXH5iDGsr8l9wggKhE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0004758DT.eswin.cn (unknown [10.12.96.83])
	by app2 (Coremail) with SMTP id TQJkCgDXaJIkCydol9V8AA--.41163S2;
	Fri, 16 May 2025 17:53:42 +0800 (CST)
From: zhangsenchuan@eswincomputing.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	yangwei1@eswincomputing.com,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Subject: [PATCH v1 1/2] dt-bindings: usb: Add Eswin EIC7700 Usb controller
Date: Fri, 16 May 2025 17:53:37 +0800
Message-ID: <20250516095338.1467-1-zhangsenchuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
References: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDXaJIkCydol9V8AA--.41163S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1kWr45Kr4kKF1UCFyfJFb_yoW5tr43pa
	93CrW0qr4fXF1fXa18WF10kan3J3Z3CF18Cr92yw17trnaqa4Fqw4akFy5Wa4UCr1xZ34a
	gFWYv3yftw47C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeZ2-DUUUU
X-CM-SenderInfo: x2kd0wpvhquxxxdqqvxvzl0uprps33xlqjhudrp/

From: Senchuan Zhang <zhangsenchuan@eswincomputing.com>

Add Device Tree binding documentation for the ESWIN EIC7700
usb controller module.

Co-developed-by: Wei Yang <yangwei1@eswincomputing.com>
Signed-off-by: Wei Yang <yangwei1@eswincomputing.com>
Signed-off-by: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
---
 .../bindings/usb/eswin,eic7700-usb.yaml       | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
new file mode 100644
index 000000000000..eb8260069b99
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/eswin,eic7700-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Eswin EIC7700 SoC Usb Controller
+
+maintainers:
+  - Wei Yang <yangwei1@eswincomputing.com>
+  - Senchuan Zhang <zhangsenchuan@eswincomputing.com>
+
+description: |
+  The Usb controller on EIC7700 SoC.
+
+properties:
+  compatible:
+    const: eswin,eic7700-usb
+
+  reg:
+    maxItems: 3
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: peripheral
+
+  clocks:
+    maxItems: 3
+    description: handles to clock for the usb controller.
+
+  clock-names:
+    items:
+      - const: suspend
+      - const: aclk
+      - const: cfg_clk
+    description: the name of each clock.
+
+  resets:
+    description: resets to be used by the controller.
+
+  reset-names:
+    items:
+      - const: vaux
+    description: names of the resets listed in resets property in the same order.
+
+  eswin,hsp_sp_csr:
+    description: |
+      High-speed equipment control register.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  ranges: true
+
+  dma-noncoherent: true
+
+  numa-node-id:
+    maximum: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - interrupt-parent
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - eswin,hsp_sp_csr
+  - dma-noncoherent
+  - ranges
+  - numa-node-id
+
+additionalProperties: false
+
+examples:
+  - |
+    usb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usbdrd3_0: usb0{
+          compatible = "eswin,eic7700-dwc3";
+          #address-cells = <2>;
+          #size-cells = <2>;
+          clocks = <&clock 270>,
+                   <&clock 545>,
+                   <&clock 546>;
+          clock-names = "suspend","aclk", "cfg_clk";
+          eswin,hsp_sp_csr = <&hsp_sp_csr 0x800 0x808 0x83c 0x840>;
+          resets = <&reset 0x07 (1 << 15)>;
+          reset-names = "vaux";
+          ranges;
+          numa-node-id = <0>;
+          status = "disabled";
+          usbdrd_dwc3_0: dwc3@50480000 {
+            compatible = "snps,dwc3";
+            reg = <0x0 0x50480000 0x0 0x10000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            interrupt-parent = <&plic>;
+            interrupts = <85>;
+            interrupt-names = "peripheral";
+            dr_mode = "peripheral";
+            phy_type = "utmi";
+            maximum-speed = "high-speed";
+            eswin,hsp_sp_csr = <&hsp_sp_csr 0x1044>;
+            snps,dis_enblslpm_quirk;
+            snps,dis-u2-freeclk-exists-quirk;
+            snps,dis_u2_susphy_quirk;
+            snps,dis-del-phy-power-chg-quirk;
+            snps,parkmode-disable-ss-quirk;
+            status = "disabled";
+            numa-node-id = <0>;
+            dma-noncoherent;
+          };
+        };
+    };
-- 
2.25.1

