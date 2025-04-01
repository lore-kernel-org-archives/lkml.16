Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB521E47CA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494050; cv=none; b=AIyJdcKUlW2RywoXzxKO2hILkS2E1dRo526LUEccSydzHMTS2MpKD2XrHwBcsBlAGkRZ9FRn8guRKJQgmFodfLddoF9EpACBVZdMdgTDfPtRif6A+ct3fz87G0tRGFnjjiiP8UnIU1nvb9mhQnmLnQnEZ3q8NIRBD4YiFJ/oFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494050; c=relaxed/simple;
	bh=zEgF7zl+qaVDn5TiUTBaHD0fanWnAVJNnO4sgNc2+7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ch+A4mC3VwZ3godavoGOn+VV90S6qffcCmagGyNJs65c1/S/V41L8NdVyiKVjA814UiXHpt6L6spKxRJCljvcG1WMkfizIqrq5rd8e+HXHp1INlW9ArnDrYagWmszMslxpI2p1BGoEfAEDCixq/VXocxnMEjS2QQMpSTFWZNSBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qau5xGl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qau5xGl6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFDF2C4CEE5;
	Tue,  1 Apr 2025 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494050;
	bh=zEgF7zl+qaVDn5TiUTBaHD0fanWnAVJNnO4sgNc2+7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qau5xGl6OB9AKddGdNpG6XVR0zwA2OQz5l+Em49VJjJE/vWVaRhN7lEuzRsMVzzYE
	 qd6J2jvsDJkYapT6lTchrye3wCthU6ZoGYZ+NVDfUNFgeoHJh+P5XHgw2pzfBlNV3y
	 WceeH/C5l5R0GKUxyQ/eFlx1xurPhz5e29OW/OHOJxTYTDHnRFlv5IYZKUwDTLC47y
	 +bvXhm/oQF/046pwtBhhGH7n8484EECLT6Hpa0H5wvHu3YftNsRRl5qLbbLmVqI+By
	 dIPIrehjBxBLqLY4GJupIf+UsrSBjRg6tP0tillx0NHZctm8rp0HNO0S8TvRKRowq4
	 5+G6IVfxTZfIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB778C36018;
	Tue,  1 Apr 2025 07:54:09 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 01 Apr 2025 15:54:55 +0800
Subject: [PATCH v3 1/5] drm/bridge: it6505: fix link training state HW
 register reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-fix-link-training-v3-1-7f60f2ab7b8c@ite.com.tw>
References: <20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw>
In-Reply-To: <20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743494115; l=1768;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=L0iJ7cK8igir/+LkaX0VG1u/Z4JkZspdyQ1kUW040to=;
 b=3ZeAjApBbdwUWtMUrKLUV1ulA0WRkCQpNpD6DDC5ha8kUO1G867Jt6ap/VMWoIpEtk31xTf/J
 WBUmO6lxMOKDf05sT8nNeku+/xueuidinyq4rQh19OeBkCUDIIx09Px
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

When connect to a DP-to-HDMI device which does not connect
to HDMI sink, it will report DPCD 00200h with SINK_COUNT = "0",
and issue HPD_IRQ when SINK_COUNT change to "1".

IT6505 can not recive HPD_IRQ before training done and driver will
force HW enter training done state when connect to such devices.

When HW is force to training done state and restart link training,
bits FORCE_RETRAIN and MANUAL_TRAIN at REG_TRAIN_CTRL1 must be set
at the same time to reset HW state.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..b47042dc06bb1e1dfd92bc0dc6d69dc918a140ba 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1806,7 +1806,9 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
 	mutex_lock(&it6505->aux_lock);
 	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
 			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
-	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
+	/* reset link state machine and re start training*/
+	it6505_write(it6505, REG_TRAIN_CTRL1,
+		     FORCE_RETRAIN | MANUAL_TRAIN);
 	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
 
 	while (timeout > 0) {
@@ -2377,7 +2379,7 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 {
 	it6505->link_state = LINK_IDLE;
 	cancel_work_sync(&it6505->link_works);
-	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
+	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN | MANUAL_TRAIN);
 }
 
 static void it6505_link_train_ok(struct it6505 *it6505)

-- 
2.34.1


