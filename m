Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A602EA737
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440397; cv=none; b=nTi495diXVtcGOY6qcozGJOxKJKsecS8TiCeRnQxfVfOr8JXIEQZB2+irc8FROd7vMS5XzR1gt4XcJXvwIBKNk9pVJAAYTsxXgQkbiy86B31jx0gjBE6nkX8igx2MBnTEKLnU58+HzbRiRZmLuW8DBlWExxfA0/bSVcb7RQKnK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440397; c=relaxed/simple;
	bh=sFXt5Hfa8fzRV2BAEylvdv3O1RHUEpTzrxJY01GuBhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=An105zBBYvbIoTH6rPDgo29jAnZvfaZb9xc5AgCElsElkO0w0FbKn0nOFOFQZzRbJ4/oah2w/qsxX1tKiiLUaa28dEgIb2At2M8usGl7a3GW5FIzQEerbYnPE5HNtKo8UilnYHVASd8E124Ap/JX2p8/0mWg9Dwcg81ipteGCFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XwEph24N; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XwEph24N"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E711D1FD3C;
	Fri, 20 Jun 2025 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750440388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXjnwSQXDdtuytqxtM3L0hY5puciJ4Vzaf5CQJt2GEg=;
	b=XwEph24NxMunBm+1IjcSw4FMaGc6u5HQQsElJXg6SRdwrSinyvEcufBN/hRkCnK7Av4ct0
	wweKtkH+quKN+qa0Wddar3/LdGGpUKNVjuPr1++qK+5yKCrsgr7Odjmb2ZN6mok8+vo0dY
	K7iCuToEInTUAE69BwmhRNnNgqSU7BVyk/SLd4kVIl81cwvFSGMjL7YOLJBA8alXtqGv0H
	QHpxWHV5ANYspBuBXD6Tf4IO/NXDpdgP7Bw+nkzbqX/OPn/uQysdbQ0Outkow5oanyh68Z
	ABf0cy2xZPhSQhF+V9LdBzLYSBCf+iPW7O5nT22sW7yWOmn3EQug34/SNbMrFw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 19:26:15 +0200
Subject: [PATCH v8 3/5] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-3-0321845fcafb@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

The bridge returned by drm_bridge_chain_get_first_bridge() is
refcounted. Put it when done. Use a scope-based free action to catch all
the code paths.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

This patch was added in v7.
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index dbd42cc1da87f82ef9cd4ccc70cdecbe56035174..21311cf5efee7d26c80316bffe80dd2bfed02238 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_bridge_state *bridge_state;
-	struct drm_bridge *bridge;
 	u32 bus_format, bus_flags;
 	bool format_set = false, flags_set = false;
 	int ret, i;
@@ -448,6 +447,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 
 	/* Try to find consistent bus format and flags across first bridges. */
 	for_each_new_connector_in_state(state, connector, connector_state, i) {
+		struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
+
 		if (!connector_state->crtc)
 			continue;
 

-- 
2.49.0

