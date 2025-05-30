Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02BC22A4E4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599426; cv=none; b=AF3mtG5w6AmoFTcFdTLdaE25lJIi9eoIz6thVTbGIX5U9R3Dzjvba5P5F4LAFBu6ct9h5ksUqf8vsMovffdqzzB9QF9Rd3WTJp6YqmFVeglLnQGxWVnkiQmDp6a/we30e9VfdkMgWTgwTycM6aM1TpCkJ8NLfdJfnzm3MGzRGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599426; c=relaxed/simple;
	bh=HGyPSVtzdcBDpGufuO3ijtSqnKP+AC9vcerGQQxlGgM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1BoKD+wghmOakGQWsdZc/5fx5hZn6gM0oeZsTNwXljzjFA7XtONhWkyr5jGOyMpYYCePROKHsq8nd41QwwtECe2nqrlyqIqJLRpztuYiBncnIyo7/ZutO3A46KzVaHNLxXI3RkuBqwPuefv1tgZH6n61qszmTGtUSBoHaAtQcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4b7zLb357lz1fy6H;
	Fri, 30 May 2025 18:02:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DF2218005F;
	Fri, 30 May 2025 18:03:36 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:35 +0800
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
Subject: [PATCH drm-dp 01/10] drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init failed
Date: Fri, 30 May 2025 17:54:23 +0800
Message-ID: <20250530095432.1206966-2-shiyongbang@huawei.com>
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

Currently the driver missed to clean the i2c adapter when vdac init failed.
It may cause resource leak.

Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  | 5 +++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 9 +++++++--
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 274feabe7df0..ca8502e2760c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -69,6 +69,7 @@ int hibmc_de_init(struct hibmc_drm_private *priv);
 int hibmc_vdac_init(struct hibmc_drm_private *priv);
 
 int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *connector);
+void hibmc_ddc_del(struct hibmc_vdac *vdac);
 
 int hibmc_dp_init(struct hibmc_drm_private *priv);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 99b3b77b5445..44860011855e 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -95,3 +95,8 @@ int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *vdac)
 
 	return i2c_bit_add_bus(&vdac->adapter);
 }
+
+void hibmc_ddc_del(struct hibmc_vdac *vdac)
+{
+	i2c_del_adapter(&vdac->adapter);
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index e8a527ede854..36401b46034c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -110,7 +110,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
 	if (ret) {
 		drm_err(dev, "failed to init encoder: %d\n", ret);
-		return ret;
+		goto err;
 	}
 
 	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
@@ -121,7 +121,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 					  &vdac->adapter);
 	if (ret) {
 		drm_err(dev, "failed to init connector: %d\n", ret);
-		return ret;
+		goto err;
 	}
 
 	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
@@ -131,4 +131,9 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
+
+err:
+	hibmc_ddc_del(vdac);
+
+	return ret;
 }
-- 
2.33.0

