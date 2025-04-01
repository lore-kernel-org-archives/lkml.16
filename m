Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA678F4F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494050; cv=none; b=PQvThrfBkk0x88IQ0ZwG1Rqhl06yrpDDcMTX6uQPALvEDM3yamgP3L4x9JOzCBn2msXR0YTULNS67+TJzS9xeCTzBaoEg8Mnu5LZsif8IAuFrhr1z73T0KhG1EowD/B9lA6okxjO6Sk2Z2UBX2RoHPxIAiWol5oZqh/G63i9PPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494050; c=relaxed/simple;
	bh=Sv32eWrLlAonnSTDakaOBa/sXD+tsT+ZOUml/oxxLoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtfi1hCYAkzTg0rWtasqTU7k5yILTYtXzIv8lL+ZGVvVg7vCA0J4vz0TC4UVE4qT3/woaFnbcObYObDcgQBClntGt0afA+p46oz9OnrO0PagQCflMud88p1+BwThAHQirLFykIL0zJMPgRSG8GzpV6Ycf1m7zUB3erN3ZXiJHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2kU+knL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2kU+knL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AA6AC4CEE8;
	Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494050;
	bh=Sv32eWrLlAonnSTDakaOBa/sXD+tsT+ZOUml/oxxLoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q2kU+knL8EKAB49dKjL+m0Zirqd9SEg7hPQZTosOI+F2kvzmG+Oi5b95MJgJDsuXZ
	 xJQTNpLVAXN3ATzfayT0xmf+4HB7iksbBXH76vsD39jPjxFWuwTYLCATKEnRilD7s2
	 EyZ5u4a6RipKntXNhTpriOgg/+LkECH9dhPY0wAjJ0gkuD77S1g6f6l8Uj4D/Cj13U
	 cmtesQn9Gft6K58X5Q/SgujXJcvBN+8Oj06v6gdXv60cbJ2V1ZuvrCOCIxWwWLosOp
	 pZwpw993rNZMl2SYDbhKIwjHa6HmMOMy1k1gkTqy+2PVJx7RNXY8N3u2EUo8XnKjUM
	 W344kX3DWU6zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEF7C3601B;
	Tue,  1 Apr 2025 07:54:09 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 01 Apr 2025 15:54:56 +0800
Subject: [PATCH v3 2/5] drm/bridge: it6505: check INT_LINK_TRAIN_FAIL while
 link auto training
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-fix-link-training-v3-2-7f60f2ab7b8c@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743494115; l=2919;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=jMRBMAfZXvgPInoi2ZG2fBNx0MmsnJGVHvslLR/IkmI=;
 b=FuXxX/ovmPDCHKbUAFA7caxlmx80XxMxkp+RAqdCKlrQlUi6GXG2gdBppNvdFspOciGhZ+IiP
 m3mlyq/H4mSCy6vMYoybAaIxroG2zNlf+DK3NPPHHDHZCweQ5NN9QAC
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

When start link training, interrupt status INT_LINK_TRAIN_FAIL can
use to check link training fail and no need to wait until timeout.

it6505_irq_link_train_fail() remove from interrupt and no longer used.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b47042dc06bb1e1dfd92bc0dc6d69dc918a140ba..7f6227c278a51358c70a3de93454aafeef64f2bb 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -821,8 +821,8 @@ static void it6505_int_mask_enable(struct it6505 *it6505)
 	it6505_write(it6505, INT_MASK_02, BIT(INT_AUX_CMD_FAIL) |
 		     BIT(INT_HDCP_KSV_CHECK) | BIT(INT_AUDIO_FIFO_ERROR));
 
-	it6505_write(it6505, INT_MASK_03, BIT(INT_LINK_TRAIN_FAIL) |
-		     BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATCH_FIFO_OVERFLOW));
+	it6505_write(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR) |
+		     BIT(INT_IO_LATCH_FIFO_OVERFLOW));
 }
 
 static void it6505_int_mask_disable(struct it6505 *it6505)
@@ -1802,6 +1802,8 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
 {
 	int timeout = 500, link_training_state;
 	bool state = false;
+	int int03;
+	struct device *dev = it6505->dev;
 
 	mutex_lock(&it6505->aux_lock);
 	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
@@ -1814,6 +1816,17 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
 	while (timeout > 0) {
 		usleep_range(1000, 2000);
 		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
+		int03 = it6505_read(it6505, INT_STATUS_03);
+		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
+			it6505_write(it6505, INT_STATUS_03,
+				     BIT(INT_LINK_TRAIN_FAIL));
+
+			DRM_DEV_DEBUG_DRIVER(dev,
+					     "INT_LINK_TRAIN_FAIL(%x)!",
+					      int03);
+
+			break;
+		}
 
 		if (link_training_state > 0 &&
 		    (link_training_state & LINK_STATE_NORP)) {
@@ -2693,14 +2706,6 @@ static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
 		it6505_enable_audio(it6505);
 }
 
-static void it6505_irq_link_train_fail(struct it6505 *it6505)
-{
-	struct device *dev = it6505->dev;
-
-	DRM_DEV_DEBUG_DRIVER(dev, "link training fail interrupt");
-	schedule_work(&it6505->link_works);
-}
-
 static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
 {
 	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
@@ -2765,7 +2770,6 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 		{ BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
 		{ BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
 		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
-		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
 	};
 	int int_status[3], i;
 

-- 
2.34.1


