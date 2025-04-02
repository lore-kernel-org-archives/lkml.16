Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7A81EB199
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611238; cv=none; b=iP28cuaixTq/QqiJpvazlrGx5emsfE3Ics+2ZIGwBSyxTbh4kX96t8WCLCte0AvgCiCAUSrd2R6nKHJ6/Uz2n8/sJnRCDAdEX/WsLriRHlm8jgEXZAcFY/2a4lpTmZ28yEtb5aEflhTxXRxswazGZXWeIGPAtTz9/Y4ewFER9dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611238; c=relaxed/simple;
	bh=6GoWxokYmPAF1A56XB7LaL9Vb/FUCA1ecKXpwfONqmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUVdhIxWFtQiyoD7vZADfc1ao3KjQ7XuYEzloUcjtJ80WMOi2IIGF4FEERrLlC6AJB6qvYkEcuBIb+kXS8xy6ShOS8bBUs/9OeaDkoLvM0ZKkGs5XQzv24o8kWZeM34kUTTdGd85bYV++Taz8S9d4pUoVHDjygn99ko8vpahdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KCmmBCmw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KCmmBCmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiHgMjSkd5odbQqdgij+KRxFLrr73iYNN/fqbj4FvnM=;
	b=KCmmBCmwWLbJtKuYpADayqtEKe0hnpyFtkqW72SsEYtayNvKqZJ2HhzRvcqEzzGPQ6yI8Z
	tL+Wev/mDR0ElUpR1nitKTRfa8gTlEn/sIx/Q6ttH2BJ3KAXL1NTXoW7CHTBn/dp+Jjzcb
	1goPSDwOSNW1zYs+BObq4QJxpypHhwk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-VkzY3yMCN0y65iBnTikCgg-1; Wed,
 02 Apr 2025 12:27:12 -0400
X-MC-Unique: VkzY3yMCN0y65iBnTikCgg-1
X-Mimecast-MFC-AGG-ID: VkzY3yMCN0y65iBnTikCgg_1743611228
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B99031956048;
	Wed,  2 Apr 2025 16:27:08 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C6E6F195609D;
	Wed,  2 Apr 2025 16:27:04 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:00 -0400
Subject: [PATCH 22/30] panel/newvision-nv3052c: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-22-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1293;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=6GoWxokYmPAF1A56XB7LaL9Vb/FUCA1ecKXpwfONqmQ=;
 b=iwffykaHiHxudGYhemjKDmWzWLp8WCIEchCKoWH6Ok571worysWA/JlBmYjjNDl1nhPaP8KXW
 zXNosmY4ljPCXNg+F5Hfvs6L06HUVrdeMUHQpfLWVeY/x2cY0JdkuKy
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
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

