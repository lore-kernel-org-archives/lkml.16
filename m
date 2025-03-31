Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA201D86F2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407425; cv=none; b=HEhw859V97MfxrR0tSUY6KAOD1GesrY0z87+ELXsXp0YKMYP3db647M4fIhU5nOXWPN3+eJRkWq195Xd06cbSjq4kYrIi6Wg8hJXg2YioByZMp1AZ0Ol1YbjO7Oj2CDS8GF7UhmHAK+Tga63rU2BmFXfCp3GNfvxBwuSoLmwPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407425; c=relaxed/simple;
	bh=eXgLevCk0iTBXDR9hA4loH4bt855GNz9dbg1lW8IbFE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qkk05TIhpUrxhg1tDx5Jg2TBS49LfqrcMsTz/woBTW4yeYVtyDAbi+T1rSHJzxd4QWwCB+YvOTsmwFrhl54bA/kiGYyI1jXTbXG1f0jO91djWS7pMkaf5ZRhA3fdZBCWe2nBojmgcjjYaNpk2D754ohV/jOkGj5jHvKUC0r6qgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZR3FD2P86z1d18l;
	Mon, 31 Mar 2025 15:49:52 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
	by mail.maildlp.com (Postfix) with ESMTPS id 457A2140383;
	Mon, 31 Mar 2025 15:50:21 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 31 Mar 2025 15:50:19 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<jani.nikula@linux.intel.com>, <dmitry.baryshkov@oss.qualcomm.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 drm-dp 9/9] drm/hisilicon/hibmc: Add vga connector detect functions
Date: Mon, 31 Mar 2025 15:42:12 +0800
Message-ID: <20250331074212.3370287-10-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250331074212.3370287-1-shiyongbang@huawei.com>
References: <20250331074212.3370287-1-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500013.china.huawei.com (7.221.188.12)

From: Baihan Li <libaihan@huawei.com>

Because the connected VGA connector would make driver can't get the
userspace call, adding detect_ctx in vga connector to make HPD active
userspace.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 05e19ea4c9f9..e8a527ede854 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -60,6 +60,7 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs
 	hibmc_connector_helper_funcs = {
 	.get_modes = hibmc_connector_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
 };
 
 static const struct drm_connector_funcs hibmc_connector_funcs = {
@@ -127,5 +128,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
 	return 0;
 }
-- 
2.33.0

