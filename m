Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D300194A73
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573480; cv=none; b=OdOgFD6V0rkgxiLIzjGphRF5IvM/RbMsZ+06xR6ceH2ZZJ8dODxYWaqFH861CUXHJ2uinHnMXFLqTXUvw4V3zvDCoY8xptisog9jtrElBnSaWYtNgJH0wjeWlbeFsuSpRVJEhlWElJ7r7F4ThQM8Ol408+01hPY5P05RVuQgRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573480; c=relaxed/simple;
	bh=18DRCiK0fuvFcaABjthDLxEo6H0Io7yynx6lo6z5hfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYZ0in7wqZjceRoa7/3uNEcNmHZbMcBLi1WX3XK+TRiIiRT2q2xN/78QzhGxKnLSIAo37rmTKVylgk82sDsWY8cQM4aDqGSrRnvSVRnIJRKV6SivQJ5G+P7Q5MDIqXhlCVySfnTiBLJ4jYHj+2Wg2BaCf93IO4JM4t/W0bq1ywY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PbaGJWaI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PbaGJWaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xYeJByhaUDtzQbfEK9w0CIlmtJj7Mwqy+uGg1CwoA3w=;
	b=PbaGJWaIXxRkFQV+iN77f2V7LW5E643SuWIvJ9p6xpOwozRrtSpDifmmjoZj0uPMfW59zZ
	CYlrc0aU/swEpISsTYkFy9ThnsydUoVSHCP9ghFN+n0YjIVhw76FuU4nyS9sFhue/N2Pv+
	45nMWwEz7wp4AwMA4b/ZfxElhPjBEig=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-TT4-3DExOgiEa04HXLhYcg-1; Thu,
 29 May 2025 22:51:13 -0400
X-MC-Unique: TT4-3DExOgiEa04HXLhYcg-1
X-Mimecast-MFC-AGG-ID: TT4-3DExOgiEa04HXLhYcg_1748573470
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD2EE1800447;
	Fri, 30 May 2025 02:51:10 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C29B1955D82;
	Fri, 30 May 2025 02:51:06 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:18 -0500
Subject: [PATCH v2 16/46] panel/samsung-s6e3fa7: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-16-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1532;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=18DRCiK0fuvFcaABjthDLxEo6H0Io7yynx6lo6z5hfM=;
 b=s4b26ADRiIPZB2ftob2tT7RUfstwYlr+cUcEksoJcTcdBrzGMlx3d0WYACsJtih/51XFtlIox
 jwzUm3zWj3BA/AzJdwLuXWspUKC6RdqQ7Gns7Djf2sPqH/5o1MYs6Jd
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
index 27a059b55ae526ba41cc61d59e15b780e5d3a934..f4d75eca3cdfa27441fbb1e303dd8894257d4397 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
@@ -185,9 +185,11 @@ static int s6e3fa7_panel_probe(struct mipi_dsi_device *dsi)
 	struct s6e3fa7_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6e3fa7_panel, panel,
+				   &s6e3fa7_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))
@@ -202,8 +204,6 @@ static int s6e3fa7_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
-	drm_panel_init(&ctx->panel, dev, &s6e3fa7_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->panel.backlight = s6e3fa7_panel_create_backlight(dsi);

-- 
2.48.1

