Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15E02153CC;
	Fri, 28 Mar 2025 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160500; cv=none; b=qQxsLaNUGDjzwnoA1arNtUIcc4LoKT3SCd7Q8wGHaFyqUGYagLaVconfiYyOCsk7SGZ0kv4IXH1KuGE9bfee9rUuq6Af34L2C+9WzT1EwAu66pkWDm/z+GhDSkpv7WnCK1CgtStvFRk7im62JoLI0pTzWP2DThc3fXKWMz6dM4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160500; c=relaxed/simple;
	bh=c8PflC4vJZ5WYU5Sr0EuanKahV5jSPFm6ghsEgu12wI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pq5CMsxnKoUvCaErzCO7uuU2lxY09SJMngwWSWyPvJIIpsQGYTI6CQBqV9WHV9gCfal5IrrSvdFrWHz/N8wB5IHOgUf7qA9fBjdCnH8y6QxgpP36CvTSZpOvuMHFERvG/gGqL/prL8LD+8baccgFNXvJkoFL8TnKlccohlMBhIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=zEPOx7g+; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zEPOx7g+"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBElqm2764921
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 06:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743160487;
	bh=ab6YDwd9m1vECnp5VMXzGhHMMce0Codn+wpuzQzyDpk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zEPOx7g+jI+FQcCSOjrxWULrLHofgALpzgIMGNkIbYbEkMH8SHn4AF3i8f71jfrrj
	 Lx3rfikDsmcCQNGpEQ8iZkVXk6HHwGs30jMReDKNWUq8W1rZdncNf1bTWNYk4moFFH
	 WcV612VSEVcu60SIRNS5rgaOE2FHVFZrJIiiSkgc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBElZu013902
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 06:14:47 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 06:14:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 06:14:47 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SBEeIq029420;
	Fri, 28 Mar 2025 06:14:44 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: soc: ti: bist: Add BIST for K3 devices
Date: Fri, 28 Mar 2025 16:44:38 +0530
Message-ID: <20250328111439.374748-2-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328111439.374748-1-n-francis@ti.com>
References: <20250328111439.374748-1-n-francis@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Document the binding for TI K3 BIST (Built-In Self Test) block.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
new file mode 100644
index 000000000000..f714a1fc550a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,j784s4-bist.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 BIST
+
+maintainers:
+  - Neha Malcom Francis <n-francis@ti.com>
+
+description:
+  The BIST (Built-In Self Test) module is an IP block present in K3 devices
+  that support triggering of BIST tests, both PBIST (Memory BIST) and LBIST
+  (Logic BIST) on a core. Both tests are destructive in nature. At boot, BIST
+  is executed by hardware for the MCU domain automatically as part of HW POST.
+
+properties:
+  compatible:
+    const: ti,j784s4-bist
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ctrl_mmr
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ti,bist-under-test:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      the device IDs of the devices under test control of the BIST device, the
+      number of devices may be more than one. The HW logic will trigger the
+      tests on all of these devices at once.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,bist-under-test
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        safety-selftest@33c0000 {
+            compatible = "ti,j784s4-bist";
+            reg = <0x00 0x033c0000 0x00 0x400>,
+                  <0x00 0x0010c1a0 0x00 0x01c>;
+            reg-names = "cfg", "ctrl_mmr";
+            clocks = <&k3_clks 237 7>;
+            power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+            ti,bist-under-test = <343>, <344>, <365>, <366>;
+        };
+    };
-- 
2.34.1

