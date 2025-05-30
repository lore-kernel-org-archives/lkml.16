Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D8E1C54AA
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573632; cv=none; b=EB4DSFB3hpndsiPQqWztcrs11A4z7bNjEFozDZBovWBsmS0Jej+b+U23BXCnkovQB6JUHRfpyHI0Sc/tGVfdo8zpqbmM+czL608sa5xekS1AA3ut3LI8hChZwrN7hn4fd9IRmFVHAEba5wUNTl6ZDjRts7KeSu8hdmPbeIZzwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573632; c=relaxed/simple;
	bh=UDye6cA/eYezWAm0UjR8/jyytWAOcbsldHF5rQuQA3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvyG6aWinbccA5XB8lAiK6jVX3uJLWy4OuWGSol+hP4C447Zz9sB2+7b9LfxOiMhmgELnUHcXxS4YuCoPanAzwaVx4nkcIGGOkknKjBzg3wW+QCzRC4cmX1lZlYwfnykcmImFTuUA3MqcW5+OlMhZcN2wo2AEATcWlQ/aBqTIBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4FL+zrT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4FL+zrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71qJbXeicNPRGAQHERaE7MQgC1dOZ0kmPfIRuZea4I8=;
	b=D4FL+zrTmUrMqreKw4DLph4S6LeFVBw1LurIWStT5cv273bMJXdVfy3PtZ6NEsFeiQbJqQ
	iOSa6oF5uowGhtLOvFOsifDvKxh7mJXjxPTsy0iljEV7KnDF59nLreQsx8lTpxa8aHn9T+
	u+XMPSurKp60XjOx3a6CzuJURoFn5fo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-zgyAAEMZPXSzA1HxgLvwQA-1; Thu,
 29 May 2025 22:53:45 -0400
X-MC-Unique: zgyAAEMZPXSzA1HxgLvwQA-1
X-Mimecast-MFC-AGG-ID: zgyAAEMZPXSzA1HxgLvwQA_1748573619
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54CC21800446;
	Fri, 30 May 2025 02:53:39 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 009A21955D82;
	Fri, 30 May 2025 02:53:34 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:45 -0500
Subject: [PATCH v2 43/46] panel/s6e88a0-ams452ef01: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-43-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1566;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=UDye6cA/eYezWAm0UjR8/jyytWAOcbsldHF5rQuQA3M=;
 b=ROuwpXyHkgkxuk3Sf9vaJ6taVLpSCbYn45KOnEuR+tYLFp/DGkoP+0uz0vQmLjZwaSAOhAqLl
 /WCbb2K52qgCK10jVvQr2q+2R+WtvlmAf0DHViNFQkxYPvHz1lnrvMx
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
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index 57b1a899bbdc824b59f3a2d17b4203844e39a66c..ca5cad41ff1d95ba00759f38ad95750e0c307d34 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -165,9 +165,11 @@ static int s6e88a0_ams452ef01_probe(struct mipi_dsi_device *dsi)
 	struct s6e88a0_ams452ef01 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6e88a0_ams452ef01, panel,
+				   &s6e88a0_ams452ef01_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vdd3";
 	ctx->supplies[1].supply = "vci";
@@ -192,9 +194,6 @@ static int s6e88a0_ams452ef01_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
 
-	drm_panel_init(&ctx->panel, dev, &s6e88a0_ams452ef01_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.48.1

