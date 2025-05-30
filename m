Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D22222C0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599422; cv=none; b=lwYpA++HwOUtJfYZwyPSTr/jlMXY36Wzs+jTzf8w1AqzdqkMI6VTSyuKQAYdGIaCJKdE1INe5I0Z6v2X0rP8/7tFqleNwXJ93F3WB2p6s2/QLQcUS4N+lgeXAntmXTJEOr/398oBV3CJ1+5GHdNQPIcX5XgeDkBW5O3bl8xiXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599422; c=relaxed/simple;
	bh=gNpJ+H6/yFGkTaocCW9K0hFPX5Orp7Ia0BuXtwB+U+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CM0C1AJKT/LSfWc7nhms5wyZTt+U9U2msD9K5ytsMe1SXNvkIe0WxbOwEh2zxFZ1L4uKCekRE8YmZnVTAUvY9wPyANTrnpVKY1+mHGI5+soJmrulCNwO29BPNfq38E7tYw1fI4PzwOQp83imKPIjpHNGCuNH78d1dj+TkKJv/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4b7zLd1bgSz23jSL;
	Fri, 30 May 2025 18:02:33 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id AD1281401E9;
	Fri, 30 May 2025 18:03:36 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:36 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:35 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
	<shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
	<dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD irq
Date: Fri, 30 May 2025 17:54:24 +0800
Message-ID: <20250530095432.1206966-3-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250530095432.1206966-1-shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
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

The debouncing when HPD pulled out still remains sometimes, 200ms still can
not ensure helper_detect() is correct. So add a flag to hold the sink
status, and changed detect_ctx() functions by using flag to check status.

Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 38 +++++++++++++------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 665f5b166dfb..68867475508c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -50,6 +50,7 @@ struct hibmc_dp {
 	struct drm_dp_aux aux;
 	struct hibmc_dp_cbar_cfg cfg;
 	u32 irq_status;
+	int hpd_status;
 };
 
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index d06832e62e96..191fb434baa7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -13,7 +13,8 @@
 #include "hibmc_drm_drv.h"
 #include "dp/dp_hw.h"
 
-#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
+#define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
+#define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
 
 static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 {
@@ -34,9 +35,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 static int hibmc_dp_detect(struct drm_connector *connector,
 			   struct drm_modeset_acquire_ctx *ctx, bool force)
 {
-	mdelay(200);
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
 
-	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
+	if (dp->hpd_status)
+		return connector_status_connected;
+	else
+		return connector_status_disconnected;
 }
 
 static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
@@ -115,22 +119,34 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	struct hibmc_dp *dp = &priv->dp;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
-	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
-		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
-		hibmc_dp_hpd_cfg(&priv->dp);
+	if (dp->hpd_status) { /* only check unplug int when the last status is HPD in */
+		if ((dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT)) {
+			drm_dbg_dp(dev, "HPD OUT isr occur.");
+			hibmc_dp_reset_link(dp);
+			dp->hpd_status = 0;
+			if (dev->registered)
+				drm_connector_helper_hpd_irq_event(&dp->connector);
+		} else {
+			drm_warn(dev, "HPD OUT occurs, irq status err: %u", dp->irq_status);
+		}
 	} else {
-		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
-		hibmc_dp_reset_link(&priv->dp);
+		if (dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_PLUG_INT) {
+			drm_dbg_dp(&priv->dev, "HPD IN isr occur.");
+			hibmc_dp_hpd_cfg(dp);
+			dp->hpd_status = 1;
+			if (dev->registered)
+				drm_connector_helper_hpd_irq_event(&dp->connector);
+		} else {
+			drm_warn(dev, "HPD IN occurs, irq status err: %u", dp->irq_status);
+		}
 	}
 
-	if (dev->registered)
-		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
-
 	drm_dev_exit(idx);
 
 	return IRQ_HANDLED;
-- 
2.33.0

