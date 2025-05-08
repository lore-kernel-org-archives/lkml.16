Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E819D080;
	Thu,  8 May 2025 04:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680251; cv=none; b=ahaNpOngeHxgwQdbTM+WO+aEj2DzV8KCIG+789J80hqUDRtx2MO+48m4H9fnzoAXdFq/l2bwTGd3M1HgTjALL2Et1a6CDTa8JhaYFsTm8Z7D288vQkenGONRIUQ4XRMJqjMx4FcdMUWQhhzEE9NXmNrjBMJ2mpsY9sP5T10mFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680251; c=relaxed/simple;
	bh=8b3gtgqTOkIJN48aoVeSMxCiIVW+SUt8I210ZRFKtYY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T3o2dAakNxRYC7NUwWvigCKDmU+DGktg717WfAmhZTTe4tX0/TafSrjHfk0arsO5zHgvmgRm+omb84XSwC/qulSlJQTUCXvobmQhFY6K9s8+SOSanrKk/pO6cPRbVofcPawILMazhl9tKqsGvuHmu4109br3qiik3MAjffYwf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8889B201D82;
	Thu,  8 May 2025 06:57:22 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7BC1F201D7D;
	Thu,  8 May 2025 06:57:22 +0200 (CEST)
Received: from lsv15573.swis.ro-buh01.nxp.com (lsv15573.swis.ro-buh01.nxp.com [10.172.0.77])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id F18BE202DC;
	Thu,  8 May 2025 06:57:20 +0200 (CEST)
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Frank.Li@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Date: Thu,  8 May 2025 07:57:10 +0300
Message-Id: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
multiport I3C hub family. These devices connect to a host via
I3C/I2C/SMBus and allow communication with multiple downstream
peripherals.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
---
V1 -> V2: Cleaned up coding style and addressed review comments
---
 .../bindings/i3c/p3h2840-i3c-hub.yaml         | 332 ++++++++++++++++++
 MAINTAINERS                                   |   8 +
 2 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml

