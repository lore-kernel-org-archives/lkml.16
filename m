Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897051F1902
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715551; cv=none; b=EpJMfePO6ydDRDFr3ziIX9+12ndno4qvEpz9DIwa59JnP9TU0/6yDAT9n5tNrugT1w9rpnPbsJgLIMb+Krt5Z9nSqhsiNp2inLFf47w36t1kQY5039pr8oh0S8iE6CcRqXcoOnZ3vjOCnjVbDbpZuOLYGPgatjOcHCaUf8vY544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715551; c=relaxed/simple;
	bh=gVmSFOc3PZgXmCDj3C3jJboqodztAxBRb9/nTgJj4ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYU38u7BtMFea9rKjMtPp3i4fhfVVQaD4s+fixPaqO1FvH0PC+yi74+95o9d6ZjTAJNtgar80M4Bba60qBqf/84EaJSy3bwSxReWJPIDPp4gIWwzONTwQmbYwVSslhe0+d+9Bye/QGBrRLcwapW3brSYX9KN2KVqnWVmR6ZXRjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0lB+UqP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0lB+UqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NXmm6rB3NGjLi2Fj/ugbq7yE09T/rIC6Hwvbos524eY=;
	b=H0lB+UqPFHTG9Xe66T9BSgn3byY+0d9XVJFzPVYMpmACFYvhZgH1eAt0EQhXI1k3+02sn8
	SjcBR6PGSjWgbCetH4xh165MITJqCdqC1BI5duw8fPq8Hnvi11prYCpVNj82DK3AOrTT+a
	PoS4BGWx36dbIatJCCKYyBPhxb/bHqw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-qRSeNkl4N0iKdt7CUzhn7A-1; Thu,
 03 Apr 2025 17:25:44 -0400
X-MC-Unique: qRSeNkl4N0iKdt7CUzhn7A-1
X-Mimecast-MFC-AGG-ID: qRSeNkl4N0iKdt7CUzhn7A_1743715541
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D138180899B;
	Thu,  3 Apr 2025 21:25:41 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 28C4E180A803;
	Thu,  3 Apr 2025 21:25:36 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:14 -0400
Subject: [PATCH 43/46] panel/s6e88a0-ams452ef01: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-43-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1493;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=gVmSFOc3PZgXmCDj3C3jJboqodztAxBRb9/nTgJj4ak=;
 b=tlkXLmznpw2//SHZP2VbHiFXIpKXw9KSs/5uk9EP/axBS2svZ7QqcR1ax3lBKYhR75CAAowwm
 MQ5ZfKRRinTAeUKHxjj/8te8MlPOTiDr6AVM3P/p/f/MN9P6M+cyEyr
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
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

