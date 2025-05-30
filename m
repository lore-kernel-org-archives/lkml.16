Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6E18DB1F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573433; cv=none; b=HZBWvXvPFCJ37lNh+4pudFwyMP5gZfWNksm5H77+snWzT4GMTycdB7j2zTlQiZHXyM/8lVEzKDDvq2lAF3F7nH2GgJ/AE4mI33JyycMqhxWAbHi/0ynZc0XGci3dQhcHdL60By5Y6U9AyjC51P77o0it1A8p38xrz+ZlpBk6m8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573433; c=relaxed/simple;
	bh=BbDlvOBfDpi/dKQndy3mzJnnSxdJwtY3vbWR7b31DdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ucQ/Hy1onpEuz2xjiu0JBVzveyhgXsHR9WBbwAF2mayZtQNwI7J4bplim6vFyHA3taftsQYnUJTLaecYXJjZT5yDMyF6i4v4L1zLXYktb62h6ybEMk+2+S1HSPe3n+dr0xz51OMZsXc6I0APapFDw5InxqBUQN5FZ00jxoiGids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=agI6Yk4m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="agI6Yk4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GmYIdDglsl1Jk2TaVnbNMksBDmnsTulDs4yfm2jcNsQ=;
	b=agI6Yk4mbUPvfOIme/yJisGXovxtYj1KFLHNwpnwyhlTbLBBOcB/TmPbt0HWfq0XiU0R5d
	6EQsH4fmQcdWOKA+3eAoCaoTvfcK3gS6En1Eg1dnjrxG6rOR7FAr9jI3DT5Tqfc36PQPpb
	7+0Ru75lyJFHq/53Xnn3YxM1koSNcQw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-Y0vVfNbzOpGSQ3JQ9hvZcQ-1; Thu,
 29 May 2025 22:50:26 -0400
X-MC-Unique: Y0vVfNbzOpGSQ3JQ9hvZcQ-1
X-Mimecast-MFC-AGG-ID: Y0vVfNbzOpGSQ3JQ9hvZcQ_1748573423
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C3A9180045C;
	Fri, 30 May 2025 02:50:23 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45A661955D82;
	Fri, 30 May 2025 02:50:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:08 -0500
Subject: [PATCH v2 06/46] panel/raydium-rm69380: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-6-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1445;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=BbDlvOBfDpi/dKQndy3mzJnnSxdJwtY3vbWR7b31DdI=;
 b=Rec7L24XsOc1BSRoGh4Thkvk+MUm0uwRJdScykO8N4/s7n4fMuAPB9S7hPVnGgAj9mmX/VQDC
 Gw7J6OOuz7VBmap7TKuHZoKeIm6H1i6JNoYYSopIUFKaPXQJ1MWbgUK
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
 drivers/gpu/drm/panel/panel-raydium-rm69380.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm69380.c b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
index d3071c01aaeae92c8ff1cdec14a01f64a9ae6460..86769cadec972ff0e7f5ba5275a7d6f2afb37ee1 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm69380.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
@@ -208,9 +208,11 @@ static int rm69380_probe(struct mipi_dsi_device *dsi)
 	struct device_node *dsi_sec;
 	int ret, i;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct rm69380_panel, panel,
+				   &rm69380_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vddio";
 	ctx->supplies[1].supply = "avdd";
@@ -248,8 +250,6 @@ static int rm69380_probe(struct mipi_dsi_device *dsi)
 	ctx->dsi[0] = dsi;
 	mipi_dsi_set_drvdata(dsi, ctx);
 
-	drm_panel_init(&ctx->panel, dev, &rm69380_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->panel.backlight = rm69380_create_backlight(dsi);

-- 
2.48.1

