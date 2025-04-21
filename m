Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C321D3C5;
	Mon, 21 Apr 2025 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271996; cv=none; b=qbpjU7PMkmCnQlNuWiIOtYQuNoFqOimNg2CeOQiiT/Yy0jc6bjDCZ2pMb7JQNFknynbO2+w8NNlzeUuXZt+RkYysNWfJ9tzj3vBlXriC0snDILYKl2LXHqxTw0575eazdJeBqKcG1iuJyTOYmLXpmv+nF/jKM4m2lCJ6sNyDUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271996; c=relaxed/simple;
	bh=GE9+w7lgQ+BD4S5m0aE2b4g3LKBlmZ8RBF7mc5nUT2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCn4z5v1nWZ+Xu3e6t+7VWCNHjev/ukgonKpNJW4IaWDW0aecZALbnCzPeGKcbsC5KKhqDCDGRlgFVQNNjlpsoX3cLy24zhrc3kxEdstEvjgmhM++9eX0G/lHVzQFrLPxXs1fQDdTvPoj2zRxWUrZNXJ570Dsx8fdG1KKWSn4sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sHJ4i/ae; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sHJ4i/ae"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMYc1033928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745271983;
	bh=Vjypw+5SWKXj3fJsQevbLbIsP5kna9ij086B85mf7mc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sHJ4i/aerLXl4mgaf97v2QF7266prQFMmObmPFUNFsxEsVfPjm+Dvt/EmA1D1l9aC
	 qtlmaM4QCJfdklcFPQeteix5MVu5btNxwxTA9jxmM3pinR7AIeUV6p6l0tdxxdkDRx
	 y+gQslRsuJ+G2lkV7DA/raanKt4wKCWnBOF15OOo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMdB118843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:46:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:46:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:46:22 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLkLqL038764;
	Mon, 21 Apr 2025 16:46:21 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/3] dt-bindings: mfd: ti,j721e-system-controller: Add compatible string for AM654
Date: Mon, 21 Apr 2025 16:46:18 -0500
Message-ID: <20250421214620.3770172-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421214620.3770172-1-afd@ti.com>
References: <20250421214620.3770172-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add the child nodes that can be found under this node. Then as done for
other similar devices (J7200 and J721s2) add support for the AM654 system
controller to this binding.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 13b6b6fa5dee7..f3bd0be3b279f 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - ti,am654-system-controller
           - ti,j7200-system-controller
           - ti,j721e-system-controller
           - ti,j721s2-system-controller
@@ -73,6 +74,18 @@ patternProperties:
     description:
       The node corresponding to PCIe control register.
 
+  "^clock@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/soc/ti/ti,am654-serdes-ctrl.yaml#
+    description:
+      This is the Serdes Control region.
+
+  "^dss-oldi-io-ctrl@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the DSS OLDI CTRL region.
+
 required:
   - compatible
   - reg
-- 
2.39.2

