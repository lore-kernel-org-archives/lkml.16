Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806C23371E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800727; cv=none; b=ZOveIVIL2R8Hs+/14yjQU7hS42EEdK0fETqbVlwcw3s2p05XvwnVTvs/2yIgz3C1sMe3TvdgdIyZRaBhquRVMQ0pqCWmoghTZJSSNh7ZSsPBztmzrqn2nUYiQF/mCOY/Ji+LjOAuszTsnyRYqcq8E6Vx3gM6sxOyycn9d6PNKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800727; c=relaxed/simple;
	bh=YglKguKseLAmjUDSxz3gJzxoFiJWmckQrcIdn2CCTi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yau5DWBIdAtFRqA3bE1W9k06ngMWFfRuUAV9MS8BERO/VGAzx+5bvnnEOSvZwljVlmpDYRqnL7iMqg/h8PBDeY/ciPshvru7FQwmGXDfhU+EMsci4dR/ZWBeDr0/pl6xH857vLhbUUPSGW+TTyjiieV9U8/i/Y64mtYmNu8tqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DYsg63mX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DYsg63mX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3olvd6t4uG6myS2TOcIhiZMnHp6QpuWCuOtWsPOLF7Y=;
	b=DYsg63mXid6xVfQJwGksIkM3uwGRV/arRoCZVoQKRm1e53LGSQ1GD8HOm0xaSob7dVQ3IR
	8/gpgQ0BbNtS95CsLKsAbEvUZpxPIGG2+poWNmE8T64ylJJYS1VjuoI8zbbm+0LOv8UafD
	/60WBKEdZn/v4Y4wB4pbNx4a5d96+Dk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-ZCxUu9zHPW2ewFRZlYywIA-1; Wed,
 21 May 2025 00:12:01 -0400
X-MC-Unique: ZCxUu9zHPW2ewFRZlYywIA-1
X-Mimecast-MFC-AGG-ID: ZCxUu9zHPW2ewFRZlYywIA_1747800719
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 884181956089;
	Wed, 21 May 2025 04:11:59 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0BAF6195608F;
	Wed, 21 May 2025 04:11:53 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:04:01 -0500
Subject: [PATCH v3 30/30] panel/orisetech-ota5601a: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-30-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1405;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=YglKguKseLAmjUDSxz3gJzxoFiJWmckQrcIdn2CCTi0=;
 b=TXl0efiKV1FCg0TFsQmSo1V1CuHb066E5cR7QvPmfudIqu3eoQKjrXtxDLZmenPETmwap/Q4s
 EzvThrfyNgpAOPJFULZi8yHnyFiV71NGO41TNBx7M/UQiI6sKexQwNC
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: none.
v2: none.
---
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
index fc87f61d4400d49814953d7f453a7c6e84004f29..3231e84dc66c2bf319f5287fd53bc437e24e0d5b 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -237,9 +237,11 @@ static int ota5601a_probe(struct spi_device *spi)
 	struct ota5601a *panel;
 	int err;
 
-	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct ota5601a, drm_panel,
+				     &ota5601a_funcs,
+				     DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	spi_set_drvdata(spi, panel);
 
@@ -273,9 +275,6 @@ static int ota5601a_probe(struct spi_device *spi)
 		return PTR_ERR(panel->map);
 	}
 
-	drm_panel_init(&panel->drm_panel, dev, &ota5601a_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&panel->drm_panel);
 	if (err) {
 		if (err != -EPROBE_DEFER)

-- 
2.48.1

