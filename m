Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312A3288C21;
	Fri,  6 Jun 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216129; cv=none; b=mnR+B0+0awO/GsEejXiFxvEoXnEuNUq7pvjXk7Ddc1bgh7FjCPTT1Lp9e+/VkXtSxHrpcyiykPg8/slte8W47eYXLQhUW94Pat+tboDLAfpOkRnx3ic/werKNqhp5ppKKgihnsJCLsA1FiSfscO8JEidk3d8/MaKT8mlJiPWxoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216129; c=relaxed/simple;
	bh=4lfqDinsst5rxiSPQwy+MHQH7sSvuercecpUyNyRXKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ITTpOVhzjofMRKqcuVttNTFFBHNbSRfTssnx+x7hBnDSfbxuQ04b5LeNoQp41qbWErQ7aJv1+bzZMcxmprakgiucXwAvbPTxPFAAhBeQmANwDZJfDaLesyrYGkk019dHUDNs2PYQQ8KAC+bnk/aaUSjnJ0/VyvrGffHx4WS6VKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DHlw2z/9; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="DHlw2z/9"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556AVV6v023288;
	Fri, 6 Jun 2025 09:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vUOoO
	fDlzVwDstDNQmrOAz1FyWVCQ/REQ3X9anjHVPY=; b=DHlw2z/9rjOsx6Hs3hH8z
	e4aw22LBvxyxbgwXZ8nlz0ZX1ENyB+U0G1gOEFUaZfFihjNIl6g7TW/aOx9klRXu
	Dqtz7Xg96SYjX74dI16wOgi/3ZuJ1V6l5HAoJ35MlljJXvMEKch+Xq8R9Ncd9QkS
	qDVVc++e5bKAUr7nUy4bpP4AZ/zNi9BZ6OnhFNKQhHRaaRP3CFboW9l53kLhHC6c
	AgCSFgJSR/ysFRF2SpBgSBJIpfwJdCaUwAXOw6pjdnnotF/XFWf2Oc3dZiat/NxI
	sTXTux7qT8Ytr9JM7tBVx9mCaqKp4sI7uY7cAiNdMalWxMeCgvqq6oy/Z8xR+OLd
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 472k2ucax0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 09:21:49 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 556DLlIG061996
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Jun 2025 09:21:47 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Jun
 2025 09:21:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Jun 2025 09:21:47 -0400
Received: from [127.0.1.1] ([10.44.3.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 556DLYfh019626;
	Fri, 6 Jun 2025 09:21:41 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Fri, 6 Jun 2025 15:21:02 +0200
Subject: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
In-Reply-To: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749216066; l=2716;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=4lfqDinsst5rxiSPQwy+MHQH7sSvuercecpUyNyRXKg=;
 b=VRfb5ad1fsO2UimjJwuFb6kXNncZyO1T4JI0ATd1fxCfVsnyQONk9K624h4+8S4Z4S9TLTInk
 HI6ZMbDwKBWCrV4setzCV62yHy+aIV2ctCAOoJdmIqMLYBcd1ukcQIl
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: yN3oVh1gKricR2O7e8ib3HfbFIcQYaKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEyMSBTYWx0ZWRfX19JOc7qrNTjW
 1P00HD3W/gGJRRQa6QMY9//qk9YtQIUBKACqgwrTDPZw3Z6TxW3WbF6/IOzqiCgm5LDmdU9c6JZ
 Lf520ZAC+8aldlN89ogyndfAY12d/2FlRCvhHZNk/25wL6WQih5lWjBJCapiFBugveB26KFJeKS
 G+18LtN5N12WF8kTXqNU7xzGuvdytPOTxDwPAevyaQsx2SQPeJUqAgrKrLWjtFwOkWX+aY07eXk
 U26tJo2XFtxYyfKDQ9KeMgKS3hnzFRlmRyTKgctFgALBvccOfKwYIuPOhHsTnlIz00L67TfP8j1
 Hnf0tVtTr77XaWxYotYsjfSBy9A+fcvbOndCE7AIqZWXXm4b1vOJ13mUheeH09qNn1i0z4sxhqi
 KWjUhbQ3HrFdmPnjfLstzppW5cxf/7/9x+GW1FBaWlctQ9Me0q2Vt13iL/zuMVgraQc/DP8R
X-Proofpoint-ORIG-GUID: yN3oVh1gKricR2O7e8ib3HfbFIcQYaKc
X-Authority-Analysis: v=2.4 cv=Fv4F/3rq c=1 sm=1 tr=0 ts=6842eb6d cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=BiVzJI_yISUpa7ZiZSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=861 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060121

Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
core that implements the MIPI I3C Basic controller specification.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e7fae394ad8fd4143eb1fffb9591a30a2d6cc6ac
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
2.43.0

