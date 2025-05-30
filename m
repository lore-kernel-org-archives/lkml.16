Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60263222598
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573630; cv=none; b=UryqD4ii2vdiMI/ECOwS3bT1mElhUhiwlNOHFROZMngugtABPVv+JaugsHeHfeSQ5JigHwH0zFXYNb+kYXsWB2DnrntlkzjQJKp4e0nYJme4Qx4f+SQg619JUYVXQVRqzNGoVjtXfn8zhxcEY+jfB49aLNrcuv5SIa0JrwEN1GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573630; c=relaxed/simple;
	bh=lTa8l7WZQTMiblBw7yPT36vbZMIzDXs1DtpgEZbE4yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPDezUD4Y7AHe6VLBIAQRWnutxdmyNlT4tW8+GCRer/CvI6IjVq1FA3O3kIyGFRSZnvEyLCLtgc5QUbl6IpOe4gUmAc1bItrSFiGy4yFN/CaRs89rCJmNuG5Tla6iA1yyHGruNHrbaBQOmJ2WnMkIEhkkRbSpibdJ6K4rGQNR4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mg3haPPh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mg3haPPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwF9k3g9s/hWUnMixSiMyGkJEv2QFUvHkK1VFCOrZxs=;
	b=Mg3haPPhXDXx1BrCDUWC/5lNW7uXiUatHD2lcbbS4h5fDtbVIxrg6SB+vQpiQ1x33jdjtR
	1rq0sK30M+FFlNOV1s/qJwXNodpvvi1nXlqb2LwYKa4g+27gIpF2vBLr1xZ6IdLTTJ24Dd
	OPeO2XUyFNC2TVyIOCQqWZDYz3EdZcw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-197-jzCMg7XaPea0dslpVGX_OA-1; Thu,
 29 May 2025 22:53:46 -0400
X-MC-Unique: jzCMg7XaPea0dslpVGX_OA-1
X-Mimecast-MFC-AGG-ID: jzCMg7XaPea0dslpVGX_OA_1748573624
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 005ED195608E;
	Fri, 30 May 2025 02:53:44 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A36251955D82;
	Fri, 30 May 2025 02:53:39 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:46 -0500
Subject: [PATCH v2 44/46] panel/nec-nl8048hl11: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-44-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1319;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=lTa8l7WZQTMiblBw7yPT36vbZMIzDXs1DtpgEZbE4yk=;
 b=QqfPcYT/pXHSZJ1QFMsiMuf4puDA1cgCHj0pAgT2zZ7SLMMFte1EjMnpVehZAur3WSwI74V7B
 JVGmMMLzdTuDfsGV7m7twQwVUM3ohPk/9g926m+5x5pIdCjNx2QN0jI
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
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
index 81c5c541a351cca1535e40ed722d5cb4c33d6708..d5c7210de4afe9101239173f506065f158cf673f 100644
--- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
+++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
@@ -178,9 +178,10 @@ static int nl8048_probe(struct spi_device *spi)
 	struct nl8048_panel *lcd;
 	int ret;
 
-	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&spi->dev, struct nl8048_panel, panel,
+				   &nl8048_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	spi_set_drvdata(spi, lcd);
 	lcd->spi = spi;
@@ -204,9 +205,6 @@ static int nl8048_probe(struct spi_device *spi)
 	if (ret < 0)
 		return ret;
 
-	drm_panel_init(&lcd->panel, &lcd->spi->dev, &nl8048_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&lcd->panel);
 
 	return 0;

-- 
2.48.1

