Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E4312B93;
	Thu, 17 Apr 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891732; cv=none; b=ihy1Za3+qozinmBQ6tlAWPM2Y8kfROAeIi4+UswUduhmUGY3ZsF+ZJ6d7almze7Jjuic1kz6AJgt03ox6Owy8MQuwA7zFtYKxQ6I0War415ZDRgDgDfzM7/8Fh9+nr2oXmnRWxEAIpsq4hLbpRapF8stkjGyXZNT2tUBNhAK5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891732; c=relaxed/simple;
	bh=ik+6ZoWGrvG+xQX10oFL3IACybhCrcKL2S+rnUC0vf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ekoRT/jryRE/N+cM02m/c7fz46qN4SqtVt3BQR5CtRAhxvgMPTi5Te2xFpDtKWzU9k5sQy6aMlEBZuq1eF4Z7UPmdULZB8IsuOohmFvrdV653Def5AET3ky25cvIL7stNIZb1Xt9km8xwfp8JpE6fdokRQ84zbXfWzAL5joUKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Zdc913kM8z1DKcR;
	Thu, 17 Apr 2025 20:07:49 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id B88D518047E;
	Thu, 17 Apr 2025 20:08:40 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 17 Apr
 2025 20:08:40 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<yuehaibing@huawei.com>, <mitltlatltl@gmail.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] usb: typec: ucsi: Fix unmet dependencies for UCSI_HUAWEI_GAOKUN
Date: Thu, 17 Apr 2025 20:28:43 +0800
Message-ID: <20250417122843.2667008-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf500002.china.huawei.com (7.185.36.57)

WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=n]
  Selected by [m]:
  - UCSI_HUAWEI_GAOKUN [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_UCSI [=m] && EC_HUAWEI_GAOKUN [=m]

DRM_AUX_HPD_BRIDGE depends on DRM_BRIDGE and OF, only select it with
both for UCSI_HUAWEI_GAOKUN.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/usb/typec/ucsi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index e94956d27325..8bf8fefb4f07 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -94,7 +94,7 @@ config UCSI_LENOVO_YOGA_C630
 config UCSI_HUAWEI_GAOKUN
 	tristate "UCSI Interface Driver for Huawei Matebook E Go"
 	depends on EC_HUAWEI_GAOKUN
-	select DRM_AUX_HPD_BRIDGE
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  This driver enables UCSI support on the Huawei Matebook E Go tablet,
 	  which is a sc8280xp-based 2-in-1 tablet.
-- 
2.34.1

