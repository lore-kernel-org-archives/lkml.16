Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0620F063
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527148; cv=none; b=PifVKdJGGesR7kP4pbXTczAqdZwuHRMUM9Fp+MKYOh2DoWujjvfyAvVE7VUj3zHmuAgJnLhaMuEoNlZfxCB4ESj4g6/HKVSzJwEPtmkcRtYvp/ioBBgbj7MH5+qoLOzazoR14a8If8zuZ9Pfx9BR2YKX7atg4anqufTnDaqVxwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527148; c=relaxed/simple;
	bh=rzO1AuFXRSgcgeIKDm0iaxEhQBnNbaUXv9QevkGsp74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxI2TN9ulLG45G6naZo2HCgnvtljWogmLz7Pb9s99IFNDcqe8/cLw/n13YLS0OO36FHKEu544CwGUlHvjKLcxBsqS9m+3OQDtp9gIQE/Hr9CZhj/pB3+idPZYd3zKa43gy6J1exzfT1XUZZQGBIuqRvjsqkrjkOjfTPoD0xzUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ftTz1Z2L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ftTz1Z2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743527146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHX+3yqeMKPpAXIntW1GU/ef/CqzXQ3nBZkiDoHj/KE=;
	b=ftTz1Z2L3YHApn/KNe/Wi4N8CRw1JfnhwxoAvyRlBWtkY0eg60zAMnga1gs8iOyn92l7gr
	mSVNwMYxecjVoutS0XKqrGs4mm42sZsQycLGdobgBRlfoNpV5xlLAOVQ7R/nlFs43F2izc
	lYJw4bJtCuJ07yqkmW66mQDHLcaOsnA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-Ru7ijFl-NfShNc40GJyc3w-1; Tue,
 01 Apr 2025 13:05:44 -0400
X-MC-Unique: Ru7ijFl-NfShNc40GJyc3w-1
X-Mimecast-MFC-AGG-ID: Ru7ijFl-NfShNc40GJyc3w_1743527142
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BD1F19560B3;
	Tue,  1 Apr 2025 17:05:42 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9504A180B492;
	Tue,  1 Apr 2025 17:05:39 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:52 -0400
Subject: [PATCH 09/10] panel/ebbg-ft8719: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-9-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1466;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rzO1AuFXRSgcgeIKDm0iaxEhQBnNbaUXv9QevkGsp74=;
 b=+yVl0L5Bu/w954rRUCyMNxFEuYQRqblrb4Jcg39V0IBmT84DDkS0zrsUXJN8ftHcNAtRHYX9W
 hb4MEPjo5nQCEC5mHKxhsLt6rA2IhMKTTud4gk+E7ygx1EIJOJxyVJH
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index 0bfed0ec0bbcef79c767db05846a3e3da56e82ad..fb9f9f42be4f26e75d4481742d8d1c81ea7095d1 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -163,9 +163,11 @@ static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
 	struct ebbg_ft8719 *ctx;
 	int i, ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ebbg_ft8719, panel,
+				   &ebbg_ft8719_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
 		ctx->supplies[i].supply = regulator_names[i];
@@ -196,9 +198,6 @@ static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &ebbg_ft8719_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");

-- 
2.48.1

