Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF27019F436
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611168; cv=none; b=A35jywXk//kiNM+q70saxyC5C6A8AVup0Zqb1BPhki/5xY060bTUmysNpoDnulcTIC5k8tAns1G+DHrKXsMNPBZkuXGzqZeUUua4GOvdHXYpX5ixDjLeAmMsT2WNyErzN0ak/YHEsRVYpJ6NRTVFWbs1MT5Gs4arTDArv4MMe6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611168; c=relaxed/simple;
	bh=ifzGrcMKMj7wX1OyLciEf8ylTTGawzrXiL8rUDJD9wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BcUGcn0OfEBKal5X7nl7UJl2x+5k8+88nfFjVJhULu4VP3UMeHSeqayGMwMH/Ex8i0BLgWX6C42207Nj7wbpRVuwxXyFcRan4/NRCypWGKcX1yZQKBfjaWVy8SEvzDCGJhWq0iycaIQT5bkZ6hoTDun9GVh/JtpKEzoLjdD+6Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dITTDGCq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dITTDGCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5HhELYg0XvErZYc/nFXcIjX10vFyUSg5D9sb32us0Y=;
	b=dITTDGCqOwUKR5yDOexpAKuk8akbL5ZBIr8m4zs2axylQ5PUpUo4Ex+KLbiwhaHYDA9n7m
	lRFyiu4CSo/SGNBddRaCzy3sDeev2UutWUGuJPfR9RVcoGr8K+dz8kW6/OP+/lfS26C0Hl
	P9vYyJxa7TePjatEFLdY4yVAKR+sUY8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-MTgbCFWUPySGF-MAE_zhYw-1; Wed,
 02 Apr 2025 12:26:01 -0400
X-MC-Unique: MTgbCFWUPySGF-MAE_zhYw-1
X-Mimecast-MFC-AGG-ID: MTgbCFWUPySGF-MAE_zhYw_1743611159
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5B6F1800260;
	Wed,  2 Apr 2025 16:25:58 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B117F192C7C3;
	Wed,  2 Apr 2025 16:25:54 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:44 -0400
Subject: [PATCH 06/30] panel/ilitek-ili9322: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-6-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1213;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ifzGrcMKMj7wX1OyLciEf8ylTTGawzrXiL8rUDJD9wQ=;
 b=Y0sNfxjJIlCXDsXB/JE0j1UxSN/DVWRStNCc1qKxtLLu/UzY/c23rIlMuXQuLmeCOS7I5KxZN
 VmU+lEaBaV3C/ZhK5Pfx76wBgBXgcU1UPbYaSHTXIgTlNENYTIiXfbF
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 94b7dfef3b5e280f02f3127e965e418b6d497c7f..6ed544a83bdd5cf1547847eba39e88cdc5b1e914 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -722,9 +722,10 @@ static int ili9322_probe(struct spi_device *spi)
 	int ret;
 	int i;
 
-	ili = devm_kzalloc(dev, sizeof(struct ili9322), GFP_KERNEL);
-	if (!ili)
-		return -ENOMEM;
+	ili = devm_drm_panel_alloc(dev, struct ili9322, panel,
+				   &ili9322_drm_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ili))
+		return PTR_ERR(ili);
 
 	spi_set_drvdata(spi, ili);
 
@@ -883,9 +884,6 @@ static int ili9322_probe(struct spi_device *spi)
 		ili->input = ili->conf->input;
 	}
 
-	drm_panel_init(&ili->panel, dev, &ili9322_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&ili->panel);
 
 	return 0;

-- 
2.48.1

