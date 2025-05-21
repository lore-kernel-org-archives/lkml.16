Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E8E2309B9
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800716; cv=none; b=q9C9+MGOhnkIzBuitpUhaagldrgJjXiUM/TNceIZq8WvDODBr4/o/HUARgM7YZPBlJa6tFWjXOrcAsJQBEtYNViLr6LE5MBQZRCWboUitbdXnnw2aLiTQqoHDbfiMM+T8MBozft31m2oujo9LqGX/zR97I6PPfIDwPoKyF+tKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800716; c=relaxed/simple;
	bh=tXc2NBmtLRJeMhsgeBMjy4+vvD6qerrEfltupv2/dHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSQP/4oIUUkSkgIsEaApViKWbLnf9wJoECINIx378pqRinxnodxXM/MbRaeNY8RUifsxevKhd8JMp3nUXFzoZKFxXPOcA/Emj8Qc6LeEEtR5lp4l51DDlpOqJXRDExJCPSihljr1QC7m8P3svtOCY17uTOfXBq+YH0PLEd0GeMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OCf9p8dW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OCf9p8dW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+4SaUA7aYhG3HotKx65nLGBfYLgo3MADzRY26tX3kI=;
	b=OCf9p8dWGuVT4S5M1vftPPsTUyCn9/1KtUsluFQO9aiqsVJKqoYodHIivFspHCQxBQzy1M
	iDarZPYorkRNGWMvFaqop8lOIbYRBx5Ou2OBQ9phsqzqaJc7ZVpmR3vuJmMRqik6Vey054
	XRXpc689Pfor/vYy7MB5eD+9WcHwCnA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-LWoqTzSfN764L7hPa_BjyA-1; Wed,
 21 May 2025 00:11:50 -0400
X-MC-Unique: LWoqTzSfN764L7hPa_BjyA-1
X-Mimecast-MFC-AGG-ID: LWoqTzSfN764L7hPa_BjyA_1747800707
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA7AB1956096;
	Wed, 21 May 2025 04:11:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B498195608F;
	Wed, 21 May 2025 04:11:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:59 -0500
Subject: [PATCH v3 28/30] panel/novatek-nt39016: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-28-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1420;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=tXc2NBmtLRJeMhsgeBMjy4+vvD6qerrEfltupv2/dHM=;
 b=OnAWzNOPz6MDPzaTD1DK0McMHD8VVTwA6XCoytdzkLLOTE3qM/E8VDt/yEJXz+n0qEk2O0qYF
 A6aDCLXS+zZCaGmgHcGhAdRiR2ze8OHfjLmCHkyf0ZOUMwbvAd9t/0a
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: fix alignment
v2: none.
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index 9fa7654e2b6755fbc641b6bef3cc450e0e16ba32..a629976bae540182504ff810604c0f18f31ac3dd 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -246,9 +246,10 @@ static int nt39016_probe(struct spi_device *spi)
 	struct nt39016 *panel;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct nt39016, drm_panel, &nt39016_funcs,
+				     DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	spi_set_drvdata(spi, panel);
 
@@ -279,9 +280,6 @@ static int nt39016_probe(struct spi_device *spi)
 		return PTR_ERR(panel->map);
 	}
 
-	drm_panel_init(&panel->drm_panel, dev, &nt39016_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&panel->drm_panel);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to get backlight handle\n");

-- 
2.48.1

