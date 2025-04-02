Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306531925A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611159; cv=none; b=IJASflg2n1RAJj8YFof6V0Qq+Axu0JblnKeLohHiOTwSLIdSxT04Bnh5IAsZ4UCfyzi+7cR7P3yPka8Xi3ZEwEzsNd0+33f3In8/KzTlieA3O31PUpIuGdNR5gp7WldxRDc2f7SLIgmUPlGW1KJqblxddI8dQ7dB6d4GKFN3sO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611159; c=relaxed/simple;
	bh=MCqbDMbfqlMEM3tpfz11sdt3VQMAwyZM3kTPP0ahC+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkWyhOBNSNt0bouQn3CSn8cGmQNl2Rm/TsPVmUj8SxBZPN+kdwvYkFOm11pA8fRdv8xRHg873vPFxrtBshwVhlWed5sSLhp+B4SEBHVjj35a+M23zxEVc6y40Em9MV7vQ5Dr8v95b6qC51eKuZy4zna0190J0ltsLhCd9BIQ8wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atX7M5N1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atX7M5N1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=875RsKmiCeapt6y3l+1tJkJZJok+TPLY4UWwWxvYYQk=;
	b=atX7M5N1fH6XPG3MJII1XSdwC9j0ZszLqdlsIfsphOXXp17BV+TTXB6O3GdVUxau+PmDYU
	fyiBK00S/uF8gUjtpJw12M+WCUX5yKIWTfE27ZPA9WT3EHZtXUQbm0hSSY85iO0zlqv6M3
	M/HAxZnLJ8MSxgrHzJsb4nzXGfGYBIQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-94nyARfBMOOxryR3b2zEPg-1; Wed,
 02 Apr 2025 12:25:52 -0400
X-MC-Unique: 94nyARfBMOOxryR3b2zEPg-1
X-Mimecast-MFC-AGG-ID: 94nyARfBMOOxryR3b2zEPg_1743611150
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C280E1955BC1;
	Wed,  2 Apr 2025 16:25:49 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B2216192C7C3;
	Wed,  2 Apr 2025 16:25:45 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:42 -0400
Subject: [PATCH 04/30] panel/himax-hx83112a: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-4-903b70999ea6@redhat.com>
References: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
In-Reply-To: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1369;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=MCqbDMbfqlMEM3tpfz11sdt3VQMAwyZM3kTPP0ahC+8=;
 b=pk7rmlONuFqcuXaDIqVehbVguBRUV5idlEGDEEJ9sN5m1z1WZEfCVqp2rlBladlGITdS1eMEe
 Zz3imde/e07DxrSSrQcC68thjZSqeyxM48FfszOqTAyK/tKd8YBmxMI
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83112a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
index 47bce087e3393345fbde8d2fb4d26a955988c395..142cb1cc067addc5900fd5b25d32298b32d7bb05 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83112a.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
@@ -269,9 +269,11 @@ static int hx83112a_probe(struct mipi_dsi_device *dsi)
 	struct hx83112a_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct hx83112a_panel, panel,
+				   &hx83112a_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vdd1";
 	ctx->supplies[1].supply = "vsn";
@@ -295,8 +297,6 @@ static int hx83112a_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_MODE_VIDEO_HSE |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &hx83112a_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);

-- 
2.48.1

