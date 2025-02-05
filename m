Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D9723ED64
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752431; cv=none; b=t0tpvHW/JvtHX5qbQ+iJFOyFTJHjM6UN+NVxjMwkapynYRddndnLgqXrqfhh73hRkXPteFhBSOlpw8KngGW7zm7oURNMQuQj3hapAKBb3qq3WJR4s5A+K9LEegdJszf58dlqepnQqaM+6FyhyWg4DVTfeTfo527/diHTx0rjh/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752431; c=relaxed/simple;
	bh=lL5KZean/dpll0/HHzw7iWhdI/MgRg+AoCG2kGt4Juo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WedPhUCyvBDkejCcJgttjQ7EBJymhYP6qUZb4SQDymO7La7VUWJEYF0nGzg6ZsX4j4RimeEV3fvJv5WYv6UfC7I+kFRWHh960aUj0lRq6/O9Mo3lTPyGkdyeU47b+HglYOW4y9reeH5eXLdJQ50jEJhy9ABxXCub6G11Guyvco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wtTv7cgb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H34c8tTe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wtTv7cgb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H34c8tTe"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA5+OW+1SruDGsfpn+v3hvksjrN5sOKFVSHHy12lIls=;
	b=wtTv7cgbtLL9hf2zI2aftDk1TkTkMCNhndV/3Bp064zx3MHhMzvFUyQb9DIhpX/52dRJYh
	88vTf0rcz3IyHSRPnCxrRj3jQH1P2Yh5485BA/mAVBUdQN6tP7xMilfI3jO7LQsRbSK+p4
	y9HHsa43lqwitoxzIj6NJ+6MEPXdGndPU1f0Q4YdMJu2uOZVN4QZKvgEMlwX/zY9SjntBb
	572e+1MnKYy6HIRgo/17EfWEiDuXXxjgjc32MRhPvCLokaeIzaY22zOvHswQGlrfeiNzsa
	o6PkPOar8P9c7H8reCY0t34T5Oaui8iDaoqKfrcA1ySdYFj/vuYb0YpEvYJj/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA5+OW+1SruDGsfpn+v3hvksjrN5sOKFVSHHy12lIls=;
	b=H34c8tTejeGr5aR59Lwk60ZEU8DhNXAr523HGvDnYu0dn6TjqdNI9CZADBThjONSjbzxrv
	ccs2F2fdmTgDMECA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 45/45] ALSA: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:33 +0100
Message-Id: <598031332ce738c82286a158cb66eb7e735b2e79.1738746904.git.namcao@linutronix.de>
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
Cc: Takashi Iwai <tiwai@suse.com>
---
 sound/core/hrtimer.c      | 3 +--
 sound/drivers/dummy.c     | 3 +--
 sound/drivers/pcsp/pcsp.c | 3 +--
 sound/sh/sh_dac_audio.c   | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index 147c1fea4708..e9c60dce59fb 100644
--- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -66,9 +66,8 @@ static int snd_hrtimer_open(struct snd_timer *t)
 	stime =3D kzalloc(sizeof(*stime), GFP_KERNEL);
 	if (!stime)
 		return -ENOMEM;
-	hrtimer_init(&stime->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	stime->timer =3D t;
-	stime->hrt.function =3D snd_hrtimer_callback;
+	hrtimer_setup(&stime->hrt, snd_hrtimer_callback, CLOCK_MONOTONIC, HRTIMER=
_MODE_REL);
 	t->private_data =3D stime;
 	return 0;
 }
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 8f5df9b3aaaa..c1a3efb633c5 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -457,8 +457,7 @@ static int dummy_hrtimer_create(struct snd_pcm_substrea=
m *substream)
 	if (!dpcm)
 		return -ENOMEM;
 	substream->runtime->private_data =3D dpcm;
-	hrtimer_init(&dpcm->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
-	dpcm->timer.function =3D dummy_hrtimer_callback;
+	hrtimer_setup(&dpcm->timer, dummy_hrtimer_callback, CLOCK_MONOTONIC, HRTI=
MER_MODE_REL_SOFT);
 	dpcm->substream =3D substream;
 	atomic_set(&dpcm->running, 0);
 	return 0;
diff --git a/sound/drivers/pcsp/pcsp.c b/sound/drivers/pcsp/pcsp.c
index 78c9b1c7590f..e8482c2290c3 100644
--- a/sound/drivers/pcsp/pcsp.c
+++ b/sound/drivers/pcsp/pcsp.c
@@ -103,8 +103,7 @@ static int snd_card_pcsp_probe(int devnum, struct devic=
e *dev)
 	if (devnum !=3D 0)
 		return -EINVAL;
=20
-	hrtimer_init(&pcsp_chip.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	pcsp_chip.timer.function =3D pcsp_do_timer;
+	hrtimer_setup(&pcsp_chip.timer, pcsp_do_timer, CLOCK_MONOTONIC, HRTIMER_M=
ODE_REL);
=20
 	err =3D snd_devm_card_new(dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0)
diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index 3f5422145c5e..84a4b17a0cc2 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -312,8 +312,7 @@ static int snd_sh_dac_create(struct snd_card *card,
=20
 	chip->card =3D card;
=20
-	hrtimer_init(&chip->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	chip->hrtimer.function =3D sh_dac_audio_timer;
+	hrtimer_setup(&chip->hrtimer, sh_dac_audio_timer, CLOCK_MONOTONIC, HRTIME=
R_MODE_REL);
=20
 	dac_audio_reset(chip);
 	chip->rate =3D 8000;
--=20
2.39.5

