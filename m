Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6622F768
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800631; cv=none; b=F3lvBiHvuZD/fa/7Oho79mH8tDCpBfG0BRFGddmz6rpov09HRFL/IuB7Hs2JLV5nbFGevlfX9dlfMYhViEvbNq2ml7Sel4fIf0IjrWAyXdB470tPmQA/msCWdinfB/oAV8OIB0T/5k9Cr2UAf67qNNP0SytWX5fpdU/xRt6lrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800631; c=relaxed/simple;
	bh=jtJTg18tT3UdwkbCGron8qegjuEh7F1SAvxymnh9S5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6q91q7vKf6fl1u99ddZ7BLA+PsltplbAbFHOfl0Xzw1kz4Wt7BrzfgW4pMsLDBdBSkpaGM6Ie4FyY3G0ozvgCTewy8vUbzGgXfngSLRpLQP7Bo+fxavEE7RqGvWIZSw1pWiYv5ynnsbY00gY+FHJN3R/ms370rYXhUgeTYgFjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=US8lMlvi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="US8lMlvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpeP2mHh7v+5nHR8VPSfm4xVcPUHpDIT4fjgudA2e74=;
	b=US8lMlviW5OSe/+ofIIJ3P21fuXTQIb7Vq8yT7SCz7YFqvzr+MzzIFd/ZBm11gjZzhCyI9
	eHvTg/thUFihAzL2qZ4IyoND6l2DzmbMZTB2Sy4C/cYrfViybLcy7GvYoJ24+6+EvfVKVo
	r2+PbLl1bWzUSWVg23saFh89EbNP6Fw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-VD7eqVP6NoGaNzaIFABi_A-1; Wed,
 21 May 2025 00:10:27 -0400
X-MC-Unique: VD7eqVP6NoGaNzaIFABi_A-1
X-Mimecast-MFC-AGG-ID: VD7eqVP6NoGaNzaIFABi_A_1747800624
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CCFE180036E;
	Wed, 21 May 2025 04:10:24 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C06751956095;
	Wed, 21 May 2025 04:10:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:45 -0500
Subject: [PATCH v3 14/30] panel/jdi-fhd-r63452: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-14-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1519;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=jtJTg18tT3UdwkbCGron8qegjuEh7F1SAvxymnh9S5Y=;
 b=ThA2kzmSIodAQ0o/vF+3UCXZEtdt7UJrUlxyze19UPz8xAijTu2Qo7M+CCgb1WKipBrWCQ33F
 wv3InrDFjtMDenMwRFIhZE4KRxNNEz/gNVceQQzi4bE55hNjHoS5wlC
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
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index 4eb71e85e9e9f2acaa2bdc23dae563f04da64f8c..cbe354b51bce35ec07b6f0758973fd5dffd92c42 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -175,9 +175,11 @@ static int jdi_fhd_r63452_probe(struct mipi_dsi_device *dsi)
 	struct jdi_fhd_r63452 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct jdi_fhd_r63452, panel,
+				   &jdi_fhd_r63452_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))
@@ -192,8 +194,6 @@ static int jdi_fhd_r63452_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &jdi_fhd_r63452_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);

-- 
2.48.1

