Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D2E251797
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693575; cv=none; b=XdGiM3ozY1LmJDdGBajdNXzRY/JASEd1TEUm88DMOf75v9BnYS4f3dqCgyarE2KgSLLp+6L+oG3jCLTKQOpoDJ/T4k1O04PrBMj6iYRuQ76jxxA9lqHkSBKB7U0CNK7b3L3Oj12/NPUb9f9PhscbNaANiIPW9ujGIw2HLNnOaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693575; c=relaxed/simple;
	bh=rb1W4LrP1E9o8xEwiL8dpEf8JMpZgfZi0jmxuvF0ekU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsHIOS2O0P3u2csWyddJVKwb+nQd2SXAYS9yFn7EL3AuQVNfThPFOdrv+RGE0O/1GF05FGfAbIcNX6T8Yqq5xEBJBhE8KWr86sGJi3K9RQqbYzKNH0vkQ0qquJ5e9xz0DvPoZKFUOdupBOjuBP1oDObwsscifchauje3OFhzNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfRAfyXE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfRAfyXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqIIvYC1OykxD1pzFUn268rZHxZr9EACygqPjFB1uGA=;
	b=NfRAfyXEx5h98aaKN1sq9ozSOpDcpRwjz41pSQXb7YYtJAuEEMzCt5zVZowh2+nZRzINRs
	6XiGe6H6/oNufOrJzNX5bBfNLstYio4DByMqmjWdIsBXzfSwxk0zyV3I3xNlEV7FGi43RZ
	FBkAcdaRp5zO8FGq0Y9K5tgd6++8/4M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-ebXmYiRpM-2XdmBMfKm8XA-1; Thu,
 03 Apr 2025 11:19:27 -0400
X-MC-Unique: ebXmYiRpM-2XdmBMfKm8XA-1
X-Mimecast-MFC-AGG-ID: ebXmYiRpM-2XdmBMfKm8XA_1743693565
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29A9A1801A12;
	Thu,  3 Apr 2025 15:19:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 427531801A6D;
	Thu,  3 Apr 2025 15:19:21 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:29 -0400
Subject: [PATCH v2 22/30] panel/newvision-nv3052c: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-22-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1309;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rb1W4LrP1E9o8xEwiL8dpEf8JMpZgfZi0jmxuvF0ekU=;
 b=xjQGfkpuEzSXjqe9jaHFU2m2uGteHJaFBUxz+CBdVFMoIN+iFjEA9okIV3gzA10EJpyRMtfI/
 ciDAckLYUqoCRXi7mYQPfWbCbwguKaTvUW/4l4ukD6t+pJWGiZq4ymp
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 06e16a7c14a756b9a399347b29b410fd5f4ae273..08c99a48e06dc02677c6f0575d344f890871e0af 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -777,9 +777,10 @@ static int nv3052c_probe(struct spi_device *spi)
 	struct nv3052c *priv;
 	int err;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_panel_alloc(dev, struct nv3052c, panel, &nv3052c_funcs,
+				DRM_MODE_CONNECTOR_DPI);
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

