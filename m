Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38266221F13;
	Mon,  7 Apr 2025 04:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743998914; cv=none; b=VWEz3mq1yJAln93zypL4iajLld58XScW61sX1ZYgsnU823i6/CYnSH0AQlDfdOBPGO6hSyr7GU0VNWfyLA1xtAYglgjTLJD5BAqMDdkW6Tk/5JbX3LnD8l6LO5UigpVPaR5SI444Lbf6Bn7s2wMzpT8YJB+lP31W/cRPi8hQO7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743998914; c=relaxed/simple;
	bh=D2sxSNNm7E6ZnFzzungMJBbi2Xq4BZrdIsdSc3qtAJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k0SlZbt6SjXm1MSMRaSEgG73+2/Wt/VmKU1PkL6JVrKPldM6h+XxGB1idLPBwmBy0V29dWwe3dPOs3QE2Qw9lQA1uWbAlakjQcv/a/pAk15lVhicPMXY5sTAPkIzvbGiWORyftkDzUnQkmxg4Od7M2rn+/5y6ootg1sVUPU+puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=oHTE89Xq; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="oHTE89Xq"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5371rWsA020258;
	Mon, 7 Apr 2025 00:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=9Aquc
	KTZ1M0JrWDBwMmztWEi0V4TXR6qq2bzyNp3wRc=; b=oHTE89Xq+Dp+CA44r9DLo
	tCSpzhazv1TTxJ2iFxCvQ1wDRvVUTeCYluBkjNfasztaNYuYhWV0IlVxOxi5Hngq
	bDUyfKQQcWaTrZTeEKDHv3vu70jIpI4s8au60bckja6+9mH+zIhcUtb4Zvpw99nl
	cKbuI8lvghi8QJfh1xkykWgwPXxZ5sTraNYz+I9ZxYWqZZTJT6ZtR6SHoVDhgzww
	icfUfyXSmkfw7kvQoTOZJKQ+b6ia7NlMbtn16gITvVxNX50ymuBHgVIHUF2rxyfD
	gUvXDSwTDYMzc/YuVB54DfxhbhZFvdoh+fj05m2oLbabQspMVyWpmqVLF9KXkOR7
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45txc5qj2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 00:08:20 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 53748JKe035389
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 00:08:19 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 7 Apr 2025 00:08:19 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 7 Apr 2025 00:08:19 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 7 Apr 2025 00:08:19 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.24])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 537480ZI018549;
	Mon, 7 Apr 2025 00:08:14 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 7 Apr 2025 12:07:50 +0800
Subject: [PATCH v4 1/2] regulator: dt-bindings: adi,adp5055-regulator: Add
 adp5055 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-upstream-adp5055-v4-1-61dd82369ff2@analog.com>
References: <20250407-upstream-adp5055-v4-0-61dd82369ff2@analog.com>
In-Reply-To: <20250407-upstream-adp5055-v4-0-61dd82369ff2@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Alexis
 Czezar Torreno" <alexisczezar.torreno@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743998880; l=6674;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=D2sxSNNm7E6ZnFzzungMJBbi2Xq4BZrdIsdSc3qtAJE=;
 b=IU4FdnSV2R4LIpt2OU3EYput+sEa5Yz/ODkqepgaJAuiJQCwmYipQn+WAUo7VYmK9YFL9KX2T
 MuBqaLfPuVoCyZrrfoCqJDRy4DCut0KHxY1iiQyedSe1z+4+hGL1p/L
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: XdzD9C5osu9gtwqHiZIAwQnyKqNOtpXF
X-Proofpoint-ORIG-GUID: XdzD9C5osu9gtwqHiZIAwQnyKqNOtpXF
X-Authority-Analysis: v=2.4 cv=KePSsRYD c=1 sm=1 tr=0 ts=67f34fb5 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=LYgrlvm2vjqWaEuYVCwA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070027

