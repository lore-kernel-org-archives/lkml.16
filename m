Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BC085931
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715462; cv=none; b=teWLZDAV9REOixcTTRTc83U6dzNx1pbu62btWRcefoZp4hKCcLsRUTdz1YF4Cr1TlpLwOw+Or+OxRQQ6y37GT70H3jrhrTpxhYZfYNi7rQdHFL0VGJ9/Y9bWt+lEOVqLt8GGmQSYB/7EO5zd38cdK8zUlAsz+hGAsptmQVkdrzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715462; c=relaxed/simple;
	bh=381SAmUCMGP/e44pYK1p67kkAoY8n9w1skfEbaR48sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=diR9tgw0OR7Nh7Cge704rS9+D0rQPs4tA6g1HFxrpYUiW9GhzddGsSAzd7uAuLeFZUfqSv8rVDY1DRDSOpSQEG29rAeoXcbfmIwCXh+fZliDtATqv4IuDn0kiqyX8Hz2wgIL7kjpaHCW5ULRkwIsTgu2OMm1aqzV+/XXfnXRHmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3iMTcSw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3iMTcSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ys5fKKa4vLR/6wnlA8cUdN63HvSH0HqdUHhfDWc+9Is=;
	b=D3iMTcSwgMg4+ifMDEkv6Kkt0AdrfkeCU19ZHmWFfzUhUsOireD9uWqZBLeMMnv+o3DDXc
	YjCm4lOp4JKTPWx2/uAUFmgBOqLM1P1cSM2e51PQvnIArhbl7oRr2GV3ORl+s47VM7+JhQ
	pKQTyO9hXA2omybTtKPFSqQoPqNTeqI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-BN-QmjsYPe-BmuKLiNuHow-1; Thu,
 03 Apr 2025 17:24:12 -0400
X-MC-Unique: BN-QmjsYPe-BmuKLiNuHow-1
X-Mimecast-MFC-AGG-ID: BN-QmjsYPe-BmuKLiNuHow_1743715448
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3E151954B23;
	Thu,  3 Apr 2025 21:24:07 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 33FD7180A803;
	Thu,  3 Apr 2025 21:24:00 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:54 -0400
Subject: [PATCH 23/46] panel/seiko-43wvf1g: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-23-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1328;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=381SAmUCMGP/e44pYK1p67kkAoY8n9w1skfEbaR48sg=;
 b=Z/jHjL+AS6Ip2j/gaskM/uGSAPo4yHG7RC8XVJ5CaiSEG7AJjTIkg7jd2mfbNjdDKMlDYNcEw
 sQft2mD5gQQCyUoA4orMLRqDjuZXVMZ0FafUWsolUNezJRbVt93GcyB
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 7d1b421ea9ddfcf84850a2fc589f7a43e24fc167..fba63607adad390ad34442d2d754a95e42833a5f 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -204,9 +204,11 @@ static int seiko_panel_probe(struct device *dev,
 	struct seiko_panel *panel;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct seiko_panel, base,
+				     &seiko_panel_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	panel->desc = desc;
 
@@ -224,9 +226,6 @@ static int seiko_panel_probe(struct device *dev,
 		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
 				     "failed to request GPIO\n");
 
-	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
 		return err;

-- 
2.48.1

