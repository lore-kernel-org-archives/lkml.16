Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E9EEB2;
	Fri, 11 Apr 2025 03:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744342197; cv=none; b=g2JDXivlO1FSmc4UWZ9i+pGZJ3NkLkvLkJrXMGb68gEWuHvcQzYvZ+VD/xw5dOKXAdj4MFu5uZ+0zqOZGKRY1GX8KUyei4yvpvI4O6AstLR+8+VnZCOWAjqCNRZjj1HdqEvyjHOzx4op7mcppt0an9MKUraJyVJZpokQn9mhFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744342197; c=relaxed/simple;
	bh=v86Y4EduVx5F581Emtz+UbUkY5PRb6rrKBbHjK/7wwA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qgslPTEsUeFub3+1S6Te/710faBIAjXc38gSCWdZsvjcHyzDAgS4N2QLuZ/Kf9SR5ykfMIYljQNwRpGOK0pFaoiKA/5SOxY7XPw5kC30tXhUUP5DyLN47ck4UsmJlSZWlLkyXiDwZPkf4/ObeBU96tIs2W08OZ898PbgZRh9PP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HA6gSiUa; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HA6gSiUa"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B3Tko41957778
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 22:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744342186;
	bh=cnH9sNRRqDYsJGbaVdR1OckLSTLwwD1L+xoqIwIinS4=;
	h=From:To:CC:Subject:Date;
	b=HA6gSiUa8riQ/P+7YmxAmGIK6BIbWnXN/RLmaAoMbp2GqmIJEkk3AZyg3yD88CJLP
	 oJFS96apCJTonSPvPStyhZnh974BrNxhrQDl+Aasq2QPWlobS707tb4Q199kAJj5cW
	 zQbM+DBIrmTriUs6PCnGncHsK6LeFHhB/FhtnxGA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B3TkKH043200
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 22:29:46 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 22:29:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 22:29:46 -0500
Received: from lelvsmtp5.itg.ti.com ([10.250.165.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B3Tge8027417;
	Thu, 10 Apr 2025 22:29:43 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <jwboyer@kernel.org>
CC: <shenghao-ding@ti.com>, <linux-firmware@kernel.org>, <13916275206@139.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Swap channel for SPI projects.
Date: Fri, 11 Apr 2025 11:29:18 +0800
Message-ID: <20250411032918.1739-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 WHENCE | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/WHENCE b/WHENCE
index d987f2b7..0e90a8ae 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8412,8 +8412,8 @@ Link: TAS2XXX8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
 Link: TAS2XXX8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
 Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
 Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
-Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA0.bin
-Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA1.bin
+Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA0.bin
+Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA1.bin
 Link: TXNW2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
 Link: TXNW2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
 
-- 
2.34.1

