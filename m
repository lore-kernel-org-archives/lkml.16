Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C21F583B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715438; cv=none; b=oLeeI35aDPzMFUkMSRIOatyRqq7Rt4AkHq3uRN0GwUmxhWhV0rIaYEpco7Ey6YIoHGbF7ApS3PIUgMbwiluSYIp9chi+5fiCtLyskYmQKQbGWNi2UdhKJs5myAlWe0LHbyOLwCFTjv7R1i9bz9SaP/nglKUfmpX+HLjvw6UbD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715438; c=relaxed/simple;
	bh=Mrfk2YBKZB1h1+kvdDk8x0HHmbk0tFFmEhmUP0eE5T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DI0QBGvfUbd5dz4uSnFDznHIq8/VnZU9Ngvy6YH2Ni8ClAzLBz+gXubKN9hazLPg0QRmr5VDuaEOnN9WVtNAI6MoOrgSE3YcOvwD83RAIYETsxtdNIIRKiosxRqOV9N0nqjnmoCFWL/D3LLO4nZTNWZalNzfbPY8WMCMJBrjTnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XuQUUoIP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XuQUUoIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrAdS5sXMrIkXPK3uditfiNpusofwp09hYwA5TLmB+s=;
	b=XuQUUoIP0gASK+etfOmNdBWke6/ojogPw4Ie7bCqOEjov3OiRDO+M8xf/4/byhT3LErwco
	ScObfagbwHmnJ95VvbS6E0sHx9mjQ2f/0jfNGb8G1jTAXTSF9fKOqO/HVN2uz1hT/cc/RW
	j/IX5h74Uxj8NcG7clqleHfAXLmcHa8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-E2yzZx60M86PqGAO68BpVA-1; Thu,
 03 Apr 2025 17:23:49 -0400
X-MC-Unique: E2yzZx60M86PqGAO68BpVA-1
X-Mimecast-MFC-AGG-ID: E2yzZx60M86PqGAO68BpVA_1743715426
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1DEC21955BC9;
	Thu,  3 Apr 2025 21:23:46 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CE2C31828AB9;
	Thu,  3 Apr 2025 21:23:41 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:50 -0400
Subject: [PATCH 19/46] panel/samsung-s6e63j0x03: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-19-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1400;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Mrfk2YBKZB1h1+kvdDk8x0HHmbk0tFFmEhmUP0eE5T0=;
 b=K/iL3ok6L1NKTuC2RMWfHeGACIFrtCh7tHQ7bWIfiVC5w7p2C0rmJ+mlqdEGJ7EfnO1EwD32i
 abjGUw40nV9C42FET9PJxvmI8TPC/7NSQctD/NNQWzDHSvhQINNzsXo
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index 364f1c9a16d9abd410dfc233f40ce797c37da3e7..6f3d39556f92294a693b6a8d85f80f25fdb43c65 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -437,9 +437,11 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 	struct s6e63j0x03 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(struct s6e63j0x03), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6e63j0x03, panel,
+				   &s6e63j0x03_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -462,8 +464,6 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
 				     "cannot get reset-gpio\n");
 
-	drm_panel_init(&ctx->panel, dev, &s6e63j0x03_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->bl_dev = backlight_device_register("s6e63j0x03", dev, ctx,

-- 
2.48.1

