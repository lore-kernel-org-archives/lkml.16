Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599FD225403
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599424; cv=none; b=F0mW8BMMXNazOsAV5bIGmwSGC/7itRI4xCRm1vvltduR3jzl8gXLimPQysNBNAKvFiGTlOaAV4mkhXxDGFZU3KToo2ixpmLkjNeljQ0jJLW8lYJQFSahRYzYhROnMgwotk3dObCfhOacXKdYwRlql0O9NbljiZAkIzFjkGesZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599424; c=relaxed/simple;
	bh=lneAPk+oAwu16jDGnrIcQSPwbJhuJxGvJxchusKt1gI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awf4+SEIQLn34EzduoZ1ReSxuCL1zqZMmi9KCnMs86BLJP4Lfk/qDnjK9sSfg3YQe9fJ7Xe5OspBGCgDObPtl6Wdz/VQYqaBkUdlo/YbbuTbrwi+PC3fOjZvIKIdF4X3GkAJWcT1kPQ9ZYzjsbJjoKXSwjKVpe792/VK/2ePn60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4b7zLT1P84ztRw8;
	Fri, 30 May 2025 18:02:25 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 247031401E9;
	Fri, 30 May 2025 18:03:39 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:38 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:38 +0800
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
Subject: [PATCH drm-dp 08/10] drm/hisilicon/hibmc: fix DP no showing after HPD with VGA connected
Date: Fri, 30 May 2025 17:54:30 +0800
Message-ID: <20250530095432.1206966-9-shiyongbang@huawei.com>
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

If the system started with VGA connected, the desktop like GDM cannot get
DP's CRTC when DP device is plugged in, because there is only one crtc
sharing use of VGA and DP. So change VGA to disconnected when DP is
connected.

Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 36401b46034c..73dd3d5fc26c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -49,6 +49,18 @@ static int hibmc_connector_get_modes(struct drm_connector *connector)
 	return count;
 }
 
+static int hibmc_vdac_detect(struct drm_connector *connector, struct drm_modeset_acquire_ctx *ctx,
+			     bool force)
+{
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
+	struct hibmc_dp *dp = &priv->dp;
+
+	if (dp->hpd_status)
+		return connector_status_disconnected;
+
+	return connector_status_connected;
+}
+
 static void hibmc_connector_destroy(struct drm_connector *connector)
 {
 	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
@@ -60,7 +72,7 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs
 	hibmc_connector_helper_funcs = {
 	.get_modes = hibmc_connector_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
+	.detect_ctx = hibmc_vdac_detect,
 };
 
 static const struct drm_connector_funcs hibmc_connector_funcs = {
-- 
2.33.0

