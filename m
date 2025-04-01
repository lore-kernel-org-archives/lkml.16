Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839F20DD43
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527128; cv=none; b=grwEMAkeybKl+O1hYSFi6kNEy3CNDb8ZIxBK6rG/QlX7eEE2TiihVV9IDSOV21weFVjWxQVkvY5igzjWY3uQ9CPiGq5t5hVq9xno3YDh/Gt+mhdVpBT5utxraBQYgCeub9Q54N1x2BEt0HbS3KeZLwa3A/HMEUgBQOcLvW1PeDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527128; c=relaxed/simple;
	bh=PJNzpQbWhpvbfsws+8F6QKRDZfNtl/jDET3EyN9kcDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDy7ocY0TNr1ehuyrJu3sIHQvOgcgMKNrbT1I/mr6VPaCXWNq4H3fEV6SCBE+/iphrX5INNaZNd/NcH5rFE1gMjjWoSr2XZJzHff6hM11It7XtYGeSYPx3ObWO7iljXeXF3UBLqSwL1pvR7UFgLjU0Ygl/Z21NUqVZF2HOPueGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RchO2kwp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RchO2kwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743527125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8o9YeRPzZsbNRAt6K9WfREncJppzp+NsUIny0gal/A=;
	b=RchO2kwpyXKdMqizd+Dg4A5TRcnGWZSoFgPOLmy3H9p1OB18LgJ1qvov9Qkz1wP3KQWqER
	u41u32CIaN18wwF3BFNuJL9c1083/DnEE9zZUMWfV4H4Q4+njfz8w/Je8TIsKDtCbs37C9
	hV4elZfPxEXwze1VDVCeCwDFKGFGe88=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-DIiK7akaM2SMhZLoS4wbYA-1; Tue,
 01 Apr 2025 13:05:21 -0400
X-MC-Unique: DIiK7akaM2SMhZLoS4wbYA-1
X-Mimecast-MFC-AGG-ID: DIiK7akaM2SMhZLoS4wbYA_1743527119
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BEFFA19560BD;
	Tue,  1 Apr 2025 17:05:18 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B65B180B487;
	Tue,  1 Apr 2025 17:05:15 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:44 -0400
Subject: [PATCH 01/10] panel/abt-y030xx067a: Use the refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-1-cdd7615e1f93@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1341;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=PJNzpQbWhpvbfsws+8F6QKRDZfNtl/jDET3EyN9kcDc=;
 b=jV2ihwwyT3V1NgqkgysNcIvClGIX1I1Ss2UjJYNaudOWnAAoSYU8BDFnjqmapsjWAcZLQjl3H
 pSX7T5ALf52BRPYTyEYs9LpwDA2l7Ymqk/4UtcNhfHEKykfsfQ8TTZJ
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
index 4692c36fe2172694b2d91f6fddf8161a68953a30..87fb0fd29658809eb3b97a23053ae53ba1a4e37e 100644
--- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
+++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
@@ -279,9 +279,10 @@ static int y030xx067a_probe(struct spi_device *spi)
 	struct y030xx067a *priv;
 	int err;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_panel_alloc(dev, struct y030xx067a, panel,
+				    &y030xx067a_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	priv->spi = spi;
 	spi_set_drvdata(spi, priv);
@@ -306,9 +307,6 @@ static int y030xx067a_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset GPIO\n");
 
-	drm_panel_init(&priv->panel, dev, &y030xx067a_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&priv->panel);
 	if (err)
 		return err;

-- 
2.48.1

