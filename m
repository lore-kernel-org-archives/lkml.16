Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39946207A08
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411958; cv=none; b=dUAFrkRa1D3zMSszs25hKmcamfEqWKoDiUHtHK8AKkE+pJo6NxbhxHE0XEa01/hrH3b5MwUWOI43ScdPMmfknjjqLkh077O3Fo+NmhoF6XAwvOIgge+ZMxHqTtjUiJiqjqGke7Ll4xAsociONgiSKG9FlYAfuxOjtPWvxCvZ0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411958; c=relaxed/simple;
	bh=aI5YhM+5GqRcO6HWFWEaGnWn1ztqZpq+7MFdAEjZ83U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AfE6RTuaQ5/NZrQmOLQUezoOpnooRxLRrn4VNgp1wk7oDERvHvHlwk5nBtT2ygF7mXkwR6C7SqRzPeEW9oVEc3rcqRwC983V3ErlFod3IBM1uPbuht/jmzIBxhn1K2AkUBXSUFOQg/VHW/p7EObVoeWcjry2D2oyOwMO5v8RRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g00pauM6; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g00pauM6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DE6B42E7E;
	Fri, 20 Jun 2025 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750411954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pW7seCsvA/di8xhjH2QlcBSJqaTTcUeZ8U1FgY8sRzU=;
	b=g00pauM6+DAKb0eFI2LgpE4wQR47ROhxS4OUrzCImT7pUHlXRMuA5Wd8IvNI+GR5EIOytM
	lX86Uv8ZQBE1eL6EICPJECb0PkyhulgPsONHkUy9uchpuvErSbm6VWW7BYLsBxf2k9dROv
	dkIL8o/JFUmOQnWXvApX9DSvifBF/vVvx5sMitBewPgSyGcnKQxmor5XClxM0LdsurrhfL
	7+sVG9fyFiDounxo0tkWDdChiU4vs82wJLPDy1imCLrI7/kWH9Uym4i0Hvvxu7zGy5h4wa
	rNPs3Q3Pbp+jPON6bqLYYmI3CN5+kPwuUxM2DYCBRynSmlRWj21baLLBTAlXKA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/3] drm/bridge: get/put the bridge reference in
 drm_bridge.c, warn on old alloc pattern
Date: Fri, 20 Jun 2025 11:32:05 +0200
Message-Id: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJUqVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3ZSiXN2koswUoExiTk5+sm56aklBaQmyeLKuQWKSUXKiiYVhsrG
 5EtCogqLUtMwKsDXRsbW1ABNM/7l2AAAA
X-Change-ID: 20250620-drm-bridge-alloc-getput-drm-bridge-c-0ab2ca481c37
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdektdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsr
 dhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomh
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

