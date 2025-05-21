Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FE2356C1
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747800681; cv=none; b=pr0KYv/AeBuW0mGaBr1lQFd4zzv2Fi5SJAhqGOnucSZPiQujxWboEkAQ4gzcoYwoE4WeHBluYfxDV+uHiLmZo7NTsx+Q1sk1wzaxpPDQmslIJkNZGkrUQWY9Ae2YhxgN3anPYDs1vh/0C5A7ccfu529eJAVpuYrXZIRe0HzuN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747800681; c=relaxed/simple;
	bh=bv90db8/RVm5DM/C3CG+ULoPG/MUGrswQ8KX+pAivJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQ/sq9Cq8zUPD270sWXJa2eSA+NnwSPNMgZEpP9sKAHAO4Y5rFA5wPxzkN0be37UCiLVfDZusFgPdrguiEREY4dOlefJtQ+Tg3j6Ot8SaUMM5iALdT3KTx+bzJFSFzc9Q9ZEr5K5GPiVrDKX44I8jhUIIbgqcGZiTmSQNdCqqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVAWbdPQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVAWbdPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747800678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwGGSo82AVPBU1tEVLRcw/iDREw+yXDXdM3iOFYfLk8=;
	b=TVAWbdPQ3sASwdmHa6Q9wSTWjaqaEEeFPj67pXXWBIjQbA9PYPI7LZ1vGi94zk+hgkBdGJ
	+aLFsn+fSBw+eUNaFoKWw4Bop8zb61vzk+MJo4AkxdLsgDCEef70sjBNJZSVyOpdYwghKw
	hI9s2P9hnxeS4EaaKXhuJWXvacE7oYA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-fK98ykTiOBSQ43OPnL9ITw-1; Wed,
 21 May 2025 00:11:15 -0400
X-MC-Unique: fK98ykTiOBSQ43OPnL9ITw-1
X-Mimecast-MFC-AGG-ID: fK98ykTiOBSQ43OPnL9ITw_1747800672
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D3961800984;
	Wed, 21 May 2025 04:11:12 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4DF241956095;
	Wed, 21 May 2025 04:11:07 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:53 -0500
Subject: [PATCH v3 22/30] panel/newvision-nv3052c: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-22-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1396;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=bv90db8/RVm5DM/C3CG+ULoPG/MUGrswQ8KX+pAivJQ=;
 b=dt4ONZAqwW3nscxvILWy9ci3WLxu9A7Gqg/a4CoiCp4SIUmtH8zdPSOlVA+Y5gA9YyZq94WUO
 vCsyup13EynBILKSVuiDLGE0PqMhLFZ/0A6FQ4wkW+D5aQ4d6DZQ6mK
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: fix alignment (Neil)
v2: none.
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 06e16a7c14a756b9a399347b29b410fd5f4ae273..0db9cadd868e56fba80eb234d0b2572e51ae4171 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -777,9 +777,10 @@ static int nv3052c_probe(struct spi_device *spi)
 	struct nv3052c *priv;
 	int err;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_panel_alloc(dev, struct nv3052c, panel, &nv3052c_funcs,
+				    DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	priv->dev = dev;
 
@@ -803,9 +804,6 @@ static int nv3052c_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, priv);
 
-	drm_panel_init(&priv->panel, dev, &nv3052c_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&priv->panel);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to attach backlight\n");

-- 
2.48.1

