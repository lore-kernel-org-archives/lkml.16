Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D98633F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573449; cv=none; b=CzlNY6O+Vw1YE/j7kKlrz4ZSfP9NN+G0bNKuNsuA3M8mKOSI+V5TTgJARN9XzuXmXb5cM68cDBacC8rtoYTSUdhdhnTqPUnQrne99fcIa1/tGo7F94rmuyIBKvxFWDQTxRFsg+geLFoFYbyv9i24s2lH2xldCYcVZq3Xia4lH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573449; c=relaxed/simple;
	bh=T023SOv1UA19zCsZHpkGUkc5JUnIAmYnnBpKycWFIm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4xCUTQU+ty9lXyDkxO1HEnEcc9zTBhAMUFYAk3fds6+hpN562X3PhHj5oBj+MVr+n9/lHz8L8DA06FEQqBFdLJjqWaQdRC2RKwbpGVrkCnsrwSlhxZW0AUY5qmgVrXXV8UGqGIlvCqyQXRBQAljor1OTHlUD9FuL0Dkl4uCkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iEQLOc6s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iEQLOc6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlvNvM371O6Af3z0U0JOmOJd1PDrgbYgW0oVzGagpRg=;
	b=iEQLOc6sOv4HQRyuyFDJXNJaUvagXpK1Fk2jYMf+jOwqQDJK5ftMGSX1Dl5nPC8+Hq6B/2
	yyWaeGP11rykR83BmWylRioLCEhGiUkDpcDRNCPufC3bEOVtmDfcLm7lKG4/Z8hfhkgvWJ
	EgDk6WniVr5+ZtlXoraMJqV3FcqH+nI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-_-h-PZqHPrKUldBDjYG_iw-1; Thu,
 29 May 2025 22:50:40 -0400
X-MC-Unique: _-h-PZqHPrKUldBDjYG_iw-1
X-Mimecast-MFC-AGG-ID: _-h-PZqHPrKUldBDjYG_iw_1748573437
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 409331956095;
	Fri, 30 May 2025 02:50:37 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E31321955D82;
	Fri, 30 May 2025 02:50:32 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:11 -0500
Subject: [PATCH v2 09/46] panel/samsung-ams639rq08: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-9-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1561;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=T023SOv1UA19zCsZHpkGUkc5JUnIAmYnnBpKycWFIm4=;
 b=ObVTNYbqTRxIyEKEOEPdsSJRVY19Ft5axjR/VVDEmA0vVwf3XGbpAb4dWjshJMEcEAd208ZvT
 ITFp9yUCJZlD72sTsf6brzjTwoFkQSK7CyuhnwKfLtlRTF6W4+L5cGE
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: refactor. Use dev instead of &dsi->dev.
---
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
index 817365cb5e461f5e0a154b6d9d5c101e05b8945b..f8ebbd4a530bda494d320f691cd13c6747c5f8db 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
@@ -257,9 +257,11 @@ static int ams639rq08_probe(struct mipi_dsi_device *dsi)
 	struct ams639rq08 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ams639rq08, panel,
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

