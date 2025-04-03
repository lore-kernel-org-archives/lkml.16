Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F691F4CA8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715426; cv=none; b=ZkeNYN1Xm3Qxass/92yQrkNbbR7FoIaD62lgKOl/mzACDEegTk474L/e9u00yAkEZlUlTB5N1KKtdHBUU63rZkq6lwJpxuxN7IqVapjctazBmLUFopRbkv0K0iD7cVcdJ4JLCFujCgEwqtXFLbNmwCu41F4iu/3l7pUvU7bVbb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715426; c=relaxed/simple;
	bh=hWFmaiPtfeA6u48d9C8VXl8fYryV1H0zNUEKf8WK7jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWUMc+0dr05UDpjXX9DQqOU/nIT/fq9msHOz3CghLnOHGOE0gtscoFsEXY3zYGSGYJv7jBHD9Yrm97ZwIARARufSJZ1Clnwg+4XCjx/Qcvd1VFwf8jAGYNdoCdJzE6HRa7HRfdmY92DJ6btFNzDATtc2igD1JadQaq0d1iAJLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EEkmxgbd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EEkmxgbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLHMevdqAz8RByzUFOVhW3oYtwjyJzta48sl3kHvWfo=;
	b=EEkmxgbdjY0joustg44Qf6ZeRlQ2k4xVPCqTz/4nSNsfuyy/o/sVby4BeQPcMUqViW2kfV
	/A2Xu84ek+XZXEef6Wm3QO5CbCsukO1rMiC9JdUzUKDMY8dmpFmWndXzabymNtT9bUV/4u
	wwhhvVWW5nRdzeoj3UVUnFhnZkeMw78=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-cuzpn18DM2qpn7OOJ-LUlA-1; Thu,
 03 Apr 2025 17:23:40 -0400
X-MC-Unique: cuzpn18DM2qpn7OOJ-LUlA-1
X-Mimecast-MFC-AGG-ID: cuzpn18DM2qpn7OOJ-LUlA_1743715417
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8C95180AF4E;
	Thu,  3 Apr 2025 21:23:36 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8E8711828AA8;
	Thu,  3 Apr 2025 21:23:32 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:48 -0400
Subject: [PATCH 17/46] panel/samsung-s6e3ha2: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-17-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1345;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=hWFmaiPtfeA6u48d9C8VXl8fYryV1H0zNUEKf8WK7jM=;
 b=KJZRKzK/8J4vK8RVn5udMj3fb/UUfmqJLW9eceSIG+GsgPnBkS1QFJdi55E3aXWmuISgydTtD
 RjTQ/3zIr6gDUDR/Xim9myR0Xv5zEsQdHg4LUrqk+wDPukYSk5y2T20
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index ab8b58545284030714c0d5520f20ba69ed9cf601..1db0c63b1131ee614ddf0bb9abe00e2b89756b4c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -681,9 +681,11 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 	struct s6e3ha2 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6e3ha2, panel,
+				   &s6e3ha2_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -731,8 +733,6 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 	ctx->bl_dev->props.brightness = S6E3HA2_DEFAULT_BRIGHTNESS;
 	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 
-	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);

-- 
2.48.1

