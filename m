Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DA2DE6FC;
	Wed,  2 Jul 2025 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493748; cv=none; b=cweVd0FwDnczKgI3jbfQn8DOqY7QjJGEO0pB3qerKN2qj8CDsy73n6R9sfNicG9rfV08pcXreQVBMuadsmuMXs5JaT/hfcfaLB4aYWa83XXuXOxld3gSkldLfJU3NajhbP1xtkGNbjPuUwnQ6mckHqe4/W4Qwaagx65yYbAbMxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493748; c=relaxed/simple;
	bh=rWl8VRDhgbtTXfvsP5K+rx5Zn1ITWbv1Mft618xM2e0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dwJSVsFeuE2nohMDI45uVydgeZUzG+0b/vU09Daxj0Nl5WnwEGyuBcQ5wTUgLvYzr+JbAQfff+PR6dudu8KPYQ9dd5m7CZf1FNj/M0GJoet6Rv3o/vG0+bx/StijrJxMrKZ44u/dI79W0fKrT6m4HDRzgnNfGCkyR6HkJ1USPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aGdZdcUQ; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aGdZdcUQ"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 562M2HpP3719926;
	Wed, 2 Jul 2025 17:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751493737;
	bh=xU0HMSFs0JxztpzuV6sOpR0n9JnmeLw4DidqdRI3Z2Q=;
	h=From:To:CC:Subject:Date;
	b=aGdZdcUQ+X30vKkyUjpxCWp9sVLPaKYX06coXKNiOqISaKi9/0DwH36Rywh8t+Fdu
	 qEcu1g7eTSQibSTi+TyAw4SmpdqSQskwj6uA6HHXpI5bNWSYb9uV5eSxpqyK61Eh0E
	 TcRugkS4V5NmDQRGu6cjCfW6hSSG6iM8L8yBj5Ic=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 562M2H0I1233764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 17:02:17 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 17:02:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 17:02:17 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 562M2HxI3906398;
	Wed, 2 Jul 2025 17:02:17 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <praneeth@ti.com>, <m-leonard@ti.com>, <rklein@nvidia.com>
Subject: [PATCH] mfd: dt-bindings: Convert TPS65910 to DT schema
Date: Wed, 2 Jul 2025 17:02:17 -0500
Message-ID: <20250702220217.155647-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Convert the TI TPS65910 documentation to DT schema format.

Fix incorrect I2C address in example: should be 0x2d.

TPS65910 datasheet: https://www.ti.com/lit/gpn/tps65910

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 .../devicetree/bindings/mfd/ti,tps65910.yaml  | 333 ++++++++++++++++++
 .../devicetree/bindings/mfd/tps65910.txt      | 205 -----------
 2 files changed, 333 insertions(+), 205 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/tps65910.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
