Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D505D21ADC5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932322; cv=none; b=C8UefxVevo3ikCluI9B/FP81kXMJKcppSsa14X6v9C3i+wKV2CYCPup8EtqfXj1tvzOgKi3kQ8iyPGHf7voI9sR1kM9aPd4LAcTDEbMNONz4yjCh4sIiLi/2YezC0dkKvZipTG6FZ+juS/l6l3ZljRCG1CrOsvHG91tPGbZfXPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932322; c=relaxed/simple;
	bh=YK2pvdDJ6IkwTqiQaUwdS4JOldNd1Bm6lfp6cF1eOl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0kyU1sZ4xh0Z3P3f7YRcvGCuctqIV48MLJ+beATIhRG4WKmK34qyOf2WEKqtW0+Irb++asQOn7Gi7SoMnc6+ApwhwcknUeSnkQbhtePKjT1eDkbz1gvXLjgO3KtHybBB8e90CY4aD1Uwvmal1kgO0lBhOdOQbZ/uN+s4fDJ5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtoCejcZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtoCejcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64617C4CEF1;
	Thu, 26 Jun 2025 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750932322;
	bh=YK2pvdDJ6IkwTqiQaUwdS4JOldNd1Bm6lfp6cF1eOl0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KtoCejcZvwrXKBc19UBfUuJRvuQXkjK0YvAF8pjmw982/e0/xMCJlb/Mzmt1yLMn1
	 dLq3n4JorGh16+y9Unac9ONGEnMzXBgGsxl2hZmfLvaR/dt0YEje0gdInXqm2MjQ3O
	 5jrnjDfBZxblG7UYqf6cy/zraw/e4CcuIujambZX6MeS2PqKlZU9mYlmQ4XuH4ry/r
	 lwxvS9VNjCb4J02EiBcPaPtKADLFWSBZA7M5XeKy5p3JpP67vpHfjr7k9DTIOb4wJP
	 fdHsEV99VXCpO+p4l63oM5TxhRRt7f+dTlqQliya6cIPHQvQnkDcp72sGjEa3PTb2e
	 dmTyC80zgg/gg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 26 Jun 2025 12:05:03 +0200
Subject: [PATCH v2 5/5] drm/panel: panel-simple: get rid of panel_dpi hack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-drm-panel-simple-fixes-v2-5-5afcaa608bdc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2757; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YK2pvdDJ6IkwTqiQaUwdS4JOldNd1Bm6lfp6cF1eOl0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmx0kHmN7mnHHA+b5e5eHpo7Jt938VnnDkjUFnl4ed0s
 qGlz+Bjx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI80HGhqbQpCUtsz4q1wqd
 nCu3K7rjq/7LDaXntU97K2xiCWJNnjbLJe1iReS+pZmnuKRNVm4VZqz32HTJdI9W+SVZxtnTeQu
 39wnKcqslC5ieC0/a2lYfbdljuGPSLJusGqGDLRn7Xp5RXAEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The empty panel_dpi struct was only ever used as a discriminant, but
it's kind of a hack, and with the reworks done in the previous patches,
we shouldn't need it anymore.

Let's get rid of it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4c831af86414aba6a6b44dbc6020c0268dbd78b7..9f81fa960b460290759f5f9eba97045ab55fe5b8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -437,12 +437,10 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_modes = panel_simple_get_modes,
 	.get_orientation = panel_simple_get_orientation,
 	.get_timings = panel_simple_get_timings,
 };
 
-static struct panel_desc panel_dpi;
-
 static struct panel_desc *panel_dpi_probe(struct device *dev)
 {
 	struct display_timing *timing;
 	const struct device_node *np;
 	struct panel_desc *desc;
@@ -591,15 +589,21 @@ static const struct panel_desc *panel_simple_get_desc(struct device *dev)
 
 	if (dev_is_platform(dev)) {
 		const struct panel_desc *desc;
 
 		desc = of_device_get_match_data(dev);
-		if (!desc)
-			return ERR_PTR(-ENODEV);
-
-		if (desc == &panel_dpi)
-			return panel_dpi_probe(dev);
+		if (!desc) {
+			/*
+			 * panel-dpi probes without a descriptor and
+			 * panel_dpi_probe() will initialize one for us
+			 * based on the device tree.
+			 */
+			if (of_device_is_compatible(dev->of_node, "panel-dpi"))
+				return panel_dpi_probe(dev);
+			else
+				return ERR_PTR(-ENODEV);
+		}
 
 		return desc;
 	}
 
 	return ERR_PTR(-ENODEV);
@@ -649,11 +653,11 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 
 		if (!panel->ddc)
 			return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if ((desc != &panel_dpi) &&
+	if (!of_device_is_compatible(dev->of_node, "panel-dpi") &&
 	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
 		panel_simple_parse_panel_timing_node(dev, panel, &dt);
 
 	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		/* Optional data-mapping property for overriding bus format */
@@ -5398,11 +5402,16 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "microchip,ac69t88a",
 		.data = &mchp_ac69t88a,
 	}, {
 		/* Must be the last entry */
 		.compatible = "panel-dpi",
-		.data = &panel_dpi,
+
+		/*
+		 * Explicitly NULL, the panel_desc structure will be
+		 * allocated by panel_dpi_probe().
+		 */
+		.data = NULL,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);

-- 
2.49.0

