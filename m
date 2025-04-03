Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292D51A9B39
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715393; cv=none; b=uT1O1eenbhggG94TScGk1BM7m+95DHgb3eh4B1HXYOOjm8WAmc+IhfaFT3Ecq6Jb8jyoB5AiO/jyIU2HnFi27yrJwCVATIuCqBqjFvgqPOndQ6YUzj/cjZ2cSft4wsSlYU/Eg/OZEjGV8VKmVBSBq6DTsvNhnVaQAaIba9OjHKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715393; c=relaxed/simple;
	bh=yB650qVybRUbDBCcXOTun5zCbXQapMEt7UxTXMqNU3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StAiO2TZdHC59SA3aa+Azstrxb8dTSwVG77QP0tpUapGzs8W87eWRhfYJE63+r6lwcvNlMLUR/Qb8gdmMQPt8X4JXcIIR0dAxmrGeQWk2fEFtV8dzTWMfLTRgJ/jRs+cX/BM5S2fS0+gXjbbAsxiU2JfgA6w6LuBNEfBOdD5cJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFAzXoVP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFAzXoVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnsTwYfjTxIYtNj29ybDbD71e1icKJPAdnZ+ugHZBD4=;
	b=CFAzXoVPUJcdLzTuxfdJqdOlMbg42ng9XTGJBaHbFsZV5Bw6TDlpzbjS11Vg77TUfaaCCT
	+E6eQBWh8Tuqxz9d5Oi4LNHD10fVWr3UlhqjTLPWnwKY3BLxSLzRMvz8FNvSs2L8aeeEaS
	6t3RjvXk8yXLVvDv598XAjhOxblcS6Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-Cp-KS90wNQ-4kyU84SIrBA-1; Thu,
 03 Apr 2025 17:23:07 -0400
X-MC-Unique: Cp-KS90wNQ-4kyU84SIrBA-1
X-Mimecast-MFC-AGG-ID: Cp-KS90wNQ-4kyU84SIrBA_1743715384
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2FA6E180AB16;
	Thu,  3 Apr 2025 21:23:04 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE5091828A9F;
	Thu,  3 Apr 2025 21:22:59 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:41 -0400
Subject: [PATCH 10/46] panel/samsung-atna33xc20: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-10-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1402;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yB650qVybRUbDBCcXOTun5zCbXQapMEt7UxTXMqNU3A=;
 b=SwKR2KGFI0YKnAfdFM6K01DUNonkl+IjznRCAj9jRVmSktGHd0vMpztefu3pxWoi7cAPfmesG
 7x1/IgYQCjkDgxiWMxFhfoVcXorTHkmiINSo4DKgkBH/D3ySHCpW08t
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 9a482a744b8c15fe1592a09c2bfe17a2bb05b5ac..20ec27d2d6c255be2c33f65d3ff25a41045a9d07 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -266,9 +266,12 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 	struct device *dev = &aux_ep->dev;
 	int ret;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct atana33xc20_panel, base,
+				     &atana33xc20_funcs,
+				     DRM_MODE_CONNECTOR_eDP);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
+
 	dev_set_drvdata(dev, panel);
 
 	panel->aux = aux_ep->aux;
@@ -301,8 +304,6 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 	if (ret)
 		return ret;
 
-	drm_panel_init(&panel->base, dev, &atana33xc20_funcs, DRM_MODE_CONNECTOR_eDP);
-
 	pm_runtime_get_sync(dev);
 	ret = drm_panel_dp_aux_backlight(&panel->base, aux_ep->aux);
 	pm_runtime_mark_last_busy(dev);

-- 
2.48.1

