Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843481925A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611155; cv=none; b=PfE0GCMhEWoFvo/JiDLK7GKHF/COL/6s23gDQvj4zj6IoYJWUICHuqlPJPlWSTY7eDjj03xWtD56YKl98BbyArBH8DGoy1KYSldKXRxqJSwl4q/rod0bypu3n4b3WM4SRr9s+VxpVxSA62Nc7FEmfo3LYqff9KaZ8Q6Iy0sDI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611155; c=relaxed/simple;
	bh=7ug0WUcbfVp4DvN+9KLPcqXYIwBnh4S1f7qzzL/gWAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVEvQZ3zgkDstls2ujqIYWnKFLQO7CnoKvdTLzhWznGnJDFf4RJAMCq7cNrLXMHRd6fYwUIFrIFNKopV8eAHL6MNsj9cU1bfoj6x+scSW5P8LpuZ3K5cvUGwfRTn6PWPKDiuIcl+S916grnEIxgMzWtka4d+jMo9eRqdPLx0BvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4TI6J6R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4TI6J6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRO4JfKR+w4MI1ioV5AUsYB8Hjn3bTaDSAAz3+ZbYyQ=;
	b=D4TI6J6RiMVp/fO1VAV3KunMWci6I6+dtU6wuFuiktM90slCRJkwx+wttackBGSt6FxtnR
	Nk1o3U0m/fMVm6MgeWopADKSEGqlwyQmcTQRFpsmAZ4Zv42U16s5Ftdup5ODvOVQLTlj4e
	TJxljjFjCU4VIL1BWTGJHC9Y2Exvspo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-1pEbILyCO9CVlQs4Q5s3yA-1; Wed,
 02 Apr 2025 12:25:48 -0400
X-MC-Unique: 1pEbILyCO9CVlQs4Q5s3yA-1
X-Mimecast-MFC-AGG-ID: 1pEbILyCO9CVlQs4Q5s3yA_1743611146
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 148FA1955DC6;
	Wed,  2 Apr 2025 16:25:45 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8CBA2195609D;
	Wed,  2 Apr 2025 16:25:40 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:41 -0400
Subject: [PATCH 03/30] panel/fy07024di26a30d: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-3-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1282;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=7ug0WUcbfVp4DvN+9KLPcqXYIwBnh4S1f7qzzL/gWAU=;
 b=DH1zb44yvwnM2auZ3yFbW41iueqWPAqF0CEpvJD+SP3JGaWLg4mYPNxNwa07eO6GDyV7OV0mB
 i3TA3hKpmBwBuQfxXWabITHKsVsl6W+ZP5QpwmgtDisbKpvPX3ieDQX
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 48e3acaecdf33de5b82c3eea1c44f0409ebf5f8f..4f8d6d8c07e4d7ac33c90403b92ea1286ebd1a77 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -189,16 +189,14 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 	struct feiyang *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct feiyang, panel,
+				   &feiyang_funcs, DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &feiyang_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->dvdd = devm_regulator_get(&dsi->dev, "dvdd");
 	if (IS_ERR(ctx->dvdd))
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->dvdd),

-- 
2.48.1

