Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E41D5175;
	Wed,  4 Jun 2025 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052177; cv=none; b=GiayEiU1d1W79hPl25DZoK5dm4GNhdLimYXu5NXJB8QbiKJnedQlq+kJKplp9a6GU+cQ8v2pRLiCPsVNaYVdKqC/Ub1nKsx0kpAgfTMXPof7kAO8QqraH/vKsq5dRxZpQH2LQonIfWcJXjJiB02+byiajV2HZPqG2dbsDJGFQ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052177; c=relaxed/simple;
	bh=8mkPg7mEcrb8I75RjBz1Bmbnu3KCBCssH5QspO2gOFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nik/s0/IKIo3MZkhPi8qHjGY9nDbfu7iq0qUDtWagPkfSk2qdW4XurrhNcI+TEigZtAvR3PBNOcIZBUPN9cuBY7R2W0LEKfpFKAeS2VLcfHOr9OpyPeb7FQgK0mAG8hBtiemscGEdHrGOdcSK4o0pY6n4dDHFOxv31W6+EW8Rdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=a0pcN45t; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="a0pcN45t"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554D4Mui023283;
	Wed, 4 Jun 2025 11:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=3Z7o8
	DM2qIcGBH62grXBsYITC2RBxzrsg0t1Sq/TSEY=; b=a0pcN45t2IpTqRNUiAcfz
	VDejd1XkAhS4Dg7RGIzHq+MHeU5WJrOBVGiVHjldQ+7wb8BSUBvKBPqIgrp3BArB
	ouSnb+h9lS7cFf84VA5fP833ygFlAzZPxUX+g0QGbv5frJ2rJkjCL5T+gWG4c0z2
	2F1E2BDlrnQZP1QRQt4mj3nRqtfLbZCao5KLFn9AWr59wTryAZBCgqDRyKEgJPLH
	3MjY6l+7cCCfcjdrH0ehEOw1s/V52j9WJk3UG0oz/lWLOdj//RCpJo/nC4dOQHKO
	9l2w7H3DKvhrFb8XIAxSTyxe3Dh9pQ3bBISUHuV4Fam0QkoGC484dIH7xZo3S52E
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 472k2u1w5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 11:49:20 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 554FnJYl020822
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jun 2025 11:49:19 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 4 Jun
 2025 11:49:19 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 4 Jun 2025 11:49:19 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.51])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 554Fn5K4003109;
	Wed, 4 Jun 2025 11:49:13 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Wed, 4 Jun 2025 17:48:57 +0200
Subject: [PATCH 1/2] dt-bindings: i3c: Add adi-i3c-master
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250604-adi-i3c-master-v1-1-0488e80dafcb@analog.com>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
In-Reply-To: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749052145; l=2640;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=8mkPg7mEcrb8I75RjBz1Bmbnu3KCBCssH5QspO2gOFE=;
 b=1Fe2M4tiNDOHYQKgo8HJBDvfEaicq0YiWCDCn/VaB8HsAKk4jSx2YPaGOB5qf67w2KAE5ixAy
 UpVfv4mgg+LD1pEHqfJLF8zQFoakmh/fNr4KWVsOQo++yl/VHcmR0rS
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 4ObCpcVnM3lZjKqVXZ3WVNOdnGW3Mk0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExOSBTYWx0ZWRfXwF00/Mx5s4Q2
 Yr6F3NZtlFGBSc98bSOOexvzLQfGpTZT4rByFgUUaxmMP8g85lnExO42ufP2w+IBX3/ROosrjwx
 2sFdynhwBTj2jA7DBuC42qToka4/9KQkH5rAG77U/CmIC31vU7hFJHV3ekqZKCQZUmKXxqjmxuN
 lG8a9ZrXIxLGynj/uBdiUbgk1amCy4sgnKD/j8rRrE3uVQnqnKE0iIya8Xeo7EwMPzANV0bV9WA
 NykyB22B4eNBsrISl6Dye4zBzJF8L2P0t511hQ94lTF7NIJCx+nTASbGnnecb6fN9+WdIXINc14
 q9P6p+gnR6SyJRVk25SCt+iUGIByZh+UqpHSFPTaqZHMNjIPO5g3DOALRJMJKPer7gQ07m9KvYz
 juO6BRTPYr4mltMMYNFE4IwMq3G3uegeZnVOR31a6SquiUzhJp1ck0Nbf/IjQdbMyyBL/2bk
X-Proofpoint-ORIG-GUID: 4ObCpcVnM3lZjKqVXZ3WVNOdnGW3Mk0S
X-Authority-Analysis: v=2.4 cv=Fv4F/3rq c=1 sm=1 tr=0 ts=68406b00 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=BiVzJI_yISUpa7ZiZSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=967 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040119

Add nodes for ADI I3C Controller IP core.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..859dbfde15f123db59d7aa46c120c4a3ac05198e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices I3C Controller
+
+description: |
+  The ADI I3C controller implements a subset of the I3C-basic specification to
+  interface I3C and I2C peripherals [1].
+
+  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
+
+maintainers:
+  - Jorge Marques <jorge.marques@analog.com>
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: adi,i3c-master
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: The AXI interconnect clock.
+      - description: The I3C controller clock.
+
+  clock-names:
+    items:
+      - const: s_axi_aclk
+      - const: i3c_clk
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i3c@44a00000 {
+        compatible = "adi,i3c-master";
+        reg = <0x44a00000 0x1000>;
+        interrupts = <0 56 4>;
+        clocks = <&clkc 15>, <&clkc 15>;
+        clock-names = "s_axi_aclk", "i3c_clk";
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        /* I3C and I2C devices */
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..6f56e17dcecf902c6812827c1ec3e067c65e9894 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11243,6 +11243,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
 F:	drivers/i3c/master/ast2600-i3c-master.c
 
+I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
+M:	Jorge Marques <jorge.marques@analog.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
+
 I3C DRIVER FOR CADENCE I3C MASTER IP
 M:	Przemysław Gaj <pgaj@cadence.com>
 S:	Maintained

-- 
2.49.0

