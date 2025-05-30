Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3082B1DC9B5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573528; cv=none; b=gY90pa38c7CpUi+qBmaeUrGwvJYCoZ4ROQUqMhi2zeUBVjiGxHPoesIzhsUZo36BKIwH53rFzJ/3kPs+4rUwQP1saigAuSeS0dZmIvGUWagAdlE/+kPYmAfMzBbrXJH+cIZTeZOnmw3az5i8yS/rnQ2816rIp2vXQnW3+3GndCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573528; c=relaxed/simple;
	bh=sHv5udTKX62beThGkQPr1OBFlpij6YZPAVyWWwAmKzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWmS8GOG1BNdvrSC15bxrB4rM1ygv2PtiqFjw7c3z6mVpDm6qAx0M4M+tpQchKTx4+j75S8Zx0NOouWBPiecbFVlxpIjK5qODZExMvTPa0YV09oFhZ3sDwX0TvOZgVkobrUP2M4pSww50g3yQjeAkMRdeKjkn3Trg4xsg8leapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IWnLjzmw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IWnLjzmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XawE01jygagVYAKA91+kaojKviEnIjTtQo5kjF8lDgg=;
	b=IWnLjzmweeNS++tN7ynPA2ymwcQWPDWX0IlYnKysnKyOpFPLxh6GBcljeT8gnaRG4uYm3B
	GiN48loNLLrt+NUn3kH0xGNQBmxTTW3zR2Cvt+o8n0XDjXQQo4mtSjVYDzYOsRMxljbdiZ
	cw43s14Ov+Rq2tTuP7y2fkylfrlR7nA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-k_JTi-I9O0uLI_Cdc9cUGw-1; Thu,
 29 May 2025 22:52:01 -0400
X-MC-Unique: k_JTi-I9O0uLI_Cdc9cUGw-1
X-Mimecast-MFC-AGG-ID: k_JTi-I9O0uLI_Cdc9cUGw_1748573518
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AFAC11800258;
	Fri, 30 May 2025 02:51:58 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EC5F51955D82;
	Fri, 30 May 2025 02:51:53 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:28 -0500
Subject: [PATCH v2 26/46] panel/sitronix-st7701: Use refcounted allocation
 in place of devm_kzalloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-26-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1383;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=sHv5udTKX62beThGkQPr1OBFlpij6YZPAVyWWwAmKzE=;
 b=sh6IjRBR6YxD5Z9hcRsz8auzq2E1DM8zpOpmuG2RVvRn6CgITjYyklpHMatf3T74j7zbAYwz/
 ML2oULoIdFNBnW7S+tRY9fCEQ6+GgUamMkh7NxzfdTpEDGjTo646VVv
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

