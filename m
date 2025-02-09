Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A01DFE18
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739103074; cv=none; b=SMPniIwbJgDpFHIykVIgS0xpkW0y6LpI15IN0mQBD/gE9oemq7BfVCCZVKVcurcRw/aKWyz6XOudxC83nu2Hu/G7Vnd+0K+qmBFZCleB43reZu5XFiptKbjxWI3HENyVBMt6yLnVittQzDyj04W9WHNNM71IxMjwuJYQP28Xo40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739103074; c=relaxed/simple;
	bh=TzzvmyZr6inHri4Kx8qN0rk8PqsshAgOnei6iJkGU0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUlCx662EeQ/6KPUcyjqTaABCR81IkqCQAOiBKwJDqaX8jxdUimoSbLHVD5Rc1bZ0e6buWFcg4jAVkq/UQJ3pXSiR+ahpiYAy8cPxopMcygduiaTU/RiJ4V+55fqc44RzRZPj+CGRfN/KHqoPOdj74pnXXLvUiQH8wm7S2mSTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uTm8v/NW; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uTm8v/NW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739103070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4WYLOQhw/RKMm5QY26fFHeUV0OebPBM++WNDwYTSgLM=;
	b=uTm8v/NWQBp7bkr2yprirdZ/12bLYqzlbwOGsFu5PbeeVUF3fl36Te7KdoLYUIlztPO6Z/
	Iv1VJ7+w4BF7le52oHs4d+G+m40Ptk3TsaiRELgXw+Fl09gNzHFAvdNFWih03BeUHcLL84
	sl6ltXCrDgM9VdAd/Z3WJ/CRz8ySYtA=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v9 07/13] drm/mipi-dsi: Add helper to find input format
Date: Sun,  9 Feb 2025 17:40:26 +0530
Message-Id: <20250209121032.32655-8-aradhya.bhatia@linux.dev>
In-Reply-To: <20250209121032.32655-1-aradhya.bhatia@linux.dev>
References: <20250209121032.32655-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Aradhya Bhatia <a-bhatia1@ti.com>

Add a helper API that can be used by the DSI hosts to find the required
input bus format for the given output dsi pixel format.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5e5c5f84daac..076826f2445a 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -36,6 +36,8 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 
+#include <linux/media-bus-format.h>
+
 #include <video/mipi_display.h>
 
 /**
@@ -870,6 +872,41 @@ ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_read);
 
+/**
+ * drm_mipi_dsi_get_input_bus_fmt() - Get the required MEDIA_BUS_FMT_* based
+ *				      input pixel format for a given DSI output
+ *				      pixel format
+ * @dsi_format: pixel format that a DSI host needs to output
+ *
+ * Various DSI hosts can use this function during their
+ * &drm_bridge_funcs.atomic_get_input_bus_fmts operation to ascertain
+ * the MEDIA_BUS_FMT_* pixel format required as input.
+ *
+ * RETURNS:
+ * a 32-bit MEDIA_BUS_FMT_* value on success or 0 in case of failure.
+ */
+u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format)
+{
+	switch (dsi_format) {
+	case MIPI_DSI_FMT_RGB888:
+		return MEDIA_BUS_FMT_RGB888_1X24;
+
+	case MIPI_DSI_FMT_RGB666:
+		return MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		return MEDIA_BUS_FMT_RGB666_1X18;
+
+	case MIPI_DSI_FMT_RGB565:
+		return MEDIA_BUS_FMT_RGB565_1X16;
+
+	default:
+		/* Unsupported DSI Format */
+		return 0;
+	}
+}
+EXPORT_SYMBOL(drm_mipi_dsi_get_input_bus_fmt);
+
 /**
  * mipi_dsi_dcs_write_buffer() - transmit a DCS command with payload
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 94400a78031f..9e2804e3a2b0 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -293,6 +293,7 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
+u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format);
 
 #define mipi_dsi_msleep(ctx, delay)	\
 	do {				\
-- 
2.34.1

