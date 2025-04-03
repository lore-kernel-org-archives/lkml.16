Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B5C1EA7DF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715479; cv=none; b=C0LSCV+hLuqvEucNNzksTsV1+GYQJrtcZYeEC9mf7MH2F7BJdV0bFJdK2mdf2OqgSkVsSE0+LoFVQ3tyqCMSwFc2UNB17pDHi5ljkyUhEDbtT3RSMK9yaRpEucoWup2Lm0n9rulr9d8eWN0w3rY/uBIh+9ffUzDFQ5nVaZ8OWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715479; c=relaxed/simple;
	bh=A1R8Esl25W2yZtG0fXxg36hSgF3V8+2Xd+X4dkYjINE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gA/uQXT2VjC8tn8h2fRZ6oI78i1t6gLKwEicCxDvG36BBya+tp6s/fLy+XylE7cnesDC8Q9s4Giy4JnZcE+FLjAnWSd2iRRhePpAcXCLvLn6zUMXmOYyXTgfDvmTzsmX4AhFq89uDG8ZyJsx7pvWriNyvZJPCeKi83eThGKiIXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIvHPfH5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIvHPfH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IOSXlaTAq5KKVgKKnH/QaIvGQalGq8s3vM47l69gSPo=;
	b=bIvHPfH5yOOO/FOqEEqI6iwFn6kihYjwUUkSAPqtjwa5Wd3dfsK12MsivW9+SHZcimUsnQ
	n76b314+QAhMZJUVI3GPHTqxYZjclWOQnjjL/3oSgTupOg4aBCmX7z6CYTLiIn2hDRvOOP
	GnUfWrJUtf2qOciAa++CroM6ICraSdw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-oWmJmtnSMkGFLI_4YjdryQ-1; Thu,
 03 Apr 2025 17:24:30 -0400
X-MC-Unique: oWmJmtnSMkGFLI_4YjdryQ-1
X-Mimecast-MFC-AGG-ID: oWmJmtnSMkGFLI_4YjdryQ_1743715467
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B0AC185FBA7;
	Thu,  3 Apr 2025 21:24:23 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B95721828AA8;
	Thu,  3 Apr 2025 21:24:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:57 -0400
Subject: [PATCH 26/46] panel/sitronix-st7701: Use refcounted allocation in
 place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-26-965b15ad5b8e@redhat.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1310;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=A1R8Esl25W2yZtG0fXxg36hSgF3V8+2Xd+X4dkYjINE=;
 b=l6fYYmvbxWrCW+mKakVJUwa+mYFSPzypK4TiWPVQtOv57q6BWYWrI8BeLPh3HIUtr2GEYLHel
 ZtsdLyjofjNBZ/QYw6PFZqeDNQxZf7FJBstwA7MnxI5AS5d3WSQsfBg
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 1f72ef7ca74c9382aa103cc7c65fdedc7e4755b3..0b83423ce470c4e060c3cd44d38719a412d3cb95 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -1150,9 +1150,10 @@ static int st7701_probe(struct device *dev, int connector_type)
 	struct st7701 *st7701;
 	int ret;
 
-	st7701 = devm_kzalloc(dev, sizeof(*st7701), GFP_KERNEL);
-	if (!st7701)
-		return -ENOMEM;
+	st7701 = devm_drm_panel_alloc(dev, struct st7701, panel, &st7701_funcs,
+				      connector_type);
+	if (IS_ERR(st7701))
+		return PTR_ERR(st7701);
 
 	desc = of_device_get_match_data(dev);
 	if (!desc)
@@ -1176,7 +1177,6 @@ static int st7701_probe(struct device *dev, int connector_type)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to get orientation\n");
 
-	drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type);
 	st7701->panel.prepare_prev_first = true;
 
 	/**

-- 
2.48.1

