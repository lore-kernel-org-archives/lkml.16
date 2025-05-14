Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D627055E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219019; cv=none; b=Exwn8+K9aP3VOqbp9z629LL/4sUDdeRzIBsEBGsHzFrfMWWUOzjkgvVUwA4rYJr8LpYElt3zEjDwL7r7/q8/lI1ZPsPCqbio2fGyEU+kmkBfBoQqFDZHKBSPetkq9GAoLPhlR2gGJR8rpjJfAqfLLUhZhGQnUUuRenDOzkEbaaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219019; c=relaxed/simple;
	bh=bUyax5imlyqIQbEI5jvfWLUcntK2ZMI0w/Iig53hQQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fm+IPG2bQX4PiAcUOXv+AG3Rgpr48lf/orMYOzcswsD4kt2TOQ429LMBcEf08pkcjZ5lYPXGXxB2kBxd9Gkq6lhqwp8cUl08YkBLm0X24m906Gdex0WqZDyKSkSvdRlyuao08YaEZHNl0luFb8UDVhN2+v1+JxQqNVUbXzVcK6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1uF9Tl-0004uZ-Tm; Wed, 14 May 2025 12:36:49 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 14 May 2025 12:36:30 +0200
Subject: [PATCH v2 3/4] leds: lp5860: save count of multi_leds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-v6-14-topic-ti-lp5860-v2-3-72ecc8fa4ad7@pengutronix.de>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
In-Reply-To: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Save the count of multi_leds child nodes for later use.
As the leds are added to a flex array, the size needs to be saved at
runtime.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/leds/leds-lp5860-spi.c | 2 ++
 drivers/leds/leds-lp5860.h     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/leds/leds-lp5860-spi.c b/drivers/leds/leds-lp5860-spi.c
index 751cc4184037c3c0e14d3493d0a43f0885786523..eee41ee8a8c226db6a68413998642624fabffe7c 100644
--- a/drivers/leds/leds-lp5860-spi.c
+++ b/drivers/leds/leds-lp5860-spi.c
@@ -50,6 +50,8 @@ static int lp5860_probe(struct spi_device *spi)
 	if (!lp5860)
 		return -ENOMEM;
 
+	lp5860->leds_size = multi_leds;
+
 	spi_set_drvdata(spi, lp5860);
 
 	spi->mode = SPI_MODE_0;
diff --git a/drivers/leds/leds-lp5860.h b/drivers/leds/leds-lp5860.h
index b4255fb48372814c7fda86ada96f504c2036f534..3b8342a832bc75afdf2318fd4ee1ee9ce105cbe3 100644
--- a/drivers/leds/leds-lp5860.h
+++ b/drivers/leds/leds-lp5860.h
@@ -305,6 +305,7 @@ struct lp5860_led {
 struct lp5860 {
 	struct device *dev;
 	struct regmap *regmap;
+	unsigned int leds_size;
 
 	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
 };

-- 
2.47.1

