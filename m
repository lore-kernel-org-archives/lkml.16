Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BF01F4C92;
	Thu,  5 Jun 2025 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105284; cv=none; b=GMdj4/nXR6P9huZilt1AxchqoOS55z357fHFGY1fLZqzwit9ue4c0Do0g6rmjXvnQ5gOOPRmQBmzP2hoif0AxFCtl8VWQc/6YsQGCujJq7HowUyvcRLD/9+mx1STPO5uFAjZpk84o2mcqXkiSDcXtwZ9GXp1V/0tBGI5pKY731s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105284; c=relaxed/simple;
	bh=K3vXgO1zlgvYeORcvU/rVn72uCLkgct3vUie0/EZOlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4qMU3dXran8ZeRoIPfBNurn1/W6ViDCSaZqop3SILHcF56OA87Bko8jenA9Ww9NOL56n5rgk86TLVBW+nZY0TSf38F83Cr/UzwUAJj7N/SnKRqBqbFKpvSit63rk190OFQTNq8GdBDBf6yYqWvY8pBU3mKxw4CHdHfGcZ8UEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xzPsG4NP; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xzPsG4NP"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556YQ1V985073;
	Thu, 5 Jun 2025 01:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105266;
	bh=0g43eBPoit6Jtatj+4t9Bz21BhQHusi4cw3INLI08SM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xzPsG4NPhHGGZh6VOAsaOPC5kuBSyLayiKf/oO2v4n3t/+wshW6p93ap5MFMubh9R
	 QE5CM6eGzL5V9Inp2dvObJOnTn3GgGsu7HxWFPVJGdSCXfFHbSeVn/E8PHw4a/n/yL
	 9vq8LxYGkg2enRWBrNckd77OeGk8uPc32fWe62OI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556YQIn705750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:34:26 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:34:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:34:26 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556YPlk3167878;
	Thu, 5 Jun 2025 01:34:25 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Andrew Davis <afd@ti.com>,
        Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Peter Rosin <peda@axentia.se>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <s-vadapalli@ti.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <danishanwar@ti.com>
Subject: [PATCH 1/2] devicetree: bindings: mux: reg-mux: Add support for new property 'mux-reg-masks-state'
Date: Thu, 5 Jun 2025 12:04:21 +0530
Message-ID: <20250605063422.3813260-2-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605063422.3813260-1-c-vankar@ti.com>
References: <20250605063422.3813260-1-c-vankar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The DT binding for reg-mux currenly requires specifying register offset
and masks in the "mux-reg-masks" property, while corresponding register
values are defined in the "idle-states" property. This approach imposes a
constraint where "mux-reg-masks" and "idle-states" must remain
synchroniszed, adding complexity when configuring specific registers or a
set of registers with large memory spaces.

Add support of a new property "mux-reg-masks-state" to remove this
constraint, allowing offset, mask and value to be specified together as a
tuple.

Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---
 .../devicetree/bindings/mux/reg-mux.yaml      | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mux/reg-mux.yaml b/Documentation/devicetree/bindings/mux/reg-mux.yaml
index dc4be092fc2f..b029e2f28df0 100644
--- a/Documentation/devicetree/bindings/mux/reg-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/reg-mux.yaml
@@ -32,11 +32,39 @@ properties:
         - description: pre-shifted bitfield mask
     description: Each entry pair describes a single mux control.
 
-  idle-states: true
+  idle-states:
+    description: Each entry describes mux register state.
+
+  mux-reg-masks-state:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: register offset
+        - description: pre-shifted bitfield mask
+        - description: register value to be set
+    description: This property is an extension of mux-reg-masks which
+                 allows specifying register offset, mask and register
+                 value to be set.
+
+allOf:
+  - oneOf:
+      - required: [mux-reg-masks]
+      - required: [mux-reg-masks-state]
+
+  - if:
+      required: [mux-reg-masks-state]
+    then:
+      not:
+        required: [idle-states]
+
+  - if:
+      required: [mux-reg-masks]
+    then:
+      properties:
+        idle-states: true
 
 required:
   - compatible
-  - mux-reg-masks
   - '#mux-control-cells'
 
 additionalProperties: false
-- 
2.34.1

