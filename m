Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2901F2F94B6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869975; cv=none; b=BWEn3cDz5bhh4Yhk1+zf2EP80Et5rCsZXditW04IMDo9+tduU2Mp3a5xhdt1kO4j/lu4hzuRvHb6p80k6uQyVxOaxnkFRXKoLQtcEja0w8zjzokj9a5lTnTrAumMEjf/arRsL7xVXfK7zP1IMmDKwFick/hacc0iF5Dif1UCgFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869975; c=relaxed/simple;
	bh=i356nV3E+WqRX4N4jyas7zC19vro1L1eMnCahJBbnSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lpb9lhWpFdAqYojhXCHoCUbHfHL4IeY8UrPuslNjKMo/OCbV4SwSP64pl0JTfZB6P+upayAIqWKstND5Ox6+9efoZMjBVJ1NViw7gsRA++eEfRMY1oeMmi5Pu6l/6KHqwP1HbbLpuDPdwBmcw9NLQCOV9lnc7rM6h22jHH+XmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dOvyr7jG; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dOvyr7jG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B31744384;
	Wed, 25 Jun 2025 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750869972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7tzRXRqkINuJKPgE8lcyGCUuH8C2X0Lcpz0YAjSzs9I=;
	b=dOvyr7jGVevjvCZhQ6ESQmbdwjNNom9UwORfNKf9s/HQRhZyjUEpfGy6P30qbv9dD5CiN/
	+muiQnGVvnzt/35i1zGk5YrbpfE+h3NQIrz4+NzF43/OwiQSjHrMBl2vuRB8Jbhav7p2f/
	RpyvTPX92Kw/2iATbgGqJioBU368ryiPsl1qfrpVNERgekkV/ItR4MOGMOpPP2ylPQKR9N
	tx4rYidm6q1iYWZ4+sGPm8Jc7T5kFdi5+ZPNf2+idJAurv9IeMwaLyRXyJm3AYJZWwVqgM
	u9QtXAjzpUTFquO9ju0h1W4SUenEBcxmDNn0+xmDSOa9+dDnMVn/+G2/89+aZg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:24 +0200
Subject: [PATCH 20/32] drm/msm/dsi: convert to the .attach_new op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-20-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepudejnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This op does not pass any pointer to the DSI device, so the DSI host driver
cannot store it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4d75529c0e858160761f5eb55db65e5d7565c27b..79cdb34074de3662d535a8d9b386c5399c8d23ba 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1610,20 +1610,20 @@ static irqreturn_t dsi_host_irq(int irq, void *ptr)
 }
 
 static int dsi_host_attach(struct mipi_dsi_host *host,
-					struct mipi_dsi_device *dsi)
+			   const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	int ret;
 
-	if (dsi->lanes > msm_host->num_data_lanes)
+	if (bus_fmt->lanes > msm_host->num_data_lanes)
 		return -EINVAL;
 
-	msm_host->channel = dsi->channel;
-	msm_host->lanes = dsi->lanes;
-	msm_host->format = dsi->format;
-	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
-		msm_host->dsc = dsi->dsc;
+	msm_host->channel = bus_fmt->channel;
+	msm_host->lanes = bus_fmt->lanes;
+	msm_host->format = bus_fmt->format;
+	msm_host->mode_flags = bus_fmt->mode_flags;
+	if (bus_fmt->dsc)
+		msm_host->dsc = bus_fmt->dsc;
 
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
@@ -1663,7 +1663,7 @@ static ssize_t dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops dsi_host_ops = {
-	.attach = dsi_host_attach,
+	.attach_new = dsi_host_attach,
 	.detach = dsi_host_detach,
 	.transfer = dsi_host_transfer,
 };

-- 
2.49.0

