Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1201386DA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715391; cv=none; b=uBlf7TYqozjsxtVagGSZs1AxQGuLKhXlcmRpvhSoNHxLC69kxKFkH57JugTvwRmpk8m365xzHEXm32SB+vyDMIzEyK0k29W0s5A4KZZUBm77ev902c0IlvhBYr0xJzY6fESN0IgNGeb5+zJLWXvDIFDVPbn8Qv1vqaXzrlmnQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715391; c=relaxed/simple;
	bh=8MHcIrgRlcUynwUP85GvJ/LGhrT4ZwT2o9UWG8H8K8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ri9qeMSXuWClEQPRcZcx/jDgs4g2EJchSKS9Jw09HHN/Rv+VXORYZPe2KSZa9scoOw0tddEbP1i2S/vk8ERIHS5AE32ZkSLqkcDeCnyZhnTb4Uk30YWOCYfTHnckuogCNJaQt+FoGVxtOSI3n1UZPSb2fxtQ/6dI3akMbgynmD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gXyUWscJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gXyUWscJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rf8g/lEXABFmCqm0FSFLV3kDYnScble8B2aOHS57f4=;
	b=gXyUWscJ5XMhcIJwwOx0mBKVntkVk4xsJ53SiHJ7AIMYE6hN2H4u7DExpzvoPpnp0f4sVK
	K+2qDmb2hLVdQtxLtv7keZy3X/FNdzDdg7c5VtPCChgz6UqULqT8T+MtvN8q0Ki4jxJMiu
	4QzmA0+hwIy80y5UkX4EAZI+sb+yths=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-JPBX8bf5MdG2D-vYVdL3qA-1; Thu,
 03 Apr 2025 17:23:02 -0400
X-MC-Unique: JPBX8bf5MdG2D-vYVdL3qA-1
X-Mimecast-MFC-AGG-ID: JPBX8bf5MdG2D-vYVdL3qA_1743715379
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F844180AF59;
	Thu,  3 Apr 2025 21:22:59 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D3E9A180B488;
	Thu,  3 Apr 2025 21:22:54 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:40 -0400
Subject: [PATCH 09/46] panel/samsung-ams639rq08: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-9-965b15ad5b8e@redhat.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1460;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=8MHcIrgRlcUynwUP85GvJ/LGhrT4ZwT2o9UWG8H8K8w=;
 b=YkySkmkoJjOr4OK1y6ZYLJQAatCZVfNnFoBtDaKV2OYrluIPzoBQSYBsEWOf2mfjuI3fYZQP0
 Mqo7PH8cLwMA6vXyoBMp00xYz8ye0+/ca0Xp68SVhuchJj8lj4TRtqS
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
index 817365cb5e461f5e0a154b6d9d5c101e05b8945b..f9f4a9ddf5628c869e82bf9abf6de7bbaa752727 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
@@ -257,9 +257,11 @@ static int ams639rq08_probe(struct mipi_dsi_device *dsi)
 	struct ams639rq08 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct ams639rq08, panel,
+				   &ams639rq08_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = devm_regulator_bulk_get_const(&dsi->dev,
 					    ARRAY_SIZE(ams639rq08_supplies),
@@ -281,8 +283,6 @@ static int ams639rq08_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
-	drm_panel_init(&ctx->panel, dev, &ams639rq08_panel_funcs,
-			DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->panel.backlight = ams639rq08_create_backlight(dsi);

-- 
2.48.1

