Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2D77263D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095207; cv=none; b=EBg5Zjz87hTKEDxrqEsrPDqhsQoTnLIgiD3CK61iMjigpuZQWDaFDHt09YOtx7WcEFUToMgL67bjOAOMEg1x0L/clRZKDXUYSO6e8t9VJTe0J2/2TgdNkZA5F7TF5JhUMhK/mfwRfTdiYcsJv7/S1ucpECTJtCQuYqOc4KBiqBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095207; c=relaxed/simple;
	bh=MUHWOWeXTgH9muEniE1HyqfCld1wHUnfwns2dOYTIa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDsGhVDiIzzgcSUyMlfAHwpTS1FO7Qz6QVAZic9ucE2srS3huIeZFhfPuxqH7/rMurT40oa+eruOmOIKVVLTImBVPcGXZxq6uFF+PE3SNsx9ddnVGRe04gTWROPkOsYklNkDjYdL3Pt+5a1rZ+LAyWUCQNOrWkK3n890r4urU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gGmkoOrn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gGmkoOrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6e2st0+iShieSpNODIcFg9Fz76rcQ8IPCC/t8w4mYog=;
	b=gGmkoOrnfNJ4StpTez7t+2k7WryFDyJDtkqSLm4C08ZzWvM2uTuwLnFt6CGhazhU8tPZao
	GVRKlB9SlZKTDI00wJNSd8KByhQA293W7yXfRVBdy74jO3OIiGYvPIQc1x12x28TGSMfrL
	tKdy9VjfpkVuZUUN0+jeQfTkdgLq9V0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-qugyn03mOlKnyIwd7JPoig-1; Wed,
 04 Jun 2025 23:46:41 -0400
X-MC-Unique: qugyn03mOlKnyIwd7JPoig-1
X-Mimecast-MFC-AGG-ID: qugyn03mOlKnyIwd7JPoig_1749095198
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E3511956087;
	Thu,  5 Jun 2025 03:46:37 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 333EC30002D0;
	Thu,  5 Jun 2025 03:46:31 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:11 -0500
Subject: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=724;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=MUHWOWeXTgH9muEniE1HyqfCld1wHUnfwns2dOYTIa0=;
 b=cbmycYmHSdj0wZkt3skRJ+iJH83a782N60NXKJyhCr1Otr9BxxDh1Y4WRMxJOXiqnntYUVaDi
 RbiUhWsYhRoDKaddXeGeS5o2Wqs82qUAiaYXWug1uhWM7Kz5R6/4y/o
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Put the panel reference back when driver is no
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de657af7fd14388 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 			dsi->out_bridge = ERR_PTR(-EINVAL);
 	}
 
+	drm_panel_put(panel);
 	of_node_put(remote);
 
 	if (IS_ERR(dsi->out_bridge)) {

-- 
2.48.1

