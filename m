Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AAD20E70B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527133; cv=none; b=AuyhoFpMaX1/AKk41PgHLIC5/T4AY02ZBBgYUvF3ADBZFIcIU/kF2cOrH1xfy3myvPyb0V7OcyWd3oGX/Ic3BQ0+lgZwDsr6zKNhVY4vjItNw1NdQsUEEo7qBcntlf8uAmDNltMaFIlVx11ByoG4G2dWdY5q6XHNPAlA4WumSgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527133; c=relaxed/simple;
	bh=Yw3L+jHcFHC7CZ76zn/KRCSpyNXGQngVaA7V3jGHGnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rR6MLBWC231j0mivzYLHeHbU2jD3akpAz0eaFqoOS7dBI81q7PsSKO++iqi/9kGMpCeJbh2wMa5MXzta2dfyQp3lVtO7ZwUMTPQ71LvN7ns5b5nzQmCTRdvoNBwy5gorNHjd75p3mrXYg4O1XVFMQmx4T42JRR9K7bV/kjYwEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QY3VIUTL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QY3VIUTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743527131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOUxTLcoOh+ubNQJGUIK0Jf022g1JzkzObL9tNbdE5c=;
	b=QY3VIUTLKCMvbdj784HV/1YeyNWo0jLLCnlyNuaKokfWYjJJ4jCp7dDHJh9CgG85Hcl4xH
	xJ33JF0mzyaA0qB3Hx7qM/af/u2tMXngRRk4UcMDhs/LlTsLizhSzhljE0FL0kH5w6l5gd
	3ZX5t+w7T87IOeSJurMxtVo8DpDIkDo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-D4umeVjoPeKvwZlQf97Arw-1; Tue,
 01 Apr 2025 13:05:26 -0400
X-MC-Unique: D4umeVjoPeKvwZlQf97Arw-1
X-Mimecast-MFC-AGG-ID: D4umeVjoPeKvwZlQf97Arw_1743527125
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08EAE1809CA6;
	Tue,  1 Apr 2025 17:05:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 14DE4180B48C;
	Tue,  1 Apr 2025 17:05:21 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:46 -0400
Subject: [PATCH 03/10] panel/z00t-tm5p5-n35596: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-3-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1535;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Yw3L+jHcFHC7CZ76zn/KRCSpyNXGQngVaA7V3jGHGnY=;
 b=DRjTuyF9wKJaN48Te/lswlpRZ6PXWuEua/jn4IEg6ZSd+SRPloSbTJT25q7UE3nmGb6lZz5Mf
 N+r+6HXORP6DSeS5cQYlejsf35HUZLlRqBA+jyrRqUmRa9YtlqMz4qG
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index b05a663c134c974df2909e228d6b2e67e39d54c0..db006576d7046b65eb698c64c9ac3c5f7b69b68d 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -224,9 +224,11 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
 	struct tm5p5_nt35596 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct tm5p5_nt35596, panel,
+				   &tm5p5_nt35596_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vdd";
 	ctx->supplies[1].supply = "vddio";
@@ -253,9 +255,6 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
-	drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->panel.backlight = tm5p5_nt35596_create_backlight(dsi);
 	if (IS_ERR(ctx->panel.backlight)) {
 		ret = PTR_ERR(ctx->panel.backlight);

-- 
2.48.1

