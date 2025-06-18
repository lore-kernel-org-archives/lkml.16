Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824BA2853F3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240789; cv=none; b=u+J/UwMA2RIzxoVijugQiral0MJAjtqY04D8OPHNwscaN2mjnkFZTuFopPXrHMuHKRwCu6jMRdC1UWibrcy6YFDM6c6q3CmmJHnf5oMrRLoa3X7Q1TqbaR2am3nXW3aUscCWdkXQKizT6ILxFEKpO+ofknmrLHYmDY/DIfgdq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240789; c=relaxed/simple;
	bh=CyQv33b09RvHl4nOFdkuxj7qIGokAYoC0TXSVeU5XvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM7JBnpLaVyGgBjj6fuz54MHE7jV+bmRHj+WXhtkKS+/YHNWYHNajm5B+D+nSMQqckRuDoE85Yj8xi03ezSa9A2W7cSpINz3zRuE3aT/3wKdjMayAptswfe8G6CjylawIDi/wZLDUtd0bJ8ZpOCyblLTbvASxEuSONWTILlaWkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gCeF45A0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gCeF45A0"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0814A17D1;
	Wed, 18 Jun 2025 11:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240767;
	bh=CyQv33b09RvHl4nOFdkuxj7qIGokAYoC0TXSVeU5XvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gCeF45A0fmquNkacgBzrQ36gp1Qkx6DoBIX1zUHyJes/13JDf73ffOvaJ0U1AhMfW
	 dlqVGnBC7TBOn3JTsB5VIa5JXURL144ihVYKDgB0sxLVef1BAyXpl7JdrRgtKygNIL
	 OiZzSU/FDWVWH95x4JhlPSnFPWegBnRkVyKfQ6+I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:09 +0300
Subject: [PATCH v4 06/17] drm/bridge: cdns-dsi: Remove extra line at the
 end of the file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-6-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=CyQv33b09RvHl4nOFdkuxj7qIGokAYoC0TXSVeU5XvY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo3+zRxirnMuQfMTECONQzyd7qv1sEh8AoZoK
 6sbY60qyROJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/gAKCRD6PaqMvJYe
 9UDzD/97Dz2GUH4Uu5er5xQvbd22dCoUAd/QUJlR3L10ujrOs/4quGGZNkmXEiVvBk3msxFMYz1
 9GQhv03i87x+Q3hl/pivdm2VycLD0xW4qJelAoLLTFzLGZQY1OdD/pL9jvIXgRrBplOopb07yZ9
 SJ3QeibiZnrljMAJ91ldn2yG6RKwHB9NDVV5crw1Mg9kYsqgGwJbZRqSVpdB31kAzq5Zx/oYNNU
 7mIKMC528MwOQScUxAOA0uWCYstwKYx43HAg0P0nI3kqQrgrWsUKfGtfBSjhgch/UO0r9mxuxee
 Mxv0NpIrhfTKSuQ9kBZxHQ22korkLPO444Gnei9puRzeT/cv291MRw8OQPfqziAJLBctiV/bM8Y
 jqgKRCs+m/wCETZ0K2wAk6i4UvWRh5nJm6Sk91l9Pv85vOK3rmPXD5keFZm9SuMYqIVX3DIJj/J
 naMY2cfEmRAU0a7Ei0eVsxbzw3pkYkz8I7sSJDaM0dzIzR2uZtL0fJ7/rZ5ZbpunZMtMf49D/16
 6WACrRxwhJqttSoj6AxzKqzWtJRwJF9WRhRD+aDX7nKxRkt2+FI79xUhTGWFzi4nG15Myq/fPDA
 uyLhpizWIzXEnDUYnfrAqM8sTuh6+p4/TvlEVaYc2dAhSB7BgYCoZAaznc7vVo0h8GutpNsFZGb
 G1t7g7hgtOtW3tA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Remove extra line at the end of the file.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 695b6246b280..0c7ad05b6e53 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1442,4 +1442,3 @@ MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
 MODULE_DESCRIPTION("Cadence DSI driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:cdns-dsi");
-

-- 
2.43.0

