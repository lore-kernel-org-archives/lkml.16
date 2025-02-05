Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C4F22DF83
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751998; cv=none; b=AwHsTLvjJmBMq0DNYVaGB95pRgThN27+jo4ZNJIWqcLYsMxLppqVnVzJOAtfvuvee51jK+6dAWPemG3k771AvXE8wQjaLAuKTtkA2ptdxyWlDzWSyawmcJGUb8EeQ5BawnNZRTLfMvhkjx/J+Ov5jJFar+SMMBMsCjD5LLezi8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751998; c=relaxed/simple;
	bh=1Oox9z0TTVmYTOeh66aL66CentavOCAi4D2hz4WTO9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RsnGyMrUVVyiuHA+Sgcp3r6K9zBZ5+uTsQN9Z1m98Pw/X174z9T5C/GjJ/axwo/VHGjm9C6riOoP5mCnWvIfgCuadeMJmBp8Esy8hHqOJR9+7ZTCwBYqPN3jst7k89S+P3S5vb0nM7sgHZXgbhTY2sX1Md8nacpt6pME/0+BdmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ial1xsFo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0q046KmQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ial1xsFo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0q046KmQ"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KqR2/15ASJrEswysloe51ZKYrXuZFVUiqVH8Khg71NI=;
	b=ial1xsFoYkaUA2iJ1sM+7zXUJq3zzLr4t/Xnp1uCTBxfkTm5oNjntoxICgNjmMDmF4WVMv
	7IZy5HV85lm9JkkFyCwKa7t/3eYDlFr8dWJIuckfTcSLXzufN9hrhyq14nW+IBu9zlMAEW
	aYZr52pmWLs6r7DUIV2S8mq75gLdth4FlAh+lZ3C8PjTENYkPdu4FuBODZ9VoXdmfepw56
	UwaTrQrQNPGyI8h0FFw4ED/mutAXGs1M27dIHFC6QlyRX20z/Lc5iugfje/kG1v5QNh/PS
	MsyHhUCW0sqT1SzzwoYiB8p/SjvqtNPajjRKfpTJCC2vIjM4PpkZfxz2dW5jNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KqR2/15ASJrEswysloe51ZKYrXuZFVUiqVH8Khg71NI=;
	b=0q046KmQgIMoq114uOkZ4op9jIWPOsSH1SsctT8q+E/Yft8kCDpuyBazq49EXfI7+deBIw
	0FAvpsZayl2YYXDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 18/31] perf: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:02 +0100
Message-Id: <f611e6d3fc6996bbcf0e19fe234f75edebe4332f.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 kernel/events/core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 0f8c55990783..59059e348844 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1147,8 +1147,8 @@ static void __perf_mux_hrtimer_init(struct perf_cpu_p=
mu_context *cpc, int cpu)
 	cpc->hrtimer_interval =3D ns_to_ktime(NSEC_PER_MSEC * interval);
=20
 	raw_spin_lock_init(&cpc->hrtimer_lock);
-	hrtimer_init(timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_PINNED_HARD);
-	timer->function =3D perf_mux_hrtimer_handler;
+	hrtimer_setup(timer, perf_mux_hrtimer_handler, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS_PINNED_HARD);
 }
=20
 static int perf_mux_hrtimer_restart(struct perf_cpu_pmu_context *cpc)
@@ -11366,8 +11366,7 @@ static void perf_swevent_init_hrtimer(struct perf_e=
vent *event)
 	if (!is_sampling_event(event))
 		return;
=20
-	hrtimer_init(&hwc->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	hwc->hrtimer.function =3D perf_swevent_hrtimer;
+	hrtimer_setup(&hwc->hrtimer, perf_swevent_hrtimer, CLOCK_MONOTONIC, HRTIM=
ER_MODE_REL_HARD);
=20
 	/*
 	 * Since hrtimers have a fixed rate, we can do a static freq->period
--=20
2.39.5

