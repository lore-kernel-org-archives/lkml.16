Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC902517AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693522; cv=none; b=Nb84iWQHt6rB6YMEp8wOALZ6U9vuT3jAUYXSi0S/MopsjtjXXth+TnbRU/gg/SEnMWlG3wTc04V1P4iximeOHFJFi6/rf6Thn5foxe6z7bprKnmVQQ/4Ul9s2zeZTuymcNhRle+JgZvQdOh1SyIuQR+5BFI2q/X0eksKLECZaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693522; c=relaxed/simple;
	bh=xNd7LeUGr08IPqsQZZJz6Xur9dzb5kvFcR4Mh4C2mZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlWbuaD0hqyFnEZ4GdgFr1qUQcvyzEgbtNHQwEwuD8mWJ6JRrcNEhUQpFah2tasYCgcw2JmR/ZoXH4pS4AHseDdzkBpkHo7Gb1pNrRqucYUD+063r63GkBXuZQPJ03C3+MvbEZjWk1qUKCbIVDmsPJHAYYfXJjYHAC7xC27v/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QiSUl8JW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QiSUl8JW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTxt46VxK1AiBCbukteKzHxLLjwlH5niXcUI0jjjh/4=;
	b=QiSUl8JWnMqetCMtSJPFKhEdn+xUOK1jQPxghGG45TgtzqCmyObAgTbKMeS2WeyMFGRTFD
	Lu+V2KhYvd8neMPrr/dgxHIn08xw/wZgJSvM9Bkel5OPxr0Q+xfcWeDsOe5+kVPlX8KnHc
	xmRXFiDnTS4/n6cRn38YjRQyta2vaw4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-GjzzKKaZNAKNvJD_oXHbQw-1; Thu,
 03 Apr 2025 11:18:34 -0400
X-MC-Unique: GjzzKKaZNAKNvJD_oXHbQw-1
X-Mimecast-MFC-AGG-ID: GjzzKKaZNAKNvJD_oXHbQw_1743693511
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C8411800260;
	Thu,  3 Apr 2025 15:18:31 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 876A81809B6C;
	Thu,  3 Apr 2025 15:18:27 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:17 -0400
Subject: [PATCH v2 10/30] panel/ilitek-ili9881c: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-10-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1322;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=xNd7LeUGr08IPqsQZZJz6Xur9dzb5kvFcR4Mh4C2mZw=;
 b=mL+Lhl14GpE5M8CxMz1I8qHcRlYbvxTsBeiuhW20ErPlGDDONTnhUL0/htLfWVQZhRFPvXELn
 +9x0YdK5/SECm9JKiyxhOpGvnbJVzgXkT5683FNiq8oNqMhfvhwMXoS
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 28cd7560e5db1d5734b10babdb4e4e553c6e07d0..aa4192def09353afa40c1981d0b105064fe95b02 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1506,16 +1506,15 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 	struct ili9881c *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct ili9881c, panel, &ili9881c_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 	ctx->desc = of_device_get_match_data(&dsi->dev);
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &ili9881c_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->power = devm_regulator_get(&dsi->dev, "power");
 	if (IS_ERR(ctx->power))
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->power),

-- 
2.48.1

