Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273BC2EF
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743935249; cv=none; b=EuSDHnahFXI442EWOQ+m6JpUHXZwPtduGqN7Wd2tVjIqBydgHZanaHEl3U+07Rge3dbfSSrJmgenoG+4X6wYePKSnePxd44f8oQ8DAXURCMqdQZxytMGzlhQFCs1+igrGNWDJcPX/lxPx2Tr8/jZe1y4ks6V4UUv+qHtFyit9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743935249; c=relaxed/simple;
	bh=xqxK3OjMwfYRc2rS1poO5L+gj09bvK1cGqirA5vpjY4=;
	h=From:To:Cc:Subject:Message-ID:Content-Type:MIME-Version:Date; b=OzNmZDzjI33v67S0ZmhmXk1NDPki8y8mned+5zzsocgsvFhR3FRJKWUCtAMJzt8NpvRtTrfmDNBboZIGr/ikjto4xGcujxsdeCKM9z8uNaTK7Y5j/2kje2qLg4gKMaEJd+slZ8qvnUeSYkOOe6sqqHMCwNRhcmpgONeG91xqcnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BI1kWfs/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pUcEs3CE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BI1kWfs/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pUcEs3CE"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743935244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VnSnLpYetFyGZa9N6yqK17zTHirukHMFwk0QG2sNOmU=;
	b=BI1kWfs/Os2U7EHmGsaPPbY4XF7sPj6xEg+nJDT2yisFb8/A/8xHLtQXmKQ8bYLeva/rKN
	zH6INgAEqeLyJzYzZBW/pHnlkvKCoRLZZgqA7NP+MjDbPahoGH5InaUixnPVbk5CEFrxVi
	BOUdz9mgmD3+6Gc8ST17jat9yUqoKC24jg+e5a5MVW4CFYKw/W2UK+ROvzOSnWpHTldoXS
	CtyNP8oSro6ni8fDpqZMCA9xCtTxECo5UsWCRgjfcORV/JfI45S71y3fcI5izt1F2Exx2y
	0Ug/0ARWaWHDIO3qFTPDG63zlVQGvLvt2qg6QIkrS7VnH65opTAnl1YxxrGd7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743935244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VnSnLpYetFyGZa9N6yqK17zTHirukHMFwk0QG2sNOmU=;
	b=pUcEs3CEbLXz3bk1NAl7fmOnA5483dcKGx0hhv2lxJPTHeqK1kG5qudZZ4XzDujlRddDBE
	2KWICrlg9aw5ZGBA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/urgent for 6.15-rc1
Message-ID: <174393522830.2343710.9366104924015273132.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun,  6 Apr 2025 12:27:24 +0200 (CEST)

Linus,

please pull the latest timers/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-20=
25-04-06

up to:  324a2219ba38: Revert "timekeeping: Fix possible inconsistencies in _C=
OARSE clockids"


A revert to fix a adjtimex() regression:

The recent change to prevent that time goes backwards for the coarse time
getters due to immediate multiplier adjustments via adjtimex(), changed the
way how the timekeeping core treats that.

That change result in a regression on the adjtimex() side, which is user
space visible:
   =20
 1) The forwarding of the base time moves the update out of the original
    period and establishes a new one. That's changing the behaviour of the
    [PF]LL control, which user space expects to be applied periodically.
   =20
 2) The clearing of the accumulated NTP error due to #1, changes the
    behaviour as well.

It was tried to delay the multiplier/frequency update to the next tick, but
that did not solve the problem as userspace expects that the multiplier or
frequency updates are in effect, when the syscall returns.

There is a different solution for the coarse time problem available, so
revert the offending commit to restore the existing adjtimex() behaviour.

Thanks,

	tglx

------------------>
Thomas Gleixner (1):
      Revert "timekeeping: Fix possible inconsistencies in _COARSE clockids"


 kernel/time/timekeeping.c | 94 +++++++++++++--------------------------------=
--
 1 file changed, 25 insertions(+), 69 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 929846b8b45a..1e67d076f195 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -682,19 +682,20 @@ static void timekeeping_update_from_shadow(struct tk_da=
ta *tkd, unsigned int act
 }
=20
 /**
- * timekeeping_forward - update clock to given cycle now value
+ * timekeeping_forward_now - update clock to the current time
  * @tk:		Pointer to the timekeeper to update
- * @cycle_now:  Current clocksource read value
  *
  * Forward the current clock to update its state since the last call to
  * update_wall_time(). This is useful before significant clock changes,
  * as it avoids having to deal with this time offset explicitly.
  */
-static void timekeeping_forward(struct timekeeper *tk, u64 cycle_now)
+static void timekeeping_forward_now(struct timekeeper *tk)
 {
-	u64 delta =3D clocksource_delta(cycle_now, tk->tkr_mono.cycle_last, tk->tkr=
_mono.mask,
-				      tk->tkr_mono.clock->max_raw_delta);
+	u64 cycle_now, delta;
=20
+	cycle_now =3D tk_clock_read(&tk->tkr_mono);
+	delta =3D clocksource_delta(cycle_now, tk->tkr_mono.cycle_last, tk->tkr_mon=
o.mask,
+				  tk->tkr_mono.clock->max_raw_delta);
 	tk->tkr_mono.cycle_last =3D cycle_now;
 	tk->tkr_raw.cycle_last  =3D cycle_now;
=20
@@ -709,21 +710,6 @@ static void timekeeping_forward(struct timekeeper *tk, u=
64 cycle_now)
 	}
 }
