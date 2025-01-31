Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE8914885B;
	Fri, 31 Jan 2025 20:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353700; cv=none; b=dFRHa1z03lYo6P+iUKpzlgnJgcF1KLIsAziwQKvLff1wgylbspRpN2LzlVnqW0sFHteg0RFkgu/XLeMukNVzbsyRoA+hPvXyIG8/YPKC0G9IiEVA4gLs6NuyqVVN+Rtgm3n12bFFRCCq2VQU4pjbVEa3JSgvpdaV1WoUrGbj+9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353700; c=relaxed/simple;
	bh=PQC6lO+NQ+lEKD+JRu90LE3Nqd7VmbhE6PsaGMSNg4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZW2zOARahGLt9qNyDQwGH+PqgLzlPjnB9uhGUhqsUeh5sKWMnfgG15C+nXsvFb1vvpofA2Eo7bG6hKU3/MPQ2Uedgl+jmw7O1J/0DSfDI3ckrUcxjcrRnYnyqG+UteIxKCoFwif6j/cFzjumQ6TaWmR+YLTVup7x1tA5E1hkjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FqHPEQ6p; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FqHPEQ6p"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V6sHmu015898;
	Fri, 31 Jan 2025 14:01:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BCT2AIKVtExqG27DTd5hLqvs/DalIumwuqwNjQzI47U=; b=
	FqHPEQ6psZPN6NmzW8I6i0lSw4HeXnUTU8lsD6+yLoPP2gZFJsPYyhVnYwc8wXy4
	vr3lb6guF3ifNsk/Xsv28Mf5Dn/b3rimb/ZhFF0oh6r4r8yTVXyntxA35/FCSMgc
	pr9RSL2BpfnJnnQlwV+VDFaydpE1bawJ/w/8q8Bs0gTdF64/+mH+Rid7gFZFBoor
	sG2WAFkSUhFRQttbp91hZ0IYPfVlDyq1i2oO+aNzBP7L2mj4tQg/A+PIUnqlF1ch
	KRhaiyOYdAfRC1GnfW1wSuVbQfIPNSKvD0SMm4H869jQtHCmvz28p9n2kBwIQfBp
	FV4pPbEB4XX8+OcUpgWw/g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44gf92157r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 14:01:29 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Jan
 2025 20:01:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 31 Jan 2025 20:01:27 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E335C82026C;
	Fri, 31 Jan 2025 20:01:25 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Fred
 Treven" <ftreven@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/7] dt-bindings: mfd: cirrus,cs40l26: Support for CS40L26
Date: Fri, 31 Jan 2025 13:56:35 -0600
Message-ID: <20250131195639.1784933-5-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZOhKIyHsomEWzO-6H9LTUrxzuEZSi2Gb
X-Authority-Analysis: v=2.4 cv=JPXBs9Kb c=1 sm=1 tr=0 ts=679d2c19 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=VdSt8ZQiCzkA:10 a=gEfo2CItAAAA:8 a=w1d2syhTAAAA:8 a=wuh2pNzbNvaVoUcC6a8A:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: ZOhKIyHsomEWzO-6H9LTUrxzuEZSi2Gb
X-Proofpoint-Spam-Reason: safe

Introduce required basic devicetree parameters for the
initial commit of CS40L26.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 .../bindings/mfd/cirrus,cs40l26.yaml          | 81 +++++++++++++++++++
 MAINTAINERS                                   |  4 +-
 2 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml

diff --git a/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
new file mode 100644
index 000000000000..a3cccb1a2d92
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/cirrus,cs40l26.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS40L26 Boosted Haptic Amplifier
+
+maintainers:
+  - Fred Treven <ftreven@opensource.cirrus.com>
+  - patches@opensource.cirrus.com
+
+description:
+  CS40L26 is a Boosted Haptic Driver with Integrated DSP, Waveform Memory,
+  Advanced Closed Loop Algorithms, and LRA protection
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs40l26a
+      - cirrus,cs40l27b
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  va-supply:
+    description: Regulator for VA analog voltage
+
+  vp-supply:
+    description: Regulator for VP voltage
+
+  cirrus,bst-ipk-microamp:
+    description:
+      Maximum current that can be drawn by the device's boost converter.
+    multipleOf: 50000
+    minimum: 1600000
+    maximum: 4800000
+    default: 4500000
+
+  cirrus,bst-ctl-microvolt:
+    description: Maximum target voltage to which DSP may increase the VBST supply.
+    multipleOf: 50000
+    minimum: 2550000
+    maximum: 11000000
+    default: 11000000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      haptic-driver@58 {
+        compatible = "cirrus,cs40l26a";
+        reg = <0x58>;
+        interrupt-parent = <&gpio>;
+        interrupts = <57 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio 54 GPIO_ACTIVE_LOW>;
+        va-supply = <&vreg>;
+        vp-supply = <&vreg>;
+        cirrus,bst-ctl-microvolt = <2600000>;
+        cirrus,bst-ipk-microamp = <1650000>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bc8ce7af3303..9c4105bf0a32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5546,11 +5546,11 @@ F:	sound/soc/codecs/cs*
 
 CIRRUS LOGIC HAPTIC DRIVERS
 M:	James Ogletree <jogletre@opensource.cirrus.com>
-M:	Fred Treven <fred.treven@cirrus.com>
+M:	Fred Treven <ftreven@opensource.cirrus.com>
 M:	Ben Bright <ben.bright@cirrus.com>
 L:	patches@opensource.cirrus.com
 S:	Supported
-F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
+F:	Documentation/devicetree/bindings/input/cirrus,cs40l*
 F:	drivers/input/misc/cs40l*
 F:	drivers/mfd/cs40l*
 F:	include/linux/mfd/cs40l*
-- 
2.34.1

