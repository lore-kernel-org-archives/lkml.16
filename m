Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B31D7E42
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573518; cv=none; b=li40ahrfxvE6rH+c4848jUaKdBFvNrfKVN/37//ULwr/1oVbwnSyt/C1JVsH5MsWSEWlXWBjWXr3papojg1Bro0kL2BWoF7BCJrCEYm2SvZIbcQES+0M13GsnDcyJkycljDLxj0E3B/DcU/lzxUWAVLM7DYEwcv20/lebaHE6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573518; c=relaxed/simple;
	bh=9QNCS9UVn1zmtxFWCm3BKRLdmpLuOBfKVVVkBZxOYnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dykJASTq5LlUs+8NYxorZjADqR/5NqSNeBBmthpMP4z50Oig0wCt/+xu4OiCWMg2XyTqrhJYis8XNf5GsgTxT6tdxrt+VPu+9L4FEp+hWcfvZ8DbZwXgObVdMndyT4oGrkOova77tHPTV2xWE530KurWVfnQhu3vPq5/VGYkWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V4trk/38; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V4trk/38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=huOOvkUz3jNByvIEum8GTGP5198iP2SPggY3MEmdI1A=;
	b=V4trk/38+TQy97xWLVhXAUGKsI5thsQ0dJtpFJVdfSRFwvqCO0Bsrot1vtipMyi7uP1wSo
	w6kaINdGmWswwDI9tyc8xQ/5/DLbMQt1mxGorofhNUv23prmmAEcgGa41vebzmYf9hgnsw
	tNEzavO81AZjtBAkXpfiiNYmg5f1pkA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-gZKDdBC5MdGxMT7Qcvzbgw-1; Thu,
 29 May 2025 22:51:51 -0400
X-MC-Unique: gZKDdBC5MdGxMT7Qcvzbgw-1
X-Mimecast-MFC-AGG-ID: gZKDdBC5MdGxMT7Qcvzbgw_1748573509
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F25C218003FC;
	Fri, 30 May 2025 02:51:48 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 475641955D82;
	Fri, 30 May 2025 02:51:44 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:26 -0500
Subject: [PATCH v2 24/46] panel/sharp-ls037v7dw01: Use refcounted
 allocation in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-24-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1381;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=9QNCS9UVn1zmtxFWCm3BKRLdmpLuOBfKVVVkBZxOYnc=;
 b=y7Qpc769pCcP2T789oeNbl93icDQ9BadXzDWU9ppYEcbTjE9ixi9QhlHEsvGullU+OAW6yehi
 t9iLwRJgSMPBpiUxPq24CG+W6Gl5CqPY7b5v/aXnQYMkTdV82nddwHf
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
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index a9673a52b861553792c9814da54a08043eb773e8..938beac4655d0bad6deaf93c7c1957403a446f20 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -138,9 +138,10 @@ static int ls037v7dw01_probe(struct platform_device *pdev)
 {
 	struct ls037v7dw01_panel *lcd;
 
-	lcd = devm_kzalloc(&pdev->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&pdev->dev, struct ls037v7dw01_panel, panel,
+				   &ls037v7dw01_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	platform_set_drvdata(pdev, lcd);
 	lcd->pdev = pdev;
@@ -181,9 +182,6 @@ static int ls037v7dw01_probe(struct platform_device *pdev)
 		return PTR_ERR(lcd->ud_gpio);
 	}
 
-	drm_panel_init(&lcd->panel, &pdev->dev, &ls037v7dw01_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&lcd->panel);
 
 	return 0;

-- 
2.48.1