Add documentation for devicetree bindings for ADP5055. The device consists
of 3 buck regulators able to connect to high input voltages of up to 18V
with no preregulators.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../bindings/regulator/adi,adp5055-regulator.yaml  | 157 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 163 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/adi,adp5055-regulator.yaml b/Documentation/devicetree/bindings/regulator/adi,adp5055-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9c4ead4c9fd19419d5055666394bb4f4e7e488d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/adi,adp5055-regulator.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/adi,adp5055-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADP5055 Triple Buck Regulator
+
+maintainers:
+  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
+
+description: |
+  The ADP5055 combines three high performance buck regulator. The device enables
+  direct connection to high input voltages up to 18 V with no preregulators.
+  https://www.analog.com/media/en/technical-documentation/data-sheets/adp5055.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,adp5055
+
+  reg:
+    enum:
+      - 0x70
+      - 0x71
+
+  adi,tset-us:
+    description:
+      Setting time used by the device. This is changed via soldering specific
+      resistor values on the CFG2 pin.
+    enum: [2600, 20800]
+    default: 2600
+
+  adi,ocp-blanking:
+    description:
+      If present, overcurrent protection (OCP) blanking for all regulator is on.
+    type: boolean
+
+  adi,delay-power-good:
+    description:
+      Configures delay timer of the power good (PWRGD) pin. Delay is based on
+      Tset which can be 2.6 ms or 20.8 ms.
+    type: boolean
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^buck[0-2]$':
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      enable-gpios:
+        maxItems: 1
+        description:
+          GPIO specifier to enable the GPIO control for each regulator. The
+          driver supports two modes of enable, hardware only (GPIOs) or software
+          only (Registers). Pure hardware enabling requires each regulator to
+          contain this property. If at least one regulator does not have this,
+          the driver automatically switches to software only mode.
+
+      adi,dvs-limit-upper-microvolt:
+        description:
+          Configure the allowable upper side limit of the voltage output of each
+          regulator in microvolt. Relative to the default Vref trimming value.
+          Vref = 600 mV. Voltages are in 12 mV steps, value is autoadjusted.
+          Vout_high = Vref_trim + dvs-limit-upper.
+        minimum: 12000
+        maximum: 192000
+        default: 192000
+
+      adi,dvs-limit-lower-microvolt:
+        description:
+          Configure the allowable lower side limit of the voltage output of each
+          regulator in microvolt. Relative to the default Vref trimming value.
+          Vref = 600 mV. Voltages are in 12 mV steps, value is autoadjusted.
+          Vout_low = Vref_trim + dvs-limit-lower.
+        minimum: -190500
+        maximum: -10500
+        default: -190500
+
+      adi,fast-transient:
+        description:
+          Configures the fast transient sensitivity for each regulator.
+          "none"    - No fast transient.
+          "3G_1.5%" - 1.5% window with 3*350uA/V
+          "5G_1.5%" - 1.5% window with 5*350uA/V
+          "5G_2.5%" - 2.5% window with 5*350uA/V
+        enum: [none, 3G_1.5%, 5G_1.5%, 5G_2.5%]
+        default: 5G_2.5%
+
+      adi,mask-power-good:
+        description:
+          If present, masks individual regulators PWRGD signal to the external
+          PWRGD hardware pin.
+        type: boolean
+
+    required:
+      - regulator-name
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@70 {
+            compatible = "adi,adp5055";
+            reg = <0x70>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            adi,tset-us = <2600>;
+            adi,ocp-blanking;
+            adi,delay-power-good;
+
+            buck0 {
+                regulator-name = "buck0";
+                enable-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+                adi,dvs-limit-upper-microvolt = <192000>;
+                adi,dvs-limit-lower-microvolt = <(-190500)>;
+                adi,fast-transient = "5G_2.5%";
+                adi,mask-power-good;
+            };
+
+            buck1 {
+                regulator-name = "buck1";
+                enable-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
+                adi,dvs-limit-upper-microvolt = <192000>;
+                adi,dvs-limit-lower-microvolt = <(-190500)>;
+                adi,fast-transient = "5G_2.5%";
+                adi,mask-power-good;
+            };
+
+            buck2 {
+                regulator-name = "buck2";
+                enable-gpios = <&gpio 19 GPIO_ACTIVE_HIGH>;
+                adi,dvs-limit-upper-microvolt = <192000>;
+                adi,dvs-limit-lower-microvolt = <(-190500)>;
+                adi,fast-transient = "5G_2.5%";
+                adi,mask-power-good;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..b2ec43f84d84765c319d8403fb5650afa273db83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1525,6 +1525,12 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/filter/adi,admv8818.yaml
 F:	drivers/iio/filter/admv8818.c
 
+ANALOG DEVICES INC ADP5055 DRIVER
+M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/regulator/adi,adp5055-regulator.yaml
+
 ANALOG DEVICES INC ADP5061 DRIVER
 M:	Michael Hennerich <Michael.Hennerich@analog.com>
 L:	linux-pm@vger.kernel.org

-- 
2.34.1

