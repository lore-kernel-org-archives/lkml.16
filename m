Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF22E6124
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435209; cv=none; b=Il/xr1WIa0GMzPLHUejGMJMWnKtdPmANQSqn+3S3xbvnPJ65PLRBwIyPEebhntEB7vOLBwLr7vWPn92JsmBC3viIsNLzeY74jcYx6uW0xSWrxmQLlLp3nprT7VRTcKlp4qRVas5ysKQ8glC/LcH1gouMSyX5eK/K5hAqJpN/ezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435209; c=relaxed/simple;
	bh=TfMYwL+r0R90XXTTIhY6bkfRQxHkjcljZFjyyv8maSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHUbV3nGiJCaNEhU6sAqfICyn9G+st2FmuzHdxj1nU+0Q34DKAtL/91zIUOlrJYhSPut8E88+8tqoBfhqQ91D9f/IWzPP+bFoMrPw7/KjrGKurKfI+b44uZRbkILifBcxdVhyMkrIuqe5o3MPBJ3a1QxoqTvAqTT9OTQs/0JjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VhsG71ng; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VhsG71ng"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BB76432F4;
	Fri, 20 Jun 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750435205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vcq0bNKLXTxzoqOoWjjPyn3SmlF4gRI3gJ8lrJHFXgk=;
	b=VhsG71ng2ZvaxZ82r+hClPmpmVm4p45TLz2WV8MPRebmpU1087B/+03FYlZ9eMVYVHOq49
	X1UiZC6Nka0aDhzcP0jgayPz7/H94NzmmED17GzdncSWjtYF/I9M7Vf15iW1hqVPegRSt3
	8glYMLZJLMkkClmxsNe2p8+GJbJTCu9n5QX23ajfZQraMM6R/UqxLOKp0Ee4UsYYfLr/Kw
	kCAk9Iq6DOihONiZLzzCLb0tD5W22J/Qs6odT+Ngwp/DsPvRn8RE53sGTirzGN3iKimvGL
	i4rAfYVXSMs0GC+xPuApJJ68T1D7XgZ2sPu4cbAxhH/u89UV+S6WkyMtYtiLoA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 17:59:55 +0200
Subject: [PATCH v9 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
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

To the best of my knowledge, all drivers in the mainline kernel adding a
DRM bridge are now converted to using devm_drm_bridge_alloc() for
allocation and initialization. Among others this ensures initialization of
the bridge refcount, allowing dynamic allocation lifetime.

devm_drm_bridge_alloc() is now mandatory for all new bridges. Code using
the old pattern ([devm_]kzalloc + filling the struct fields +
drm_bridge_add) is not allowed anymore.

Any drivers that might have been missed during the conversion, patches in
flight towards mainline and out-of-tre drivers still using the old pattern
will already be caught by a warning looking like:

  ------------[ cut here ]------------
  refcount_t: addition on 0; use-after-free.
  WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x148
  [...]
  Call trace:
   refcount_warn_saturate+0x120/0x148 (P)
   drm_bridge_get.part.0+0x70/0x98 [drm]
   drm_bridge_add+0x34/0x108 [drm]
   sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
   [...]

This warning comes from the refcount code and happens because
drm_bridge_add() is increasing the refcount, which is uninitialized and
thus initially zero.

Having a warning and the corresponding stack trace is surely useful, but
the warning text does not clarify the root problem nor how to fix it.

Add a DRM_WARN() just before increasing the refcount, so the log will be
much more readable:

  [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
  ------------[ cut here ]------------
  refcount_t: addition on 0; use-after-free.
  [...etc...]

A DRM_WARN is used because drm_warn and drm_WARN require a struct
drm_device pointer which is not yet available when adding a bridge.

Do not print the dev_name() in the warning because struct drm_bridge has no
pointer to the struct device. The affected driver should be easy to catch
based on the following stack trace however.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v9:
- change warning trigger from "refcount != 1" to "container not NULL"

This patch was added in v8
---
 drivers/gpu/drm/drm_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..0b450b334afd82e0460f18fdd248f79d0a2b153d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
+	if (!bridge->container)
+		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
+
 	drm_bridge_get(bridge);
 
 	mutex_init(&bridge->hpd_mutex);

-- 
2.49.0

