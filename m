Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D5E1BD9E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611228; cv=none; b=X9pkuiUXbbfDCgmJxPIHC8jV1RLi3gQnweGUzCWqwXBNCAubWHs7Oe+h/ul/hYqYbLykmHsyzdPNZtZv+6bQl+kfSSL1fE/zeoGHx1S6TR2sGx9kZXrVTbU1moc6XEZs9exx3LAp5mtfEIj9wJd4MFZw+IBl9gvbfjp6XZiqIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611228; c=relaxed/simple;
	bh=yDL1X2KRlQleOoI9y6keJaGM798Sa3CZHFZtCRX2hRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ROkoSxDNF8kk25l0AM2Jyr5TMJ3lJd8JHcTmojE2pgQaxfVG3fJOzuQW2B11Sxw3B+E4h4xVRg/5xZwhWm/Tgs9pnivO4AdQYDLKYlZBOvbXh1BZyUxzvO9cIrrh/vgt4KjFGOyU1YkpZ2OZRRXxdByGypU0vggZsYX2gcntHTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R0zhe3Xi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R0zhe3Xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5lQ8TI8gl4MIGsUjiBcrpgYYt0M7hW5xnXkDy9c8nOw=;
	b=R0zhe3Xi2x7Eh5twwdN0Dz6oV1ooldLRCLTx7XvXV3F3Lye3+/cL1jD6yEX7DvJyJyfAie
	ekW2LdaQwiCDjy5Dx8vPSSqH7mBCbTyjdKO2uczQg5m6wB4nwStuHTqqfOsQL99PmRUFUQ
	wWnPObhR7fCvcDuBZ8dUdUchDkLIzHw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-389-TH1pFjSMPPaqJuqU-lxkwA-1; Wed,
 02 Apr 2025 12:27:02 -0400
X-MC-Unique: TH1pFjSMPPaqJuqU-lxkwA-1
X-Mimecast-MFC-AGG-ID: TH1pFjSMPPaqJuqU-lxkwA_1743611220
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2272F180882E;
	Wed,  2 Apr 2025 16:27:00 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F70E195609D;
	Wed,  2 Apr 2025 16:26:55 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:58 -0400
Subject: [PATCH 20/30] panel/mantix-mlaf057we51: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-20-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1435;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yDL1X2KRlQleOoI9y6keJaGM798Sa3CZHFZtCRX2hRE=;
 b=UlEP6GntIrHDZn+PRY99gPD8R1muqGxGxXztpKE6QMJ4f6fgUGEO/lQPXMZN0BINBnawm5owg
 Lcwg0JcdJXxCibgpWmsm8k4CjUOnYmdqb4Ja74RJJ06Zk72u3idODj4
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 4db852ffb0f619a398c04ba2358e503733db108f..55664f5d5aa5d4c45ad3974119a3da492db4bdad 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -234,9 +234,11 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
 	struct mantix *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct mantix, panel, &mantix_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
 	ctx->default_mode = of_device_get_match_data(dev);
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
@@ -271,9 +273,6 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(ctx->vddi))
 		return dev_err_probe(dev, PTR_ERR(ctx->vddi), "Failed to request vddi regulator\n");
 
-	drm_panel_init(&ctx->panel, dev, &mantix_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

