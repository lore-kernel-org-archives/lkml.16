Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B7E1A0BD0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573451; cv=none; b=BATZAzVucjDNMnzCo/qg26h3n7FeqqcYS7HioBZJspNnULkrpXWO+cuUlmaEfdOjBomv0IYinGbkN95HqnZQGoVErgP03/7umnD6uKLNQjUVqPe5B/4OEWLwrZWh8gF1aM0E5OAosoFlkfSyxFCfybwUTT1pDR8m5hjVN4X36ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573451; c=relaxed/simple;
	bh=/iid4grjA19GuegSW29dRxy6DNzeARyRJhGLEeL1ysI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SG2Kl/udlYGC5TpIpIveCmDlT+nNdao6LIWIXCybabe3lhuM0iI1w4HIy/FrNgZR4FITZ05NCS+e6Z79HVngO2eAKguthDWOu+AEweQTnPx1soWR7t29EPJuqerA3Kn6W2sT5xIM+hJEM50cf9SJt/6FO/7MKQrInykbQ6/K0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MbcPIT+S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbcPIT+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2ylAT6GAiVv7GPPMNj85vtdJ3zDhg8w7xsG23OKju8=;
	b=MbcPIT+S1tA8IU9beSUXLn8xIv9FkS8zW1gGlMs4MLHaRgOt5nVYs3NqLa+5hHSO72bovN
	sMf6CbcNrTYUYxksI/VAzJIOTEgeYqJhSVNzleax324xmyRO9HJ6r6RFnNCGhvgafNU7Jq
	evZHv4wpI9bU7D48eqMc2qNKhBhzHT4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-iUsV0bPjPhmYwho71cmC7g-1; Thu,
 29 May 2025 22:50:45 -0400
X-MC-Unique: iUsV0bPjPhmYwho71cmC7g-1
X-Mimecast-MFC-AGG-ID: iUsV0bPjPhmYwho71cmC7g_1748573442
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DB6E1955D84;
	Fri, 30 May 2025 02:50:42 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F1041955D82;
	Fri, 30 May 2025 02:50:37 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:12 -0500
Subject: [PATCH v2 10/46] panel/samsung-atna33xc20: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-10-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1475;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=/iid4grjA19GuegSW29dRxy6DNzeARyRJhGLEeL1ysI=;
 b=TuY67b6vkxpXdnUgin7ipSMbckbr7BDNRZGLpaxJ5vvgcwFcN9KEXgc58b/OnBfeRgrLNXBOl
 tnK+HgBwQjBDemTb30j0YXuyYBkEyf7rWbnBYLvZpo57Ge6htXkizg0
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

