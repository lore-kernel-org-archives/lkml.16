Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C4C15B0EF;
	Tue,  4 Feb 2025 04:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738642078; cv=none; b=HKpd0sXkS+MkASwUrgOC7o4sLM2LAKbVV1Bu2ojO6bQD3xVG9+RCsd0758PcZvsdJRlyixyd4OlDpwTuHTfZUxmnYS6ZWzbFkHlKrDWXYwVg5ylPZ7+s8xcTzO7xNa7H9Oj07RCELjOYAYLtnphF3rcfKnX1+Ek7i8yDa4rC0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738642078; c=relaxed/simple;
	bh=WVJKJCXafoZDt2fgMo2hfVB4TrepTpU/rLmSnRwwsmE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QXKWrGRECw6Ck1n3V0aqtVm6WSWAvfOQTOxjCRjI+lC3nW6jEomm9kYQ/6tIkf3ZWDa1DFQv9M3kWj4gBCwp7G/jWkyJgzZFpv1FjevO0TXMBln/+1ckICDZRlP9yp1g4LRVbzSOttK0qge63BHwS4OjmCQrZ5FE4MbBg19eMWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tIoNct5z; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tIoNct5z"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51447iLN3082441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 22:07:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738642064;
	bh=p5otmGI6O7LQBHDsBHInGlKABWHLbf34yMb/QXQ/q1o=;
	h=From:To:CC:Subject:Date;
	b=tIoNct5zTj3F/Q1KaRd+YJJgEb/mxc9nf2MVY66QK7ZFa/A2XUJPalsTAnaBt2HRh
	 qltKSVCZcTJxRy0g0xt8j6Sx5FbItnTPeJ/vWAuoN7efA++ZGlqmX1OKBuApMJAxtg
	 V4YxMtgyD4vu1LNwKnAcjFj8VUOsw24B3QxAlqZY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51447ifX103878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 22:07:44 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 22:07:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 22:07:43 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.127])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51447etc078001;
	Mon, 3 Feb 2025 22:07:41 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <linux-kernel@vger.kernel.org>
CC: <baojun.xu@ti.com>, <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] MAINTAINERS: remove Kevin Lu from TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
Date: Tue, 4 Feb 2025 12:07:37 +0800
Message-ID: <20250204040737.657-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Due to internal re-org, Kevin Lu has no longer maintained audio driver.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..bc0bf402818d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23370,7 +23370,6 @@ F:	sound/soc/ti/
 
 TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
 M:	Shenghao Ding <shenghao-ding@ti.com>
-M:	Kevin Lu <kevin-lu@ti.com>
 M:	Baojun Xu <baojun.xu@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-- 
2.34.1

