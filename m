Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4871EDA2E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861381; cv=none; b=TGl52ASxhrWnxxypGr5nN/ugY2Azs69ZSPEYaicx5w208DncCcA7r9twe7KLq44snQWdg4a96znYzxfCUXvjZg7LhceEeq2w0DFIk1Onyahdufhylx5CORvfISUJ8GnzpkNCcwKnilKODvXrBr095ciT0sParXSJ+4VTiRcZkSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861381; c=relaxed/simple;
	bh=XgUEzh5Sod0yORSdI5jkjxiQ0MWHpQypds1cXimsreY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAcQKOqHehTT9ggmkHEVeDE0He1R+zglTUUVYjmHgah40sy8mqh5MWb9WikN0iHMTlgxmu82MV5RU14flWVVYxPd0fEyMT98j5/QwqpIbDMjHLIccxRGAr7Hpq4KOlipbFAcC/nTAv5QmxL8P8gaMWuw84ImxTUSoEC1p/IDMig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UNGVIuNR; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UNGVIuNR"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3984444462;
	Thu,  6 Feb 2025 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjmN0Siir72J1DWp5KiHDNwbcU6lRJX/aB8iNer34IQ=;
	b=UNGVIuNRp1w1zP7g2LZ3HYFP0Ye9AMeCp24uprDpI+Z9XVkzh4C6WtwwBbVvK5K+Hk3wpp
	XikvGei9OPVoDlEET/vK8T3o81FoG1NGTdTXaSDGFxx1dwyxXy1CsTtAwbRvyVZ5oVbTwm
	BqnnmkOW/DGUR4Dvw1iXAB8PDBIAyhK/X+6u/H1EtZd/k0PgcDF+u5H477t0VAJm6+iNYZ
	sbzN7nvaj2NjPNWIH6HpZwZWjZXeJ2L8x1SOzY0g4ozGYt142CiEb6otC9L3JFzz71Z5qB
	B55SKYiDo/wwpQroSb4SxR0WkeUMZ/8YiTs4ibh8DeNi/M+CEa27RA8t2PXmGA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 18:02:38 +0100
Subject: [PATCH 6/8] drm/bridge: tc358775: remove unused drm_panel.h
 include
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-drm-cleanups-v1-6-93df60faa756@bootlin.com>
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
X-GND-Sasl: luca.ceresoli@bootlin.com

The file uses the panel_bridge APIs from drm_bridge.h, but no drm_panel
APIs from drm_panel.h.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 0b4efaca6d682320b76ce09ed41824ae7f84ca2d..c89757bec4e6cc59ea0e84b1096ba71b077d408e 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -26,7 +26,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
 #define FLD_VAL(val, start, end) FIELD_PREP(GENMASK(start, end), val)

-- 
2.34.1

