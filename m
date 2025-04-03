Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F036253B48
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693568; cv=none; b=J42JZypD/JtaGZ7jNUW2l3QQSV/3BNzPFpoO8qXnKZedHcHQlJuq2L5Xtcobw56Ydgx2GNcUkanIBs21aSW9xNs3ago8TRm0AdDlEuBJBmAujkF6uY6Ou1DAzO1bof1c0H99yboQWrJL7m17mVQ6APvNue+7s8Xrkbv+J6k7b8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693568; c=relaxed/simple;
	bh=eir47puoED8sBWrmRUNM7FfDlndShT9tW/JZcNe8ie4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBn6M0TB+gxMrv7dOpWBTO49USo+mmZR9aaU9PxFlrAOdsTcvATEjZS/W/4CLIgyB3vR/90ow4q6wRcEjKID22Y0yFwQ4ec/d8rXZgY6XoWAnTH75FcGXcSZHMQIr7owFuhXT0C++2S8XoT9k/WgxBl7zVbqFL8gXzctPbUp8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FrlkeD4g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FrlkeD4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twWRbGjC9pU6Oht0c78WBho7m4ClBW2yYXAnibNeRQk=;
	b=FrlkeD4g8eyg/FuE7D2rLD1hRv1l7rrDbZJh2A+6j30f0NnObSImhUJ4yxMLN8R3bs8M9Z
	PC1qrMfjuteuxuB5ljBEiw4VeW7j21tm4zGFQ8imEjJS5NfEMYGh07xvXXyIIpEtOfVFnx
	VzeZRWO/3WrAna/b735qMQ//GVo13ew=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-VOk4t399Mt2IuxrW4iS-fg-1; Thu,
 03 Apr 2025 11:19:19 -0400
X-MC-Unique: VOk4t399Mt2IuxrW4iS-fg-1
X-Mimecast-MFC-AGG-ID: VOk4t399Mt2IuxrW4iS-fg_1743693556
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5ECB6180AF78;
	Thu,  3 Apr 2025 15:19:16 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C2061809B67;
	Thu,  3 Apr 2025 15:19:12 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:27 -0400
Subject: [PATCH v2 20/30] panel/mantix-mlaf057we51: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-20-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1451;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=eir47puoED8sBWrmRUNM7FfDlndShT9tW/JZcNe8ie4=;
 b=KQPhBElDOATStQiayUwtj2Zr/AIiCEAWyHUeWaWa0YPP4606Y2MtOySAYYZ9pkyfVGFyDdG3p
 1T+barbAILHBllNiKRZbf8wY+VVCDS5aswOPRj7N7l9O1DnNE6coVq8
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
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

