Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A81F6699
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715440; cv=none; b=WHWlKbcRsTdExKm4zllMK2bcKuSzmymTwiDaghHwgjdNEQu3amGrN87SRySxJASMF/0/kzMgK3cxpXCSHZxpVR1VTIgqN7G/ACnfyAXeG/g8ScIHdPcf1bJ9bfojqFsFEmFYebtLud8asSCTBhVazI1+nOdk1aRzAayNwZ4XVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715440; c=relaxed/simple;
	bh=LItULYCemN87V2Nrn4QOPS1hsNa/awmAIXkO/DTaNSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Boe63xFTYY/PVNeCA5mssfdCrmMYnrbCq0OrJw7PNw39pB44XzhmZu6xpRXk2AI4pwWAWy2Q4U1xCoRaBUqEplIL9/sCRw1rXvRBrGR3/tc47i8e8Um3M6NH//9GuD61IHTqmr3GZ3rfN3DtBnbPGF5FhPS5IBB+slkGaKDho9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bMeDRj2k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bMeDRj2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1paAkFlcbA/6LYPGkSkmoWoim8KWiPVmPLV3hiWoZHo=;
	b=bMeDRj2kVRgRtDd/cBa2f2SiHgEwKWUDiVdXnE9lE5Ap95ZpbLVu7Ji0Yq3k40U2pGFRX+
	lkq/zcBskx5XuHQvTSDkn6EYY9lt4D2M2FwLtVfpzmnpM1KZ+Vn+LXg+JtDUyFix8/Y6y3
	6flo1LLkp3yHH8MvKHwaqpClsc1ZtNI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-472-pWxTYUjJPg-6FMNTyWAsaw-1; Thu,
 03 Apr 2025 17:23:53 -0400
X-MC-Unique: pWxTYUjJPg-6FMNTyWAsaw-1
X-Mimecast-MFC-AGG-ID: pWxTYUjJPg-6FMNTyWAsaw_1743715430
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7B01180AF4C;
	Thu,  3 Apr 2025 21:23:50 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 682F51828AB9;
	Thu,  3 Apr 2025 21:23:46 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:51 -0400
Subject: [PATCH 20/46] panel/s6e88a0-ams427ap24: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-20-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1597;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=LItULYCemN87V2Nrn4QOPS1hsNa/awmAIXkO/DTaNSQ=;
 b=eKSFqmExq+7dbyFrBHxKvqU0mAt8XTYwkKf4EBqKGd9bqdw5+R5y/v9K0G0qcix19ea7U+JW5
 n1QC2yd0sS/DclFmfg3JZ1IwyFd0XaxFXbg955aYXS7gNd+UkoR8Dsw
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
index e92e95158d1f2a50c1bef77b01103a80210b542f..e91f506629975f2c2cc40d91d79576406ae35ca2 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -687,9 +687,11 @@ static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
 	struct s6e88a0_ams427ap24 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct s6e88a0_ams427ap24, panel,
+				   &s6e88a0_ams427ap24_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = devm_regulator_bulk_get_const(dev,
 				      ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
@@ -711,8 +713,6 @@ static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_NO_HFP;
 
-	drm_panel_init(&ctx->panel, dev, &s6e88a0_ams427ap24_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");

-- 
2.48.1

