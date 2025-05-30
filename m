Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14F522D4F2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599428; cv=none; b=bnfB86cQe4COR2YrTMTRoEbUE7GDmlnZk4F6+OINPLFeqdoF7b4A3dq6mn4gRvYRIc5dRaEH9DqTffwIoJ1manZp1K5BvAdIQF2Hnso00oxYMulm3rJNIMUrjbnYTi0Y+M0VHgam6K0NBh5vjW0iR4EVu2+delYFtx1yZ40baRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599428; c=relaxed/simple;
	bh=mDCzqgVG/YMS/4jeZL7qdvquA+VdsUNZ/seaj0/cieY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SrlZe+sjlOizngXxXyHoBhjLlra78A+NWGKpFPENM4BhpB30LyGaqVGCjJZsWDU9YpGQ/NqKzaTsAlAM9aEu4wDeNPE5HW9sEfBvUKx08GQrEYEe0WV/hFemHrhj108vKNCtjf7fuk9ouEDc9j/0abRGAhSq7JQv5EmucD7iPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4b7zNs4wm4z27jJR;
	Fri, 30 May 2025 18:04:29 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F5AD18005F;
	Fri, 30 May 2025 18:03:39 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:39 +0800
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
Subject: [PATCH drm-dp 09/10] drm/hisilicon/hibmc: fix HPD no showing with VGA para of GRUB
Date: Fri, 30 May 2025 17:54:31 +0800
Message-ID: <20250530095432.1206966-10-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250530095432.1206966-1-shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)

From: Baihan Li <libaihan@huawei.com>

In early OS versions， there is a bug in hibmc-drm driver previously,
so some OS add a VGA parameter in GRUB(video=VGA-1:640x480-32@60me) to
fix the bug, that will config a force VGA mode to drm driver. However, the
HPD problem exists that mentioned in previous patch, so change VGA's status
in force() to compatible with some older OS versions.

Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 73dd3d5fc26c..d609ccda2f2a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -61,6 +61,19 @@ static int hibmc_vdac_detect(struct drm_connector *connector, struct drm_modeset
 	return connector_status_connected;
 }
 
+static void hibmc_vdac_force(struct drm_connector *connector)
+{
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
+	struct hibmc_dp *dp = &priv->dp;
+
+	if (dp->hpd_status) {
+		connector->status = connector_status_disconnected;
+		return;
+	}
+
+	connector->status = connector_status_connected;
+}
+
 static void hibmc_connector_destroy(struct drm_connector *connector)
 {
 	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
@@ -81,6 +94,7 @@ static const struct drm_connector_funcs hibmc_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.force = hibmc_vdac_force,
 };
 
 static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
-- 
2.33.0

