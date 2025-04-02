Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4F1A304A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611172; cv=none; b=PRWQtNsV0kQ7ZWwEPY16B3TkxTrVys9w5Fec/9IUd5+bRwFBOrSYLOdYdi4gALBNJBicUZ1JaOtfDvwuxg0WMpQHbbmZMKusCTvl7LwFkD1SUGwreh++xD/ni/SHy6JhRNz+2JaNDyJXq7XPHEi5G25raz8AyYq1UOjJDOMJyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611172; c=relaxed/simple;
	bh=DsNJmc5rLHBXzfemEN6C/4jFyAPvFFHR9UkjydvcKiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+kT7UeT6RddUY84AFj2uCU7rAOYsS2Lvn2QBVR80QUjeT0hu4OohUNe2buazRXEuQT/SxV+UmN0ulJipURDlaWC3q9aEX3LdbyAhs5r64rKcWEnKzEVPjkzoMtIHp/57fm2m+ZXWDqnmZvGMgB7ne64F61Klmz/rxvcmGdCh3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cheHjdJc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cheHjdJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K90Nh+iYfk2CkiujMPyuv28d4U/9+M3yVThyT1lglvE=;
	b=cheHjdJcES9PA9dKBKZkmaqAZsFzLvIVRiGPLTAaONi2RiyVk0cSIXDYZ6eTgvTd/rpC+H
	NV+0/NXV2vfd6XfiLqbhZNhkaZhdhy0iNZRjfkX6i9kPzlhVr0v1LtmFWs7CCDvEeB4AkO
	f0VVx1P7vSdMYtDXbsNfeGGV22SrR/E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-weIi507qMvauQMS3ajmblg-1; Wed,
 02 Apr 2025 12:26:06 -0400
X-MC-Unique: weIi507qMvauQMS3ajmblg-1
X-Mimecast-MFC-AGG-ID: weIi507qMvauQMS3ajmblg_1743611164
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 353F0180025E;
	Wed,  2 Apr 2025 16:26:03 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F1912192C7C6;
	Wed,  2 Apr 2025 16:25:58 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:45 -0400
Subject: [PATCH 07/30] panel/ilitek-ili9341: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-7-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1047;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=DsNJmc5rLHBXzfemEN6C/4jFyAPvFFHR9UkjydvcKiw=;
 b=LO87nh+uE7jI7PF+KAHPAyO86Y0IxVn7AbUNU2ouB8zNmWRde2S/m3oIdNjmgXAcKsZkYKtH5
 5FRAImoqzBiB38mnr/eyrb3lKgit2IDEKWSD8xRiJiB+YE7X3h8uOIe
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index ff39f5dd4097e8da0a0e16c50c5bfd45c078d91c..d87b7eefe9beedd290fb59065b389b3315c85720 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -490,9 +490,11 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	struct ili9341 *ili;
 	int ret;
 
-	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
-	if (!ili)
-		return -ENOMEM;
+	ili = devm_drm_panel_alloc(dev, struct ili9341, panel,
+				   &ili9341_dpi_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ili))
+		return PTR_ERR(ili);
 
 	ili->dbi = devm_kzalloc(dev, sizeof(struct mipi_dbi),
 				GFP_KERNEL);

-- 
2.48.1

