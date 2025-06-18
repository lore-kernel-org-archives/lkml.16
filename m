Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4979F24DD13;
	Wed, 18 Jun 2025 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231049; cv=none; b=WFzV03jLIqF5iQ3yWoMghqgjiBENpK/zW1OumLEIxIHDQ51nLlQ0NDTGyowIM4+03pK7mIvWa6vtbhVB2gCbhWheXF9eRQMsOTg/Y0yse5+lS/iv+4+zGnSXzQ8NB6agIu8PLIEAeG380X60acbn4IJ4ER7duGj2vWTzhVMzeWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231049; c=relaxed/simple;
	bh=OxcJIOubdThp/od04BP7j+lpLRH0YfmJ04jgzmTq8D8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RFgy9SpwllvLM4oug3cuy8vaYiGCLx1tPqZRQVwVaRmwvlt0++yXhtt0FjT3w4ZMR/jgC1zsSxt2Ip4naE4BAsNPDH47+VTNqqYtIeLJjEIrmzh6Li1edqfIXKUG0SRXXUGKj9keFm1uYuZbDWb2w81Pc2/OXJTAxpRVolieIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Krra2AO1; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Krra2AO1"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I60Bx6001422;
	Wed, 18 Jun 2025 03:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=flUZl
	HXzkcaGwxuDSeXBch5tcaQ56/ZOPOqxwAslb6s=; b=Krra2AO1WcOSQqk+JdUTi
	zjfLxN5Yu1jGnZudTT+OhW/Kzjy6R9GBobepraZvbsijfOdUyf6Ko0n1p8SbwPBl
	YK8RvdJp88XZ2bRodSwAU0Zrr4RKbrSeKdxUKRuCFHYkK5p9IjoEJ9gbpy6p+Bn/
	1wma1XsgoxENcc8lxb0zw5E8A60y3i8thejTvZR8ERxD7Ru1XHj1XayX9AW7zu2A
	p2P+OzwEDXrAqeyWmWJmz6O8dqEaAU5rSme5i83E2Pu23V6C4eiTrdQtEweAlI9q
	H0vGJD8niqj51Mr9MEmmCAenFt3BvNoDD5/3OCUiIe5vHoJgx8R8qXvJHc7UQTcA
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47bfsqjd12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 03:17:00 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55I7Gxuo031034
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Jun 2025 03:16:59 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:16:59 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:16:59 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Jun 2025 03:16:59 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.56] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55I7GkPf027550;
	Wed, 18 Jun 2025 03:16:55 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Wed, 18 Jun 2025 09:16:43 +0200
Subject: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
In-Reply-To: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <gastmaier@gmail.com>,
        Jorge Marques
	<jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750231006; l=2735;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=OxcJIOubdThp/od04BP7j+lpLRH0YfmJ04jgzmTq8D8=;
 b=dSthwIDzsuefUtoxI/iqjqyoHhHQdPD0i+Ei7LcNPb7L7BYAfqXDb9BgWwBolYc/Y16NkUV2l
 sF7ixuOzEOUCPW+Lc9zlnzZtcU3BhObMQ+9RtEz3QOAabIMN9vyYKvY
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 0M2dK_CBMR1A6wXZO6ryvxn_EcxdOk9i
X-Proofpoint-GUID: 0M2dK_CBMR1A6wXZO6ryvxn_EcxdOk9i
X-Authority-Analysis: v=2.4 cv=d9L1yQjE c=1 sm=1 tr=0 ts=685267ed cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=BiVzJI_yISUpa7ZiZSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MSBTYWx0ZWRfX+G9qvLTFXheq
 IlHiWIP9qwz6ZmxqeoH/uzHOL3lQQYQnVVrbd1OjkvbGtQLY+boDrpIulb222A7FCRLaNxfC7dI
 BFViPrAeyC/Slle9Dd2obcP2xTwDq8YRFm+SyHJW2U9Oz0a4VS7tV42EDo8Lv8MyNNZUMC1SyCA
 awGWsXtugOa7vD175p466NR1BWjMcSsoQZ+HtwbdpRXTFpqDFqZAVujsGNH+yueJTUexhaOIjLM
 0c+QIjwjYAQ0tqbPJXIOt3olMPopNFpPtTwxCIbrb11cEuShvU6g9SJT/A+A82Nz2zz+tIgwPB+
 Sre0AgNfSKTSvWde0GJ8ROdux9JoIZUTug0Bz50lxID+U7ekgggki5ru8pDS+Hycrb9ElA1lmh4
 enUUxfd7L87T8aWem20Pi1TPF511MBXfEy/RdHetjHCOz/4Zw24FGOv641CU/hqJHrlDJJHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=921 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180061

Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
core that implements the MIPI I3C Basic controller specification.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
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
+  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
+  implementing a subset of the I3C-basic specification.
+
+  https://analogdevicesinc.github.io/hdl/library/i3c_controller
+
+maintainers:
+  - Jorge Marques <jorge.marques@analog.com>
+
+properties:
+  compatible:
+    const: adi,i3c-master-1.00.a
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
+      - const: axi
+      - const: i3c
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
+allOf:
+  - $ref: i3c.yaml#
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
+        clock-names = "axi", "i3c";
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

