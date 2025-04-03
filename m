Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4EA2505D0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693545; cv=none; b=Kdx19Hm1sWUjlS8gEt4qlAHbzs1LOH4DgWjfd/I13m6sSFdlZqg8zF9zR0J9Dn4AaEUJpazmDx6+SPbHPJl+VbeHuNP57uyr3ENRWt1SnehtHXzRHh+hEGr6lZP4/e9mNoF+1RhX4AMyueYahMjkNQIHzc9yHdOliK3Ts6oHC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693545; c=relaxed/simple;
	bh=ENWWKXlpubkpPq5fpDdDeeupnZjgEoYXiBF942ONjIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVVAzgfoQEzkfZlm9eNaUPhSGfUN52YaiZj97QxNbiehxYWxWz61F/gJPeybLVcF3UdZTTxr2SDmQWZHEnM/i+6b9TKVDPgSYK9K/J7xF+sqOXPdZd4eClVZknHam6MADI6wS5p93opl0RLn2jBpjTNPhvAF4avxFgHQwn7mde4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+TwrkBJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+TwrkBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQalz+47QZFlPN9EEEesruNWWHgXVhVvt6cZotgSQwE=;
	b=W+TwrkBJSKu4l1opjC0IVbXWJQNucCouO+b3RwUPE5g+0yWmnJdnHb4DHzVy3O9OnGrqAO
	3cEeGYvNUpUGDVhMYE7MxPS8mVY59HtyRMp/XnMDCb4gV9/jlptoix7beFhaT1NFvYJ+Bg
	Me9m0P8BJeQQ9z8VWcAnpC+NDjy+4jw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-cQT1C-VvOyauIGYZlYZrCg-1; Thu,
 03 Apr 2025 11:18:57 -0400
X-MC-Unique: cQT1C-VvOyauIGYZlYZrCg-1
X-Mimecast-MFC-AGG-ID: cQT1C-VvOyauIGYZlYZrCg_1743693534
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58EF31955BC9;
	Thu,  3 Apr 2025 15:18:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 265311801752;
	Thu,  3 Apr 2025 15:18:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:22 -0400
Subject: [PATCH v2 15/30] panel/ltk050h3146w: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-15-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1436;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ENWWKXlpubkpPq5fpDdDeeupnZjgEoYXiBF942ONjIk=;
 b=sWPq/I9nU0W1xJYUH6TpBvIBqMUMz/gs+d47CzSWL79/E4xXwIt3zyRGnMVOa344Eo0hd5n5Z
 9RiHObfyYJxBras20FPY4gwxz2CyR3p9aqhZkS2S6isZheybv2W2HEy
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 77f74e6c467e566ca2fd7b6a5cc29b2fe09b9ef5..9a384149b86ea2fd03feb1a21d2dd532412a966c 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -548,9 +548,11 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 	struct ltk050h3146w *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct ltk050h3146w, panel,
+				   &ltk050h3146w_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->panel_desc = of_device_get_match_data(dev);
 	if (!ctx->panel_desc)
@@ -577,9 +579,6 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = ctx->panel_desc->mode_flags;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

