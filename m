Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38A61FCFDC;
	Mon,  3 Feb 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591464; cv=none; b=CDISQxYzKeinro6TPEZqbQLbavcvoUNx2GvVJf6sRkld8lkxT9jKqJsRY3B5UxELGiqT9/w4e6LaIXsqAWjk0Bqa7r1pbdkvmwYpk866kLI9Stl0ccova0K/o0KUbl6/ohSMVBOHHnTbhA6psFe2Dwr6zVH8tZaeTTn8wRVMSsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591464; c=relaxed/simple;
	bh=HZL337EBIbjzUeN5s//5Tri9Plnc/gZ5wQbTCTf3xHA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kE1nsZcQhmRyiq9H/UcEXHaaQuUntc3tcWt8KM6rLVu8fCbsFuMuQwmebiTQcD+7nE4WVhqySosvjImWDhbVrCTWNoALKNV9cSc049D8hVL+94+PA3FkMXHThbjw26+pYZv9VBGsxv7ghNAdy0zr7kiLsqLLLoNbg/mzAt1utRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HK292aNI; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HK292aNI"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513E3PRh3026657
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 08:03:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738591405;
	bh=risQ65T55Tm6eYa1TdwpJHzLazGd9IsglOpUNuMRuXA=;
	h=From:To:CC:Subject:Date;
	b=HK292aNIVDqDJmRQaMufd725Kbw0S55a7MXRShiHfGnrv23bO6IRnEfDVGs7euDQ5
	 XdF8K3Xo7aFZeKg8LGTJXPsUehm/ztaH+2nnhX9I5+e9c/MY997SKSx/G5YQs0PCL3
	 yQRBkcQWu+XF3vLzNT8es5MZu7KDp7mhIdRnIRdQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513E3Pvh078914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 08:03:25 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 08:03:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 08:03:25 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513E3Ox3036019;
	Mon, 3 Feb 2025 08:03:24 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
        <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
        <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
        <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH] dt-bindings: display: ti: Fix compatible for am62a7 dss
Date: Mon, 3 Feb 2025 19:33:23 +0530
Message-ID: <20250203140323.1992920-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Fix compatible string for AM62A7 DSS.
s/ti,am62a7,dss/ti,am62a7-dss

Fixes: 7959ceb767e4 ("dt-bindings: display: ti: Add support for am62a7 dss")
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 55e3e490d0e6..31c4ffcb599c 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -23,7 +23,7 @@ properties:
   compatible:
     enum:
       - ti,am625-dss
-      - ti,am62a7,dss
+      - ti,am62a7-dss
       - ti,am65x-dss
 
   reg:
-- 
2.39.1

