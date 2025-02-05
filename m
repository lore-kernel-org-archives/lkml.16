Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB2231A49
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752423; cv=none; b=IupAiAo9Yn5HgsFg/m2PY7ekwcU3GVUspzt7wtJI494x4sO+y9pb9l06Sre8L0dBGBfeo+ouJ3pDFc908JrXbMvrY1R2UhwBUiVYd09wNG8N5L848+c4MQyC5QYBKQ00jILfDzetNZCGFRiGZ8ROTEji6FLxPuKIQrZ/+K3cmY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752423; c=relaxed/simple;
	bh=q/TtEJ+PMeZ70CVvP9TcLl2k7gIf0tam2BKdnctLRu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KosK5/t1baFgP/LkITkDklHk1HM0RRXv1FdqzMKrg0sib9Rn5r8KdHi2GUDkCF0GTYQ728erpy0yEDC1EnVmSUMAdl/xYwqtDjTzKvHFqR1NE6Y4HtPIoUasQHWcLhgJI4S2LKlytb/MLsks2TvAzJtJQaDvltoKqc4HhOEcIsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gUTp/5b3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5a9a9FAi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gUTp/5b3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5a9a9FAi"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlAAacMbsh7R0RfJXl9zPs5EKSPtwFTBcKTNc8Fryos=;
	b=gUTp/5b3e0TvlsQ7Tk5SxquZ7bs9v1US/QUbFYLXr/zMwoDcZ9RUy8I3E49RP6XoNEpdn5
	Ic7dmuwsEFdPDA8dvlpOPsjMgDAsi3aVF3l5/2RcuaMqfQndKNtmihlNQlqw2bYhOjYT5n
	SmBFOQCkBgRnde4ZJTpZ6L5m1qo9v8q2898h1eK1Eu5V/q4PtwB3Rxd/hVqZ/7jRxsjqkD
	Ahnj987s2Rtz4aHugDeYAklDGqYQeMwLL75isQByhn4vd8/9XnBZkYIdm0lTxUz78frixv
	ofgj0MG36WB1AFUon3FyyGDoiZDaAGOHtAG9rdiFKI+t9HqWFWawMLXX+RVcew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlAAacMbsh7R0RfJXl9zPs5EKSPtwFTBcKTNc8Fryos=;
	b=5a9a9FAiFQDuaH5bpcG8l7lcxJhoT1F2K0J4iXkhkJdgkun5XgEp+iUzy4SCRP1c2CT6UW
	8BssEyIZw3n579CQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 18/45] power: reset: ltc2952-poweroff: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:06 +0100
Message-Id: <75ef5206f52f194b9c51653628cd2d0b083a482f.1738746904.git.namcao@linutronix.de>
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
Cc: Sebastian Reichel <sre@kernel.org>
---
 drivers/power/reset/ltc2952-poweroff.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/ltc2952-poweroff.c b/drivers/power/reset/l=
tc2952-poweroff.c
index 1a6fc8d38e20..90c664d344d0 100644
--- a/drivers/power/reset/ltc2952-poweroff.c
+++ b/drivers/power/reset/ltc2952-poweroff.c
@@ -162,11 +162,11 @@ static void ltc2952_poweroff_default(struct ltc2952_p=
oweroff *data)
 	data->wde_interval =3D 300L * NSEC_PER_MSEC;
 	data->trigger_delay =3D ktime_set(2, 500L * NSEC_PER_MSEC);
=20
-	hrtimer_init(&data->timer_trigger, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	data->timer_trigger.function =3D ltc2952_poweroff_timer_trigger;
+	hrtimer_setup(&data->timer_trigger, ltc2952_poweroff_timer_trigger, CLOCK=
_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
-	hrtimer_init(&data->timer_wde, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	data->timer_wde.function =3D ltc2952_poweroff_timer_wde;
+	hrtimer_setup(&data->timer_wde, ltc2952_poweroff_timer_wde, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_REL);
 }
=20
 static int ltc2952_poweroff_init(struct platform_device *pdev)
--=20
2.39.5

