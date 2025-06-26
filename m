Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F1421FF37;
	Thu, 26 Jun 2025 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932497; cv=none; b=L8MSmH13bTDqjzz5MU1lVMEtW12Xdfr/81gI3SaggL1qVdPvhEzWoXlv0MMmsXmN4uH7Eb8QFkWcs/99cvNyCTtEdAZhulKbooyDWDPH/Zw4lMqCezGwOpMQX3qIihBeoqpRBEmL1RCGKjt1Fl/FqXltMGb1mWUrg0mEXSutn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932497; c=relaxed/simple;
	bh=DtBgfP4gMa3+l7MHXIJyse+ahiEbPxkfsagoFKikI+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rtdGB2eez4/HPBFiR1FAge62JC3JY6iLS4XhXh/aqKvpbFV16+Do+fCxxsVkKUQArXmpZ++ADhM9Y/DhixivTlENaI1zmsAOL7/aGMFPaWEz/K4XqxY4jInvAd265gabMUrZo4iyy6M+l/x1aljhnW3BJDTQ2SgS5ZKXqExSLuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=zkAgJUDP; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="zkAgJUDP"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q82LYd024500;
	Thu, 26 Jun 2025 06:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+JBZQ
	k9+5pYaD/CIzOksmIKi5WNaVQQZWHpOsiT582E=; b=zkAgJUDPwdY/kV0OlqSYC
	iFTN2TEJ6p1uH/5cx7hVNa3qlTL3asIGeBf0zmCj1TLvKUBbdggva3b08Cp1HQd2
	nBHR+0br/KIXH6YY94Cwo+7frufqeQC3sD9JBwtNyYRm1fq0tn8d0TMGYywyuKBU
	tqwaKmnjzMoFjFxBrM4fXQ7OGVgW9uP25QJAwOu9FZ5i8slUczl9oILwxLJL5Kuq
	2k1bj6/Dm6hBou5Ap32cx1O08OKg2EPPNYR9RqaixtL2UR/LEgpPbpsoj12LqP30
	NUJVead4UYo+pq8NKgsWfk5tbmO7DifmVgc09Rz1GnKpb7r9bbEfr/5Ed11WdDPD
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47ge72xk14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 06:07:59 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55QA7wmN043559
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Jun 2025 06:07:58 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 26 Jun 2025 06:07:58 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 26 Jun 2025 06:07:58 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Jun 2025 06:07:58 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.62])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55QA7huw031419;
	Thu, 26 Jun 2025 06:07:52 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 26 Jun 2025 12:07:36 +0200
Subject: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
In-Reply-To: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750932463; l=2931;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=DtBgfP4gMa3+l7MHXIJyse+ahiEbPxkfsagoFKikI+Y=;
 b=hsABvo197wtiK5N2tGG7JrDWv8eqXMJKMmsu8B4OGIrqYsgwVIG2pGkkzeANooVGB5+ktMIko
 7/zwHZunGvMCzuAzEbOGL8//zUaRVEHqAfMP6aitsTi0X5YJX4sh8Gq
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: TUBU97KK_ySBFUFhet6CsmRKvFpJSPIo
X-Authority-Analysis: v=2.4 cv=DKGP4zNb c=1 sm=1 tr=0 ts=685d1bff cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=griirDNZpteYz7WkQZ0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-ORIG-GUID: TUBU97KK_ySBFUFhet6CsmRKvFpJSPIo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA4NCBTYWx0ZWRfX839Wymw170+9
 52zEFaESwsQO3zhUY1CVEkuM3uxHA3qAuPMikrlTYDZ7WPWTl3JPiNsJrjc/9Y6O6TNdW0mNkDC
 1ps0EirdUD579BVxArBbEmVHspGZywqkDLpMRySJfGGRamlmuMB1Uk7nZW0fNk4K3QfgJJxxXgj
 1rqY02E7xjL1HRrtwehtYIDTegO6kc9JRiYRHNVk6rxJ7lpw5SIG8pDR2hhehG7c8CXf5SdZItK
 nSR5PczP+QEwzszOcPVKSdhpcWLSbxaFAPNo1c/9sukuWESspsvy8jNnT3JSvvvMrR+cLUMaGML
 I1cVOAUYYrFPaLIFcDlUygXPAYzOq8cCFSCnFDIy+qRWEFtEhbeTTmJgJ2OXiFS8L1N+m/BJFvY
 6CAJqs5fOY2lWp9sq/qxk4hGZs2z5EBe2IK0Cq89TC6aab1ohnLfi9bHSUAdnRT62hcH6gBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=939 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260084

Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
core that implements the MIPI I3C Basic controller specification.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 .../bindings/i3c/adi,i3c-master-1.00.a.yaml        | 66 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master-1.00.a.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master-1.00.a.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9bad24187800cb47090f440b70c519b3f710adf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master-1.00.a.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/adi,i3c-master-1.00.a.yaml#
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
+      - description: The AXI interconnect clock, drives the register map.
+      - description: The I3C controller clock. AXI clock drives all logic if not provided.
+
+  clock-names:
+    minItems: 1
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i3c@44a00000 {
+        compatible = "adi,i3c-master-1.00.a";
+        reg = <0x44a00000 0x1000>;
+        interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
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