=20
-/**
- * timekeeping_forward_now - update clock to the current time
- * @tk:		Pointer to the timekeeper to update
- *
- * Forward the current clock to update its state since the last call to
- * update_wall_time(). This is useful before significant clock changes,
- * as it avoids having to deal with this time offset explicitly.
- */
-static void timekeeping_forward_now(struct timekeeper *tk)
-{
-	u64 cycle_now =3D tk_clock_read(&tk->tkr_mono);
-
-	timekeeping_forward(tk, cycle_now);
-}
-
 /**
  * ktime_get_real_ts64 - Returns the time of day in a timespec64.
  * @ts:		pointer to the timespec to be set
@@ -2165,54 +2151,6 @@ static u64 logarithmic_accumulation(struct timekeeper =
*tk, u64 offset,
 	return offset;
 }
=20
-static u64 timekeeping_accumulate(struct timekeeper *tk, u64 offset,
-				  enum timekeeping_adv_mode mode,
-				  unsigned int *clock_set)
-{
-	int shift =3D 0, maxshift;
-
-	/*
-	 * TK_ADV_FREQ indicates that adjtimex(2) directly set the
-	 * frequency or the tick length.
-	 *
-	 * Accumulate the offset, so that the new multiplier starts from
-	 * now. This is required as otherwise for offsets, which are
-	 * smaller than tk::cycle_interval, timekeeping_adjust() could set
-	 * xtime_nsec backwards, which subsequently causes time going
-	 * backwards in the coarse time getters. But even for the case
-	 * where offset is greater than tk::cycle_interval the periodic
-	 * accumulation does not have much value.
-	 *
-	 * Also reset tk::ntp_error as it does not make sense to keep the
-	 * old accumulated error around in this case.
-	 */
-	if (mode =3D=3D TK_ADV_FREQ) {
-		timekeeping_forward(tk, tk->tkr_mono.cycle_last + offset);
-		tk->ntp_error =3D 0;
-		return 0;
-	}
-
-	/*
-	 * With NO_HZ we may have to accumulate many cycle_intervals
-	 * (think "ticks") worth of time at once. To do this efficiently,
-	 * we calculate the largest doubling multiple of cycle_intervals
-	 * that is smaller than the offset.  We then accumulate that
-	 * chunk in one go, and then try to consume the next smaller
-	 * doubled multiple.
-	 */
-	shift =3D ilog2(offset) - ilog2(tk->cycle_interval);
-	shift =3D max(0, shift);
-	/* Bound shift to one less than what overflows tick_length */
-	maxshift =3D (64 - (ilog2(ntp_tick_length()) + 1)) - 1;
-	shift =3D min(shift, maxshift);
-	while (offset >=3D tk->cycle_interval) {
-		offset =3D logarithmic_accumulation(tk, offset, shift, clock_set);
-		if (offset < tk->cycle_interval << shift)
-			shift--;
-	}
-	return offset;
-}
-
 /*
  * timekeeping_advance - Updates the timekeeper to the current time and
  * current NTP tick length
@@ -2222,6 +2160,7 @@ static bool timekeeping_advance(enum timekeeping_adv_mo=
de mode)
 	struct timekeeper *tk =3D &tk_core.shadow_timekeeper;
 	struct timekeeper *real_tk =3D &tk_core.timekeeper;
 	unsigned int clock_set =3D 0;
+	int shift =3D 0, maxshift;
 	u64 offset;
=20
 	guard(raw_spinlock_irqsave)(&tk_core.lock);
@@ -2238,7 +2177,24 @@ static bool timekeeping_advance(enum timekeeping_adv_m=
ode mode)
 	if (offset < real_tk->cycle_interval && mode =3D=3D TK_ADV_TICK)
 		return false;
=20
-	offset =3D timekeeping_accumulate(tk, offset, mode, &clock_set);
+	/*
+	 * With NO_HZ we may have to accumulate many cycle_intervals
+	 * (think "ticks") worth of time at once. To do this efficiently,
+	 * we calculate the largest doubling multiple of cycle_intervals
+	 * that is smaller than the offset.  We then accumulate that
+	 * chunk in one go, and then try to consume the next smaller
+	 * doubled multiple.
+	 */
+	shift =3D ilog2(offset) - ilog2(tk->cycle_interval);
+	shift =3D max(0, shift);
+	/* Bound shift to one less than what overflows tick_length */
+	maxshift =3D (64 - (ilog2(ntp_tick_length())+1)) - 1;
+	shift =3D min(shift, maxshift);
+	while (offset >=3D tk->cycle_interval) {
+		offset =3D logarithmic_accumulation(tk, offset, shift, &clock_set);
+		if (offset < tk->cycle_interval<<shift)
+			shift--;
+	}
=20
 	/* Adjust the multiplier to correct NTP error */
 	timekeeping_adjust(tk, offset);

