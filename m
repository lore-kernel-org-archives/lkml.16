Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A22857D2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438516; cv=none; b=VlNjwEP5wF6i7wBzoeLNJnW+iKIpPnEsJ6SzrAKNn2/u9Vfpe+HgVsh3RA2QZgK612eKO8LgUama2j5YtCPis1zi+XeE2IlKwYB76WH0gzfwxWebCwbCh4YsAn795+RUoQydibCp8IKwz9ffrPLmjlejUN6RATuJli6fE2gGo0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438516; c=relaxed/simple;
	bh=g+xOFZ57Bsw1wMhdPNhPQ3EPoGnnqN87CcjYVj3CF94=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kajKT5s5XpmYBqaE8S5mp4HdYxvbJ4yGx+Sf+dlBoyh3c0fJd9W3Av/PtBujfHxBfKqUCV2VRYmSFQXH2lzlDxjezw5lMwEYykiV+aqvLmrBhk4Xo/PNPWsBG0Wfcsn64h2DdBr4qe7TJC0IgpCI2wlKyGzUNG/BsnxGT0zxgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDDD7Asz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDDD7Asz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9EBC4CEE7;
	Wed, 28 May 2025 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748438516;
	bh=g+xOFZ57Bsw1wMhdPNhPQ3EPoGnnqN87CcjYVj3CF94=;
	h=From:To:Cc:Subject:Date:From;
	b=aDDD7AszRyVaRBu6mbucjjvqIYsnL0MnUri9+IbJl0PBXTbVzH38hkf9h4zKvjNLX
	 H5Gqg7STXWEFlRHOxo5ri+u07BldrSB7YTKT8JhNqu5R8JIHpPhy42QYBPGVXWA0Hw
	 YkbZTV2kapsJuXU2/uAe+JJ0vunTY+SNBVRW8WsE3sSPzknJVvauNxihQPEY7dN4pS
	 GtsCEfBRBAeVajEIwGIVvMGaCkn+/B1D5czx3PzmU6RCRcewIL8Je0pNTvmJ7babpk
	 YkGFPULzGg1PO0tMTYKRXjPObZDBgIWN7vIlVG2hJYwjk1UdlCOZl2sJoiWzL/wFUS
	 9OWbPrRr1bNJg==
From: Michael Walle <mwalle@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
Date: Wed, 28 May 2025 15:21:48 +0200
Message-Id: <20250528132148.1087890-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bridge has three bootstrap pins which are sampled to determine the
frequency of the external reference clock. The driver will also
(over)write that setting. But it seems this is racy after the bridge is
enabled. It was observed that although the driver write the correct
value (by sniffing on the I2C bus), the register has the wrong value.
The datasheet states that the GPIO lines have to be stable for at least
5us after asserting the EN signal. Thus, there seems to be some logic
which samples the GPIO lines and this logic appears to overwrite the
register value which was set by the driver. Waiting 20us after
asserting the EN line resolves this issue.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
I couldn't find a good commit for a Fixes: tag and I'm not sure how
fixes are handled in drm.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 60224f476e1d..fcef43154558 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -386,6 +386,17 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 
 	gpiod_set_value_cansleep(pdata->enable_gpio, 1);
 
+	/*
+	 * After EN is deasserted and an external clock is detected, the bridge
+	 * will sample GPIO3:1 to determine its frequency. The driver will
+	 * overwrite this setting. But this is racy. Thus we have to wait a
+	 * couple of us. According to the datasheet the GPIO lines has to be
+	 * stable at least 5 us (td5) but it seems that is not enough and the
+	 * refclk frequency value is lost/overwritten by the bridge itself.
+	 * Waiting for 20us seems to work.
+	 */
+	usleep_range(20, 30);
+
 	/*
 	 * If we have a reference clock we can enable communication w/ the
 	 * panel (including the aux channel) w/out any need for an input clock
-- 
2.39.5

