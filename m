Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751121B185
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932321; cv=none; b=X5yyt1xMzPk0fMEeaXyeUDIVFGPFPfhTf1cjnmcrovR/pEhoaBPqHzOn8Q+BfjHciUah+Oi1jVjR5ZNYAhc+I5fImD7SXVsxY9n+G4V+w2Hv+GX19up7jDQ6HagDmHMePJvXDiIh31aMpVLG03rqlM+M1IMRjX9ddZVQv28+8Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932321; c=relaxed/simple;
	bh=jbRXkk0hjIDPPWjYuxAm63dXMqfFIrrPdpEYXFXsa9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPI7AtllCscQFtKXWCLfDlmncUujw26MNN1ybMSxKSonN/1R+np7rCMFtyn2hTsBb6hvN1FqNVux92YW3Vj7tmKeARrffAbeJMKMO0S8axFBDN11xyTbq4i8ZUXSIiuAKeATExJSEjiec6CLwzn0uSgDahExRXj7PGmFhxqRTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohmjphWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohmjphWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2EBC4CEEB;
	Thu, 26 Jun 2025 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750932320;
	bh=jbRXkk0hjIDPPWjYuxAm63dXMqfFIrrPdpEYXFXsa9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ohmjphWj3P1xuIYPxYPqL2IeLt3i+DXuplSSTbggaXEOo6ePZSfAjyik2cjBI+wxy
	 TlSkYkSE2ArTDXSI7S1F7aUx1Rsig/BpliW0h1Bm8PVczxt4/GNh8YaGxJS8EFRlFT
	 6l4tqmgLfNBCifHA9O9FAiL7IXJynhZm7LJBWsIg+hD8AxOPKq3idjvkRNY/vUpUwW
	 NhOUsZ1Ke+DAP/C+17S+DnFtAot0aKWH+xC87HJTMl8S0ZnNHoKlS5E9+SbmSOQYlC
	 FlEgnZ7LZkJpsJOSLLINHdGhjMI01oewwPx3a6ZVHc6GDJKzYnnqop+4C5iAoSbvYe
	 67dY96OU64qbw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 26 Jun 2025 12:05:02 +0200
Subject: [PATCH v2 4/5] drm/panel: panel-simple: Add function to look panel
 data up
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-drm-panel-simple-fixes-v2-4-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6328; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jbRXkk0hjIDPPWjYuxAm63dXMqfFIrrPdpEYXFXsa9M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmx0oHMz1tLHVMLJ/nJlb0NZfNTVwhdIcdwJE2ywH0n9
 4Zm31sdU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCLz2Rnro28u9r5ZKX8za5f9
 lUNZ743fd614b6t6J2jvQf/I8zZnk+/siHE97qXo9kb3fFkRx7R4xjp7zdoXvde2PAp+PScu0sX
 I+tWasijHH4frtmqzaa16fOLuJ1c+nurQzw+3SCYo3X7zQRkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in
place of devm_kzalloc()") moved the call to drm_panel_init into the
devm_drm_panel_alloc(), which needs a connector type to initialize
properly.

In the panel-dpi compatible case, the passed panel_desc structure is an
empty one used as a discriminant, and the connector type it contains
isn't actually initialized.

It is initialized through a call to panel_dpi_probe() later in the
function, which used to be before the call to drm_panel_init() that got
merged into devm_drm_panel_alloc().

So, we do need a proper panel_desc pointer before the call to
devm_drm_panel_alloc() now. All cases associate their panel_desc with
the panel compatible and use of_device_get_match_data, except for the
panel-dpi compatible.

In that case, we're expected to call panel_dpi_probe, which will
allocate and initialize the panel_desc for us.

Let's create such a helper function that would be called first in the
driver and will lookup the desc by compatible, or allocate one if
relevant.

Reported-by: Francesco Dolcini <francesco@dolcini.it>
Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 82 +++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e70ee2d4a538caaae673507b93e02b444a2e1640..4c831af86414aba6a6b44dbc6020c0268dbd78b7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -24,10 +24,11 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
@@ -134,10 +135,18 @@ struct panel_desc {
 
 	/** @connector_type: LVDS, eDP, DSI, DPI, etc. */
 	int connector_type;
 };
 
