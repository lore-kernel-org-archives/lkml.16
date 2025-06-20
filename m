Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC672E9EC3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440396; cv=none; b=Po6V0R2CWzQkVAQIo6+2MeJNupJmKfviVq4L3sBvjGJ8PBkYD/oS0gNTRTGaczACD+r/VrfeG6PjlMM3ahXACqhTKNxBbnLj5cZeRp+qsjEQW6mV25D0/blsDvDOn49nAO7b/SgN6oE2sLDE/VBq2fnItZ1ZSbKqU2HGGLRtWQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440396; c=relaxed/simple;
	bh=1pnxjGCk1qmiuk34uDXOAq8Hz77Ps/v+vVAxjbJMU10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aK6h+/j0GdviQNSfcD82bh3U3nhPIQQtuF8sZ9cuGHTJsRQplq2bVOp9BgHgDPKe3uSrHLB76MvxYMDTrNQ0bzl7bmAwLoSXMzjM6g7enA1qNjMOGJuZromDpFHkdQ1FMEs1yvj8tYnJL52NYEElQPizZLtRtUh3+g/Ap0dDDDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GB2m0dkH; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GB2m0dkH"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A0BA1FD38;
	Fri, 20 Jun 2025 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750440386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8+8F/hrb+sI4eVHPhXhlX9e0Bs2g0jUsX1Jf66Mmu8=;
	b=GB2m0dkHV4iqQqrmNlVxvJfVWb3MMX8io4a7nSw1DqGSLJsmp4hT06yBtIsoA/BhF/9Vw6
	3ZYIGMds644GaXSFTWsRc/LPPcw3Fd9MkcAZT9P+p0d7TxNoYMsH2wuzq1XzoSQN51U3A3
	TBom0OIyBcMESdkiyYLL3gyV98ir+yyJxPUXRYIrEF1Kx7Ll9kLt6CmLo1qoXomUGJ9ezt
	4Kiwsb9qzzbYT498PJwtsf663LwGNKyhK2ARPlwcBv2zSvi+HiDvv4YYN/m0Xa9x1mOyk7
	nSNVUmgekNdUwQQmcGl5TKkFrfcof+UMjx0cTiHSoNbwyeuP2vzC3u7ROdxANQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 19:26:14 +0200
Subject: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
caller could hold for a long time. Increment the refcount of the returned
bridge and document it must be put by the caller.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

This patch was added in v7.
---
 include/drm/drm_bridge.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b110c5bba8c0612a71f749ad51345e7a8ccdc910..f98044581d67c380c3bc3a1943bd6ab09b764ec3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1336,6 +1336,9 @@ drm_bridge_get_prev_bridge(struct drm_bridge *bridge)
  * drm_bridge_chain_get_first_bridge() - Get the first bridge in the chain
  * @encoder: encoder object
  *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
  * RETURNS:
  * the first bridge in the chain, or NULL if @encoder has no bridge attached
  * to it.
@@ -1343,8 +1346,8 @@ drm_bridge_get_prev_bridge(struct drm_bridge *bridge)
 static inline struct drm_bridge *
 drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 {
-	return list_first_entry_or_null(&encoder->bridge_chain,
-					struct drm_bridge, chain_node);
+	return drm_bridge_get(list_first_entry_or_null(&encoder->bridge_chain,
+						       struct drm_bridge, chain_node));
 }
 
 /**

-- 
2.49.0

