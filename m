Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0893482FF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088439; cv=none; b=gBwlqJLKUg3EvF9b6XPgBT+lpKnCwlCE1L3k9RsQa5dAtCVAzaiiGy3wWjEdvqTg5H7Ld0nwrQ6WXN5LW517Qs43pwlKe4HOjrRFyiVsIN+vQfB8369Q0raigj69Fa9HBzhRVvSqkizZkzcKMMu+d/W/PUwFbd4I4DQKlJUMqiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088439; c=relaxed/simple;
	bh=y8LWt9HRv7KyRtBYLPqa8+GDokQcV8+yboEXU+KwbIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdmWvzk8Qn+XR6b0SkP3pUpiQr1I5ej42+F8l4mWsHbZXBFn5KXgfT+Gqf9rFkZkKcApTuRDdTqOSMpzEhfi/sXldI8/7LfOcujKz6N1X+HpH8hDHY8lMpmTya0mcWqr/Dju8OyIx9ulspvYrNzSX1BkOtLLbblz26FZNi5r63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d4F405nB; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VK38iCyK; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d4F405nB";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VK38iCyK"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bLZ2q4xzmz9spn;
	Mon, 16 Jun 2025 17:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750088435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i0dyI4MRX18W1XQPVub/atygkpPpTT9XkNbCtuNLz8U=;
	b=d4F405nBtgaidEOWwt0/9Ijnres1SntnusICovssYK/05rh985VqVC5tSbhcmmUGY+V/fB
	sVq19pyBzBfSh7jOkhXiNzq9y5lA6pGqHOKgzSrilewfT5Wye90YLP7AA3dJzEjvc5fmhD
	/4FSb0Z8Ywt/VLDMjahcnCTnEaFfbux/nCIFZpPjWGtHmdJ2vrfHj3HoCeR7NbezZRYTup
	ICHIqdao5mUaALCxihA/0oG++809d/mH+xoyiknb11WnWZ/JPeQFHt8yTLUeFbaCo5Mtdj
	IbTeZZlch9i840NYZ8++jkmEMzxTbBPn25kiYoXBPhbWXtrKl37DPfJEPYaa4Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750088433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i0dyI4MRX18W1XQPVub/atygkpPpTT9XkNbCtuNLz8U=;
	b=VK38iCyKphvhZzQkyIYlP7iil1wpU9+Y6B1UoGLZZ+W+aKmm+ZM0mtbrXq3yqAvzV1oxE3
	bwU93R6S5CAcnchdt+ZMFx2hNogebMJbYZB4iJHhtLPewPF3/Q9ZkAag9zRCcJ/pGWkXcR
	xpqp2NXdp0JF0XZ/arh4x+TCmqMhIbnTQMlji4I5Iwjt0GH8CKwIqUa/wr4qlAohuqM0no
	KHMpQddpXi64Ci+yHV9ikJBjkdyi6sU0lTVEo4QIwxZoEroX6c9qrUCHzRtQ9Y4fBRhwtk
	zt79AHZ6RWTbWbPPX4uK/Y6euHgVPbTa2CE9GWJUtLp+Nn7Us/cW7DjCQdcYmA==
To: linux-arm-kernel@lists.infradead.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: rpi-panel-v2: Add shutdown hook
Date: Mon, 16 Jun 2025 17:40:07 +0200
Message-ID: <20250616154018.430004-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: izkkms45zo414kq375membxy8gh3oueu
X-MBO-RS-ID: db10599e07852c9faa4

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add shutdown hook so that the panel gets powered off with the system.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
---
 drivers/regulator/rpi-panel-v2-regulator.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index c506fd699d57..30b78aa75ee3 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -89,9 +89,19 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(&i2c->dev, ret, "Failed to create gpiochip\n");
 
+	i2c_set_clientdata(i2c, regmap);
+
 	return devm_pwmchip_add(&i2c->dev, pc);
 }
 
+static void rpi_panel_v2_i2c_shutdown(struct i2c_client *client)
+{
+	struct regmap *regmap = i2c_get_clientdata(client);
+
+	regmap_write(regmap, REG_PWM, 0);
+	regmap_write(regmap, REG_POWERON, 0);
+}
+
 static const struct of_device_id rpi_panel_v2_dt_ids[] = {
 	{ .compatible = "raspberrypi,touchscreen-panel-regulator-v2" },
 	{ },
@@ -105,6 +115,7 @@ static struct i2c_driver rpi_panel_v2_regulator_driver = {
 		.of_match_table = rpi_panel_v2_dt_ids,
 	},
 	.probe = rpi_panel_v2_i2c_probe,
+	.shutdown = rpi_panel_v2_i2c_shutdown,
 };
 
 module_i2c_driver(rpi_panel_v2_regulator_driver);
-- 
2.47.2

