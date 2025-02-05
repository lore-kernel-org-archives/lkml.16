Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837122DFAD
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752425; cv=none; b=S8AsEKOQ8L0KnTcUOjZHUqIC0+SLyebXa65HJSlgLD4SSdLfF8fCmEM0+MO5WgmIZj822DitFkSrCHf8Gij6/G+PHJmWarecMjgrcWZveydLpZy9hAIxk2iOsE75mkMioSGG2j2BHDUixCq1KGIkAMJZdKDGfk04XhZH7t8PgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752425; c=relaxed/simple;
	bh=e03tCuce8sqgdxMjGoPUhTA7EjXanDQNQRZyXjJkUaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAv2vHZ50bQHrVuumA5V91E9/IawX5yaRj+49TwFjH5ctJAs/n3wyEnGWKVbhV0/gXEs96asuSL3Y8QD3r1Iwgs2eIrp8r2pv8afhY4wKMZz/btjo0kPAoYaz/m9H0LqgyrNZlztzAjovLS4HitXd3Wcdi0tz7p+BRMmcAn2LEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t3FXt1la; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4w/mrT/G; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t3FXt1la";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4w/mrT/G"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EON2od1YOzSZTiDMeNdc0/opP1+ZKtlRHo3VBdgx5UM=;
	b=t3FXt1lajuPwqKvdovU5dXiQU1aWdCYzYh5HFRnfzhXyiO2/GiDdMce02c2HmiwffIpbW5
	9V4ldyRikgyBeNAeN9rPQoTUTN7PKbemEth3BSYNpJ1EdjVTGQ+c4S8dIoLCs/PQpnjPKD
	nZkV4RkQzWqXBS04291VDSl0Yf0vpgQ3EnW5l0B5S++tzekYkoWkSTOPbXzO973EO81G7O
	78OOGw9zmvVvbWdZ7RGqqK/V4XGFA2k4ghGzNIpNcZvqb6lwC1+dfqN5/YXsJbS+vttnYx
	8AHU559/KPoLG1xUfZzESmhhOLDhsq0S7yiYFgOxxiVCMrYbQ7HfX0oiTbxOHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EON2od1YOzSZTiDMeNdc0/opP1+ZKtlRHo3VBdgx5UM=;
	b=4w/mrT/G+t7/H6D01vkVqGMX6W9ACsP+dhURL5ueY2a2sBL7Ex5eFtEYTqJSNzg2Fm8FEs
	TOy8PbgFQ4CY1XAQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 27/45] iio: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:15 +0100
Message-Id: <570792e31b28a94a511c19c6789f2171a6745685.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/iio/adc/ti-tsc2046.c           | 4 +---
 drivers/iio/trigger/iio-trig-hrtimer.c | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-tsc2046.c b/drivers/iio/adc/ti-tsc2046.c
index 7dde5713973f..49560059f4b7 100644
--- a/drivers/iio/adc/ti-tsc2046.c
+++ b/drivers/iio/adc/ti-tsc2046.c
@@ -812,9 +812,7 @@ static int tsc2046_adc_probe(struct spi_device *spi)
=20
 	spin_lock_init(&priv->state_lock);
 	priv->state =3D TSC2046_STATE_SHUTDOWN;
-	hrtimer_init(&priv->trig_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL_SOFT);
-	priv->trig_timer.function =3D tsc2046_adc_timer;
+	hrtimer_setup(&priv->trig_timer, tsc2046_adc_timer, CLOCK_MONOTONIC, HRTI=
MER_MODE_REL_SOFT);
=20
 	ret =3D devm_iio_trigger_register(dev, trig);
 	if (ret) {
diff --git a/drivers/iio/trigger/iio-trig-hrtimer.c b/drivers/iio/trigger/i=
io-trig-hrtimer.c
index 716c795d08fb..82c72baccb62 100644
--- a/drivers/iio/trigger/iio-trig-hrtimer.c
+++ b/drivers/iio/trigger/iio-trig-hrtimer.c
@@ -145,8 +145,8 @@ static struct iio_sw_trigger *iio_trig_hrtimer_probe(co=
nst char *name)
 	trig_info->swt.trigger->ops =3D &iio_hrtimer_trigger_ops;
 	trig_info->swt.trigger->dev.groups =3D iio_hrtimer_attr_groups;
=20
-	hrtimer_init(&trig_info->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	trig_info->timer.function =3D iio_hrtimer_trig_handler;
+	hrtimer_setup(&trig_info->timer, iio_hrtimer_trig_handler, CLOCK_MONOTONI=
C,
+		      HRTIMER_MODE_REL_HARD);
=20
 	trig_info->sampling_frequency[0] =3D HRTIMER_DEFAULT_SAMPLING_FREQUENCY;
 	trig_info->period =3D NSEC_PER_SEC / trig_info->sampling_frequency[0];
--=20
2.39.5

