Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E113235355
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800668; cv=none; b=hkSjsE4gTk/Yz8mYw2OLu1cGL7aqYOvUFRnLn1VhZ7EGwEBpL5QszacTSJmlvK0zlZxymafGyCNt3GLw3BOAu4fwYdfLNx1RtCglpuC5gbf1qgg893xuzI50OgYVao3FNHraVlytY8AibAUzOuPrKkGp3RODHuLreXWMIglrt80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800668; c=relaxed/simple;
	bh=INslf17n5W1TThwlKDQd0lUPUT10LhJ3yE6an0iMCGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtBd8iAGl7DALyvP69kuw2s4MHJif5QWcIt0ophGzwZ2Zj1mhLxJRYI9nB/ZWqcruhV076bHbkSRjDcj77E59jL6D2txLgq6Ab74hNJOanoB79/kLhisrbH4fKcM9P1nAxiY/8UzutJCUrovoKSe05EPO6ORPj6WnCkniTLKyrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DHD6+Sgp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DHD6+Sgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcJPsD4yEb7C8prq3SYtzfKqzvCWxOEm2tcvbSNIBrQ=;
	b=DHD6+SgpygqRxaHaEVgRW68QCBjOcvWqceXtJmzLl5D+CvtssZJ1XgrvgMU87tEpz8uLgt
	b1ZAWjxDJhFb6uXa69L7hkhj7l/DuoSmUNEQUf06dQcGd0ZL8ymf6Bhbdw4J3etcgVBVui
	FGLPp8o3y/BKWgUag8iLltr4ckFI77I=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-uxgxbs_tP2S1oLT5H6ikLw-1; Wed,
 21 May 2025 00:11:03 -0400
X-MC-Unique: uxgxbs_tP2S1oLT5H6ikLw-1
X-Mimecast-MFC-AGG-ID: uxgxbs_tP2S1oLT5H6ikLw_1747800661
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC4391955DAD;
	Wed, 21 May 2025 04:11:00 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6596C195608F;
	Wed, 21 May 2025 04:10:55 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:51 -0500
Subject: [PATCH v3 20/30] panel/mantix-mlaf057we51: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-20-f7ae7b723c68@redhat.com>
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
 bh=INslf17n5W1TThwlKDQd0lUPUT10LhJ3yE6an0iMCGw=;
 b=o2n2imLQ3YoBmonq/HDarSlR4hr9PHS4xlYqKen3F4KuniVSfR75MmQfSS9WsSLyErwhsZMcX
 vC1o9MdHdfMBWW1wyXkYzImBqjpxqhZDfx1LHSVF/aVkVmeDFAIpLFo
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

