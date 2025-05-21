Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D622FDE2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800571; cv=none; b=INiK/pDijc5oksKZs9QHXgsN5rFSokprwzOSFQwWN+aK7JbSGvmnTiDxKn/6ft36JPWq3KySuQVv1JJDsxEYue28/COBy3dnrcOjyKcDaFBJS3pcdj9BIIePqkF7DaoApOMCCvGIrsuzf4kHLuOULEpFH8yRuqzJgdrah6kdSAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800571; c=relaxed/simple;
	bh=jw2l6kmyqcb7jMZ15ts1AmgfI3kwcFaGFrmpEJ25EbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPuNNQ6o38aeuiehHGFAZ7chJbHCxwR0LHoU1rCMXQcAvgyS9Whg8/7rwBU2x1IFYXGM4L+rybIkQV6yeS+wu7lEz8BWrHTWZPhk3aToOdgBF8/NxDtCGMEPrU2IsrjAnOV9Vm4LKyXIdWSnkx4ilnwS9rt94B7FbpKhy9q0WK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5vlXWBs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5vlXWBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCxA/b3zl4VYyMzvg30Eg13vDqe5q9eddw/UZLbosOM=;
	b=D5vlXWBseaq6AC4uz2f2GjxG1CWnDpIrG0gfIjOyZqXEC0QIZnvYVR2NPPWzHl27L1y8hh
	DnDgIiR7BaiS6TfmcAB2wGDX3zQxqOcuL+KUA5kSvinDwTv1021cAbz4dS8UiY700Uvceb
	6w+5xtgCMHTliUiQRDNSRNryWLyDmgw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-KJE1RNcHNFGOK3ydKhlc4g-1; Wed,
 21 May 2025 00:09:25 -0400
X-MC-Unique: KJE1RNcHNFGOK3ydKhlc4g-1
X-Mimecast-MFC-AGG-ID: KJE1RNcHNFGOK3ydKhlc4g_1747800562
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 712D21956080;
	Wed, 21 May 2025 04:09:22 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6A5919560A3;
	Wed, 21 May 2025 04:09:16 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:35 -0500
Subject: [PATCH v3 04/30] panel/himax-hx83112a: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-4-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1453;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=jw2l6kmyqcb7jMZ15ts1AmgfI3kwcFaGFrmpEJ25EbQ=;
 b=i/hKYh1nk8xhrAU7XXCO72exEAy1G3g3sgFmaWmiCua28MHKBGQEPJUtWOFvWdz3kOqcwl11d
 t/LwomrlV+qBx5fznbNOp/mGhR6dAqRJvaQwhW1HwZPB8sPNeTOBvdC
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
 drivers/gpu/drm/panel/panel-himax-hx83112a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
index 47bce087e3393345fbde8d2fb4d26a955988c395..142cb1cc067addc5900fd5b25d32298b32d7bb05 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83112a.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
@@ -269,9 +269,11 @@ static int hx83112a_probe(struct mipi_dsi_device *dsi)
 	struct hx83112a_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct hx83112a_panel, panel,
+				   &hx83112a_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vdd1";
 	ctx->supplies[1].supply = "vsn";
@@ -295,8 +297,6 @@ static int hx83112a_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_MODE_VIDEO_HSE |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &hx83112a_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);

-- 
2.48.1

