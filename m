Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E370B191499
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573407; cv=none; b=efHKQJNOis190jD+UomPM6Vk4SiTVxk2N7hEa03Uy3F7eP8hYoIxiXT14eSmtWZ0DomDx789hmO99YxHJ2UBRF8lLMJcrMJmGoF2U+rDFnnil7+VQ41a6e/HQy9hjwQOHkKok/SbyWyCVvPooluSuZ30jheue2ulHpxg03hP2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573407; c=relaxed/simple;
	bh=wI7sB38CUJyw64nroSDGtrofdFX4t8ZxbWat4IlHQHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neHU4rNj1dgVfaDJXEn1ZDH4EX/gSB4PQ1OkrV9gIDOQm5x6Gmpj7ZYOXMEr90KYx4uYnaG+8T7dmSlT2CWbOzrXM2l8qZR6Lkt8naY7ctZnjes39/dJtQ4E+IezWhjoj86ul4pgSDbC7c9YW1nS48u9d9Vs1l+deVBQvwuv8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EBs1dKZN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EBs1dKZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKgx39Jwbdb7D6/K1iT9PFE/Gy25zvv7y4opmcijMM0=;
	b=EBs1dKZNHngfzGokMqmIu0P3kz/3qnrBeimGUNEl3XFgsrIHXBwZ7hzQsy77jFJNvIqPLY
	/VPMEuoehVMjMyDgzOurYhIFetTCfxsZvbucqmq/tOS/CuZnMf++ljGiJED3vmFr7BCv9X
	+fuI0V3hxlIgbMtCLXJgP26d7cWWUMs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-Dri6yWXKNn-RN0VYQI0flA-1; Thu,
 29 May 2025 22:50:01 -0400
X-MC-Unique: Dri6yWXKNn-RN0VYQI0flA-1
X-Mimecast-MFC-AGG-ID: Dri6yWXKNn-RN0VYQI0flA_1748573398
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08D2E19560A0;
	Fri, 30 May 2025 02:49:57 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5AF931955D88;
	Fri, 30 May 2025 02:49:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:03 -0500
Subject: [PATCH v2 01/46] panel/orisetech-otm8009a: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1583;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=wI7sB38CUJyw64nroSDGtrofdFX4t8ZxbWat4IlHQHg=;
 b=h0hXjj7wY/HvfjtHlvbI5vkzOILZIilr72pnF5tXbPYzFdB8uvgLEFVe1lR1CoYiqOKIvyHp+
 B0Kvkf1fChjBSKCzPO7eq1e05vBYo5oxC2DgatXMBKERD03eDUwrn8p
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 87bbb25d119a38a0d92bf3eece5c00b4ab38f4a7..a0f58c3b73f693511d146ae191e2e42862336841 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -424,9 +424,11 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	struct otm8009a *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct otm8009a, panel,
+				   &otm8009a_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio)) {
@@ -451,9 +453,6 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &otm8009a_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->bl_dev = devm_backlight_device_register(dev, dev_name(dev),
 						     dev, ctx,
 						     &otm8009a_backlight_ops,

-- 
2.48.1

