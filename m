Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FA822F3A8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800630; cv=none; b=KkrdoQsdS9oEhehzdSBYvd4zUJqcXgGPf+WTZ2eD/JaP7sLLTbGi+Cb7iceiJ61NWfXqQ2cyG7l3dWqUpnQIns1AdP8X9b4sFzfPhQxuujtJvD6tRg8+CvBvK1sENdgSBlNYF0EbPzNf3yHeKwScRD5Qy4c9NbSCKs6zMBcc59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800630; c=relaxed/simple;
	bh=FKthoYsueIzu7l1PgjW8ktMuyiWGBy9E5Bv6TQw/mYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZoxVftbyxMJLWjLjNeiEa8EgtARseYWGT5LC0SQ/i1NsVbM1rpfvyZQQmHQ+7j2o3LpkanmECUS0pQ6o8CFVtxekaIQpXMY8vlW6KkfnTRmENVqeqbajp9uEvVx6TpL+Ps5r+glsAMmDbn1kKtHUCrIYWRppOqsonVHDZE7kv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNdI/ZPc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNdI/ZPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stm7x6EetpTfy0vTwnwkJlHiOMFjKb1zyPHVuXH7/E0=;
	b=UNdI/ZPcFyMrJQ71RJ/FofcJbEaMW/pzzYhmssnUsZIlVC3hVBFrWv2z214/7YCQvO5Duf
	verC71oO0cQZxpOIYvlBPvQeFsSMI8GiXJ+3dtlAHN/2wB/Ej8VBaX2ffaTtdrlNsH63yf
	8OvuNwtnSfhAfCJGCG6xCTII83Wu6X0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-3mux6VGNNem0Cu4_4vFPqg-1; Wed,
 21 May 2025 00:10:20 -0400
X-MC-Unique: 3mux6VGNNem0Cu4_4vFPqg-1
X-Mimecast-MFC-AGG-ID: 3mux6VGNNem0Cu4_4vFPqg_1747800618
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54E3818004A7;
	Wed, 21 May 2025 04:10:18 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C5939195608F;
	Wed, 21 May 2025 04:10:12 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:44 -0500
Subject: [PATCH v3 13/30] panel/jadard-jd9365da-h3: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-13-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1567;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=FKthoYsueIzu7l1PgjW8ktMuyiWGBy9E5Bv6TQw/mYA=;
 b=bWVofUxY3jv8wt9rhxzCY2h5/C9R94biIX+kTRMkup4iifznRai3Tf0rU1OhVeoYh4xc+3306
 cRGkX4Mxma2DCqr0pk8IqpBN02SMDiIOGlGUHjxJVnkeryKxNu7rXpa
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: fix alignment (Neil)
v2: none.
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index eb0f8373258c346ccdffd5f8052a5923cd21e203..5c2530598ddb99a0ebdfc7e304b92d11ebf9a50a 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1120,9 +1120,10 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	struct jadard *jadard;
 	int ret;
 
-	jadard = devm_kzalloc(&dsi->dev, sizeof(*jadard), GFP_KERNEL);
-	if (!jadard)
-		return -ENOMEM;
+	jadard = devm_drm_panel_alloc(dev, struct jadard, panel, &jadard_funcs,
+				      DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(jadard))
+		return PTR_ERR(jadard);
 
 	desc = of_device_get_match_data(dev);
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
@@ -1148,9 +1149,6 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(jadard->vccio);
 	}
 
-	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get orientation\n");

-- 
2.48.1

