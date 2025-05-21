Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD8622F389
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800602; cv=none; b=SirvXd+SqGjMICYnb7syeFUCj4mFxhu3gnzELQOiYzkDzuYey4zSohFWGmlJo+Zi/OIRV6kxZaXOmF4dUaZRonpiCUDv8kY2lw/lJZRYL+M/OUHoyKiQDmWdAv/9x7VMddlO7JeWHaYQYjShF4CzrojZ+fLRkAba8JuV1lpMEM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800602; c=relaxed/simple;
	bh=mVTHA1abtNGy0Y5bU7qxENYvM4jZVs6LLI8C9EH1LbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/vChiVc7soExZpcBSdjqYsXJQjZUvgB1alq7orEGWnj9j4XNmfYyBD90CBaWmXAovl3zbpVIHg77ZVrE7mx3ZWoBeokJuqohq9YEEGbCMOl7xR3A5Jf411IA6OnHPwBctYSxsc16CUqPgZ9kwX7JEYB5RIbYJzmEcAe2COm8fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gR8H9i40; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gR8H9i40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEWB64d3J/cvo2iqUS8neIrjJpcsrlFCXAhz2SXY2KQ=;
	b=gR8H9i40HnkC1i13KfqIXew0vsIfw0WxnxOaJ4wKc7jpgeZT7ELLAgCAOeWPVVR0V+puHz
	97+7doJQ1AyNR2Sc8tVM5g/cf+Yraw3obCL7dz2j9jbIlOoLg0Aiy3h4U0d97JxmozNrRs
	Vnckkkphejn3BdkIISH6LdUTotn5zO0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-ptv5cIIKPCK7DRR2m7zCNg-1; Wed,
 21 May 2025 00:09:56 -0400
X-MC-Unique: ptv5cIIKPCK7DRR2m7zCNg-1
X-Mimecast-MFC-AGG-ID: ptv5cIIKPCK7DRR2m7zCNg_1747800594
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5009719560B1;
	Wed, 21 May 2025 04:09:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 91B8C195608F;
	Wed, 21 May 2025 04:09:48 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:40 -0500
Subject: [PATCH v3 09/30] panel/ilitek-ili9806e: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-9-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1532;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=mVTHA1abtNGy0Y5bU7qxENYvM4jZVs6LLI8C9EH1LbQ=;
 b=CbKJm5mfiutuwLHLe2uREg8QhatorHcMnfrGI79Jwp6p9RusYOZer5PHiue1FBS70551/UKTc
 y/AcDm+dfyRAUeTY0TPdACpCNH7kJutl+19LiloRUs2eZ//ySjhTb4R
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: none.
v2: none.
---
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
index a3c79ad99d0bd03f37442c53d4d9dd0e32012ac7..18aa6222b0c557f4ca703922a9728f74ad2848dc 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
@@ -166,9 +166,10 @@ static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 	struct ili9806e_panel *ctx;
 	int i, ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ili9806e_panel, panel, &ili9806e_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->desc = device_get_match_data(dev);
 
@@ -192,9 +193,6 @@ static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = ctx->desc->format;
 	dsi->lanes = ctx->desc->lanes;
 
-	drm_panel_init(&ctx->panel, dev, &ili9806e_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get orientation\n");

-- 
2.48.1

