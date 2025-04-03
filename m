Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA41E250BFB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693511; cv=none; b=IXxWNhhQ7D4Jl7iCzzm6uNipUa7PaLXumVX7EOqbtpLCtwhdn7HtThRa9HphmCmxN4BhDim3ADcDY9N9GRP26QJvJi+N4jves0vflgtdg5HTy4QEf+RM5vVerYiLJI9u+jQ1lpveaCJQxLIjngcuETvpVAMYg3AWXwl8lmWhMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693511; c=relaxed/simple;
	bh=tG6h8l9NqnDPeEhBcV2AhHGrGMourP7+ADLAtf5qRdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cmdq6Ob1cUilw7OqTO4RPm8LszmR6UbWQvw/7ZLBXj6n7TK5hU+MRIKwOqa8Hfy4dQ5Meyla6SFZjLb2ICia6QkQwn47Y5bfyc+7k+BB6tCT6NE8VDoHEviV86gOFNMZbmrCB3XunQfyAM2mx48wBSYObKgw6Z7oTTnql6cy2fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aON2k6Wz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aON2k6Wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Q28aZlHchMCXGe0AtyVdvVmSymSEtarZ+Ruj3XKAwc=;
	b=aON2k6WzPlrXv2W93eJpIfJ9V4jqiyke/QLSPRPEczFFZBDVioyH3zYymZRO0ipsL0CpDo
	vyYIu2gdP9m3c07PTo2KO0Ng17orBhzfdAlFr07xxUuFDjxv6nsOpT5zhB4dPd48hYrrRQ
	i3EZsgfX29dDb4ehJjG8yJnGUEfN6XQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-vzju_zpSPwy2A4HwDHwCQQ-1; Thu,
 03 Apr 2025 11:18:27 -0400
X-MC-Unique: vzju_zpSPwy2A4HwDHwCQQ-1
X-Mimecast-MFC-AGG-ID: vzju_zpSPwy2A4HwDHwCQQ_1743693502
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDF23180034D;
	Thu,  3 Apr 2025 15:18:22 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C4F21801752;
	Thu,  3 Apr 2025 15:18:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:15 -0400
Subject: [PATCH v2 08/30] panel/panel-ili9805: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-8-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1439;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=tG6h8l9NqnDPeEhBcV2AhHGrGMourP7+ADLAtf5qRdE=;
 b=DEPWzimzMVTjkR/Y+7te7S5FN6/mNhLrMgZisVAbXJMrRt3z66Ph5aoKcQNXFKHg0xuXf8u0H
 N5y1XLCqubACND1cE3t+NR/PQ6i7GOiQPyFV6PhznD8IMEif8yxMAkC
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Start using the new helper that does the refcounted
allocations

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
index 1cbc25758bd2bc0ed1ea64eed61edc7cdda68f9e..bda585e00cf980575b8b858149fa39fbaf2182df 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
@@ -307,9 +307,12 @@ static int ili9805_dsi_probe(struct mipi_dsi_device *dsi)
 	struct ili9805 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ili9805, panel,
+				   &ili9805_funcs,
+				   DRM_MODE_CONNECTOR_DSI)
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 	ctx->desc = of_device_get_match_data(&dsi->dev);
@@ -320,9 +323,6 @@ static int ili9805_dsi_probe(struct mipi_dsi_device *dsi)
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_NO_EOT_PACKET;
 	dsi->lanes = 2;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &ili9805_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->dvdd = devm_regulator_get(&dsi->dev, "dvdd");
 	if (IS_ERR(ctx->dvdd))
 		return PTR_ERR(ctx->dvdd);

-- 
2.48.1

