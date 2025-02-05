Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE0523236E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752425; cv=none; b=QEIIN7x1R1/tKHm0hawKO0jT8RbthK6e9N7CxVY5FjTk+e+d8Jn3nUndTj9TBRLILzDyfhEA/m5aSj/RvKL8UStC14OmBlNphR78ehWSXMEi8tMLZY5zcPBW9tlIuMlPrw+0Kee/14kg/j+P7EwNpQfRVfEe8AFTxhx2VsI18lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752425; c=relaxed/simple;
	bh=aYBCsYtn+CzikXXVzPpDKM316C72CEViAATzTT0g8o0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0tDtH9BVE5OUoHZHpJI9vUfVIH6SxsbZaELTKXZsZ2FvcEpD9QBzew+J3FpK9nbXpNLC9CunWh1e8XpAUGo8hp4Ek2Gwd6fLCXUOK95ZiAwywFDMoecrWrZvECSha284p95xkW1qMH32P2siDShjyaEH8dsXl+6khWRQu4uDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZUJU6HnY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6wDSBPvK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZUJU6HnY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6wDSBPvK"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHxmbs9CMkIPXFurAWE/4zIPrlVyczWIEvoEg/ZzHLM=;
	b=ZUJU6HnYVlQ1pB6PKmzy1sx+d/hOVIzg6Lk6vbGfcMuKF6zWKl7zNCTkSpBk9diiK+gHJK
	ILrThkz+KOIcisNMxmRyS/nGk1ckbDYxKmNeNlIuXQ18iYo/LNiFax+RP8tkH7sNm4R+ye
	4csw/O8uBPMGEO5DwFzmk9mtMwGJpymKTeS19lSeTmcoDXAcOZaNAzD+Ac8tfs9jF1hz8H
	sCV+efeNRLxt3BROrKxdQo7jzMShqYOiEznU/TFwsYY23u2MyJT0q8zK1pOzZzCIkFCXif
	U/ZIQ8XQgbMA219dDUST7AMpKJaP7fEW8cspiOihEy/rbr6sx/OhgZQ0SjeOKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHxmbs9CMkIPXFurAWE/4zIPrlVyczWIEvoEg/ZzHLM=;
	b=6wDSBPvKWtSj1F/9MxqAKm64bKK+eImAvZ/xT1EY+Oado9rmDaBdNzxsILz8+SaDleVLoJ
	6s1yl2rLAMZ5iUDg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2 25/45] leds: trigger: pattern: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:13 +0100
Message-Id: <76fa1cc9777a99a48f49f949abadc1c10af1bc64.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/trigger/ledtrig-pattern.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/=
ledtrig-pattern.c
index aad48c2540fc..a594bd5e2233 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -483,8 +483,8 @@ static int pattern_trig_activate(struct led_classdev *l=
ed_cdev)
 	data->led_cdev =3D led_cdev;
 	led_set_trigger_data(led_cdev, data);
 	timer_setup(&data->timer, pattern_trig_timer_function, 0);
-	hrtimer_init(&data->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	data->hrtimer.function =3D pattern_trig_hrtimer_function;
+	hrtimer_setup(&data->hrtimer, pattern_trig_hrtimer_function, CLOCK_MONOTO=
NIC,
+		      HRTIMER_MODE_REL);
 	led_cdev->activated =3D true;
=20
 	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
--=20
2.39.5

