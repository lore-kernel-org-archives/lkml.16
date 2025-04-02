Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293A19307F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611235; cv=none; b=bulzYz0s6J6Z9hvHQhREK4YE/5kprthTyeXWLgaTBwxOqSgDORTZCiX1WxNuS0cdNuXvvYkwleq5I2s1KIKpx/aN9QMd80jHayMVbEmc4CgZiiGIrnDEFbsRLzSNxf/J6RMQHjsmJBjqyHezdidxtOK/OhFBOxulwVs2iXqTrwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611235; c=relaxed/simple;
	bh=9YW9rJHLIGdRGLO4GFRhV8IbkrEU3vBnytV2vJcRvwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SEadxcZFH52D2XEXfqn3UO4VHyDwIzHS7jCK3sQ0s8NbTwxQkFV71aEb1JepuAY3d/pUlhbLTBDCUXx8NtPpUPI0DccZQ9j+VwldyA5cYE7KYYdsd21SyIsd4nwrN1skja1MOKlZMGFZmpt+yrmMx1HI/cqXgtowt1z03Vvb3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BeOO101i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BeOO101i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j19z0lwtHbM624baP4fRU9+KrIrspaRG92RuhXMc604=;
	b=BeOO101iXkvN9BRxwuL7yPNfbi831LRICWsQggM9p4sDaQXDWNNslmWx8Zh86Uh1j7hqSV
	7x/z7i6OpT/2g6Fzv0QopIMXRg/WdbuhyKnSMe8J7/qFOjF+SQxv8VAIY8MBDx9XDg9EER
	Tat88bj9rNVpIlH38wh6LxvicVjOgiQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-R5eTwx_MNKCxFe4SifAJhA-1; Wed,
 02 Apr 2025 12:27:08 -0400
X-MC-Unique: R5eTwx_MNKCxFe4SifAJhA-1
X-Mimecast-MFC-AGG-ID: R5eTwx_MNKCxFe4SifAJhA_1743611224
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C48C1955BC1;
	Wed,  2 Apr 2025 16:27:04 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6DAF2192C7C6;
	Wed,  2 Apr 2025 16:27:00 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:59 -0400
Subject: [PATCH 21/30] panel/newvision-nv3051d: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-21-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1350;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=9YW9rJHLIGdRGLO4GFRhV8IbkrEU3vBnytV2vJcRvwc=;
 b=/7SG9D90J9C8RfkGeq9/2mxMEkRV5cXebMrOoT0sD5WKISiQ4Hy996ipS/r5XGa5J6h0/Ip1E
 tmQWR0RRJ/ZBhtqtek7Teg/jx2MTCpsFzsjZsGmcMlGgsuoghp+GkUl
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 5d115ecd5dd44c8e5e7d1fb8afe573324e987f59..083e314310c5ea15268a32c7011a9191e30cc16c 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -361,9 +361,11 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 	struct panel_nv3051d *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct panel_nv3051d, panel,
+				   &panel_nv3051d_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->dev = dev;
 
@@ -391,9 +393,6 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = ctx->panel_info->mode_flags;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

