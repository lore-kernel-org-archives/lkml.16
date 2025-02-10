Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A73F9C5;
	Mon, 10 Feb 2025 02:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154716; cv=none; b=oKfWQGNAU9q8bXnUegPyZ4QSD9+msF9CR6ZCi0BW3H/X8GUi/HZ+DU/VYL9PrZ7WxTVfil8bTqd2sR+1O2ae2njXKz9zpL7XIbtZG1RwCc6uyDNJzzckmr++EodSzbPbwBF1qVYHP2w0zMKWXzbzAvynxhreSDPJeKfB1dedWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154716; c=relaxed/simple;
	bh=hMRqijdQHpURuAmQgdJ4wKxWoupBVCW7dGZTaMpJ+nQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=p3vV1XiM9hZU28nJ8tvds8dpsuOtpVmf3fD44Ge9RRgMpYk6uvbFhe9RbWpxIuHo6VUmWjC6bkAtQTKx3QkGzSvQ0vrYklgvgtNwbM7ZLlaTMx2YB0cp7OfaivskflJK5T0a9+InmtWkL8KNZ7zR/lCo9zBYBjaxqad8qnzXq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AJ2X5vTN; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AJ2X5vTN"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A0PgxP014127;
	Sun, 9 Feb 2025 21:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gTKkZ
	j8yQLOXKBDceOLTC8y4DUPzQevS4+5RV7oOj+Q=; b=AJ2X5vTNDrY7EY+Sh56ir
	/OE0Pi6l+TsUIuDg1XGPcqA6UopL/mvvxDGMv8MstV2/gBJ6xFVcIZYmaQqzLDFA
	ab7TLJYBGkBwNpHytG5BHs450fxICulDaD5fjMr2GhH8tRs35wDCk88KN0sksF21
	79xOEdlaR6GANQ4cdmpeqkNoM+fYs37Z1Puz8DwGwoS7w7RzodHnPOm3T/qrRSOu
	pxAttvzir4X4JKyKjSiWcVItoOXHuXgKbTdCfbiLxClYULkPj47dtMrlWROF4omX
	JPZtrQvUODYMXyQxq9xQqFSObQ4IuMAmOn2mlqV/3dogwms2jbE6B+mbOZbFWjw7
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44p529n8vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 21:31:45 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 51A2VfnM018807
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Feb 2025 21:31:41 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Sun, 9 Feb 2025 21:31:41 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Sun, 9 Feb 2025 21:31:41 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 9 Feb 2025 21:31:41 -0500
Received: from CCAPUA-L02.ad.analog.com (CCAPUA-L02.ad.analog.com [10.117.222.251])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51A2VLis017158;
	Sun, 9 Feb 2025 21:31:32 -0500
From: "Celine Joy A. Capua" <celinejoy.capua@analog.com>
Date: Mon, 10 Feb 2025 10:30:53 +0800
Subject: [PATCH 2/2] dt-bindings: regulator: Document the ltc7871 regulator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-staging-ltc7871-v1-2-c593ad86aab2@analog.com>
References: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
In-Reply-To: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Celine Joy
 A. Capua" <celinejoy.capua@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739154682; l=3695;
 i=celinejoy.capua@analog.com; s=20250210; h=from:subject:message-id;
 bh=hMRqijdQHpURuAmQgdJ4wKxWoupBVCW7dGZTaMpJ+nQ=;
 b=LNdlm0FWioskbgB1S6+Lyjv6jUObu1213M8MYp3IiVv+PPVKeLY4/ZQHg6hzYcZFDvuMe56AE
 sY38Hch2J4XBbFG7fI86ZysG38BmcI29ma53V/D8dGokofzckVd2Xs1
X-Developer-Key: i=celinejoy.capua@analog.com; a=ed25519;
 pk=7kw4U3NQswQj33plajHOwzScUl5kbavfQVO78tcggn8=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: Oh0-NttBFi6WRVxx1wSnLQVwf8APxQQO
X-Authority-Analysis: v=2.4 cv=FabNxI+6 c=1 sm=1 tr=0 ts=67a96511 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=J5pWkT1JHglQ5616DUsA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=oVHKYsEdi7-vN-J5QA_j:22
X-Proofpoint-GUID: Oh0-NttBFi6WRVxx1wSnLQVwf8APxQQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_01,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=967 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100019

The LTC7871 is a bidirectional buck or boost
switching regulator controller that operates in
either buck or boost mode on demand. Add
corresponding DT bindings.

Signed-off-by: Celine Joy A. Capua <celinejoy.capua@analog.com>
---
 .../bindings/regulator/adi,ltc7871-regulator.yaml  | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/adi,ltc7871-regulator.yaml b/Documentation/devicetree/bindings/regulator/adi,ltc7871-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b1ae8b16e19c11b3faf2d4a41a4ae4f615ca3c1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/adi,ltc7871-regulator.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025 Analog Devices, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/adi,ltc7871-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC7871 Buck-Boost Voltage Regulator
+maintainers:
+  - Celine Joy Capua <celinejoy.capua@analog.com>
+
+description:
+  The LTC7871 is a high performance bidirectional buck or boost switching
+  regulator controller that operates in either buck or boost mode on demand.
+  It regulates in buck mode from VHIGH-to-VLOW and boost mode from
+  VLOW-to-VHIGH depending on a control signal, making it ideal for 48V/12V
+  automotive dual battery systems
+properties:
+  compatible:
+    enum:
+      - adi,ltc7871
+      - adi,ltc7872
+
+  reg:
+    maxItems: 1
+
+  adi,enable-chip-ctrl-wp:
+    description: If present, this indicates the use of regulator's
+      internal write protection.
+    type: boolean
+
+  adi,ra-external-ohms:
+    description: External Resistor used to compute the value of
+      programmable VLOW in buck mode.
+    default: 10000
+
+  adi,rb-external-ohms:
+    description: External Resistor used to compute the value of
+      programmable VLOW in buck mode.
+    default: 107000
+
+  adi,rc-external-ohms:
+    description: External Resistor used to compute the value of
+      programmable VHIGH in boost mode.
+    default: 12700
+
+  adi,rd-external-ohms:
+    description: External Resistor used to compute the value of
+      programmable VHIGH in boost mode.
+    default: 499000
+
+  adi,idac-setcur-microamp:
+    description: Adjusts the IDAC_SETCUR to program SETCUR
+      pin's sourcing current.
+    minimum: -63
+    maximum: 64
+    default: 0
+
+  adi,freq-spread-percentage:
+    description: Sets the range of modulation with respect to the
+      switching frequency.
+    enum: [+-12%, +-15%, +-10%, +-8%]
+    default: +-12%
+
+  adi,switching-freq-divider:
+    description: The factor at which the switching frequency is
+      divided to get the modulation frequency.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [512, 1024, 2048, 4096, 256, 128, 64]
+    default: 512
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: regulator.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      regulator@0 {
+        compatible = "adi,ltc7871";
+        reg = <0>;
+        adi,ra-external-ohm = <10000>;
+        adi,rb-external-ohm = <107000>;
+        adi,rc-external-ohm = <12700>;
+        adi,rd-external-ohm = <499000>;
+        adi,idac-setcur-microamp = <0>;
+        adi,freq-spread-percentage = "+-12%";
+        adi,switching-freq-divider = <512>;
+      };
+    };

-- 
2.34.1

