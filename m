Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87F61FBEA4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715483; cv=none; b=Cne/SwrMEA1LdS0Nm4sHIp0BcJ3rRFxUL77dDjRPairmWKA6wnHJmbuGhYyX/ud+BVuAIJo6xPWHOIFW2glRPauYrOtc0WvK34zZGWCzINFLvFlTC6Jr4kCksu3c3nSPVLY/K4TDRFOv4Nsin+e2oyj4N7YedHLI3ulg8y2k+2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715483; c=relaxed/simple;
	bh=1UuWWu0C8PNgV/ecIwKuMrp4pAn3O5IAgXydIF9Odok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkJMGAmw1vIsHDSyACho7DNICaAJ/XscYFjkSTedeRJzrdW9Qvx65Iq/zck6NxkmY8H/e9jT/hvsqGZcv98JPEu313/BVzRsn5B5IsEmF2iSOROUsajr/J4k/v0NEyeGF2EUB8W3buk2vyvwMkUjupcxQOY8o8+TVI9n0PhD4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvJnMDTc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvJnMDTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZx2Fn2Al8uOLSYD4QYzSd6pFDRIlqeJHJkHR5Bvh1A=;
	b=UvJnMDTcXlFzNn5NVnTMighAuxJX5iuGf3kEGOPJ3F4zbvIbvhRsSbflAI0s/V7RrST9hP
	++XcZSq8h5yolVL2fRIz93578tk+1qgKJGca9aaIWnMkXmZ8dvSI648xuFWcvRnkte8R9d
	DSX8uAjqN50pcrHVnNvL6unlvRyXsII=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-CuSgaQJZObSHiF1PV2vAOw-1; Thu,
 03 Apr 2025 17:24:35 -0400
X-MC-Unique: CuSgaQJZObSHiF1PV2vAOw-1
X-Mimecast-MFC-AGG-ID: CuSgaQJZObSHiF1PV2vAOw_1743715472
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 36BC519560A2;
	Thu,  3 Apr 2025 21:24:32 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E8A671828AC0;
	Thu,  3 Apr 2025 21:24:27 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:59 -0400
Subject: [PATCH 28/46] panel/sitronix-st7789v: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-28-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1308;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=1UuWWu0C8PNgV/ecIwKuMrp4pAn3O5IAgXydIF9Odok=;
 b=dM36/VpXsuObAmAqKkmKnFI0p+jwrgCGR/433+ApWPSr4VG14WRXO1H/ycilwS5yW++oAD7dn
 jvVcbiRASbSCTT85UBTR2tByKDrojkV8TUK+JxEnvX+NZf4EEjdEtZM
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 28bfc48a91272901862dcaa309f51da4697d0a4a..04d91929eedda092b966b8cffdef5b267748f190 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -612,9 +612,10 @@ static int st7789v_probe(struct spi_device *spi)
 	struct st7789v *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct st7789v, panel,
+				   &st7789v_drm_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
@@ -626,9 +627,6 @@ static int st7789v_probe(struct spi_device *spi)
 
 	ctx->info = device_get_match_data(&spi->dev);
 
-	drm_panel_init(&ctx->panel, dev, &st7789v_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ctx->power = devm_regulator_get(dev, "power");
 	ret = PTR_ERR_OR_ZERO(ctx->power);
 	if (ret)

-- 
2.48.1

