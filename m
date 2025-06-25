Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9301DEFE7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827407; cv=none; b=LAdIzV27eL16mdW734FKnFDXLRtsC0/U+TXY3rdOy3uJDTzP4WnHg1Jn2/E5P9jkuYlQhLnqjnUJgKGmJ3ZhiDdSIM88EzoBX9IHbfra37mhyGKLwBRg/5mlOt8cjOpixg5+sFDwb5rOhTBzpley2kIRjUjV2ReeHRKyLRq8Spw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827407; c=relaxed/simple;
	bh=3nqEZxV/Y5uq+XwWCf1wbzoSm47wfpCQv/tVq85eryQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HnvUUwdN4vm10oIP2MZgQz4k2d508Mo4FAcg5Wbnrc6O7fO+JjLTsGPEzhKgwSGZ9AnBT4NEp6PS2ADa9KrXGZAzuWNdWwArjLQbO49yNbJ49uvzlrNXjwUKXrcgFHvB3BzREr5OiOaYbRCOE9mO1C/QFKal0VPVW3G+v/Ve8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1q6BGWl3; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1q6BGWl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750827405; x=1782363405;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=3nqEZxV/Y5uq+XwWCf1wbzoSm47wfpCQv/tVq85eryQ=;
  b=1q6BGWl3gWg9BHZPTOLv8OCa4wvwco3OL32tgj4Hh458ydCPpvoHgv9z
   twTp3+TpUvW6IJnp3+dEr9SqWaWbBoio7F2lPv0Dpw6Ped6BZYGZUwwbH
   JrhLMyr4ZlpQa0c8RnEBwFGxyTVWyf7oHxXlPnF5JGaSN7Ks6lNyItXXF
   kUf/8M+7C7VkAmopeUfVEiiDjgfFX/gsIEcmk2WdybWDJdAsHMJYEkU04
   XGbAD/IpP8IwJGh1Xm5zRrGA6NAj0NA/NZgGQl+arcG0WWnB118FCfPME
   ARAI6r6ERC6xzwSHilCYW4PQP3CXVUIb/Zfv9i9erT5/49vTP4TJIG9LF
   g==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: tiE5eSZaTme32b23sLO4TQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="42713914"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 21:56:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:31 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:26 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 10:26:10 +0530
Subject: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v5-2-624cf72b2651@microchip.com>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
In-Reply-To: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=1753;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=3nqEZxV/Y5uq+XwWCf1wbzoSm47wfpCQv/tVq85eryQ=;
 b=4sdzPsgpBa4OlnMTfa/2tULoTtkrEe19367c/589Yny1LsbWdncOmxsb744sWmSNmJtkcdHMs
 Kz2M9gtS92sA3b/dmDiT0U19OeSBoOxF4/AQHGY5kC632yNsUV1DnXY
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

Replace legacy .enable and .disable callbacks with their atomic
counterparts .atomic_enable and .atomic_disable.

Also, add turn off the serialiser inside atomic_disable().

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 06d4169a2d8f..c40c8717f026 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -111,7 +111,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void mchp_lvds_enable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	int ret;
@@ -131,18 +132,22 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
 	lvds_serialiser_on(lvds);
 }
 
-static void mchp_lvds_disable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
+	/* Turn off the serialiser */
+	lvds_writel(lvds, LVDSC_CR, 0);
+
 	pm_runtime_put(lvds->dev);
 	clk_disable_unprepare(lvds->pclk);
 }
 
 static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
 	.attach = mchp_lvds_attach,
-	.enable = mchp_lvds_enable,
-	.disable = mchp_lvds_disable,
+	.atomic_enable = mchp_lvds_atomic_enable,
+	.atomic_disable = mchp_lvds_atomic_disable,
 };
 
 static int mchp_lvds_probe(struct platform_device *pdev)

-- 
2.43.0

