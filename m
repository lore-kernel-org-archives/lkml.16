Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429EA2F546A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869971; cv=none; b=jjns9zsp0jBdOptg1BN611BjhAepQE7SeiEPE/QM/ZXiHx2/I/WfKu19qCnfX6uBxqnmLnVzxWFsCSBcxIK2MRUYQYvqd8WT3fhDee5KxD6IVP+dzgVJePd6pUxQQQS0xwDkkNb4A8Pes1yngn1rNoHyd7QysTpGeppxy5ZBAbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869971; c=relaxed/simple;
	bh=fN3+vs+e/Y4Y/16ONyFqspsFCnYGAwSRcq4Om5YfDGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoymLyLYL6bbRMCptmynA/hLHnROKloe2iv2a/Y8dppl7HlPCxmSCsquAzrbpjVpW5FCPRucQEWLEvquoJCkPB7S98yS2BVWLya8jCEQzpI0NGOmW12530A+UfE9DjdQbAgURZlBdcJft41/fy6BiBk/obKNHOz7j76BrNwxNyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Iv2+RTku; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Iv2+RTku"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 418814437D;
	Wed, 25 Jun 2025 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JYfe/0tPhHRlZx1xH7v0PmfNAhMMOxY2TLnE45xUSg=;
	b=Iv2+RTkuiMNf6TE0Y/rn64SkJkPIz0WbdokbaVVuaxzgAUsAMww/JlwNipd8nTnLXA/Mke
	5rqqb10D5huTsYXbRLLMqIj5yH6IKbpO5eTxAw/GKLc/maw7a1W532XBwiRQ9rDG/oRq50
	PpPRpRdaR9AVHWBh6FPDMioXvBrHY/ppqkJfjv7bIvu6Zk5q5GK31f+vRhIc5rrsHiiJNf
	D5fNFahUhqj0zzWNVRRYCH32d8MmXrsx8vCtpjrnwjcqjdK8Yxl0cgOMN0EIcXjYygdvyh
	MmVarSLx1k75IL4K5nRBc+efIZIk8OBvCG+iyeRuf58mz3xXaK4I6xzR7K851A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:21 +0200
Subject: [PATCH 17/32] drm/i915/dsi: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-17-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This op does not pass any pointer to the DSI device, so the DSI host driver
cannot store it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
 drivers/gpu/drm/i915/display/vlv_dsi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index aa566ad3f5cd72fb8f9440e2645da0047da222b1..ce5d7b77444d2ac7bc71aecc150d42e2dbb59e0f 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1780,7 +1780,7 @@ static const struct drm_connector_helper_funcs gen11_dsi_connector_helper_funcs
 };
 
 static int gen11_dsi_host_attach(struct mipi_dsi_host *host,
-				 struct mipi_dsi_device *dsi)
+				 const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	return 0;
 }
@@ -1826,7 +1826,7 @@ static ssize_t gen11_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops gen11_dsi_host_ops = {
-	.attach = gen11_dsi_host_attach,
+	.attach_new = gen11_dsi_host_attach,
 	.detach = gen11_dsi_host_detach,
 	.transfer = gen11_dsi_host_transfer,
 };
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 346737f15fa93264ab8791912cc4cc128f2f3324..5f73919c4bb626f8c293e383479ce393869e47d4 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -199,7 +199,7 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static int intel_dsi_host_attach(struct mipi_dsi_host *host,
-				 struct mipi_dsi_device *dsi)
+				 const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	return 0;
 }
@@ -211,7 +211,7 @@ static int intel_dsi_host_detach(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops intel_dsi_host_ops = {
-	.attach = intel_dsi_host_attach,
+	.attach_new = intel_dsi_host_attach,
 	.detach = intel_dsi_host_detach,
 	.transfer = intel_dsi_host_transfer,
 };

-- 
2.49.0

