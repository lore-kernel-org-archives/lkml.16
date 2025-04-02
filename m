Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983C1C8605
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611194; cv=none; b=Lo3hMb2Q1tx95nijsYUg51f1ipkTpDKr8GV6d3lw5E97SXXAC6WG8x6J+taUu4H1NVguxD7OLFH7nysTuPj1FN862wAn23Rom7vDvdivuKSkx2n517vaijUg0B7TqEGR6KtXf/genmwVC4vG9J6w3XtOG6noRo4Xwa+lxhDjgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611194; c=relaxed/simple;
	bh=yuWW0Q0YBFIEbQSgj1FeCraiDLT2hSb2Iu0fLuf7uAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bIUmrjAGQyp4q0F1s+rNuLeSpd7uE8kFDhcr7NnHXXgFtX6b2dDTg5VchbOSThw6uvlVJV1Ve7jN5giEsvl0ntqaVm7WzWhjBYp6q2BMC4CbplnRJOIpduDHTTrVa+Q7SfcEOpgrxSclx9eDxX+VvQGQ2ymsAg/LRoTFvmL5RwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CR4J5TTD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CR4J5TTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZa/fH42jj3tgaR5qpbl8nKcJkKxRA3VALVpWq6pgso=;
	b=CR4J5TTDO9pwdDAVyZ4KEZpnwpT6qPol56/ebmTmcrMzyolivBoVeutg7ldC1HgCRGfYTq
	Lz90UBohKrRtQt7KlniBsJRWjWrLOqMrUqpSqn4NyN6+2JB3ltyFPngn7eWMg75CV6e1u2
	/wF4nBoajJ5C70OJmHtA1jdHlR0StW0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-Q2F6QY3yNGCFrZYsiwAm2Q-1; Wed,
 02 Apr 2025 12:26:28 -0400
X-MC-Unique: Q2F6QY3yNGCFrZYsiwAm2Q-1
X-Mimecast-MFC-AGG-ID: Q2F6QY3yNGCFrZYsiwAm2Q_1743611185
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FC0B1956053;
	Wed,  2 Apr 2025 16:26:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44BAF195609D;
	Wed,  2 Apr 2025 16:26:21 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:50 -0400
Subject: [PATCH 12/30] panel/innolux-p079zca: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-12-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1331;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yuWW0Q0YBFIEbQSgj1FeCraiDLT2hSb2Iu0fLuf7uAU=;
 b=duAjSqCZaS5bkGdMGQo6zAJtCZ+AXgjNCLByOBoBPKuBKqSCGfOOomVKIszIeLou7bfHpEpeK
 Hhx4uyJqHBJBgu+D68qmStP0Sk/dFBGjCvbZyDXP9sPiMUbdwNaT6n0
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index d95c0d4f3e3534d70901864fa9ed0fff8f37d236..80afeeab9475fa13ddadb44cd03a1519d448e24e 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -382,9 +382,11 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 	struct device *dev = &dsi->dev;
 	int err, i;
 
-	innolux = devm_kzalloc(dev, sizeof(*innolux), GFP_KERNEL);
-	if (!innolux)
-		return -ENOMEM;
+	innolux = devm_drm_panel_alloc(dev, struct innolux_panel, base,
+				       &innolux_panel_funcs,
+				       DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(innolux))
+		return PTR_ERR(innolux);
 
 	innolux->desc = desc;
 
@@ -410,9 +412,6 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 		innolux->enable_gpio = NULL;
 	}
 
-	drm_panel_init(&innolux->base, dev, &innolux_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&innolux->base);
 	if (err)
 		return err;

-- 
2.48.1

