Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80922FDEF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752936; cv=none; b=l5sE6Qj9Lm2Qq4ptl4LAADkYlTvu6P64TSrvJ14L4jIgs1TEugg23F40EjfEiHF4OiPBvnbq2gNIA5HpD0G2w6+FL3n5b0jk8epK2f8qMH4zBS3qmq2NOd7j694XUzrCqUMwJnhcASerjp1ebUnlgwnwDpCvaTut92cJJ/X/LMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752936; c=relaxed/simple;
	bh=2aN9XdrGhLLUgcHQKFP4B76bnQNsqs56aszb2ZX5lqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mcFOt88/5os1lilzZUB8dZnX6acg6J1CexWZGyDgQuqy0HhCnItnhMEtojWNOBN7gy4Kw1kHMM5xb6bDV6ZuRE3U07dXAdp1zt2psQD1Cf4AjlJUtbMQEOzpWQZq/vovC1wdUBoHmk6kZIDO/LOgRHp8Yv47qUImqiUDJ6ValPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DTA8yL/x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pv9ns82H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DTA8yL/x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pv9ns82H"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RJeMcsPkAEmhA27s3sLTssPdK+WsbgJL72T6GUFIBU=;
	b=DTA8yL/xkiMfX+SF6zQpAH2lId7bEscvBoSzTXPM/xVjEa8pq7901W/NkuG/SrzcHmEA73
	A9Awg1bOWiKlFfac8cV1Ny//+TMKE6FajFfHX1mSmZJv6I4hOmg2lNW3t/OOQ0MvYO1u86
	D8b7Ze/WN0wsSvAYQaWCmOTVWO4ICnEJccyuBSga2A2W77fprR4wLVV5/BYbr09TbS7e2R
	aQcFDFBT66/Klbo0z+S3gtrrDEi3e7L4NSo2Pu3U4HMvEuA2iwXkrIR9BbLsma0BW/7V8Q
	AqvA3VXGZjP66ZI6U9+ODDkLOefCGbU57IjfwtX+3XPco97MDrMCRZJhiuMAlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RJeMcsPkAEmhA27s3sLTssPdK+WsbgJL72T6GUFIBU=;
	b=pv9ns82H6ozGAbgyZkC79/EWxA2hUlTF7J428yAo0vcWHhxZv/9pEGW+zUJ9HBsLF0XQUg
	z7prGsNDzPIOeKDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 07/12] hrtimers: Make callback function pointer private
Date: Wed,  5 Feb 2025 11:55:16 +0100
Message-Id: <7d0e6e0c5c59a64a9bea940051aac05d750bc0c2.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Make the field 'function' of struct hrtimer private, to prevent users from
changing this field in an unsafe way. hrtimer_update_function() should be
used if the callback function needs to be changed.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/hrtimer.h       | 2 +-
 include/linux/hrtimer_types.h | 2 +-
 include/trace/events/timer.h  | 4 ++--
 kernel/time/hrtimer.c         | 8 ++++----
 kernel/time/timer_list.c      | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 242ceafecde5..5facee69b7e2 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -344,7 +344,7 @@ static inline void hrtimer_update_function(struct hrtim=
er *timer,
 	if (WARN_ON_ONCE(!function))
 		return;
=20
-	timer->function =3D function;
+	ACCESS_PRIVATE(timer, function) =3D function;
 }
=20
 /* Forward a hrtimer so it expires after now: */
diff --git a/include/linux/hrtimer_types.h b/include/linux/hrtimer_types.h
index 7c5b27daa89d..8fbbb6bdf7a1 100644
--- a/include/linux/hrtimer_types.h
+++ b/include/linux/hrtimer_types.h
@@ -39,7 +39,7 @@ enum hrtimer_restart {
 struct hrtimer {
 	struct timerqueue_node		node;
 	ktime_t				_softexpires;
-	enum hrtimer_restart		(*function)(struct hrtimer *);
+	enum hrtimer_restart		(*__private function)(struct hrtimer *);
 	struct hrtimer_clock_base	*base;
 	u8				state;
 	u8				is_rel;
diff --git a/include/trace/events/timer.h b/include/trace/events/timer.h
index 1ef58a04fc57..f8c906be4cd0 100644
--- a/include/trace/events/timer.h
+++ b/include/trace/events/timer.h
@@ -235,7 +235,7 @@ TRACE_EVENT(hrtimer_start,
=20
 	TP_fast_assign(
 		__entry->hrtimer	=3D hrtimer;
-		__entry->function	=3D hrtimer->function;
+		__entry->function	=3D ACCESS_PRIVATE(hrtimer, function);
 		__entry->expires	=3D hrtimer_get_expires(hrtimer);
 		__entry->softexpires	=3D hrtimer_get_softexpires(hrtimer);
 		__entry->mode		=3D mode;
@@ -271,7 +271,7 @@ TRACE_EVENT(hrtimer_expire_entry,
 	TP_fast_assign(
 		__entry->hrtimer	=3D hrtimer;
 		__entry->now		=3D *now;
-		__entry->function	=3D hrtimer->function;
+		__entry->function	=3D ACCESS_PRIVATE(hrtimer, function);
 	),
=20
 	TP_printk("hrtimer=3D%p function=3D%ps now=3D%llu",
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 728075f5c9c6..027a63344259 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1326,7 +1326,7 @@ void hrtimer_start_range_ns(struct hrtimer *timer, kt=
ime_t tim,
 	struct hrtimer_clock_base *base;
 	unsigned long flags;
=20
-	if (WARN_ON_ONCE(!timer->function))
+	if (WARN_ON_ONCE(!ACCESS_PRIVATE(timer, function)))
 		return;
 	/*
 	 * Check whether the HRTIMER_MODE_SOFT bit and hrtimer.is_soft
@@ -1634,9 +1634,9 @@ static void __hrtimer_setup(struct hrtimer *timer,
 	timerqueue_init(&timer->node);
=20
 	if (WARN_ON_ONCE(!function))
-		timer->function =3D hrtimer_dummy_timeout;
+		ACCESS_PRIVATE(timer, function) =3D hrtimer_dummy_timeout;
 	else
-		timer->function =3D function;
+		ACCESS_PRIVATE(timer, function) =3D function;
 }
=20
 /**
@@ -1748,7 +1748,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cp=
u_base,
 	raw_write_seqcount_barrier(&base->seq);
=20
 	__remove_hrtimer(timer, base, HRTIMER_STATE_INACTIVE, 0);
-	fn =3D timer->function;
+	fn =3D ACCESS_PRIVATE(timer, function);
=20
 	/*
 	 * Clear the 'is relative' flag for the TIME_LOW_RES case. If the
diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 1c311c46da50..958dd4194684 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -46,7 +46,7 @@ static void
 print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *tim=
er,
 	    int idx, u64 now)
 {
-	SEQ_printf(m, " #%d: <%pK>, %ps", idx, taddr, timer->function);
+	SEQ_printf(m, " #%d: <%pK>, %ps", idx, taddr, ACCESS_PRIVATE(timer, funct=
ion));
 	SEQ_printf(m, ", S:%02x", timer->state);
 	SEQ_printf(m, "\n");
 	SEQ_printf(m, " # expires at %Lu-%Lu nsecs [in %Ld to %Ld nsecs]\n",
--=20
2.39.5

