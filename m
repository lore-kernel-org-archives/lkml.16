Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749B1F4CB2;
	Thu,  5 Jun 2025 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105330; cv=none; b=LnjjROOVeIAsuD4tviTvyefgHjRBfEJDTcMcV+3fXyTAfqbeU4PGsxF3TQSs75Q89hkMADk3Plr7U29czoVl1wdVPUNrb+A/zWYLyK/gw9QeZNW+g6bmJZMOGmRdsdyIj2Xo9SlvHEF9adp/5RygX1h0ezvzl84q6iVBzQojUMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105330; c=relaxed/simple;
	bh=ZJuuSfRbNuq0z7gSinlL+Y01t6POZtQPkzIccMqJB1s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wu4YA1Ii3dGGCYWSMt87sWTr6b+FiyUdizpJxrngEsohcWsRBU9SS7BzN53WVPEFE7juuOyFdJManRe1KuKoE8KyEjxxWUdptdEBdVUC3t0LybosTSiSmpm8GQgoLS8RKZRI3PcUltRYzehcideoO01xQqjlptEP20XXNKUn2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T2LNqz+h; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T2LNqz+h"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556ZFPm1031508;
	Thu, 5 Jun 2025 01:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105315;
	bh=8bbn5Q3XSuNaGGEOu1W5P3SYFc2Dd2MiUKvE+QwaI/c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T2LNqz+hLs0EGw+wDrULIgS6CMdi2rxI7/A2VLKwYiDf6UwA0OXak9hrs18YTHL2R
	 ObelECI/VRXx8+6VUTsW+rnzznTdSZxzW/fVwWxMAZrLXgJCV4lazSy1bQzr2oGaFJ
	 tW6OoED8Awi4BmwrBwnLAKqYYrM5oBT61vHuZRFU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556ZFXi948576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:35:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:35:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:35:14 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556Z7VZ3168702;
	Thu, 5 Jun 2025 01:35:11 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v4 1/2] dt-bindings: soc: ti: bist: Add BIST for K3 devices
Date: Thu, 5 Jun 2025 12:05:05 +0530
Message-ID: <20250605063506.2005637-2-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605063506.2005637-1-n-francis@ti.com>
References: <20250605063506.2005637-1-n-francis@ti.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
No change since v3

 .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
new file mode 100644
index 000000000000..a73691cf5624
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
@@ -0,0 +1,63 @@
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
+allOf:
+  - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
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
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,sci-dev-id
+
+unevaluatedProperties: false
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
+            ti,sci-dev-id = <234>;
+        };
+    };
-- 
2.34.1

