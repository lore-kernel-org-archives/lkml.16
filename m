Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B41714B4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897990; cv=none; b=P84YKWx3hsJBsARWetlste4H//Qv+vgVoLemGNfCf5uzA6SiFeRcjb17z4FvoZhg1ETxYqYFVnYRMbrWpDQcbKEBMSpky8F/vlu/yHiRuKAB6Ro6vaq2LEgAvbh68d3kCeM62l6fkC+4ZqB1+iJyLY2JQ93HEft2Dg4Ax0uDX2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897990; c=relaxed/simple;
	bh=hOrY6pskPs+4dbFK5FnZUxDcJ5GgpSj8pc9wJkOUo6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jlbq8elrp05lf2Ms8GLvRpPynncLn+7GVN0j9pTy/MlQl+lDZEowyxdGP69J5cj8rpLiADXaam2dOZPEHYo6N4trXJiWY6UhuHBsnWb/lB5yNDmwcBSDbUnyWOu/zTJ2Ewg4JXI+rWYhwUNw7yNflu7ZJ/Sgqi7DcCMHHUhCglQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EjlVSen/; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EjlVSen/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2025A43A59;
	Thu, 22 May 2025 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747897984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vpUILtSYAH2sXWWKFYrv/0f+hDKiWRqqvwW165y3kL0=;
	b=EjlVSen/cEbDVeaJcw5WCzKVVxn5txFTdpxiks7bkfo1UEi7ylEzp+2n5fJiTNB7uhMLnW
	JpeZM0fvehi4M+bz+0Vsp1RU4VkdLqY0s/ZbPuY/BaGChC5/zMZm/r0bOCfm0Xqy+jn9+r
	lG8CS1BR6p8vCHVqe1OOMNpSQYzIj0HGEXBOhVFXXpKa5cLA3x28hhcPeBDYwnpeFAVj5N
	lXggT6vdYqhP4bud9Iuw18H0gN8dLelNnCQlTARG0SIVu5KPe+6wBboe6uz1GhIvvaQe4P
	VdcsXQ+jX3bMmVp/6cI7NMl/HdeCx7fWH1/MmzS4xUYfsZe5cYwf/sezEFf4DA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 22 May 2025 09:12:58 +0200
Subject: [PATCH] drm/bridge: fix build with CONFIG_OF=n
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250522-devm_drm_put_bridge-fix-non-of-build-v1-1-a05234dea046@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHnOLmgC/x2NWwqDQAwAryL5bsAG7esqRZauybaBuivZKgXx7
 g39HBhmNqhiKhVuzQYmq1Yt2eF4aGB8PfJTUNkZqKW+7YmQZZ0C2xTm5ROiKbuS9Iu5ZCwJ46J
 vxhTj6cx06a7dCJ6aTdz5b+7Dvv8Al5xmmnYAAAA=
X-Change-ID: 20250522-devm_drm_put_bridge-fix-non-of-build-fbb67d28494c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehfeefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdevuddtleevueefhfdtvdevteefvdfgteejhfdvvdevtefhleffhfehueeigfenucffohhmrghinheptggrthhirhgtlhhoghhsrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhilhhlvgdrshihrhhjrghlrgeslhhinhhugidrihhnthgvlhdrtghom
 hdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Commit 5164553d739e ("drm/bridge: add devm_drm_put_bridge()") adds two
declarations for devm_drm_put_bridge():

 1) an inline declaration in the #else branch of
    '#if defined(CONFIG_OF)...'
 2) one outside of the same #if

This results in a build failure with CONFIG_OF=n:

  ../drivers/gpu/drm/drm_bridge.c:1406:6: error: redefinition of ‘devm_drm_put_bridge’

The function has nothing to do with OF, thus fix by removing declaration 1.

Fixes: 5164553d739e ("drm/bridge: add devm_drm_put_bridge()")
Reported-by: Ville Syrjala <ville.syrjala@linux.intel.com>
Closes: https://oftc.catirclogs.org/dri-devel/2025-05-21#34288266;
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_bridge.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 464da28f9134f0fcece5c72a8c5fe7f3e42c7e3d..0af5db244db8580ea0c9af1d9a373b7bf62ee699 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1311,8 +1311,6 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
-static inline void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge) {}
-
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,

---
base-commit: a3436f63aa4f93b043a970cc72a196a501191ecc
change-id: 20250522-devm_drm_put_bridge-fix-non-of-build-fbb67d28494c

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

