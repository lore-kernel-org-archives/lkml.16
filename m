Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B51E1DE3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573543; cv=none; b=ASy/Lxz2cZUb9vBS6qbQs/q+YdF31ceokaKug/KrrzeoRld6rlriVZsMpLkqiPN6x70ez6R4s+1cxJI5eUQ2zoByL/XZ5WJ3BDy+i27BHEEmsZuWVHAj6tGkWnNirQG1OrGiyyd5rzpt0Y5jJdYzFka2ATbZyoM1/1xMWa0lJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573543; c=relaxed/simple;
	bh=UXpkTYfcHbFEnJIoLnxpIw1Sq4P4b815CAiwGmfXpzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYBRxusYbM/6HGj3M4fCFKGXXOlHZ6Nl62v1uqrBn2a+jVYijqRNdCQDf/IGLkDV5jOom7Rg6HFBmEO352FJVwRX23q22TmPd35bnOJx+DNy/KF8FjHyc4b7C9Q+ukAM4706kcGO2WhRr86yI1p8v+Dk9iebZi/ZhYdnZlsmYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E7YSbS3C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E7YSbS3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtg8apOmyEaQEbzm8uthuX8EFi1ivGKWiwICjrZb5Kk=;
	b=E7YSbS3C0NafSmAiWiS+hsRIjLlTCMbiMJFypeW7ZHAue3siQKLRsH839Mh4YB82IUzajj
	ratjAqw6Um+OYycjR0RTaeW80SN4nCsvukBABDOtzO+uXelwo3XfN4MZtQg2LLO9mQ+xF/
	JukPTmlr5fiAL43TRqxLOBQHCyqWo4Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-p7PR54WyMJ-cTemrTqt-Yw-1; Thu,
 29 May 2025 22:52:17 -0400
X-MC-Unique: p7PR54WyMJ-cTemrTqt-Yw-1
X-Mimecast-MFC-AGG-ID: p7PR54WyMJ-cTemrTqt-Yw_1748573532
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C9FAB180048E;
	Fri, 30 May 2025 02:52:12 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D94A1955D82;
	Fri, 30 May 2025 02:52:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:31 -0500
Subject: [PATCH v2 29/46] panel/sony-acx565akm: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-29-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1335;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=UXpkTYfcHbFEnJIoLnxpIw1Sq4P4b815CAiwGmfXpzY=;
 b=i6zIcHLqb80WcuK8gLFq6DH1KOxDeOE/tGsUUPJ7vBV7lonOXv4poodABlMJJZUnF9opGeJre
 Ml6tgi8HieFAhUPLtvujbH0BhJstV+Vbp56xhq+aaWLLIwMB7ce8yPU
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
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index d437f5c84f5f0915ec9a3b3a899cb8bd41209c77..fe043de791b0f5ee725a14210436cc00ce7789e7 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -607,9 +607,10 @@ static int acx565akm_probe(struct spi_device *spi)
 	struct acx565akm_panel *lcd;
 	int ret;
 
-	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&spi->dev, struct acx565akm_panel, panel,
+				   &acx565akm_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	spi_set_drvdata(spi, lcd);
 	spi->mode = SPI_MODE_3;
@@ -635,9 +636,6 @@ static int acx565akm_probe(struct spi_device *spi)
 			return ret;
 	}
 
-	drm_panel_init(&lcd->panel, &lcd->spi->dev, &acx565akm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&lcd->panel);
 
 	return 0;

-- 
2.48.1

