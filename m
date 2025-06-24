Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E7122D78A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757086; cv=none; b=nCjhcaBfs4HY6GWdx6CAjDesFtSUwlwTCaFe58W54Z7gaXiIF/Zms+tHegiizpWPH6LJ6e7O+FspuYVn9bHLgUP3mfMpU1oWf+wwtOSUlmvHhgyKlGwjD19slqWGfWBjKXMewveya3ws2XJ1aEbLHltI8QXwdRg0XVY+B6EMsAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757086; c=relaxed/simple;
	bh=Ein54qI7rmxnJ9OTf6MtXF+MZAoUwZCXJsSkm5CT8gQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iU/xAjOYifps9CeUX8XMtHaztoJwnX71CKJccTc8D4N5woSN6qljoGE2jD1AHpn994d44PxjIqi+RWwzsEy6Krb3SUV6M1vRTCCKWp0h2mlcuyweL5oFHM/6p666PU/g4DkfwdZ/E6iSpH/h4dNAYuDo0uuyBTABnpiRkD+FS0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Qd+CkRi0; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Qd+CkRi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750757084; x=1782293084;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Ein54qI7rmxnJ9OTf6MtXF+MZAoUwZCXJsSkm5CT8gQ=;
  b=Qd+CkRi0GQ8F1k/I2x74Y7r4QmgdbXDiPsqAknboB0GS1yX1YfCcNf0F
   Xy3B+ZoyM3aXVQl4ELpaPI4y0PWI91iZKktx3S6cLpaT6LHSH+EKFCz+Y
   PxOMSp76HS2rjnhbqFUgUKaSWFgEA5rD6eVhuo54D5hvohOmuK5mPkk6Y
   rx78ZofVfgX8ogNZc12n9T3RdHkICLh2AgDPewHDIlgMw4UNQu9MUq0WM
   nrIJ7NmSPO3uhyhJ1QeNAY201cosXrayFReWJGXMs/LtdSUdseOUPKj3c
   tqNQcbraIWMbeDN50ZFXJhq7dRLsEL+W0eRHi77tQUuCZtXpfr7IQWHx2
   g==;
X-CSE-ConnectionGUID: mOi1Uhg9QQ68o5XA/b6ZIQ==
X-CSE-MsgGUID: 8FTTMBV6RAqJ75glG+jTrg==
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="48218059"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 02:24:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 02:24:34 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 02:24:29 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 24 Jun 2025 14:54:15 +0530
Subject: [PATCH v4 2/3] drm/bridge: microchip-lvds: switch to use atomic
 variants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-microchip-lvds-v4-2-937d42a420e9@microchip.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
In-Reply-To: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750757054; l=2189;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=Ein54qI7rmxnJ9OTf6MtXF+MZAoUwZCXJsSkm5CT8gQ=;
 b=92vmKg7GGXHMY1DbRPHHVGB6YwkchhJrwJe06eHgs5CaoCCeqg9/Lyawg2IVE81Meq7Uhcc6J
 ba97tJnmur+CHDYuxZqQyDsTDqnFI9Uf4GrTjtt9rPkvpDWhB006h2U
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

Modernize the bridge ops to use atomic_enable/disable.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 42751124b868..e4ff46b03d54 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -111,7 +111,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void mchp_lvds_enable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	int ret;
@@ -127,11 +128,26 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
 		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
 		return;
 	}
+}
 
+static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	lvds_serialiser_on(lvds);
 }
 
-static void mchp_lvds_disable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+
+	/* Turn off the serialiser */
+	lvds_writel(lvds, LVDSC_CR, 0);
+}
+
+static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
@@ -141,8 +157,10 @@ static void mchp_lvds_disable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
 	.attach = mchp_lvds_attach,
-	.enable = mchp_lvds_enable,
-	.disable = mchp_lvds_disable,
+	.atomic_pre_enable = mchp_lvds_atomic_pre_enable,
+	.atomic_enable = mchp_lvds_atomic_enable,
+	.atomic_disable = mchp_lvds_atomic_disable,
+	.atomic_post_disable = mchp_lvds_atomic_post_disable,
 };
 
 static int mchp_lvds_probe(struct platform_device *pdev)

-- 
2.43.0

