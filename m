Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACCD27A13F;
	Tue, 15 Apr 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702926; cv=none; b=mCvBh2A1vp/N/L77KF90LjK/iS9xROcJhSCt6tqKZ/ryTLBJm8iCUcwrGxf91YoTJLBRSRLp/jVgoV9wSkGrn9TcTL/jNviKZHZ0axIKfzaqNtEPL9JSxH5vx2DShACGwjU9JBJRPpnbtK0UIFITgBRyHwqp9uGeNm1TQgDxOsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702926; c=relaxed/simple;
	bh=NnA1MjE1iS6qh1kJ4h8uRlhFyDx9zS+qVFI5xM9AivY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3UZmoTQzF52GV+AhLAq3YVYSOsKh2myLA6iTjNn8gZmZ+1EJQUGtX8nR+E1BV3aUzM2irn59CDz45Pjy98fMk5OuxGpzyTbnlCTbH4tPNsnt8ttC9fsWQJtDMUcGKLQz3Ib0acuGexBadp1dInscs8BPb9UuvNLk8UJF0ktOc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzytD6AH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzytD6AH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02B1C4CEED;
	Tue, 15 Apr 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744702925;
	bh=NnA1MjE1iS6qh1kJ4h8uRlhFyDx9zS+qVFI5xM9AivY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UzytD6AHr9B5rgzeHRkdAHcgxDZaa0zv+755PTpNfXnXowsH2z9m7xl69U8Ujr+AJ
	 MOOISO8HVYn6yucLa0CIQiZ5IHuHnHRDRutdsPFgPp825udbuzO8CgYhJhpQwlr2Qz
	 W3ey1yeVckD9+LKRBp0S3mCVsLtzeY2aCJQ7NX3n4/Q7UXGufKblmGgTbBIcGb8ONs
	 i5wRPRMwq5WuUp+141/FfdwDrFaHU7wy/Y8E5t6EUk0a9N3xiLgqHA0KuZ7ZCKep4S
	 n8P8fRjlRGS3FYIfvkVL04RseJ2yVwdCMzr6ZhFWPeLWQaeJG7epKA05JTZBzRboma
	 7m+Wzfj0z+pWQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u4avi-000000001se-0Fwd;
	Tue, 15 Apr 2025 09:42:02 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/2] ASoC: codecs: wcd938x: fix mux error handling
Date: Tue, 15 Apr 2025 09:41:44 +0200
Message-ID: <20250415074145.7202-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415074145.7202-1-johan+linaro@kernel.org>
References: <20250415074145.7202-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change added support for looking up an optional mux control
before falling back to gpio control for us-euro plug selection.

The mux framework does however not yet support optional muxes and an
error message is now incorrectly logged on machines like the Lenovo
ThinkPad X13s which do not have one:

    wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)

Suppress the bogus error and add the missing mux error handling by
making sure that the 'mux-controls' DT property is present before
looking up the mux control.

Fixes: eec611d26f84 ("ASoC: codecs: wcd938x: add mux control support for hp audio mux")
Link: https://lore.kernel.org/lkml/Z-z_ZAyVBK5ui50k@hovoldconsulting.com/
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 585a92772c2a..55031c16e4e1 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3271,18 +3271,13 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return dev_err_probe(dev, wcd938x->reset_gpio,
 				     "Failed to get reset gpio\n");
 
-	wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
-	if (IS_ERR(wcd938x->us_euro_mux)) {
-		if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
+	if (of_property_present(dev->of_node, "mux-controls")) {
+		wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
+		if (IS_ERR(wcd938x->us_euro_mux)) {
+			ret = PTR_ERR(wcd938x->us_euro_mux);
+			return dev_err_probe(dev, ret, "failed to get mux control\n");
+		}
 
-		/* mux is optional and now fallback to using gpio */
-		wcd938x->us_euro_mux = NULL;
-		wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
-		if (IS_ERR(wcd938x->us_euro_gpio))
-			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
-					     "us-euro swap Control GPIO not found\n");
-	} else {
 		ret = mux_control_try_select(wcd938x->us_euro_mux, wcd938x->mux_state);
 		if (ret) {
 			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
@@ -3290,6 +3285,11 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 			return ret;
 		}
 		wcd938x->mux_setup_done = true;
+	} else {
+		wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
+		if (IS_ERR(wcd938x->us_euro_gpio))
+			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
+					     "us-euro swap Control GPIO not found\n");
 	}
 
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
-- 
2.49.0

