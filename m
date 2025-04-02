Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5412E190462
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611165; cv=none; b=BeIesU1gNLirKsfwuBS9rogskLuEAvWjmnZb5QTj+Vu6dmYDT+JBo27p3Q7WcU96MOmrr+O/M1NTUgCRWeG0F480V8NqSEiLrVhmgox4H1z08C3UPa9QEpa1wylZTW9RYKuUiDYj6FdBT53QxghdpnhC/stuboWhffui45KHFks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611165; c=relaxed/simple;
	bh=iba0hhsehOqH4Fs29yrW1D1gZNzo6TgJrylYkgV73w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQqcCOO1RUUcbajz6wyuEnoh4MGZKK2mg0tjtcwm5vaobqa9IdQipLdSb4jA1oCLqnplvs5UMmxNmkkO/kA5jSdcmzjTm34JX5k96c+QEMBgApO0TdZD1JHR2JZ7GH1fMtqZ6H/1fGFVGsQtIngtlk1oshW1zbZd2EU4gBTLioM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R2m96E38; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R2m96E38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XI0Eq14BuE4/8eJYlUv7+De6XInkB4iwHReVJBrWt3Y=;
	b=R2m96E38pyK/fuolUqRZGOZ8HRaJJXKVrFBabtYNgN1mZ9XPB8++SBnEMSe7ev4SA1qjoB
	96AFwvS4JQ8vfz2zTEsCx/UdfxxUFoHuofxPm7+aJaI3/LC2d7n+ewee5k1sG0FYQwmxdp
	nKthmAVVepMskAfZ+1HzjQn3HugOgzs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-d38nRIqfPYKkJ8OiA63XOQ-1; Wed,
 02 Apr 2025 12:25:58 -0400
X-MC-Unique: d38nRIqfPYKkJ8OiA63XOQ-1
X-Mimecast-MFC-AGG-ID: d38nRIqfPYKkJ8OiA63XOQ_1743611154
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64345180025C;
	Wed,  2 Apr 2025 16:25:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 197F9195609D;
	Wed,  2 Apr 2025 16:25:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:43 -0400
Subject: [PATCH 05/30] panel/himax-hx8394: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-5-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1385;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=iba0hhsehOqH4Fs29yrW1D1gZNzo6TgJrylYkgV73w0=;
 b=kIYzJHOq9QAeH1oHJ+EM7ZgfkF92nx6pPlK746fu/eJovqFS/AcPAjGuK/0qdZmwvu5+H0i5D
 gNoETEmYPHGAdn0RQDYvoz7LAq28g+iDqFRiMU/BgUUwWm/7C8427KV
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index ff994bf0e3cc1af134f40ac3b1712633ae801caf..0e3bf4ba91890e5a859288cb6a9737ed77a343b3 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -611,9 +611,11 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	struct hx8394 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct hx8394, panel,
+				   &hx8394_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->reset_gpio))
@@ -645,9 +647,6 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->iovcc),
 				     "Failed to request iovcc regulator\n");
 
-	drm_panel_init(&ctx->panel, dev, &hx8394_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

