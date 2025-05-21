Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1578A23372E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800646; cv=none; b=UJ9GdoQXQ8xdBLemhMkHnphm7qHNllp9MQzdsIXrvz7f7xnAkYvLEABt/1rGVqXuj+P9V7vjw7aQT4e/0sc0wrSZZWTG8KawpkkBKP9JN4pkOOn4RCPhXJsrtp7Z3mjBHkJRXTv3GgLPiDiWnUXE7NRrgLSDBDZBEdVJHPY0YUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800646; c=relaxed/simple;
	bh=FiFxzPcrlKU8A+PR8my6TfixTivCTh2sL3ewoO1WCE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuRSG3AeQA9yuhtIdiS9UN/EiSOsKFb/Rfe4Et/c4f7fvaBcvzaNUML9D9xs4So3pR2ww/om/IeFMzTQp7su8Hrc47pUCgccP6vU75xGGpVuC/TPBXjVucrNRUR5A2NwvA/IJqbR+jPx0nR7pWTlliqvR4VF9SLtoLBawS1ttZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZgKIv4Zw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZgKIv4Zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjWCocP9uKM973wWaPVB9nhRDPhktaEqTfvsGFpnjgE=;
	b=ZgKIv4ZwY41wWxlt+cQZIQVEQgJ/zfeZrV6mjIiaD9J2XigW/y6Kf1XGLb2vjSGhHkSEkq
	btW8OGGJuuRBr+dx4s70+mCl6Q/G7BSu332umXQvjtIGFTU0wlAKxDKJjYpaiQOBXzJlvT
	8s6BEKP/5FZNGnaUQ3P/JykgNJvyKys=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-lHkdeVzjPKe37nPwWW1Z2A-1; Wed,
 21 May 2025 00:10:40 -0400
X-MC-Unique: lHkdeVzjPKe37nPwWW1Z2A-1
X-Mimecast-MFC-AGG-ID: lHkdeVzjPKe37nPwWW1Z2A_1747800637
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F2BD019560A1;
	Wed, 21 May 2025 04:10:36 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20C97195608F;
	Wed, 21 May 2025 04:10:30 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:47 -0500
Subject: [PATCH v3 16/30] panel/ltk500hd1829: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-16-f7ae7b723c68@redhat.com>
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1549;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=FiFxzPcrlKU8A+PR8my6TfixTivCTh2sL3ewoO1WCE8=;
 b=wutJk7X7hl+D4gzyBsgL3FkchvH49YkpsU5MVxqNiy05lLHGrBUWR8tdugpEcCUBwvanjtxYu
 1T04+ld4aG5DbfP09acFRI+Qf3dsQ7Zr9nMVjmb//XcmPSwpU763tUr
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: none.
v2: none.
---
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index 6b18cf00fd4a7a1d12a3577eced49ad6f9c3e955..7f19fd5b80600c2db3236f2d0e3ee44fd91fe4f9 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -604,9 +604,11 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ltk500hd1829, panel,
+				   &ltk500hd1829_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->panel_desc = of_device_get_match_data(dev);
 	if (!ctx->panel_desc)
@@ -643,9 +645,6 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &ltk500hd1829_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

