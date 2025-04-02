Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6F19885F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611215; cv=none; b=DKdgq4k2z7QZuu7yAxd53e+Ar5JmkmaizqBJLVwWiT1HqYGHgj7ZLCTcdVW+lKIMMWE2xgZ5Hbejg8OHzgURDI5ij7AQ2xXg1jgAaX/w5QrNkioY3HAItJRIcHWeLKavSAlhGGRpf/k80iUaTWQkMf5DPB/TVwIgkmoibKg7vK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611215; c=relaxed/simple;
	bh=op4q2pliKJa3cUfNAwn53eqZVcDkeIvRaZBUXhBrYHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jf8G1UxnuayzuTsb2wmDzga8RNd5AeE+dxs9WMWwrQk81GCN/4ssboGEtY+PeqITJ+9nOOQJWTSe34L+eaxysmfFuR52DVyLAbEt2QGHfaCUELKmakYrrKL4K+mqXCY2nbcdDnnm4FxTk5rAP9ce539B8r+xSU4xJtMkimsqV10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T1pSPzEW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T1pSPzEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAXPb/RTY7H6dz1SuwGg5qQ6DgcS9natTkvCebzHKYY=;
	b=T1pSPzEWz+2GooNk4hJIcQD2sR3k0vaSNDUZ9hA7eiLJOhlkLB/WjgdPyKl/7Tm5yN2DwG
	F/iBUBuG27OXKD6LQStZ+CmxgpdJJNAQ6xdBvdV6XPDolr/ohI4o2B5OQlAydPfbsK13EM
	0IxLx+1SKWHiSjhUUEFhW7UJm+s7jXs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-GTIrtU3ZNCCBuTcY0dRgFA-1; Wed,
 02 Apr 2025 12:26:49 -0400
X-MC-Unique: GTIrtU3ZNCCBuTcY0dRgFA-1
X-Mimecast-MFC-AGG-ID: GTIrtU3ZNCCBuTcY0dRgFA_1743611207
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53B831955DCE;
	Wed,  2 Apr 2025 16:26:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 47342195609D;
	Wed,  2 Apr 2025 16:26:43 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:55 -0400
Subject: [PATCH 17/30] panel/lg-lg4573: Use refcounted allocation in place
 of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-17-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1184;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=op4q2pliKJa3cUfNAwn53eqZVcDkeIvRaZBUXhBrYHI=;
 b=RQX2h557vuYo/KBqgiUELMTQY0tzHUof/jGHS2SAHB7ucO7L3M0/pkl+/O+T5H7wqYhOG/GU7
 C03Bp0hrR5HBsgn9UOeidIFT1TQPuHZ9dFhg4U3d70kG1xNgXjmiEOl
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-lg-lg4573.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
index cf246d15b7b628a0b3821bfb2697842b6e484319..dec619902c15f8fbfdd138ef3bd2aa7cae921375 100644
--- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
+++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
@@ -243,9 +243,11 @@ static int lg4573_probe(struct spi_device *spi)
 	struct lg4573 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&spi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&spi->dev, struct lg4573, panel,
+				   &lg4573_drm_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->spi = spi;
 
@@ -258,9 +260,6 @@ static int lg4573_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	drm_panel_init(&ctx->panel, &spi->dev, &lg4573_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&ctx->panel);
 
 	return 0;

-- 
2.48.1

