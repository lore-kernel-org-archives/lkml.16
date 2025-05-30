Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392FA194124
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573598; cv=none; b=DK0nzdg2rYNZTlKiRiWYyxdWNVGyO/CliQEqLhUnhSPjY2V+2+9is3mP/o6fHKnmtHklmipOp5BQ9zuy6Xue2js978iRuJxw9JPjc/RIKOgrcp9on8HYvdJ2xsTUOXa1mz8vvcSdPxZrSHeMUTd94l8P4JGWA9X4adwNyEsSd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573598; c=relaxed/simple;
	bh=5Yl4sUn4626o5IXLobd/iSY9bbdLwoGDMbpdTb9dED4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gze7m2Y6/1l37j8k42c0oWl2m0k0ARUDDOvylCRaYnNuCY+3bYKC88dWqiAoB4zSqsbCY0eMLTEH45NxFCTsUtiMAogwKCnexq0iWYpZIkTe4qLDqGBP+raf/uX10SDr/bGqabtJOL2S0He7ylP0y4tMAGCp7q+Kft5i6eCyr+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UhMZ5neA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UhMZ5neA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P27YduuO65z3reZ0B7CoUQDVQivjFOG1602bY6W2o48=;
	b=UhMZ5neAKpc5mIkJHm28uM6ZqSWxCF/d0etw6DHn27zboNFcrlk7cwv9XfwGSUK/aTsv2V
	BkbJsRfgtPkF52PUWgdsSM3fsY8H1+JjcckMZwp4VOWHe5aViB3o8YzM1ta8JbVbZf6lSw
	Qhlowrf4Kiq+N7kK1oaHGEJYVNuNxUw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-m35vOi9ZOgmga3uQOmEZRg-1; Thu,
 29 May 2025 22:53:13 -0400
X-MC-Unique: m35vOi9ZOgmga3uQOmEZRg-1
X-Mimecast-MFC-AGG-ID: m35vOi9ZOgmga3uQOmEZRg_1748573590
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 832DB19560AF;
	Fri, 30 May 2025 02:53:10 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ADD3E1955D82;
	Fri, 30 May 2025 02:52:59 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:40 -0500
Subject: [PATCH v2 38/46] panel/visionox-rm69299: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-38-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1383;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=5Yl4sUn4626o5IXLobd/iSY9bbdLwoGDMbpdTb9dED4=;
 b=uh3SW7gQaCcgRPOJ5sARx8hdEK457sV7rV4EzQUH2dd8s1OkmJ7ff4KWgsQhNkY9uW97itMYU
 UXlHmKBYDoDA1KP3vLwLtNGARBxtw0da3mDmXrSD9vGdtnR8BePi5B2
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
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index be3a9797fbced5222b313cf83f8078b919e2c219..2b091d88bf4a507e58f55a260e7ed1fea93a0439 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -187,9 +187,11 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	struct visionox_rm69299 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct visionox_rm69299, panel,
+				   &visionox_rm69299_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -210,8 +212,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->reset_gpio);
 	}
 
-	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	drm_panel_add(&ctx->panel);
 
 	dsi->lanes = 4;

-- 
2.48.1

