Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9E1A8F6D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573437; cv=none; b=NzWFuC54lF8BaCEyY652Scoy7cf7SDBYufoXpTme84zkeHfgqDpQ2kqHqJ6kHM1wWHYWW+R7S48w7MG6D6H9TJOq/kyLoZTugL+ag+weL1GVp4SlC14Y3GGdUe2hCwbEF/a5ozSmJlnOl0ANK4w15/b9lW1sovh5GYTZi1yJWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573437; c=relaxed/simple;
	bh=8X+Z/93oZEewJICP+BYSyz8Avvzc3+Twfw3Dcgt/dAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LETXrYye9K5QHFUETkSztbX7XFmOCC31JlxxjD1VdvQyqQRUuNNQf3d6oAOcBrCR6ZQwGs+mC7odg6Zw253xEh7xx2BA/UlDBr1VHDnF5WZ82aw6TqHAvRUkjCHfg0GsZu5iXb510+pQgQFywzXbzUu2m5MN88BTggsUt/IVzUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gjOzHe/K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gjOzHe/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HufTZwqlu3MY4gkaOUrbeff+ha6MfEm7tgUgivlHaxA=;
	b=gjOzHe/KSAItYmhD4jtEwKE2PVgWC1iXpMEJg1sOHIZ3W4G0eAAt+do4KIVcD/KjJwPEbB
	YHtdQXVBUnT17O5B59yEnrdioLhyPBbqoFapZItZ+fU9h72WjEKYrTiEukjnuta6HZQcvP
	U1jhcywEegc+s5II47FDWyG89pJ8r/Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-We4YvRcLMDuceGIK9OHIiA-1; Thu,
 29 May 2025 22:50:30 -0400
X-MC-Unique: We4YvRcLMDuceGIK9OHIiA-1
X-Mimecast-MFC-AGG-ID: We4YvRcLMDuceGIK9OHIiA_1748573428
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBCC1180056F;
	Fri, 30 May 2025 02:50:27 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7F1761955D82;
	Fri, 30 May 2025 02:50:23 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:09 -0500
Subject: [PATCH v2 07/46] panel/ronbo-rb070d30: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-7-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1556;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=8X+Z/93oZEewJICP+BYSyz8Avvzc3+Twfw3Dcgt/dAU=;
 b=1oibaY4P3oK8QhaI2WKfGIZx8613qP59xZfgpJqHIz2qnc7fLx3M3BeFFM7setASfe/Z/xtkU
 DQTlU+gA+A5DAqVtV30NrOWX2HzC1pHwwKI9lBwJEzK1hRVuraPs/vw
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
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 2ef5ea5eaeeb2062372c594d077bd070975119ed..ad35d0fb0a16787ffb87c365c9939c78ff42d67a 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -143,9 +143,11 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 	struct rb070d30_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct rb070d30_panel, panel,
+				   &rb070d30_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supply = devm_regulator_get(&dsi->dev, "vcc-lcd");
 	if (IS_ERR(ctx->supply))
@@ -154,9 +156,6 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &rb070d30_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->gpios.reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->gpios.reset)) {
 		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");

-- 
2.48.1

