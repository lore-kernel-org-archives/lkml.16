Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139CB1B6CFE
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573491; cv=none; b=SDwYz8UjBTZfpIotyvMktGl0sPscTMd7eHGEUun6lotrBUy5x55HBH1NS0Ij2VKsDbH3mzT5K4qfT/s8FsA+e91bGxnVa3Lc5TsdKZhNvF/dN/xNkvbEw2gucpOduCMo74VnN4HXNRXjzHIpNQK7f7m03RV+iB+9itqkkAeVMw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573491; c=relaxed/simple;
	bh=zSUmP0EeTP6drEI+TGeK4IAvxvieQdNFYzqm/hNUajM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rz4zygOmYUBo4FWKXOkI/+D+Qlp+9YUk+h6lV0R24tf6QAhq28gBG+bZeg3fUwoWNV2owdC6zAqPRKvrvIs9tS+g8BtvJbTo9OP3HDxNKM8K2D0Fnkba8MUrq3+ISA+EzTIsFtL5cnYa8K8BbK5/BoTBs+WMk9qw3chzFmdvIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fP7C4h1O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fP7C4h1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ryG2f9UZ4wyOi7yrOCuXZBevf7UHSNEYl3mAa3rzkO0=;
	b=fP7C4h1OAXmTV0K1qwmbZxQJxdXUWDYsw/HKiP9afqTN0mgdlisr+EsYGDPok+tz/nkEXJ
	spmgOlDKdkGpGoRoWrwGCaL8jpSsgcoy8Lk4buytMMS89v7qxQh0alPIGhQ1zL3VFHLBYm
	BIGn8/8bt1+/TrDPj2u1C8xvs0BBcx0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-341-UnUNFwO9NNCVGptQowsclQ-1; Thu,
 29 May 2025 22:51:21 -0400
X-MC-Unique: UnUNFwO9NNCVGptQowsclQ-1
X-Mimecast-MFC-AGG-ID: UnUNFwO9NNCVGptQowsclQ_1748573475
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D67D1800373;
	Fri, 30 May 2025 02:51:15 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F30291955D82;
	Fri, 30 May 2025 02:51:10 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:19 -0500
Subject: [PATCH v2 17/46] panel/samsung-s6e3ha2: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-17-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1418;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=zSUmP0EeTP6drEI+TGeK4IAvxvieQdNFYzqm/hNUajM=;
 b=/GnuNOyjU35SKj7tlrJBRLdZ6nHyW/8FqZLxsBHN8ulSDei0hiyI8mOdsF8PE8dyRWzxtHIJ/
 oQTaEeferMbDmtGj3UuZYo5nx+TZUOsNV4nFu+r6zyn5PscB5UvNFh5
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
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index ab8b58545284030714c0d5520f20ba69ed9cf601..1db0c63b1131ee614ddf0bb9abe00e2b89756b4c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -681,9 +681,11 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 	struct s6e3ha2 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6e3ha2, panel,
+				   &s6e3ha2_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -731,8 +733,6 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 	ctx->bl_dev->props.brightness = S6E3HA2_DEFAULT_BRIGHTNESS;
 	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 
-	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);

-- 
2.48.1

