Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54E283C8D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412438; cv=none; b=Q8gA/5CrmTIMz72VrefZzT22VuFM0C48Wt0vuNGTAgolO2vXSk6cKU2OTf/ro/Hq14wa8WO47xoszrvje04Cf1Ju3OIvm8A4IHrFxUvO74iob50dw4nZCSK4agRQi4ES9EyhHeQDLLvNcdesZUYYiWJBuQW0IZWfIkHEudyU3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412438; c=relaxed/simple;
	bh=/ijnEtaFvPdoKs2uS9Jhy1lXP6WnzkzuD2IFg4iqfRw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DH9ls4e+aKOuQGjM3cUHCaWEjtUHtFeY9gmM0m7TX0lbML+U3ZJR5KkwbxEO8KelcoJf0iiB2JZbY22Kj1y9L2m0zNZIgv3c83WAcsvQHtgexbxFbB23Ozy8AYGW/cunHUVOpO2RI0LzlPNeRom4fvDU820Dd9E1v3oJdoB9/8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bNstb2bdXz2y8wF;
	Fri, 20 Jun 2025 17:41:27 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 247441A016C;
	Fri, 20 Jun 2025 17:40:33 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 17:40:32 +0800
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
Subject: [PATCH v2 drm-dp 06/10] drm/hisilicon/hibmc: add dp mode valid check
Date: Fri, 20 Jun 2025 17:31:00 +0800
Message-ID: <20250620093104.2016196-7-shiyongbang@huawei.com>
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

If DP is connected, add mode check and BW check in mode_valid_ctx() to
ensure DP's cfg is usable.

Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v1 -> v2:
  - delete if (!dp->is_connected) in hibmc_dp_mode_valid(), suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 10 ++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 +++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 51 +++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index 98cc534ba794..5b1f943b601c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -273,6 +273,16 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp)
 	dp->dp_dev->link.status.channel_equalized = false;
 }
 
+u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
+{
+	return dp->dp_dev->link.cap.link_rate;
+}
+
+u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
+{
+	return dp->dp_dev->link.cap.lanes;
+}
+
 static const struct hibmc_dp_color_raw g_rgb_raw[] = {
 	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
 	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 9b45e88e47e4..0059a2648a38 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -12,6 +12,10 @@
 #include <drm/drm_print.h>
 #include <drm/display/drm_dp_helper.h>
 
+/* 27 * 10000000 * 80% = 216000000 */
+#define DP_MODE_VALI_CAL	216000000
+#define BPP_24				24
+
 struct hibmc_dp_dev;
 
 enum hibmc_dp_cbar_pattern {
@@ -62,5 +66,7 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
 void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
 void hibmc_dp_enable_int(struct hibmc_dp *dp);
 void hibmc_dp_disable_int(struct hibmc_dp *dp);
+u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
+u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index c0de796225b7..40f95880b278 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -15,6 +15,28 @@
 
 #define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
 
+struct hibmc_dp_disp_clk {
+	u16 hdisplay;
+	u16 vdisplay;
+	u32 clock;
+};
+
+static const struct hibmc_dp_disp_clk hibmc_dp_clk_table[] = {
+	{640, 480, 25175}, /* 25175 khz */
+	{800, 600, 40000}, /* 40000 khz */
+	{1024, 768, 65000}, /* 65000 khz */
+	{1152, 864, 80000}, /* 80000 khz */
+	{1280, 768, 79500}, /* 79500 khz */
+	{1280, 720, 74250}, /* 74250 khz */
+	{1280, 960, 108000}, /* 108000 khz */
+	{1280, 1024, 108000}, /* 108000 khz */
+	{1440, 900, 106500}, /* 106500 khz */
+	{1600, 900, 108000}, /* 108000 khz */
+	{1600, 1200, 162000}, /* 162000 khz */
+	{1920, 1080, 148500}, /* 148500 khz */
+	{1920, 1200, 193250}, /* 193250 khz */
+};
+
 static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
@@ -49,9 +71,38 @@ static int hibmc_dp_detect(struct drm_connector *connector,
 	return connector_status_disconnected;
 }
 
+static int hibmc_dp_mode_valid(struct drm_connector *connector,
+			       const struct drm_display_mode *mode,
+			       struct drm_modeset_acquire_ctx *ctx,
+			       enum drm_mode_status *status)
+{
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+	u64 cur_val, max_val;
+
+	/* check DP link BW */
+	cur_val = (u64)mode->htotal * mode->vtotal * drm_mode_vrefresh(mode) * BPP_24;
+	max_val = (u64)hibmc_dp_get_link_rate(dp) * DP_MODE_VALI_CAL * hibmc_dp_get_lanes(dp);
+
+	*status = cur_val > max_val ? MODE_CLOCK_HIGH : MODE_OK;
+
+	/* check the clock */
+	for (size_t i = 0; i < ARRAY_SIZE(hibmc_dp_clk_table); i++) {
+		if (hibmc_dp_clk_table[i].hdisplay == mode->hdisplay &&
+		    hibmc_dp_clk_table[i].vdisplay == mode->vdisplay) {
+			if (hibmc_dp_clk_table[i].clock != mode->clock) {
+				*status = MODE_CLOCK_RANGE;
+				return 0;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
 	.get_modes = hibmc_dp_connector_get_modes,
 	.detect_ctx = hibmc_dp_detect,
+	.mode_valid_ctx = hibmc_dp_mode_valid,
 };
 
 static int hibmc_dp_late_register(struct drm_connector *connector)
-- 
2.33.0

