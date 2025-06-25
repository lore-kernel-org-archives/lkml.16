Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCB22DFA3B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869956; cv=none; b=O3b1HDfS14dJHdyJqJsAEXZLKVT46kMYPm7r1YkYY4RydP1yIA6K4cMcZEDn1R+aCYiYdofeUsfInFN+dSOdoPaaXSuCERGrR8h3wfW3FI0d6J7/ftpBKIYtvxHsZLZKoxIIDEvGnmdNK2gLQGSgH+V88pkjVMLzi+HewklQOfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869956; c=relaxed/simple;
	bh=m7UvP12KnQadhngbCKfqy/TuW7Y1mBuhVo9H0JkEPeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTXBrXe/YPhjXmYZfDT9ikpZJZYxnzHQYsu6SSXZg20zpQj1kRiZMYxTZlgVOhL9fSmA05tUZLk70xB7FJVmFZ1GqVjk6O/fNyMaLO/s/PefBBmShN9PCwqIACjrTWzrYWJK4OJHwnKQPSYc9W3Xf9hjBzrukfCKbPdg1GqSD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bgu9urFJ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bgu9urFJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33E5A44394;
	Wed, 25 Jun 2025 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZC8kTFkNZUH26dMbIXrbVtlmYb027xrF/4ZDarIWrE=;
	b=Bgu9urFJn7fQvdoXTxamXVA6Y+iMoDpD1Jv0U1vY7Ye+VQJ2KhNO/HbvWlKYRx1ThK7FNQ
	cmCh7t+HnwpTR5JP44m+cqUSNpXKYJDYm9CDLYh6Pl6UPCdwBlWBEgT/E/TVdt8C2Y+HkZ
	c08UuP6eZvUa29lML47DN4QJ99xPwwzGPdXdainOUymoCGEmRL+wcz08FRT2bbCx5VGp/f
	ZYew8NlIi/buQWk5UFLVLB5Yh4vxZQ1YBfPxBRfYqRCBfs9F3q5VE+BHDnzTuqWn7BUsxP
	LGlLrJGKVbgdEio4AO7ah+sV1DtdO+H0PmXEqSS6TpypvDX6j7mW+42R0rUp/g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:12 +0200
Subject: [PATCH 08/32] drm/bridge: cdns-dsi: remove redundant logging
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-8-e36bc258a7c5@bootlin.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdpr
 hgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Now there is an equivalent of this dev_err in mipi_dsi_attach(), valid for
all DSI hosts.

This avoids the need to access the @name field in struct mipi_dsi_device.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index a57ca8c3bdaea9d4d15dd23af221c111b7319ac4..005aa6121227b2f7ac682f3b724e4518e8e5f721 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1072,7 +1072,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	struct cdns_dsi_output *output = &dsi->output;
 	struct cdns_dsi_input *input = &dsi->input;
 	struct drm_bridge *bridge;
-	int ret;
 
 	/*
 	 * We currently do not support connecting several DSI devices to the
@@ -1093,12 +1092,8 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	 */
 	bridge = devm_drm_of_get_bridge(dsi->base.dev, dsi->base.dev->of_node,
 					DSI_OUTPUT_PORT, dev->channel);
-	if (IS_ERR(bridge)) {
-		ret = PTR_ERR(bridge);
-		dev_err(host->dev, "failed to add DSI device %s (err = %d)",
-			dev->name, ret);
-		return ret;
-	}
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	output->dev = dev;
 	output->bridge = bridge;

-- 
2.49.0

