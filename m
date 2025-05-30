Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A352222C2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599422; cv=none; b=s8CohhCPjMhmddQDwpQKDO4SuwyuyW05MxaaJje00JWGlGP1BM6IiOlOQBKuPMkliYCCLQ97qxrQ7htsp2dQnrdmPGjTAKCPw4HUKd/BYyQsbFLsWbU2DPgyXWa4Wg9e4VBFTp3fesjbf4RSr1WdTWAIe7W3/wyXHmddqCVR7js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599422; c=relaxed/simple;
	bh=6k00c+g1toqFlC7nSAbHPwqsqMHFp72vbTSQHJdqPUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XIx4dWLbEBHUz/s3qN86AhuqER1qJfBRHtTlvutAQG+9krp/dNyszK3SWnJ+5t8ziXgdlMNuSyGSerrHhHqNQr06KZXlVFRP/OeQZtxjqTaRSjLCFtaLSbu8P83J5TxqNfCykFfCvHy90RHc1Uc0JHMDxxPK5gZwbpSZhDwzTWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4b7zLf4QPJz2TSL7;
	Fri, 30 May 2025 18:02:34 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B3EF140293;
	Fri, 30 May 2025 18:03:38 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:38 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:37 +0800
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
Subject: [PATCH drm-dp 07/10] drm/hisilicon/hibmc: add dp encoder modeset
Date: Fri, 30 May 2025 17:54:29 +0800
Message-ID: <20250530095432.1206966-8-shiyongbang@huawei.com>
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

Add GPU display control enable in dp_mode_set(), which is already
in vdac's mode_set, however, if vdac is not connected, GPU
cannot work.

Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index e4b13f21ccb3..d9ae7567ebb7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -11,6 +11,7 @@
 #include <drm/drm_edid.h>
 
 #include "hibmc_drm_drv.h"
+#include "hibmc_drm_regs.h"
 #include "dp/dp_hw.h"
 
 #define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
@@ -169,9 +170,26 @@ static void hibmc_dp_encoder_disable(struct drm_encoder *drm_encoder,
 	hibmc_dp_display_en(dp, false);
 }
 
+static void hibmc_dp_encoder_mode_set(struct drm_encoder *encoder,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct drm_device *dev = encoder->dev;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	u32 reg;
+
+	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
+	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
+	reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
+	reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
+	reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
+	writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
+}
+
 static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
 	.atomic_enable = hibmc_dp_encoder_enable,
 	.atomic_disable = hibmc_dp_encoder_disable,
+	.atomic_mode_set = hibmc_dp_encoder_mode_set,
 };
 
 irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
-- 
2.33.0

