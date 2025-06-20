Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26E12DFF22
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435205; cv=none; b=jsM66lEFxuiyXPM3BH9yD99mOZG/odcRy4c6lC6H9395tCl+0pmr0hScHKSsF3isi/CxwunwN+92UNux6j9arfefUE/leD0VCBDgSp3Fyp6TCEfM5M/WlZD2TIo+Z2c8EOrowkAAG+lq4qMdnOKlDiXW8LtY2Lfp0A85PjbaPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435205; c=relaxed/simple;
	bh=ZKdoyWG4uNvQboILO4stlRgtMREmdDVse60DV4CbPCs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tgC0NAas0KCA3e8memf2m2o4yqxJvwDVU+56tEoCxJyKXM73YZbTzTPGvQW3vpwEDHxjG8FWY7LdB+IACUIYJ6GGoSVMhOVdD46Lav8LN58+GiYNwvopfGwCLvYOXkbDllLEKJkX1YovUOpUKKmIHiDoN0G9kmADzE3d+lKGvEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TrdRDju6; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TrdRDju6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 619FD41CFD;
	Fri, 20 Jun 2025 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750435201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uCrCrimT2GeByS96cS2HIu4iMov1HLkBona2ijb0XWw=;
	b=TrdRDju6W4qLi2wv9kb+q8qV4GC+F8lb5Bzco8TZoQqCVdY5h8XGs1oRyj9v02IsfyMTzG
	pP2TH2eY8J9XeJtJpCjnvbsZsy9BVoE13mbvWPWmNGKzWJlnpL7NsLpPR+kPrLb+bd4xOL
	RKeg9Dimz2d25e+rHWCJKEyd8WvljFxtsSB9WkeIEZJr/nCGuGzFWISU4ggSPe4z5Yni9/
	lQYXOBmhAGCtYtWsH+ycKNHWuXOtTchZ8fPJRtOMKAUF7UBWbXSt4zlhQRPI27AyuB5lzR
	K+b6K/cYOWfyAbEDstY8nQpRBURXjAkfkQRXbOrPkCtEX1RbXiE+3akWcfKIbQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v9 0/3] drm/bridge: get/put the bridge reference in
 drm_bridge.c, warn on old alloc pattern
Date: Fri, 20 Jun 2025 17:59:52 +0200
Message-Id: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHiFVWgC/5WNyw6CMBBFf4XM2jFtFVFX/odh0ccIkwAlbW00h
 H+3snLr8pyb3LNApMAU4VotEChzZD8VuOwqsL2eOkJ2hUEJVYuTEujCiCawK4seBm+xozQ/06+
 3KLRRVh/P0h4aKFdzoAe/tsy9LdxzTD68t2qWX/tnIEsUaLRryOjaSdncjPdp4Glv/Qjtuq4fT
 +YJZ9oAAAA=
X-Change-ID: 20250620-drm-bridge-alloc-getput-drm-bridge-c-0ab2ca481c37
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This small series adds drm_bridge_get/put() calls where applicable in the
bridge core code, and adds a warning when the old allocation patter is
used.

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free.

The steps in the grand plan [1] are:

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

This series is part of step 1 of the grand plan.

Current tasks in step 1 of the grand plan:

 A. ✔ add new alloc API and refcounting (in v6.16-rc1)
 B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
 C. ✔ kunit tests (now in drm-misc-next)
 D. ➜ after (B), add get/put to drm_bridge_add/remove() + attach/detech()
      and warn on old allocation pattern (this series)
 E. after (B), convert accessors; this is a large work and can be done
    in chunks
 F. debugfs improvements

Specifically, this series does two things related to the recently
introduced devm_drm_bridge_alloc() [0]:

 A) add drm_bridge_get/put() in the two places within drm_bridge.c where a
    bridge reference is taken/relased
 B) add a warning on bridges using the old allocation pattern instead of
    devm_drm_bridge_alloc()

These are loosely related topics, but I'm sending them in a single series
to avoid trivial patch conflicts, as they touch the same lines. This will
holefully help getting the patches applied more efficiently and quickly. I
hope this is fine being 3 small patches.

Part A) is made of patches 1 and 2. Those have been previously sent in
"[PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with bridge
refcount" [2] (as patches 3 and 4), and already Reviewed-by Maxime at that
time. However they could not be applied until the conversion of all bridge
drivers to devm_drm_bridge_alloc(), which got completed a few days
ago. Hence the reason this is v8.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u
[2] https://lore.kernel.org/all/20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v9:
- patch 3: change warning trigger from "refcount != 1" to "container not NULL"
- Link to v8 (counted as v1 by mistake): https://lore.kernel.org/r/20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com

---
Luca Ceresoli (3):
      drm/bridge: get/put the bridge reference in drm_bridge_add/remove()
      drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()
      drm/bridge: add warning for bridges not using devm_drm_bridge_alloc()

 drivers/gpu/drm/drm_bridge.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)
---
base-commit: a59a271769149f0b8258507276f3d2a24370cbdb
change-id: 20250620-drm-bridge-alloc-getput-drm-bridge-c-0ab2ca481c37

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

