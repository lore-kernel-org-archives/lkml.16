Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EDC1A0B08
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573507; cv=none; b=riJMHCJQVTqLpEZwm2bjXFqEiBX68Cf4zkntkLJGlgaE4U+2pN9idIXKkcbprxnk1fQQneSecMohAnDKr9dWFvhYqP0lTCCkOQNmgfExiB29URk1aJAa4mfOyMHsuPi+yEu3vQ2Hc2HQbD+yNsTKPeUh0R6FS2fp35PvfraPP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573507; c=relaxed/simple;
	bh=iEc9lrRRh6DtPPRJVnlQGtr/NTkZZlu4XfkW/me3Dn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGxWJ21PCasxXZSzS0L3+nlmzAc6RYr55y09Ohv+rYLz423fuivSaCH/DS9qmUquOPChm3By6f6eYFLiiJAqTIG+PUgzrnLGUVndx0F74RXQNbR7bjxpSQPZd8eI/7dtBCBCQy2g622EWM7nqT9RVj+RiO/ahVISkVqS6n49DOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eoLC4WxT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eoLC4WxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sbg7KaQC6N6l5v60Ot1AiIj8buZso7C7f/kvHA5VamE=;
	b=eoLC4WxTVeWobAqH03EJSsGcyZCzKZQrvfn/4zxRxa6QwoZ2DAfKMyFP31/SJindowwU51
	wia/OXGHvvxsyN/PyAQXAP6bgASRHbMYdYjh/W4Oz5CPuTVHp0aSgAgW5OGcrdC1i2gfhq
	BanJp43In09tPtLFx0mZkNdJ1f8D9eE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-R8562rs9MDO-b3ZRepT1Bg-1; Thu,
 29 May 2025 22:51:37 -0400
X-MC-Unique: R8562rs9MDO-b3ZRepT1Bg-1
X-Mimecast-MFC-AGG-ID: R8562rs9MDO-b3ZRepT1Bg_1748573494
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D541195608E;
	Fri, 30 May 2025 02:51:34 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 34F061955D82;
	Fri, 30 May 2025 02:51:30 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:23 -0500
Subject: [PATCH v2 21/46] panel/samsung-s6e8aa0: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-21-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1401;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=iEc9lrRRh6DtPPRJVnlQGtr/NTkZZlu4XfkW/me3Dn8=;
 b=6knJ1BAZHeeky+Z4EajIAMZeUlMQ8mctDVm3kzMb4sbWm6AEzbrC0amQDasscj7XNsqmsL/mL
 rwNAz6dh2pVC303LIlOixdnE2PdY+6QIklPLYw7fJQUqHSL3VZxUDrx
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: minor refactor. Use dev instead of &dsi->dev.
---
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index c51d07ec15295f81d4c2c07fcd5b58fdab18b084..897df195f2f3437224d1fe9f42d0bfc761541ab2 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -979,9 +979,11 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 	struct s6e8aa0 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(struct s6e8aa0), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6e8aa0, panel,
+				   &s6e8aa0_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -1014,8 +1016,6 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 
 	ctx->brightness = GAMMA_LEVEL_NUM - 1;
 
-	drm_panel_init(&ctx->panel, dev, &s6e8aa0_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);

-- 
2.48.1

