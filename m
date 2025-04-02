Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816861F1500
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611256; cv=none; b=Db6KXo1g/kB7ynP+z+fvW6uR9+Nrt/4NG6Bs9mgBQbG2Ig5KgTAaMRVjwPtUrN7ZRrIWDhkdPX7HoHf5SSHboiufNGSbnr3XPvn7YJbkuwk1P5xpsOjK0ra4jjxM/PODH/DqQZYg4OdypTTZ18r7yyyeHxVTX7fQutKLG1hyxs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611256; c=relaxed/simple;
	bh=ScF0oS/ivreAcpssqYR+koYAxtpH61OnAgSFxandPHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFEsXcoseDU86OiT/jT7QXtpMpALnqpBsBeUFjzrNEUYPsZE3EAJaLRBvALHDOIPtf5KOsNhvMIfBkWyTvHpOLaLYHzd5K4N9wy2qNRwCq+wxbL7bXQZCC5ejylZN8D01Z2hoFLNJdp2Z5+2d7/iQuckK7FywdW3qzvkJe6B4Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWqiEPS4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWqiEPS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCVcmVWs590LHx3fAShanO97/SS0pZoRCdI+DCfpx3k=;
	b=fWqiEPS4YQpa5VrKLB+eCy6V6bz+JXJouz+Rie1ROouk2Jqo8w2vHLfOMrWxuwHGu2XEvj
	ylpjSDiBHr8wSh/N07areQep5r4859zwawIq8hayo73OxWdOePKEdCjVJ+S9dEME4AGYbL
	tlXq2CO1kHYZlaNV8g2brTrWQQIIYWE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-eJ9N_NysPZme2tYLyxzCjw-1; Wed,
 02 Apr 2025 12:27:28 -0400
X-MC-Unique: eJ9N_NysPZme2tYLyxzCjw-1
X-Mimecast-MFC-AGG-ID: eJ9N_NysPZme2tYLyxzCjw_1743611246
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E4B4F1955BC1;
	Wed,  2 Apr 2025 16:27:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1121C195609D;
	Wed,  2 Apr 2025 16:27:21 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:04 -0400
Subject: [PATCH 26/30] panel/novatek-nt36523: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-26-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1394;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ScF0oS/ivreAcpssqYR+koYAxtpH61OnAgSFxandPHw=;
 b=0EWpwYuJLu42AGq/FaMwsPJdSz7FgZuWooCEYFJe202lET1weaJg1nc+fIb/oN7zMIc6Hw7CT
 Ft5u1JqKm3pCpe0oR9+nzd3Kmf/oEAQDs0kvREbtcKp4uOHcllkpl6F
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 116d67bfa1140073cc537ec967b77195beeec051..32cf64c7c18be061fc3d38689529f039bf7cea55 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -1171,9 +1171,11 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 	const struct mipi_dsi_device_info *info;
 	int i, ret;
 
-	pinfo = devm_kzalloc(dev, sizeof(*pinfo), GFP_KERNEL);
-	if (!pinfo)
-		return -ENOMEM;
+	pinfo = devm_drm_panel_alloc(dev, struct panel_info, panel,
+				     &nt36523_panel_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(pinfo))
+		return PTR_ERR(pinfo);
 
 	pinfo->vddio = devm_regulator_get(dev, "vddio");
 	if (IS_ERR(pinfo->vddio))
@@ -1211,7 +1213,6 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 
 	pinfo->dsi[0] = dsi;
 	mipi_dsi_set_drvdata(dsi, pinfo);
-	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
 	ret = of_drm_get_panel_orientation(dev->of_node, &pinfo->orientation);
 	if (ret < 0) {

-- 
2.48.1

