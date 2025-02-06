Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AB235363
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861380; cv=none; b=c8hVz1BYP+UqcKMHigFHbMbxOv9Z0f21kxT/0tyCtUPudaHQ66D5iOqs+Yn+rCULpy/J2OA41Rxk5heISciqVio3GP+uXBz3GBlgVSMitd4EBfJQHpx4QPcQ2hkC6HWFFFvoTcJVGQCzfLOhlKjx51PdVz5aWW3dJig6OfrT4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861380; c=relaxed/simple;
	bh=yrHoY8nyrhTE3dEuM5ysXX5W5sl+jP6nJY9oJ0cVkPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f6gmLRLg8JTHBAqI+NqXlW6bDiZFhUcjoyCXNr9ELAG6+lLAFjvwcIcVs0o2Z0aWBKr6dTox4+GivHl1bpljCSrcunvlc9Mi8i6+67MJ+21V5W93ggdoajqvSGsqwQan1QXSqflv33cwm80ZYkFKLa6kIbpgZoheYXXweeHaA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PwaO+TG5; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PwaO+TG5"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CBB944457;
	Thu,  6 Feb 2025 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KLVc8DsJkG2/KhPhAnvbwhnbrB/mygCyryTZUCypcnc=;
	b=PwaO+TG5J9cyS9QiTdq6WtcuzQGZ+a+nIabj0Mz0mQr9aN9NsfvX1Gkip0n8snIaSEL7KG
	8IiUp8YAPUFlyiEotylqUL2YEL8+LhMZ7x6QgrjyP6X1JQcwk5VTy7INFM1JnShsQA2CU5
	ZstvMTz7z83SZkEC6trTCdi/C9MePOhJchpxeacthltH/NXzmCxjpsMYm/9N+hTkWDYVjI
	Xnaa4GHfraHszsTstowFvWLCbXsMPe0mxCMfAU3K3pKxFzlm0Bd+9BVuf9NnCGk6dobc0U
	r7SWfwtBvU6hpfWkHJvJa5Bw1AoUCezGio8PywZM7ZIpIokEZjvQFJa5JM2IOg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/8] drm/bridge: minor cleanups
Date: Thu, 06 Feb 2025 18:02:32 +0100
Message-Id: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjrpGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMz3ZSiXN3knNTEvNKCYt0kcwtzA+NUA5NUyzQloJaCotS0zAqwcdG
 xtbUAbrxV/V4AAAA=
X-Change-ID: 20250206-drm-cleanups-b78703e04e9f
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeetvddthfehvdevieevffehfeffjeevgfelkefhleeufeevieevfefhjeetgfevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
X-GND-Sasl: luca.ceresoli@bootlin.com

This series removes some unnecessary #includes and and unused forward
declarations, which I noticed while preparing a way more complex series
(bridge hotplug). I decided to split these trivial patches to a separate
series to limit the noise on the larger series.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (8):
      drm/panel: remove unnecessary forward declaration
      drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
      drm/bridge: parade-ps8622: remove unused drm_panel.h include
      drm/bridge: parade-ps8640: remove unused drm_panel.h include
      drm/bridge: tc358762: remove unused drm_panel.h include, add drm_bridge.h
      drm/bridge: tc358775: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include

 drivers/gpu/drm/bridge/nxp-ptn3460.c   | 1 -
 drivers/gpu/drm/bridge/parade-ps8622.c | 1 -
 drivers/gpu/drm/bridge/parade-ps8640.c | 1 -
 drivers/gpu/drm/bridge/tc358762.c      | 2 +-
 drivers/gpu/drm/bridge/tc358775.c      | 1 -
 drivers/gpu/drm/bridge/ti-sn65dsi83.c  | 1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c  | 1 -
 include/drm/drm_panel.h                | 1 -
 8 files changed, 1 insertion(+), 8 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250206-drm-cleanups-b78703e04e9f

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

