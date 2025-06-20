Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0827CCF0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412436; cv=none; b=c4rC3NaqhngYBPtmD/uNE6EuWd2W7kDqh4epLtbbuMTiXiCdhXRizKfduWpcLn6/YhG7+VcGaPRjahgRU0f7/ZMt3rcVmodocZT4/6MOq37i5GLveFOgMgS9mKPuZadntniT63bFvzhpaJTfhKKKScJI+/2yNQ8RR7yRE4mRjLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412436; c=relaxed/simple;
	bh=AnjOHa+qv9lnzUlSc0ChLjErf3qcfsW5NrUfWsFhkhQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JO4GALg9wE9HcPvqZI69BWkRs6SjA77Q3Fe5JhA64caKzKAZZKTD94ldrVZ/ZTiNKuLzfaae6se0GJbb+qHa3jUz3AO7PnkFhwBHbS7LWVf5E8AClN5L6UeUBU32QfnJiLwuKxHISgPuaBoHs8p/6SMwepAFCwjuOa7sTu934QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bNspl5R4vz28fWQ;
	Fri, 20 Jun 2025 17:38:07 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 660121A016C;
	Fri, 20 Jun 2025 17:40:33 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 17:40:33 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 17:40:32 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 drm-dp 07/10] drm/hisilicon/hibmc: fix dp and vga cannot show together
Date: Fri, 20 Jun 2025 17:31:01 +0800
Message-ID: <20250620093104.2016196-8-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250620093104.2016196-1-shiyongbang@huawei.com>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)

From: Baihan Li <libaihan@huawei.com>

If VGA and DP connected together, there will be only one can get crtc.
Add encoder possible_clones to support two connectors enable.

Fixes: 0ab6ea261c1f ("drm/hisilicon/hibmc: add dp module in hibmc")
Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v1 -> v2:
  - don't tie VGA and DP status, suggested by Dmitry Baryshkov.
  - use crtc clone to let 2 connectors can display simultaneous
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index ac552c339671..289304500ab0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -115,6 +115,8 @@ static const struct drm_mode_config_funcs hibmc_mode_funcs = {
 static int hibmc_kms_init(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = &priv->dev;
+	struct drm_encoder *encoder;
+	u32 clone_mask = 0;
 	int ret;
 
 	ret = drmm_mode_config_init(dev);
@@ -154,6 +156,12 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 		return ret;
 	}
 
+	drm_for_each_encoder(encoder, dev)
+		clone_mask |= drm_encoder_mask(encoder);
+
+	drm_for_each_encoder(encoder, dev)
+		encoder->possible_clones = clone_mask;
+
 	return 0;
 }
 
-- 
2.33.0

