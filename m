Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CB2836BD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412436; cv=none; b=EtXSkzC79MrOtFrDMz8eU7NjxUOtnpecQHDo7tFlo98UN4KCX68jTwi5RScIDJ/2vXjuIkhAV6Rx3UVvzehTM3jKxWWPStDwF3zJiCj2Y1baD3TI9+0kIjZnWhozHsmCqcsihiG9Jh3JCpEfrESX6bu1Fvra3mhjA6Mc+X65GqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412436; c=relaxed/simple;
	bh=wnNuWBhhiBYhfwf1/wOF3T9jJmwhlRTf8Gd5LjIiUkY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYfvOOm6zdMysn89Hbic1m8llgLJk0WVwz3COmgaBpqkbACeOyqyzydJW3cOm7OzXvj9+rD9jDGmFkZh+NJNUPCeTw6F7XfbuuYb8qAHc72HpvPi94Nbvg0Gtzy/kRqMpV7naJXswaPfcbzizwwiGiyqgxuXfx7Ptznsp/LsHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bNsqm6nqsz2BdTx;
	Fri, 20 Jun 2025 17:39:00 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D44B180043;
	Fri, 20 Jun 2025 17:40:31 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 17:40:31 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 17:40:30 +0800
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
Subject: [PATCH v2 drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD irq
Date: Fri, 20 Jun 2025 17:30:56 +0800
Message-ID: <20250620093104.2016196-3-shiyongbang@huawei.com>
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

The debouncing when HPD pulled out still remains sometimes, 200ms still can
not ensure helper_detect() is correct. So add more checks and
hibmc_dp_link_training0() in detect_ctx().

Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v1 -> v2:
  - don't use the flag, and use more checks in detect_ctx(), suggested by Dmitry Baryshkov.
  - delete if (dev->registered), suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 24 +++++++++++++++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 19 +++++++++++----
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index 8f0daec7d174..8a965e143012 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -238,19 +238,33 @@ void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable)
 	msleep(50);
 }
 
-int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
+int hibmc_dp_detect_link(struct hibmc_dp *dp)
 {
 	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
-	int ret;
+	int ret = 0;
+
+	mutex_lock(&dp->link_train_mutex);
 
 	if (!dp_dev->link.status.channel_equalized) {
 		ret = hibmc_dp_link_training(dp_dev);
-		if (ret) {
+		if (ret)
 			drm_err(dp->drm_dev, "dp link training failed, ret: %d\n", ret);
-			return ret;
-		}
 	}
 
+	mutex_unlock(&dp->link_train_mutex);
+
+	return ret;
+}
+
+int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
+{
+	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
+	int ret;
+
+	ret = hibmc_dp_detect_link(dp);
+	if (ret)
+		return ret;
+
 	hibmc_dp_display_en(dp, false);
 	hibmc_dp_link_cfg(dp_dev, mode);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 665f5b166dfb..9b45e88e47e4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -50,9 +50,11 @@ struct hibmc_dp {
 	struct drm_dp_aux aux;
 	struct hibmc_dp_cbar_cfg cfg;
 	u32 irq_status;
+	struct mutex link_train_mutex; /* link training mutex */
 };
 
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
+int hibmc_dp_detect_link(struct hibmc_dp *dp);
 int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
 void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
 void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index d06832e62e96..c0de796225b7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -34,9 +34,19 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 static int hibmc_dp_detect(struct drm_connector *connector,
 			   struct drm_modeset_acquire_ctx *ctx, bool force)
 {
-	mdelay(200);
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+
+	if (!(dp->irq_status & DP_MASKED_SINK_HPD_PLUG_INT))
+		return connector_status_disconnected;
+
+	if (drm_connector_helper_detect_from_ddc(connector, ctx, force) !=
+	    connector_status_connected)
+		return connector_status_disconnected;
 
-	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
+	if (hibmc_dp_detect_link(dp))
+		return connector_status_connected;
+
+	return connector_status_disconnected;
 }
 
 static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
@@ -128,8 +138,7 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
 		hibmc_dp_reset_link(&priv->dp);
 	}
 
-	if (dev->registered)
-		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
+	drm_connector_helper_hpd_irq_event(&priv->dp.connector);
 
 	drm_dev_exit(idx);
 
@@ -178,5 +187,7 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
+	mutex_init(&dp->link_train_mutex);
+
 	return 0;
 }
-- 
2.33.0

