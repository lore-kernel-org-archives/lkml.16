Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CB22F386
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752249; cv=none; b=eVM+yNFlmToTjyMNIaLe1eiQTW30snfZcXkxA3ZKVK6oMph9nI2T8NY607lu2zaZnuC6G+m5X2flEz4KXRM2mdUUPofEIwgczXOEhwm7O1dbo8Z9z8LJ/U3u+gHQ+ORSRKdDbwJi6eZvPhVGDZXoAL/kb2d4WqiJvEaxztt9dd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752249; c=relaxed/simple;
	bh=lwdzT4D9tUSr70iEBlqm1ErOjEZlhxKoCny6yVDtLQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nPApva5XAT042/5vfQUs6zKFxrTg1DIVT1FHWqnvpR51DJtOE+Ih3pvjmbJeq4a/s+WB+Ne0N4i0DOrhlQ5WCE3+lbHVZvMnirb7ckavZsI0fO1Nz5LrJ9/76KPGhEyjcB50bpr9Owy5Z4WLpplS105rRfCZwKPHM6+N42lAfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CIxUZkLy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x+ABu66f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CIxUZkLy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x+ABu66f"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvuUjZiP7cBPl9y5gYW6v2NngZPMaIEP2c/Ga6hOKA0=;
	b=CIxUZkLyrlh4EkXbxlaJEicizzKWg00pcJL+mtXyVQ74StHHwpHmREJEdBbutwt8hUd/W4
	wqNfJTRjPMCo+5judIj47qcdd1ZJROPq8DE+w1cGZXDbD7Y+1p4zCSi4UKCwPBHeH+9uou
	GMOZ1SLQrk8JSd66Q0qtlOcfvQnCnBwI2ZzYIVyj2nWz6REhx7jhZ5HmUB+xkrb+O5nfxM
	EHldujlrCnUrHMUsTkTdnRPa+iHlfi6iB7pvPMNjlKEvf20VLM161Xj7gSKPZyAfJ9yyzu
	EHV4ynSKFS2SQCm+Ca0ATfDdQR9Z2hzWlbDabX4cnSPPEoVXK876MyD9av81JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvuUjZiP7cBPl9y5gYW6v2NngZPMaIEP2c/Ga6hOKA0=;
	b=x+ABu66ffyKqT4e3kdsr4L1zwnPPghwlc3KMXvDsiui0tlkzBOpYSmMspK9RwlrCXC90AV
	MKr3eV9+sijx3QBw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH v2 21/24] wifi: rt2x00: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:41 +0100
Message-Id: <f086be77528edf0dfb455af4cb984b863084a455.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely. This new function replaces
hrtimer_init().

However, converting this driver is not obvious: the driver calls
hrtimer_init() in rt2x00dev.c, then set the hrtimer's callback function in
rt2800mmio.c and rt2800usb.c. Therefore, switching to the new function is
not a simple one-for-one replacement.

With the lack of hardware to verify any non-trivial changes, keep it simple
and calls hrtimer_setup() with hrtimer_dummy_timeout() as callback function
pointer.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/w=
ireless/ralink/rt2x00/rt2x00dev.c
index 9e7d9dbe954c..432ddfac2c33 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -1391,8 +1391,8 @@ int rt2x00lib_probe_dev(struct rt2x00_dev *rt2x00dev)
 	mutex_init(&rt2x00dev->conf_mutex);
 	INIT_LIST_HEAD(&rt2x00dev->bar_list);
 	spin_lock_init(&rt2x00dev->bar_list_lock);
-	hrtimer_init(&rt2x00dev->txstatus_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
+	hrtimer_setup(&rt2x00dev->txstatus_timer, hrtimer_dummy_timeout, CLOCK_MO=
NOTONIC,
+		      HRTIMER_MODE_REL);
=20
 	set_bit(DEVICE_STATE_PRESENT, &rt2x00dev->flags);
=20
--=20
2.39.5

