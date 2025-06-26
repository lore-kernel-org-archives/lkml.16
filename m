Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E263D221FB2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932315; cv=none; b=upBVTUucVYRG/LjNySHFHv1E9qZ/v2Iunhi95mOXZnwNFrmZipQWfqDHDJGWMDiPaBvVO1EI1QvqVthDtMJbmH73u4+1eR2Nc9+DAcybojG3o134ePPo+f3ur+IXJZKt821s/BYROxNY+Z7Gx7espA9lJbvVunz01LqkzA9nGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932315; c=relaxed/simple;
	bh=I0Wn0v0oJ34lZSaquWxq7quZ9zp2CkhUtsLyYrYJvuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdDuviGoqRGtFHX9c2BqsHOickOzhiRTDhUkjvvuzGb7YOxX7OP0qPGEAA/as2LJpEohTVH8aaA6YVRO21iyTXCwuVTJ0Pr+UelufSjJF67OynJfn6/79nnqkxZ2S2sH0PL+lPsecqdxbKNJdJViSDGDluG1+AiaJnfFcNlAz2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCZcRh8p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCZcRh8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE79C4CEEE;
	Thu, 26 Jun 2025 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750932314;
	bh=I0Wn0v0oJ34lZSaquWxq7quZ9zp2CkhUtsLyYrYJvuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rCZcRh8pdYPUUj21mdLOejy1OaEe2xTSf8FD5SYN3cNtxJe30EkeEGzyZrV2YJjjV
	 UkA7kdUulfbFocNm6PYg0inAowfWM7238iDceto7Y4e6jWaX4RA7UzS9w3yW8/oU+x
	 BUUHHAmbutv6Q9zm2+fiMYkviRICI/VA9jFeKi7zls+U7q7+nQplht7Byficl8W3y3
	 E5hEdDYCsr6GXef+vxPogBilVh1Li4EqE9EZCPkIUmrVoHMVUyhG3kPWd1BcKXo4rd
	 Unoiq7Fpb845YoGYZmWybNtoJPXN14HCPsH+VEKmaut8SDXGNO/xAkhrOv6qhe8JiN
	 ufdlSMxLbX38A==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 26 Jun 2025 12:05:00 +0200
Subject: [PATCH v2 2/5] drm/panel: panel-simple: make panel_dpi_probe
 return a panel_desc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-drm-panel-simple-fixes-v2-2-5afcaa608bdc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3848; i=mripard@kernel.org;
 h=from:subject:message-id; bh=I0Wn0v0oJ34lZSaquWxq7quZ9zp2CkhUtsLyYrYJvuQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmx0gHxty7bMOUVOtoyrzh4L4lf7AfX8dfTmYwL5uUah
 T+dlOjSMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZSbMVYH557eK9F68KJzR+r
 VZMe/PC3WL+s8lKzwY/pChqstllLOh/qJMxTEpvA/L0j2MahXjCNsT7iwPMVwS1fdY9wfrjwkz3
 kzT6LnB1qk6Pvfa5+f3TRO8l1bS+En0+4foLpy9IbPp5+q7sB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

If the panel-simple driver is probed from a panel-dpi compatible, the
driver will use an empty panel_desc structure as a descriminant. It
will then allocate and fill another panel_desc as part of its probe.

However, that allocation needs to happen after the panel_simple
structure has been allocated, since panel_dpi_probe(), the function
doing the panel_desc allocation and initialization, takes a panel_simple
pointer as an argument.

This pointer is used to fill the panel_simple->desc pointer that is
still initialized with the empty panel_desc when panel_dpi_probe() is
called.

Since commit de04bb0089a9 ("drm/panel/panel-simple: Use the new
allocation in place of devm_kzalloc()"), we will need the panel
connector type found in panel_desc to allocate panel_simple. This
creates a circular dependency where we need panel_desc to create
panel_simple, and need panel_simple to create panel_desc.

Let's break that dependency by making panel_dpi_probe simply return the
panel_desc it initialized and move the panel_simple->desc assignment to
the caller.

This will not fix the breaking commit entirely, but will move us towards
the right direction.

Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0a3b26bb4d731c54614e24e38018c308acd5367a..89188e683822f9202ec580c9a294e42083b9704a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -430,12 +430,11 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_timings = panel_simple_get_timings,
 };
 
 static struct panel_desc panel_dpi;
 
-static int panel_dpi_probe(struct device *dev,
-			   struct panel_simple *panel)
+static struct panel_desc *panel_dpi_probe(struct device *dev)
 {
 	struct display_timing *timing;
 	const struct device_node *np;
 	struct panel_desc *desc;
 	unsigned int bus_flags;
@@ -443,21 +442,21 @@ static int panel_dpi_probe(struct device *dev,
 	int ret;
 
 	np = dev->of_node;
 	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
 	if (!desc)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	timing = devm_kzalloc(dev, sizeof(*timing), GFP_KERNEL);
 	if (!timing)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	ret = of_get_display_timing(np, "panel-timing", timing);
 	if (ret < 0) {
 		dev_err(dev, "%pOF: no panel-timing node found for \"panel-dpi\" binding\n",
 			np);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	desc->timings = timing;
 	desc->num_timings = 1;
 
@@ -471,13 +470,11 @@ static int panel_dpi_probe(struct device *dev,
 	desc->bus_flags = bus_flags;
 
 	/* We do not know the connector for the DT node, so guess it */
 	desc->connector_type = DRM_MODE_CONNECTOR_DPI;
 
-	panel->desc = desc;
-
-	return 0;
+	return desc;
 }
 
 #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
 	(to_check->field.typ >= bounds->field.min && \
 	 to_check->field.typ <= bounds->field.max)
@@ -611,14 +608,17 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			return -EPROBE_DEFER;
 	}
 
 	if (desc == &panel_dpi) {
 		/* Handle the generic panel-dpi binding */
-		err = panel_dpi_probe(dev, panel);
-		if (err)
+		desc = panel_dpi_probe(dev);
+		if (IS_ERR(desc)) {
+			err = PTR_ERR(desc);
 			goto free_ddc;
-		desc = panel->desc;
+		}
+
+		panel->desc = desc;
 	} else {
 		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 

-- 
2.49.0

