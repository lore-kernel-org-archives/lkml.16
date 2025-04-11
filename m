Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE364645;
	Fri, 11 Apr 2025 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744351091; cv=none; b=BQxjlxkpsnEw0Cs2KfuFhMH1F50e6tTPqhqDOLqXvQEf3IQGlgrp+Xgj6afuM5/TlsEm4UbtBCWBE1KYr93Zb684B0svmgaPYoNidbUWQZN+tK4A+n+n8WXsvCU4jbMoL3AW6ry9hVw+g168k4Bw1JgcULWC3u/NPtpCneNX3IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744351091; c=relaxed/simple;
	bh=owx8yacVvxem6rPY56dmtueRi13HtWZqxRuDVF5Y7iw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bC9m/yBkb2hZtazpiMHLrE+wkmgnEBRqESYtAaWWHuqLF0NvGgKp0kbybttaPkHNz0W04PKExehsDs7IH1w2884qb7U4fHRtUWlLkvbuUdMd0c91JOWM6o+eiBXFABN1yQgEaPDHQMcwI0zUpAsXth4K0zdcdPshFd4s6/oH8og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c/pdu57I; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c/pdu57I"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B5vmqo2020329
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 00:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744351068;
	bh=Q59HgdDBxXW3RUEMQuXbm4IX7T1E0mDEkoYnlFm6hPY=;
	h=From:To:CC:Subject:Date;
	b=c/pdu57IciznWH55f1JIfsADzOf0w6WvOn3QV1U9b1eLKe5BmAqFfZ/nouFrbXoSS
	 Zr5CuDwaDWkxtsHGaTe7rHxApdwzjKnZtVOmUy2BwMTog3jHuJ+tCgivD6Trz/kQ5p
	 woTtlXxZ3GZoPhc+9/DZKu1hrdNZT+wXEl5rzpF8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B5vmZi023840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 00:57:48 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 00:57:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 00:57:48 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B5vhgr048099;
	Fri, 11 Apr 2025 00:57:44 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
        <yamonkar@cadence.com>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] dt-bindings: phy: cadence-torrent: enable PHY_TYPE_USXGMII
Date: Fri, 11 Apr 2025 11:27:43 +0530
Message-ID: <20250411055743.623135-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The Cadence Torrent SERDES supports USXGMII protocol. Hence, update the
bindings to allow PHY_TYPE_USXGMII. Since PHY_TYPE_USXGMII has the value
of "12" while the existing maximum allowed PHY TYPE is "9", switch back to
using "enum" property in the bindings to account for this discontinuity.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250411.

Regards,
Siddharth.

 Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
index 15dc8efe6ffe..9af39b33646a 100644
--- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
@@ -99,8 +99,7 @@ patternProperties:
           Specifies the type of PHY for which the group of PHY lanes is used.
           Refer include/dt-bindings/phy/phy.h. Constants from the header should be used.
         $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 1
-        maximum: 9
+        enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12]
 
       cdns,num-lanes:
         description:
-- 
2.34.1

