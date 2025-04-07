Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C849323BD18
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024409; cv=none; b=IlVkyHzzCooBtXdKAKVlziE+uGBRRUwCvZ/ugbsn5r5xr1pIDItsPmywIbHIk7TnxEAPTrothYipHjM8naIH13mgpg1ljVl14clWRmO99XcFuCMeYwuAUjRcxcGiAE36NS1ChHL2WmZGY3BiU6SRx23+bd31KSzkimKUl03lv8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024409; c=relaxed/simple;
	bh=9K/38m1kgKRw+v83ZaslKQEga3gdg8jIEJvsu8WdanE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ToPKNFPamYNJUTJktNv8G8AJvtIRgeadJhX6C/Fl/kVcPFABNFyzTP5Vz1CO/u7QprThEq3ONHgQJapsRXfGyk/dPf/FgT8R2eLseFeZi2HncKEnFD8U8+z7BkbeO4ihXQpuJFzsvDlIHsb1SxKi5HeH2N2ZE0tQqtteSKrbCns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 537AoAi2002089
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 18:50:10 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 537Anj3v001585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 18:49:45 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 7 Apr 2025
 18:49:45 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <tim609@andestech.com>, "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH 4/9] dt-bindings: interrupt-controller: add Andes machine-level software interrupt controller
Date: Mon, 7 Apr 2025 18:49:32 +0800
Message-ID: <20250407104937.315783-5-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407104937.315783-1-ben717@andestech.com>
References: <20250407104937.315783-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 537AoAi2002089

Add the DT binding documentation for Andes machine-level software
interrupt controller.

In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
second time with all interrupt sources tied to zero as the software
interrupt controller (PLICSW). PLICSW can generate machine-level software
interrupts through programming its registers.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../andestech,plicsw.yaml                     | 48 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
new file mode 100644
index 000000000000..5432fcfd95ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/andestech,plicsw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes machine-level software interrupt controller
+
+description:
+  In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
+  second time with all interrupt sources tied to zero as the software interrupt
+  controller (PLIC_SW). PLIC_SW can generate machine-level software interrupts
+  through programming its registers.
+
+maintainers:
+  - Ben Zong-You Xie <ben717@andestech.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - andestech,qilai-plicsw
+      - const: andestech,plicsw
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 15872
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    interrupt-controller@400000 {
+      compatible = "andestech,qilai-plicsw", "andestech,plicsw";
+      reg = <0x400000 0x400000>;
+      interrupts-extended = <&cpu0intc 3>,
+                            <&cpu1intc 3>,
+                            <&cpu2intc 3>,
+                            <&cpu3intc 3>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a0ccac1cca29..645d7137cb07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20728,6 +20728,7 @@ F:	include/linux/irqchip/riscv-imsic.h
 RISC-V ANDES SoC Support
 M:	Ben Zong-You Xie <ben717@andestech.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
 F:	Documentation/devicetree/bindings/riscv/andes.yaml
 
 RISC-V ARCHITECTURE
-- 
2.34.1