new file mode 100644
index 000000000000..789b3c6d89cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -0,0 +1,333 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS65910 Power Management Integrated Circuit
+
+maintainers:
+  - Shree Ramamoorthy <s-ramamoorthy@ti.com>
+
+description:
+  TPS65910 device is a Power Management IC that provides 3 step-down converters,
+  1 stepup converter, and 8 LDOs. The device contains an embedded power controller (EPC),
+  1 GPIO, and an RTC.
+
+properties:
+  compatible:
+    enum:
+      - ti,tps65910
+      - ti,tps65911
+
+  reg:
+    description: I2C slave address
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description: |
+      The first cell is the GPIO number.
+      The second cell is used to specify additional options <unused>.
+      See ../gpio/gpio.txt for more information.
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description: Specifies the IRQ number and flags, as defined in
+      Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+    const: 2
+
+  ti,vmbch-threshold:
+    description: |
+      (TPS65911) Main battery charged threshold comparator.
+      See VMBCH_VSEL in TPS65910 datasheet.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 1
+    items:
+      minimum: 0
+      maximum: 3
+
+  ti,vmbch2-threshold:
+    description: |
+      (TPS65911) Main battery discharged threshold comparator.
+      See VMBCH_VSEL in TPS65910 datasheet.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 1
+    items:
+      minimum: 0
+      maximum: 3
+
+  ti,en-ck32k-xtal:
+    type: boolean
+    description: Enable external 32-kHz crystal oscillator.
+
+  ti,en-gpio-sleep:
+    description: |
+      Enable sleep control for gpios.
+      There should be 9 entries here, one for each gpio.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 9
+    maxItems: 9
+    items:
+      minimum: 0
+      maximum: 1
+
+  ti,system-power-controller:
+    type: boolean
+    description: Identify whether or not this pmic controls the system power
+
+  ti,sleep-enable:
+    type: boolean
+    description: Enable SLEEP state.
+
+  ti,sleep-keep-therm:
+    type: boolean
+    description: Keep thermal monitoring on in sleep state.
+
+  ti,sleep-keep-ck32k:
+    type: boolean
+    description: Keep the 32KHz clock output on in sleep state.
+
+  ti,sleep-keep-hsclk:
+    type: boolean
+    description: Keep high speed internal clock on in sleep state.
+
+  regulators:
+    type: object
+    description: List of regulators provided by this controller.
+
+    patternProperties:
+      "^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        properties:
+          ti,regulator-ext-sleep-control:
+            description: |
+              Enable external sleep control through external inputs:
+              [0 (not enabled), 1 (EN1), 2 (EN2) or 4(EN3)].
+              If this property is not defined, it defaults to 0 (not enabled).
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 4, 8]
+        unevaluatedProperties: true
+
+      "^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        properties:
+          ti,regulator-ext-sleep-control:
+            description: |
+              Enable external sleep control through external inputs:
+              [0 (not enabled), 1 (EN1), 2 (EN2) or 4(EN3)].
+              If this property is not defined, it defaults to 0 (not enabled).
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 4, 8]
+        unevaluatedProperties: true
+
+      "^ldo[1-8]$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        properties:
+          ti,regulator-ext-sleep-control:
+            description: |
+              Enable external sleep control through external inputs:
+              [0 (not enabled), 1 (EN1), 2 (EN2) or 4(EN3)].
+              If this property is not defined, it defaults to 0 (not enabled).
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 4, 8]
+        unevaluatedProperties: true
+
+    additionalProperties: true
+
+patternProperties:
+  "^(vcc[1-7]-supply)|vccio-supply$":
+    description: |
+      Input voltage supply phandle for regulators.
+      These entries are required if PMIC regulators are enabled, or else it
+      can cause the regulator registration to fail.
+      If some input supply is powered through battery or always-on supply, then
+      it is also required to have these parameters with the proper node handle for always-on
+      power supply.
+      tps65910:
+          vcc1-supply: VDD1 input.
+          vcc2-supply: VDD2 input.
+          vcc3-supply: VAUX33 and VMMC input.
+          vcc4-supply: VAUX1 and VAUX2 input.
+          vcc5-supply: VPLL and VDAC input.
+          vcc6-supply: VDIG1 and VDIG2 input.
+          vcc7-supply: VRTC and VBB input.
+          vccio-supply: VIO input.
+      tps65911:
+          vcc1-supply: VDD1 input.
+          vcc2-supply: VDD2 input.
+          vcc3-supply: LDO6, LDO7 and LDO8 input.
+          vcc4-supply: LDO5 input.
+          vcc5-supply: LDO3 and LDO4 input.
+          vcc6-supply: LDO1 and LDO2 input.
+          vcc7-supply: VRTC input.
+          vccio-supply: VIO input.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - regulators
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,tps65910
+    then:
+      properties:
+        regulators:
+          patternProperties:
+            "^(ldo[1-8]|vddctrl)$": false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,tps65911
+    then:
+      properties:
+        regulators:
+          patternProperties:
+            "^(vdd3|vaux([1-2]|33)|vdig[1-2])$": false
+            "^(vpll|vdac|vmmc|vbb)$": false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic: tps65910@2d {
+          compatible = "ti,tps65910";
+          reg = <0x2d>;
+          interrupt-parent = <&intc>;
+          interrupts = < 0 118 0x04 >;
+
+          #gpio-cells = <2>;
+          gpio-controller;
+
+          #interrupt-cells = <2>;
+          interrupt-controller;
+
+          ti,system-power-controller;
+
+          ti,vmbch-threshold = <0>;
+          ti,vmbch2-threshold = <0>;
+          ti,en-ck32k-xtal;
+          ti,en-gpio-sleep = <0 0 1 0 0 0 0 0 0>;
+
+          vcc1-supply = <&reg_parent>;
+          vcc2-supply = <&some_reg>;
+          vcc3-supply = <&vbat>;
+          vcc4-supply = <&vbat>;
+          vcc5-supply = <&vbat>;
+          vcc6-supply = <&vbat>;
+          vcc7-supply = <&vbat>;
+          vccio-supply = <&vbat>;
+
+          regulators {
+            vrtc_reg: vrtc {
+              regulator-name = "vrtc";
+              regulator-always-on;
+            };
+            vio_reg: vio {
+              regulator-name = "vio";
+              regulator-min-microvolt = <1500000>;
+              regulator-max-microvolt = <3300000>;
+              regulator-always-on;
+              regulator-boot-on;
+            };
+            vdd1_reg: vdd1 {
+              regulator-name = "vdd1";
+              regulator-min-microvolt = < 600000>;
+              regulator-max-microvolt = <1500000>;
+              regulator-always-on;
+              regulator-boot-on;
+              ti,regulator-ext-sleep-control = <0>;
+            };
+            vdd2_reg: vdd2 {
+              regulator-name = "vdd2";
+              regulator-min-microvolt = < 600000>;
+              regulator-max-microvolt = <1500000>;
+              regulator-always-on;
+              regulator-boot-on;
+            };
+            vdd3_reg: vdd3 {
+              regulator-name = "vdd3";
+              regulator-min-microvolt = <5000000>;
+              regulator-max-microvolt = <5000000>;
+              regulator-always-on;
+            };
+            vdig1_reg: vdig1 {
+              regulator-name = "vdig1";
+              regulator-min-microvolt = <1200000>;
+              regulator-max-microvolt = <2700000>;
+              regulator-always-on;
+            };
+            vdig2_reg: vdig2 {
+              regulator-name = "vdig2";
+              regulator-min-microvolt = <1000000>;
+              regulator-max-microvolt = <1800000>;
+              regulator-always-on;
+            };
+            vpll_reg: vpll {
+              regulator-name = "vpll";
+              regulator-min-microvolt = <1000000>;
+              regulator-max-microvolt = <2500000>;
+              regulator-always-on;
+            };
+            vdac_reg: vdac {
+              regulator-name = "vdac";
+              regulator-min-microvolt = <1800000>;
+              regulator-max-microvolt = <2850000>;
+              regulator-always-on;
+            };
+            vaux1_reg: vaux1 {
+              regulator-name = "vaux1";
+              regulator-min-microvolt = <1800000>;
+              regulator-max-microvolt = <2850000>;
+              regulator-always-on;
+            };
+            vaux2_reg: vaux2 {
+              regulator-name = "vaux2";
+              regulator-min-microvolt = <1800000>;
+              regulator-max-microvolt = <3300000>;
+              regulator-always-on;
+            };
+            vaux33_reg: vaux33 {
+              regulator-name = "vaux33";
+              regulator-min-microvolt = <1800000>;
+              regulator-max-microvolt = <3300000>;
+              regulator-always-on;
+            };
+            vmmc_reg: vmmc {
+              regulator-name = "vmmc";
+              regulator-min-microvolt = <1800000>;
+              regulator-max-microvolt = <3300000>;
+              regulator-always-on;
+              regulator-boot-on;
+            };
+          };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/tps65910.txt b/Documentation/devicetree/bindings/mfd/tps65910.txt
deleted file mode 100644
index a5ced46bbde9..000000000000
--- a/Documentation/devicetree/bindings/mfd/tps65910.txt
+++ /dev/null
@@ -1,205 +0,0 @@
-TPS65910 Power Management Integrated Circuit
-
-Required properties:
-- compatible: "ti,tps65910" or "ti,tps65911"
-- reg: I2C slave address
-- interrupts: the interrupt outputs of the controller
-- #gpio-cells: number of cells to describe a GPIO, this should be 2.
-  The first cell is the GPIO number.
-  The second cell is used to specify additional options <unused>.
-- gpio-controller: mark the device as a GPIO controller
-- #interrupt-cells: the number of cells to describe an IRQ, this should be 2.
-  The first cell is the IRQ number.
-  The second cell is the flags, encoded as the trigger masks from
-  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-- regulators: This is the list of child nodes that specify the regulator
-  initialization data for defined regulators. Not all regulators for the given
-  device need to be present. The definition for each of these nodes is defined
-  using the standard binding for regulators found at
-  Documentation/devicetree/bindings/regulator/regulator.txt.
-  The regulator is matched with the regulator-compatible.
-
-  The valid regulator-compatible values are:
-  tps65910: vrtc, vio, vdd1, vdd2, vdd3, vdig1, vdig2, vpll, vdac, vaux1,
-            vaux2, vaux33, vmmc, vbb
-  tps65911: vrtc, vio, vdd1, vdd2, vddctrl, ldo1, ldo2, ldo3, ldo4, ldo5,
-            ldo6, ldo7, ldo8
-
-- xxx-supply: Input voltage supply regulator.
-  These entries are required if regulators are enabled for a device. Missing these
-  properties can cause the regulator registration to fail.
-  If some of input supply is powered through battery or always-on supply then
-  also it is require to have these parameters with proper node handle of always
-  on power supply.
-  tps65910:
-	vcc1-supply: VDD1 input.
-	vcc2-supply: VDD2 input.
-	vcc3-supply: VAUX33 and VMMC input.
-	vcc4-supply: VAUX1 and VAUX2 input.
-	vcc5-supply: VPLL and VDAC input.
-	vcc6-supply: VDIG1 and VDIG2 input.
-	vcc7-supply: VRTC and VBB input.
-	vccio-supply: VIO input.
-  tps65911:
-	vcc1-supply: VDD1 input.
-	vcc2-supply: VDD2 input.
-	vcc3-supply: LDO6, LDO7 and LDO8 input.
-	vcc4-supply: LDO5 input.
-	vcc5-supply: LDO3 and LDO4 input.
-	vcc6-supply: LDO1 and LDO2 input.
-	vcc7-supply: VRTC input.
-	vccio-supply: VIO input.
-
-Optional properties:
-- ti,vmbch-threshold: (tps65911) main battery charged threshold
-  comparator. (see VMBCH_VSEL in TPS65910 datasheet)
-- ti,vmbch2-threshold: (tps65911) main battery discharged threshold
-  comparator. (see VMBCH_VSEL in TPS65910 datasheet)
-- ti,en-ck32k-xtal: enable external 32-kHz crystal oscillator (see CK32K_CTRL
-  in TPS6591X datasheet)
-- ti,en-gpio-sleep: enable sleep control for gpios
-  There should be 9 entries here, one for each gpio.
-- ti,system-power-controller: Telling whether or not this pmic is controlling
-  the system power.
-- ti,sleep-enable: Enable SLEEP state.
-- ti,sleep-keep-therm: Keep thermal monitoring on in sleep state.
-- ti,sleep-keep-ck32k: Keep the 32KHz clock output on in sleep state.
-- ti,sleep-keep-hsclk: Keep high speed internal clock on in sleep state.
-
-Regulator Optional properties:
-- ti,regulator-ext-sleep-control: enable external sleep
-  control through external inputs [0 (not enabled), 1 (EN1), 2 (EN2) or 4(EN3)]
-  If this property is not defined, it defaults to 0 (not enabled).
-
-Example:
-
-	pmu: tps65910@d2 {
-		compatible = "ti,tps65910";
-		reg = <0xd2>;
-		interrupt-parent = <&intc>;
-		interrupts = < 0 118 0x04 >;
-
-		#gpio-cells = <2>;
-		gpio-controller;
-
-		#interrupt-cells = <2>;
-		interrupt-controller;
-
-		ti,system-power-controller;
-
-		ti,vmbch-threshold = 0;
-		ti,vmbch2-threshold = 0;
-		ti,en-ck32k-xtal;
-		ti,en-gpio-sleep = <0 0 1 0 0 0 0 0 0>;
-
-		vcc1-supply = <&reg_parent>;
-		vcc2-supply = <&some_reg>;
-		vcc3-supply = <...>;
-		vcc4-supply = <...>;
-		vcc5-supply = <...>;
-		vcc6-supply = <...>;
-		vcc7-supply = <...>;
-		vccio-supply = <...>;
-
-		regulators {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			vdd1_reg: regulator@0 {
-				regulator-compatible = "vdd1";
-				reg = <0>;
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-always-on;
-				regulator-boot-on;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			vdd2_reg: regulator@1 {
-				regulator-compatible = "vdd2";
-				reg = <1>;
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-always-on;
-				regulator-boot-on;
-				ti,regulator-ext-sleep-control = <4>;
-			};
-			vddctrl_reg: regulator@2 {
-				regulator-compatible = "vddctrl";
-				reg = <2>;
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				regulator-boot-on;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			vio_reg: regulator@3 {
-				regulator-compatible = "vio";
-				reg = <3>;
-				regulator-min-microvolt = <1500000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-				regulator-boot-on;
-				ti,regulator-ext-sleep-control = <1>;
-			};
-			ldo1_reg: regulator@4 {
-				regulator-compatible = "ldo1";
-				reg = <4>;
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <3300000>;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			ldo2_reg: regulator@5 {
-				regulator-compatible = "ldo2";
-				reg = <5>;
-				regulator-min-microvolt = <1050000>;
-				regulator-max-microvolt = <1050000>;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			ldo3_reg: regulator@6 {
-				regulator-compatible = "ldo3";
-				reg = <6>;
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <3300000>;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			ldo4_reg: regulator@7 {
-				regulator-compatible = "ldo4";
-				reg = <7>;
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			ldo5_reg: regulator@8 {
-				regulator-compatible = "ldo5";
-				reg = <8>;
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <3300000>;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			ldo6_reg: regulator@9 {
-				regulator-compatible = "ldo6";
-				reg = <9>;
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				ti,regulator-ext-sleep-control = <0>;
-			};
-			ldo7_reg: regulator@10 {
-				regulator-compatible = "ldo7";
-				reg = <10>;
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				regulator-always-on;
-				regulator-boot-on;
-				ti,regulator-ext-sleep-control = <1>;
-			};
-			ldo8_reg: regulator@11 {
-				regulator-compatible = "ldo8";
-				reg = <11>;
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				ti,regulator-ext-sleep-control = <1>;
-			};
-		};
-	};
-- 
2.43.0

