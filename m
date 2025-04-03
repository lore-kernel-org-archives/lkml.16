Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0356B250C14
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693502; cv=none; b=sINhssFklJiDpG8Wz7TV8tRyxqzceOAADmZhRmIDMH+JVXZPu1FdHxBZXBs5X0NGtLsAOjkBwyE0/f8LwANWjugSleSjPrzHuJX8nG3dds8MzB56CXz6yBNVXU2QSigIvGQMcQXXUJ3s7qeRw+fA/aJ8JYAXz2OQAmxGQAgI6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693502; c=relaxed/simple;
	bh=0qjDY+Qa1aBJr/h2b74uTankgs+9rSSlXRgJxVXCGsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bC82VO4AzCobrFyz9+VwsD/MXMdI7DzAY17O8dbMGQCf1/ECAiwjHXsTgPNUCIfw9Xe39Z3MYOsMArL16IZFQODNBPrbNDtFYcNUPw+sNHtn156ZM6QgGIarPBytgFgIDYE6C1BYMSSa/EptkMaixAICUKEzNAGjrgpkTlBY0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EAZ+NJ9l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EAZ+NJ9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743693499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pE9sF46aEGvT3nKjfZRazirn7U6eSWTE5F6bXW6KZ7A=;
	b=EAZ+NJ9lTdsOf58RM7svzfcA8CCqanxJcEN+FnLpYEQ1S6oRu++95X2vvg4GoZQvjta4CR
	nk1D2lhZOZj5SnwHtWtnW/BUHfu+7DokzLVql3LxobrNTWFAzy3twZjCd0rL26kiXIzyDY
	R3paf/uqxmCyj0Jy8MjFlYecYhYW8z8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-2gKGj87yMo2XH2pjNdNt2A-1; Thu,
 03 Apr 2025 11:18:16 -0400
X-MC-Unique: 2gKGj87yMo2XH2pjNdNt2A-1
X-Mimecast-MFC-AGG-ID: 2gKGj87yMo2XH2pjNdNt2A_1743693494
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DD491800262;
	Thu,  3 Apr 2025 15:18:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6941D1801A6D;
	Thu,  3 Apr 2025 15:18:09 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:13 -0400
Subject: [PATCH v2 06/30] panel/ilitek-ili9322: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-6-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1229;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=0qjDY+Qa1aBJr/h2b74uTankgs+9rSSlXRgJxVXCGsM=;
 b=BYMVNuPGe0hvxUUEontXOzui+dPj/SuSt49Z6nHPkNub/yjKFBElFnJaYSh+fIjZAp6v9zKKD
 WM83hPyJrvtB8kVttYh0IRraiu/Hxs1MkpQTffIRNJIClgoQuKoWEbl
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
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

