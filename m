Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F94414;
	Sun, 25 May 2025 07:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748157519; cv=none; b=GUVge47mIUMtD99ngYXkcvvEP08YPxi0M63cl2jF0tYJEoRZXu2uH9aOzZUIlhSwmBkBaTFZwZr8FPOaUW5UUwyYSacb9PTa1fvtxTgG6WgxQg0UO/CePWzB9+nNZEehTQBuqBkhUsLX2tulWo+uSsETMV7QYRPS0HOMzVkiIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748157519; c=relaxed/simple;
	bh=tVfmxhBLic2AHhDb7smwYOVHaGdcVFL71B/YxZoa0tc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MIFmNLLvNqZZe7uJrgx8Ni5VGtAJp/UVyjKckVzcP/8BFOuIxuAOb1cKS+Le3r5NRihTykSxoB5xCHIkDnvEixHw6qT4/nfPeDivB2VMrnLXH7of7I+4vovEPyXP6VTo6rFo7bAME41eI8Jdpm/FMAu0vco09E0vp1baNwe0QNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 25 May
 2025 09:18:28 +0200
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Sun, 25 May 2025 09:18:28 +0200
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: regulator: add pca9450: Add regulator-allowed-modes
Date: Sun, 25 May 2025 09:18:20 +0200
Message-ID: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make the PWM mode on the buck controllers configurable from devicetree.
Some boards require forced PWM mode to keep the supply ripple within
acceptable limits under light load conditions.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
Changes in v3:
  - Fix typo in the examples
Changes in v2:
  - Add the header to the binding patch
  - Improve commit message

 .../regulator/nxp,pca9450-regulator.yaml       | 14 ++++++++++++++
 .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 include/dt-bindings/regulator/nxp,pca9450-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index 4ffe5c3faea07..a5486c36830f0 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -100,6 +100,15 @@ properties:
               PMIC default "STANDBY" state voltage in uV. Only Buck1~3 have such
               dvs(dynamic voltage scaling) property.
 
+          regulator-allowed-modes:
+            description: |
+              Buck regulator operating modes allowed. Valid values below.
+              Users should use the macros from dt-bindings/regulator/nxp,pca9450-regulator.h
+                0 (PCA9450_BUCK_MODE_AUTO): Auto PFM/PWM mode
+                1 (PCA9450_BUCK_MODE_FORCE_PWM): Forced PWM mode
+            items:
+              enum: [ 0, 1 ]
+
         unevaluatedProperties: false
 
     additionalProperties: false
@@ -143,6 +152,7 @@ allOf:
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/nxp,pca9450-regulator.h>
 
     i2c {
         #address-cells = <1>;
@@ -179,6 +189,8 @@ examples:
                     regulator-max-microvolt = <3400000>;
                     regulator-boot-on;
                     regulator-always-on;
+                    regulator-initial-mode = <PCA9450_BUCK_MODE_FORCE_PWM>;
+                    regulator-allowed-modes = <PCA9450_BUCK_MODE_FORCE_PWM>;
                 };
                 buck5: BUCK5 {
                     regulator-name = "BUCK5";
@@ -186,6 +198,8 @@ examples:
                     regulator-max-microvolt = <3400000>;
                     regulator-boot-on;
                     regulator-always-on;
+                    regulator-allowed-modes = <PCA9450_BUCK_MODE_AUTO
+                                               PCA9450_BUCK_MODE_FORCE_PWM>;
                 };
                 buck6: BUCK6 {
                     regulator-name = "BUCK6";
diff --git a/include/dt-bindings/regulator/nxp,pca9450-regulator.h b/include/dt-bindings/regulator/nxp,pca9450-regulator.h
new file mode 100644
index 0000000000000..08434caef429f
--- /dev/null
+++ b/include/dt-bindings/regulator/nxp,pca9450-regulator.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Device Tree binding constants for the NXP PCA9450A/B/C PMIC regulators
+ */
+
+#ifndef _DT_BINDINGS_REGULATORS_NXP_PCA9450_H
+#define _DT_BINDINGS_REGULATORS_NXP_PCA9450_H
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define PCA9450_BUCK_MODE_AUTO		0
+#define PCA9450_BUCK_MODE_FORCE_PWM	1
+
+#endif
-- 
2.39.2

