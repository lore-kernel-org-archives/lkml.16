Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C532E425F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435207; cv=none; b=UqlTboBan30da46BBGBddLWlCWlHm4FcsiZuEVSXo6OxJ7wFzWI3hWchBhPUYLyXzS2dxJrJ4mlWqLjXmwCHkherRwRv18cSMGZ9Wfhz7vxjxQrbXwGkbpLBwa5unQ3wF0yQgZ1bzC+Xridj9/B9U1HaLUJVeaJQMEb5H5VkvXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435207; c=relaxed/simple;
	bh=NVQa2PMltdTMXU9DSw/VYnAjmH/p+ngdgdXHnIqrPCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zrsso3tq+5jpxjPiw2NL6TVXoOs2N+IIAQL8pfNzmD/qAB0dYcGG3y4345fVr8VZtAY8NtDqDpOt7u6/IQWxK1FFCs3vBSC2OJ/M5AjWOeciXKweMfV/MeD/Q4QvgW76shlVsUyWssiOfRoAMcV8yTzj50zkEQYSU79PW8AZ9Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O2wjBsBM; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O2wjBsBM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93A08432D1;
	Fri, 20 Jun 2025 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750435203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxqhpgNdN8sprPi5Np5GP4NDa3E4dF18OFdVOGJkQuA=;
	b=O2wjBsBML0hngmIxbAkAbtl8Nhpj9p19JDsbosQ095/NpYWRH0LuyCtAyjH+OUwoibXmhX
	vX7bqD3SflSpUZIpBivIYrhVq7rwUa68XYQGkeui2DupS1lbAOvtsiCxpa0b0Zcc0DnzuG
	moHPvAFrg2jeqVx5mqkwX6l1Gqnv5Kzi04OWIjiVzXP6hdHnISp/nBEWN9HIUY63XEXflP
	lsvmRWBU3ttY/KE5L5dbPtf+/JIjMYGqcLqo4PCjilhYXUeeXC89ilK9/cA9OEO9MO8FUj
	BzJXb/hiCbhKkajGeqxhZkO3qEyZWbRd44TODnou5tJRTCi0I9DW31zfAmInhA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 17:59:53 +0200
Subject: [PATCH v9 1/3] drm/bridge: get/put the bridge reference in
 drm_bridge_add/remove()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-1-ca53372c9a84@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

drm_bridge_add() adds the bridge to the global bridge_list, so take a
reference for that. Vice versa in drm_bridge_remove().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v9: none
Changes in v8: none

Changes in v7:
- in v6 this was part of "drm/bridge: add support for refcounted DRM
  bridges", now split to a separate patch
---
 drivers/gpu/drm/drm_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d6ce7b4c019f415400bab8aa3d032638cba6cdc5..fa2b2457b16e145e3ace70c53984937096d310d0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -295,6 +295,8 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
+	drm_bridge_get(bridge);
+
 	mutex_init(&bridge->hpd_mutex);
 
 	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
@@ -342,6 +344,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 	mutex_unlock(&bridge_lock);
 
 	mutex_destroy(&bridge->hpd_mutex);
+
+	drm_bridge_put(bridge);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 

-- 
2.49.0

