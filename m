Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E319D4B1E5E;
	Thu,  8 May 2025 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746673771; cv=none; b=K6FyWZaX7Z+RJqpnr1+ldGaYiOdEyb6t/S8hIGP6C6izYUQQYFd6hRVFJuBW8NFl1zv/XTKMfMEz4R4rXbx6u9jpMArwKorTcVgGm0OoIA3VnfppuiAdHmdZOoPIxeP7eHzAs71xDrXimw6Ldp8dV5ruImVy+j8CwxT6m1SiIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746673771; c=relaxed/simple;
	bh=9VPUkAAqKJdFWpDRqamHtFrmx85GBqkgnKOSnrDI9vA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oObtfgSJHmAly0o7V/znJpR/e1oZAiykL53sgTFg3cnw9s+sk9JRBdWGIhKUDoYCrVa8WhUy1S1sSQ/OQ1uEvvCqn2R6qL1uM5ialUK3zPIQK+WEZzmwzXg/jJojTB/XA3llAZTu4CfsMgCGEdbaIzw99+/gGsg3u5TVEqdy84M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EFd6c7Kw; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EFd6c7Kw"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54839KTa982443
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 22:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746673760;
	bh=i8RU0fbhH6U3yXyRxm0j+S6qxPOhhNP5iZUZq5SHWkU=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=EFd6c7Kw8CRgFAsa70xcFmpdhdP7ddY9ZNBmSSVTKdb/U395KNpqvgG+QUY3aCYd+
	 EMKgzYazfEv4Zq/u6a8jR5fc0qBLN2MkXFCGVgD1nicNv9dJwsPi2kBUABF07Qb9/q
	 ms1xj4hwzWEV9JODyrYinI0pnRogL3TxYd1e/ivg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54839K8I008939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 22:09:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 22:09:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 22:09:19 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54839JRi020147;
	Wed, 7 May 2025 22:09:19 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 7 May 2025 22:09:19 -0500
Subject: [PATCH v5 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-am62lx-v5-1-4b57ea878e62@ti.com>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
In-Reply-To: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add the binding for TI's AM62L family of devices.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - separated out devicetree bindings
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb764..6f448433d3b2e 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -31,6 +31,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:

-- 
2.49.0

