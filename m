Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C642857F5
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199296; cv=none; b=DfgDyed44ebTKn0/3uY/q41PXti2iiBI2q5Ztd0VPzmmOYQ6dTwd+/SgB8e1+fbhRq/cwdP3j8RLcsq4bF3LccorsoSNMAKWFaElQ0jX8zTrVbSTRd+T4v5BVyjlpMu9gweeUurrC4fkXBYJEAm+vImv1l4lO/2OzQdRqgOFHZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199296; c=relaxed/simple;
	bh=9WqcrWbBCYa6chjgCwm2cxb/KCtjY8xl7xIxjJ7rY+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AZ2zsNoDV6tbZMfPFWPky0ZGMmW9hVy2H1R9ut+XRXgKKhGrfN5Tbu31m2jmAzZJz9HjipO+oZ383TyuZTqSw0KFI2NtpK2/nh8h3xzrYV1bcar2ZHxgJ/bIUC7RhDPYJrx1hY2Pi4BX9BTvI3tSLNZS3Csz0c5lx/MO4o6aIJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hdEYYGSr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hdEYYGSr"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D73BB4333B;
	Fri,  6 Jun 2025 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749199292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m2mlV4bRCtcPWgugMXFHSpwRIhfJ+cADh4dLHAwqvhU=;
	b=hdEYYGSrFpweuGF0oVy4QduQKjrypOdu8aGOWIxU3ogRzdZhc9/Y6uAOZLBhhy8M6mOlxQ
	Fpy3PRd9kcB5eM+xA5kgZKw5kMhevE1hPM9bTMiCIZ0zoIkBbW/vY0NGR8t4exf3uAKTv5
	MLD3caWY3Cd6YsCM6c+jz//rMh1aMHzBBTT3hY/Vj7kTx0WJHGH8M+DJjmH89Qe2A+5ayK
	tkWHIZvv0xzF5fMGs3VV3lhs+IrDaGuETuUTcnN3h4r81P2OqCx3Z4GWkeksMNaKIhr9Dd
	YAyhWVzTm4opCXB3Bw6DJitMAILP6+HbnPXPSo/dgpjhsclkPdPH/yowPS1xvQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v9 0/3] drm/bridge: add kunit tests for
 devm_drm_bridge_alloc()
Date: Fri, 06 Jun 2025 10:41:18 +0200
Message-Id: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK+pQmgC/33NTQrCMBAF4KtI1kZi2zSpK+8hLvIzsQNtI0kIS
 undTQsibrqYxZvHfDOTCAEhksthJgEyRvRTCd3xQEyvpgdQtCWTilWcNUxSG0aqA9rSqGHwhto
 yCWKiVSusYxaclIyU+2cAh6/Nvt1L7jEmH97bqyzW7VftdtQsKKOqNqrRneCdcFftfRpwOhk/k
 tXN8mfxc7tnyWIJqHnrLJda8X9rWZYPMCXNaBABAAA=
X-Change-ID: 20250408-drm-bridge-alloc-doc-test-267df0def880
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeefjedrudeivddruddvfedrhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfeejrdduiedvrdduvdefrdehvddphhgvlhhopegludelvddrudeikedrvdehvddrvdefhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This small series adds a few kunit tests for the new DRM bridge allocation
flow, based on the recently introduced devm_drm_bridge_alloc() [0].

It is part of the work towards removal of bridges from a still existing DRM
pipeline without use-after-free.

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

 A. ✔ add new alloc API and refcounting -> (now in drm-misc-next)
 B. … convert all bridge drivers to new API (in progress)
 C. ➜ kunit tests (this series)
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
 E. after (B), convert accessors; this is a large work and can be done
    in chunks
 F. debugfs improvements

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v9:
- Patch 1: rename structs according to conventions
- Patch 2: swap .destroy and .detach declarations
- Patch 3: rework to not introduce a new funcs struct, rename according to
           conventions, use more appropriate kunit test macros, etc
- Link to v8: https://lore.kernel.org/r/20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com

Changes in v8:
- Remove documentation patch
- Add patch to convert existing kunit tests to use devm_drm_bridge_alloc()
- Add tests for bridge deallocation (based on adding a .destroy callback)
- Link to v7: https://lore.kernel.org/r/20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com

---
Luca Ceresoli (3):
      drm/tests: bridge: convert to devm_drm_bridge_alloc() API
      drm/bridge: add a .destroy func
      drm/tests: bridge: add KUnit tests for devm_drm_bridge_alloc()

 drivers/gpu/drm/drm_bridge.c            |   2 +
 drivers/gpu/drm/tests/drm_bridge_test.c | 176 +++++++++++++++++++++++++-------
 include/drm/drm_bridge.h                |  10 ++
 3 files changed, 152 insertions(+), 36 deletions(-)
---
base-commit: 3671f37777589194c44bb9351568c13eee43da3c
change-id: 20250408-drm-bridge-alloc-doc-test-267df0def880

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

