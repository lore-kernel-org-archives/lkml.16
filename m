Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213D19F13B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715368; cv=none; b=u0My2KpoCqn+J8kAV3+aGPXvPcJ2ZfHrlSB182hKfLeG14U+iXz9PMbmguCgiaGAkoGtRS240SxcQBz507yYW0kSDz02XIloLwbunM3WhwRXUs2f4Kmu3sBPV9SS+Vca0GcZSLAJn7YIjbHImGJlQlq9c8UchBTfAjKDrjy/MnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715368; c=relaxed/simple;
	bh=2IdDHaGzFquCq7N4xhH9WdiUXwDs0/2yQulzBHFJP4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSesmfvI3ZQ0h3WB7cWvG2CGebTUlpB5HdC3qBjbOuN1NobZ/yity5FfoJa2MuEZwYF0R5HSoX1p4tc5iqR7ml8Qa+fvN3mOqhvKK5cYIrbjsD8v1N8TFyL4unyPoA7i/BU6oX1eFd2fFZzhftrQHnwu4whzdTezRBmY8yjaWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HqSEIYPA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HqSEIYPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8m83oPnzHjoj3TYj8kJawzHmXyw5D9Sy9AIGCgir168=;
	b=HqSEIYPALSXBaeDSQL6YLijjwPmaUBpz76kwnWqInLq2CPLZkihwnmGSY2/Xyn8iGxvIW1
	IuxGTDbCPOiYAU0sZlQ/SRpPTBZ+VK73i0Z5ldEKNJsESwDs3Gc0Zs10008tRae07H8HJF
	GwcAIYilZVupMDG01aYGPUoGF+BAVhQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-hQIw9tLaOUeY6G3FGCHhWA-1; Thu,
 03 Apr 2025 17:22:39 -0400
X-MC-Unique: hQIw9tLaOUeY6G3FGCHhWA-1
X-Mimecast-MFC-AGG-ID: hQIw9tLaOUeY6G3FGCHhWA_1743715356
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B6BFA180AB16;
	Thu,  3 Apr 2025 21:22:35 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5BBA01828AA8;
	Thu,  3 Apr 2025 21:22:31 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:36 -0400
Subject: [PATCH 05/46] panel/raydium-rm692e5: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-5-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1399;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=2IdDHaGzFquCq7N4xhH9WdiUXwDs0/2yQulzBHFJP4k=;
 b=ab7oxJakSbbIdbkvQ3n4QsY7vKPENeEwrQFsYSFETiPEKhvj+QXMXAO/krZOxIpbAhENnTLgI
 npPffFaPryzAZqaaNvcqARB/Ua6c4KT7EN1im2RGqMefloxwygY9WlW
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
index ea1b728e85a2ece226d3df48dbd45a763bc6bd5d..8e9484768657b68a300d42594ab921ee37a5d5a3 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -281,9 +281,11 @@ static int rm692e5_probe(struct mipi_dsi_device *dsi)
 	struct rm692e5_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct rm692e5_panel, panel,
+				   &rm692e5_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vddio";
 	ctx->supplies[1].supply = "dvdd";
@@ -306,8 +308,6 @@ static int rm692e5_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &rm692e5_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->panel.backlight = rm692e5_create_backlight(dsi);

-- 
2.48.1