+struct panel_desc_dsi {
+	struct panel_desc desc;
+
+	unsigned long flags;
+	enum mipi_dsi_pixel_format format;
+	unsigned int lanes;
+};
+
 struct panel_simple {
 	struct drm_panel base;
 
 	ktime_t unprepared_time;
 
@@ -565,19 +574,53 @@ static int panel_simple_override_nondefault_lvds_datamapping(struct device *dev,
 	}
 
 	return 0;
 }
 
-static struct panel_simple *panel_simple_probe(struct device *dev, const struct panel_desc *desc)
+static const struct panel_desc *panel_simple_get_desc(struct device *dev)
 {
+	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI) &&
+	    dev_is_mipi_dsi(dev)) {
+		const struct panel_desc_dsi *dsi_desc;
+
+		dsi_desc = of_device_get_match_data(dev);
+		if (!dsi_desc)
+			return ERR_PTR(-ENODEV);
+
+		return &dsi_desc->desc;
+	}
+
+	if (dev_is_platform(dev)) {
+		const struct panel_desc *desc;
+
+		desc = of_device_get_match_data(dev);
+		if (!desc)
+			return ERR_PTR(-ENODEV);
+
+		if (desc == &panel_dpi)
+			return panel_dpi_probe(dev);
+
+		return desc;
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
+static struct panel_simple *panel_simple_probe(struct device *dev)
+{
+	const struct panel_desc *desc;
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
 	int connector_type;
 	u32 bus_flags;
 	int err;
 
+	desc = panel_simple_get_desc(dev);
+	if (IS_ERR(desc))
+		return ERR_CAST(desc);
+
 	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
 				     &panel_simple_funcs, desc->connector_type);
 	if (IS_ERR(panel))
 		return ERR_CAST(panel);
 
@@ -606,23 +649,13 @@ static struct panel_simple *panel_simple_probe(struct device *dev, const struct
 
 		if (!panel->ddc)
 			return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if (desc == &panel_dpi) {
-		/* Handle the generic panel-dpi binding */
-		desc = panel_dpi_probe(dev);
-		if (IS_ERR(desc)) {
-			err = PTR_ERR(desc);
-			goto free_ddc;
-		}
-
-		panel->desc = desc;
-	} else {
-		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
-			panel_simple_parse_panel_timing_node(dev, panel, &dt);
-	}
+	if ((desc != &panel_dpi) &&
+	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
+		panel_simple_parse_panel_timing_node(dev, panel, &dt);
 
 	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		/* Optional data-mapping property for overriding bus format */
 		err = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
 		if (err)
@@ -5374,18 +5407,13 @@ static const struct of_device_id platform_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);
 
 static int panel_simple_platform_probe(struct platform_device *pdev)
 {
-	const struct panel_desc *desc;
 	struct panel_simple *panel;
 
-	desc = of_device_get_match_data(&pdev->dev);
-	if (!desc)
-		return -ENODEV;
-
-	panel = panel_simple_probe(&pdev->dev, desc);
+	panel = panel_simple_probe(&pdev->dev);
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
 	return 0;
 }
@@ -5415,18 +5443,10 @@ static struct platform_driver panel_simple_platform_driver = {
 	.probe = panel_simple_platform_probe,
 	.remove = panel_simple_platform_remove,
 	.shutdown = panel_simple_platform_shutdown,
 };
 
-struct panel_desc_dsi {
-	struct panel_desc desc;
-
-	unsigned long flags;
-	enum mipi_dsi_pixel_format format;
-	unsigned int lanes;
-};
-
 static const struct drm_display_mode auo_b080uan01_mode = {
 	.clock = 154500,
 	.hdisplay = 1200,
 	.hsync_start = 1200 + 62,
 	.hsync_end = 1200 + 62 + 4,
@@ -5659,15 +5679,11 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct panel_desc_dsi *desc;
 	struct panel_simple *panel;
 	int err;
 
-	desc = of_device_get_match_data(&dsi->dev);
-	if (!desc)
-		return -ENODEV;
-
-	panel = panel_simple_probe(&dsi->dev, &desc->desc);
+	panel = panel_simple_probe(&dsi->dev);
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
 	desc = container_of(panel->desc, struct panel_desc_dsi, desc);
 	dsi->mode_flags = desc->flags;

-- 
2.49.0