diff --git a/Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml
new file mode 100644
index 000000000000..f3b5aabf5fe0
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/p3h2840-i3c-hub.yaml
@@ -0,0 +1,332 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 NXP
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/p3h2840-i3c-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: P3H2X4X I3C HUB
+
+maintainers:
+  - Vikash Bansal <vikash.bansal@nxp.com>
+  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+
+description: |
+  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
+  hub devices that connect to:-
+  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
+     peripheral devices on the downstream  side.
+  2. Have two Controller Ports which can support either
+     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
+  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
+  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
+     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect to
+     peripherals.
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  $nodename:
+    pattern: "^hub@[@.*]+,[0-9a-f]+$"
+
+  Compatible:
+    const: nxp,p3h2x4x
+
+  cp0-ldo-enable:
+    type: boolean
+    description:
+      Enables the on-die LDO for controller Port 0.
+
+  cp1-ldo-enable:
+    type: boolean
+    description:
+      Enables the on-die LDO for controller Port 1.
+
+  tp0145-ldo-enable:
+    type: boolean
+    description:
+      Enables the on-die LDO for target ports 0/1/4/5.
+
+  tp2367-ldo-enable:
+    type: boolean
+    description:
+      Enables the on-die LDO for target ports 2/3/6/7.
+
+  cp0-ldo-microvolt:
+    description:
+      Selects the voltage for controller Port 0, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  cp1-ldo-microvolt:
+    description:
+      Selects the voltage for controller Port 1, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  tp0145-ldo-microvolt:
+    description:
+      Selects the voltage for target Port 0/1/4/5, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  tp2367-ldo-microvolt:
+    description:
+      Selects the voltage for target Port 2/3/6/7, in microvolts.
+    enum: [1000000, 1100000, 1200000, 1800000]
+    default: 1000000
+
+  tp0145-pullup-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  tp2367-pullup-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
+    enum: [250, 500, 1000, 2000]
+    default: 500
+
+  cp0-io-strength-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the IO drive strength for controller Port 0, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  cp1-io-strength-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the IO drive strength for controller Port 1, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  tp0145-io-strength-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the IO drive strength for target port 0/1/4/5, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+  tp2367-io-strength-ohm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Selects the IO drive strength for target port 2/3/6/7, in ohms.
+    enum: [20, 30, 40, 50]
+    default: 20
+
+patternProperties:
+  "@[0-7]$":
+    type: object
+    additionalProperties: false
+    description:
+      I3C HUB Target Port child, should be named as target-port@<target-port-id>
+
+    properties:
+      reg:
+        description: |
+          The I3C HUB Target Port number.
+        minimum: 0
+        maximum: 0x07
+
+      mode:
+        enum: [i3c, smbus, i2c, gpio]
+        description:
+          I3C HUB Target Port mode setting to control Target Port functionality.
+          As per now it is oly supporting SMBus, i2c and i3c( i2c mode will work
+          with hub network).
+
+      pullup-enable:
+        type: boolean
+        description:
+          Enables the on-die pull-up for Target Port.
+
+      ibi-enable:
+        type: boolean
+        description:
+          Enables the IBI for Target Port.
+
+      local_dev:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          SMBus Target Agent can discard transactions of downstream device and not generate an IBI to upstream I3C Hub
+          Controller Port. Up to 8 device (addresses) can be configured as local Devices.
+
+          This property is optional. If not provided, local device list will empty.
+
+      always-enable:
+        type: boolean
+        description:
+          Enables the hub network (Controller port -> target port).
+
+    patternProperties:
+      "@[0-9a-f]+$":
+        type: object
+        additionalProperties: false
+        description: |
+          I2C child, should be named: <device-type>@<i2c-address>
+
+        properties:
+          compatible:
+            description:
+              Compatible of the I2C/SMBus downstream device.
+
+          reg:
+            description: |
+              I2C address, Downstream device address which are connected to target port.
+            minimum: 0
+            maximum: 0x7f
+
+    required:
+      - compatible
+      - reg
+
+  "@[0-9a-f]+,[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+    description: |
+      I3C child, should be named: <device-type>@<static-i2c-address>,<i3c-pid>
+
+    properties:
+      reg:
+        items:
+          - items:
+              - description: |
+                  Encodes the static I2C address. Should be 0 if the device does
+                  not have one (0 is not a valid I2C address).
+                minimum: 0
+                maximum: 0x7f
+              - description: |
+                  First half of the Provisioned ID (following the PID
+                  definition provided by the I3C specification).
+
+                  Contains the manufacturer ID left-shifted by 1.
+              - description: |
+                  Second half of the Provisioned ID (following the PID
+                  definition provided by the I3C specification).
+
+                  Contains the ORing of the part ID left-shifted by 16,
+                  the instance ID left-shifted by 12 and extra information.
+
+      assigned-address:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0x1
+        maximum: 0xff
+        description: |
+          Dynamic address to be assigned to this device. In case static address is
+          present (first cell of the reg property != 0), this address is assigned
+          through SETDASA. If static address is not present, this address is assigned
+          through SETNEWDA after assigning a temporary address via ENTDAA.
+
+    required:
+      - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c {
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        hub@70,236153000c2{
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x70 0x236 0x3000c2>;
+            assigned-address = <0x50>;
+
+            cp0-ldo-microvolt = <1800000>;
+            cp1-ldo-microvolt = <1800000>;
+            tp0145-ldo-microvolt = <1800000>;
+            tp2367-ldo-microvolt = <1800000>;
+            tp0145-pullup-ohm = <1000>;
+            tp2367-pullup-ohm = <1000>;
+            cp0-io-strength-ohm = <50>;
+            cp1-io-strength-ohm = <50>;
+            tp0145-io-strength-ohm = <50>;
+            tp2367-io-strength-ohm = <50>;
+
+            target-port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x0>;
+                mode = "smbus";
+                pullup-enable;
+
+                eeprom@57 {
+                    compatible = "atmel,24c32";
+                    reg = <0x57>;
+                    pagesize = <32>;
+                    wp-gpios = <&gpio2 2 0>;
+                    num-addresses = <8>;
+                };
+            };
+
+            target-port@2 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x2>;
+                mode = "i3c";
+                pullup-enable;
+
+                sensor@68,39200144004 {
+                  reg = <0x68 0x392 0x144004>;
+                  assigned-address = <0xa>;
+                };
+            };
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@70 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "nxp,p3h2x4x";
+            reg = <0x70>;
+
+            cp0-ldo-microvolt = <1800000>;
+            cp1-ldo-microvolt = <1800000>;
+            tp0145-ldo-microvolt = <1800000>;
+            tp2367-ldo-microvolt = <1800000>;
+            tp0145-pullup-ohm = <1000>;
+            tp2367-pullup-ohm = <1000>;
+            cp0-io-strength-ohm = <50>;
+            cp1-io-strength-ohm = <50>;
+            tp0145-io-strength-ohm = <50>;
+            tp2367-io-strength-ohm = <50>;
+
+            target-port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x0>;
+                mode = "smbus";
+                pullup-enable;
+
+                eeprom@57 {
+                    compatible = "atmel,24c32";
+                    reg = <0x57>;
+                    pagesize = <32>;
+                    wp-gpios = <&gpio2 2 0>;
+                    num-addresses = <8>;
+                };
+            };
+
+            target-port@2 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x2>;
+                mode = "i2c";
+                pullup-enable;
+                always-enable;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index af686e0bb6d7..38e197f20683 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17167,6 +17167,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
 F:	sound/soc/codecs/tfa989x.c
 
+NXP P3H2X4X I3C-HUB DRIVER
+M:	Vikash Bansal <vikash.bansal@nxp.com>
+M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-i3c-owner@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.25.1

