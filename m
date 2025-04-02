Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22673236A99;
	Wed,  2 Apr 2025 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593532; cv=none; b=IkmcyJJahvNthpFvm/pkP64cGGV9LxA/DRvm8/wu8Cn2Q0vKkITtOg8hOBpriXD6+80i8hyQW98o4VXNVWdhA6iMlWlxAlvFWXjuwE7mxrTQWMO7uuOLaynPu4SkvjV2DoOVpjEULQU6cqyHVJHxKLrmZ58Tr32chInTgFOs93A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593532; c=relaxed/simple;
	bh=8WhNYugsSqHYYkJ5SfOI8qiq7dZYIPTnffMpuptuLHI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTn/eOjZ/NoPsXqn/q47laNLiRwwfWQu0yJvdA+ggW64/U05wmz4BpONN0VIey2uO0HU1kPqno8Hn9kFNkWHarH8aaCIekedIsE3ydTTTJMTXzxHZpHmj02i/RLuChX+/Fl7Hg1kL/sqFUdM4ZWgxFEycGTJBHrmZKebMEppLC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BoLlrrsr; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BoLlrrsr"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW5iW3915800
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593525;
	bh=aMs2O+a+TiQUYN0V8AKxd4jss6ijSi+/4hLvnBJOlks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BoLlrrsrE+X0b/LBEXf6dH1ajnK91L8NDlsMoCIpOCJNl5pMhxvch6CFrFqr6RTBw
	 a1nmVR/m4HsvpKArf+xofLuca2xz8l27/emVEIHw7rY6+SOXkXvr6ncuBGIk5dQ2pR
	 TKLd2YNnkBzgouuuOoqjGuF7bcsIrIXzX2oQUfIc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW5ku123244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:05 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:04 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW3Vx017352;
	Wed, 2 Apr 2025 06:32:04 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 1/5] dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl property
Date: Wed, 2 Apr 2025 17:01:57 +0530
Message-ID: <20250402113201.151195-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Andrew Davis <afd@ti.com>

Add a pattern property for pcie-ctrl which can be part of this controller.

Signed-off-by: Andrew Davis <afd@ti.com>
[j-choudhary@ti.com: Change description and add example]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 378e9cc5fac2..13b6b6fa5dee 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -68,6 +68,11 @@ patternProperties:
     description:
       The node corresponding to SoC chip identification.
 
+  "^pcie-ctrl@[0-9a-f]+$":
+    type: object
+    description:
+      The node corresponding to PCIe control register.
+
 required:
   - compatible
   - reg
@@ -110,5 +115,10 @@ examples:
             compatible = "ti,am654-chipid";
             reg = <0x14 0x4>;
         };
+
+        pcie0_ctrl: pcie-ctrl@4070 {
+            compatible = "ti,j784s4-pcie-ctrl", "syscon";
+            reg = <0x4070 0x4>;
+        };
     };
 ...
-- 
2.34.1

