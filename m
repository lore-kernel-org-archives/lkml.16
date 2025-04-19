Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA34184F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745041681; cv=none; b=WAds8lJ+vo+XNHV5TQ0GOkw52VYGCPlYVRN8C3E3zxljU5ZfZ4+h96Df5pZmUq741zg4n4uQgifVZ3FYZs1xqT6p3eDdYcrZtxJXisjoHknL78RSE1W/+pThdzGRojOmBEsmwkERaRAxZdbDNhoRsiZ2S29rMguH8h93JALOFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745041681; c=relaxed/simple;
	bh=T36w7T6WsGB+nWqm2COg4Z23poGoMCRvgw0i8WcZNv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gKKn1WmDMJG1J6NPV+bl/pj/rM3nR66TBi7OBDFzwrLzpYliU9b8K1rSynYPn7GG2IVKaPD0v3Ir07cIxwjnFwhbfl5ymV5IGJ4IC90t+ffEXvXPmxVuDow+I35OtPWMKFBnZgq/3uJQiZfR1KJh3ckpihB/uOIYXSKyIFNngGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qt5yGOk/; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qt5yGOk/"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736c7df9b6cso2988949b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745041679; x=1745646479; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SdJKpwbPcy6gRTD8c2n1oCcw85CayJPijKUia1p0ZF4=;
        b=qt5yGOk/ncRE0Wf6iZEiK7YQCe/gS2nIeLUfA2longdQ+eQPjUvh3nfnOEMvniHmM8
         wGB19qDtOKeQbKy234uL5da8nmdbNU2DfzDvrY8pomQLXrEK7W7yiisLol17vXcaEuQQ
         yVhgbGa08hP9BVJc+rnEfeXCP1KwUcx0r9XJ7PfYh9ORiSHXARRsayFh5m29PwEk0dkb
         OdZuhsu0mIL/a+ZpyN+I1Bv/2dvRKoEoIg86Ffes8TGkKtRVra98NUao35pq80S2w0Fg
         YGR3HyG53VxCWfTet2E3KaEh4qiYJ8OFXPBiqA5btIKIPkIVOuYsXZCNfn19FaUOFuF7
         TnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745041679; x=1745646479;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdJKpwbPcy6gRTD8c2n1oCcw85CayJPijKUia1p0ZF4=;
        b=pTcSeZk23ndr4f4zSFkEfa2PUoPANy7GzDPZfq4wI/+ANudBssvhSlnE19MYuyjune
         Rsbrzq2grrrwL3b1zVIpgYgw58IGa4XL02CSgZKqXXp5EhCedbmBBBd9/9AQ3KKVxaMq
         0LC9+ePDsFPk0shI81SPjic084vRfUSVjlhL6wEp3AEOVCm4/lkr0Q/S0FcqQHGzo98O
         ZNaGNGc1e49LrypGgWh2tNwzCtEAxjXoGp5LVBmfaCYhuIj7ufAgst5lFXiNqA/is6ic
         wwoGxAD8Bpa5TTu1AGFp/2PQWTPIyymq2a+JkTB1bE+N+cIeNfVLoMHwhA76lHbx/Rg2
         YpeA==
X-Gm-Message-State: AOJu0Yxf7gY6tWjy8UX9H9oBoHZx3XN0K63YUd+7+cR/kCMzTP6KKN6Q
	l77U5hQWx2FVos/u/TOmJBm0ZBHUMAh1ssM0ryROnlCaIIf1dLpTgV7fRZIeyRhwQehlpH6E8RI
	xsgT7SgSGtcSSR2AzZ/aS+u/AHeo8b9ruZWeOwlLg/pzN0uWhDdJY3AeHAljgPQOfzpgzAjnM4v
	v8K6X+p4w4l10PLngAHfl1woU6coN3mFFlN6IM3ChhZLdm
X-Google-Smtp-Source: AGHT+IG1zUCrEEgDh4YEOCfxrp+PRvSy7bLVCAiyGydhxQAJdgGbPUV4CQEDGgo07a33wuJ5mEF+r/MZQKJQ
X-Received: from pfbjc2.prod.google.com ([2002:a05:6a00:6c82:b0:73c:26eb:39b0])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1305:b0:736:42a8:a742
 with SMTP id d2e1a72fcca58-73dc14ccd73mr6440107b3a.11.1745041678543; Fri, 18
 Apr 2025 22:47:58 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:46:52 -0700
In-Reply-To: <CANDhNCrNYuxP7xqNLKWGnhMOBEHGhD9-FceNAj7n=fQUsLwvMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CANDhNCrNYuxP7xqNLKWGnhMOBEHGhD9-FceNAj7n=fQUsLwvMA@mail.gmail.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250419054706.2319105-1-jstultz@google.com>
Subject: [PATCH v3] timekeeping: Prevent coarse clocks going backwards
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Lei Chen <lei.chen@smartx.com>, Stephen Boyd <sboyd@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Thomas Gleixner <tglx@linutronix.de>

Lei Chen raised an issue with CLOCK_MONOTONIC_COARSE seeing time
inconsistencies. Lei tracked down that this was being caused by the
adjustment

    tk->tkr_mono.xtime_nsec -= offset;

which is made to compensate for the unaccumulated cycles in offset when the
multiplicator is adjusted forward, so that the non-_COARSE clockids don't
see inconsistencies.

However, the _COARSE clockid getter functions use the adjusted xtime_nsec
value directly and do not compensate the negative offset via the
clocksource delta multiplied with the new multiplicator. In that case the
caller can observe time going backwards in consecutive calls.

By design, this negative adjustment should be fine, because the logic run
from timekeeping_adjust() is done after it accumulated approximately

     multiplicator * interval_cycles

into xtime_nsec.  The accumulated value is always larger then the

     mult_adj * offset

value, which is subtracted from xtime_nsec. Both operations are done
together under the tk_core.lock, so the net change to xtime_nsec is always
always be positive.

However, do_adjtimex() calls into timekeeping_advance() as well, to
apply the NTP frequency adjustment immediately. In this case,
timekeeping_advance() does not return early when the offset is smaller
then interval_cycles. In that case there is no time accumulated into
xtime_nsec. But the subsequent call into timekeeping_adjust(), which
modifies the multiplicator, subtracts from xtime_nsec to correct for the
new multiplicator.

Here because there was no accumulation, xtime_nsec becomes smaller than
before, which opens a window up to the next accumulation, where the
_COARSE clockid getters, which don't compensate for the offset, can
observe the inconsistency.

This has been tried to be fixed by forwarding the timekeeper in the case
that adjtimex() adjusts the multiplier, which resets the offset to zero:

  757b000f7b93 ("timekeeping: Fix possible inconsistencies in _COARSE clockids")

That works correctly, but unfortunately causes a regression on the
adjtimex() side. There are two issues:

   1) The forwarding of the base time moves the update out of the original
      period and establishes a new one.

   2) The clearing of the accumulated NTP error is changing the behaviour as
      well.

Userspace expects that multiplier/frequency updates are in effect, when the
syscall returns, so delaying the update to the next tick is not solving the
problem either.

Commit 757b000f7b93 was reverted so that the established expectations of
user space implementations (ntpd, chronyd) are restored, but that obviously
brought the inconsistencies back.

One of the initial approaches to fix this was to establish a separate
storage for the coarse time getter nanoseconds part by calculating it from
the offset. That was dropped on the floor because not having yet another
state to maintain was simpler. But given the result of the above exercise,
this solution turns out to be the right one. Bring it back in a slightly
modified form.

Thus introduce timekeeper::coarse_nsec and store that nanoseconds part in
it, switch the time getter functions and the VDSO update to use that value.
coarse_nsec is set on operations which forward or initialize the timekeeper
or after we have accumulated time during a tick

This leaves the adjtimex() behaviour unmodified and prevents coarse time
from going backwards.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Miroslav Lichvar <mlichvar@redhat.com>
Cc: Lei Chen <lei.chen@smartx.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: kernel-team@android.com
Fixes: da15cfdae033 ("time: Introduce CLOCK_REALTIME_COARSE")
Reported-by: Lei Chen <lei.chen@smartx.com>
Closes: https://lore.kernel.org/lkml/20250310030004.3705801-1-lei.chen@smartx.com/
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[jstultz: Simplified the coarse_nsec calculation and kept behavior so
coarse clockids aren't adjusted on each inter-tick adjtimex call,
slightly reworking the comments and commit message]
Signed-off-by: John Stultz <jstultz@google.com>
---
v3:
* John's Rework of Thomas' version here:
  - https://lore.kernel.org/lkml/87r01qq7hp.ffs@tglx/
---
 include/linux/timekeeper_internal.h |  8 +++--
 kernel/time/timekeeping.c           | 50 ++++++++++++++++++++++++-----
 kernel/time/vsyscall.c              |  4 +--
 3 files changed, 49 insertions(+), 13 deletions(-)

diff --git a/include/linux/timekeeper_internal.h b/include/linux/timekeeper_internal.h
index e39d4d563b197..785048a3b3e60 100644
--- a/include/linux/timekeeper_internal.h
+++ b/include/linux/timekeeper_internal.h
@@ -51,7 +51,7 @@ struct tk_read_base {
  * @offs_real:			Offset clock monotonic -> clock realtime
  * @offs_boot:			Offset clock monotonic -> clock boottime
  * @offs_tai:			Offset clock monotonic -> clock tai
- * @tai_offset:			The current UTC to TAI offset in seconds
+ * @coarse_nsec:		The nanoseconds part for coarse time getters
  * @tkr_raw:			The readout base structure for CLOCK_MONOTONIC_RAW
  * @raw_sec:			CLOCK_MONOTONIC_RAW  time in seconds
  * @clock_was_set_seq:		The sequence number of clock was set events
@@ -76,6 +76,7 @@ struct tk_read_base {
  *				ntp shifted nano seconds.
  * @ntp_err_mult:		Multiplication factor for scaled math conversion
  * @skip_second_overflow:	Flag used to avoid updating NTP twice with same second
+ * @tai_offset:			The current UTC to TAI offset in seconds
  *
  * Note: For timespec(64) based interfaces wall_to_monotonic is what
  * we need to add to xtime (or xtime corrected for sub jiffy times)
@@ -100,7 +101,7 @@ struct tk_read_base {
  * which results in the following cacheline layout:
  *
  * 0:	seqcount, tkr_mono
- * 1:	xtime_sec ... tai_offset
+ * 1:	xtime_sec ... coarse_nsec
  * 2:	tkr_raw, raw_sec
  * 3,4: Internal variables
  *
@@ -121,7 +122,7 @@ struct timekeeper {
 	ktime_t			offs_real;
 	ktime_t			offs_boot;
 	ktime_t			offs_tai;
-	s32			tai_offset;
+	u32			coarse_nsec;
 
 	/* Cacheline 2: */
 	struct tk_read_base	tkr_raw;
@@ -144,6 +145,7 @@ struct timekeeper {
 	u32			ntp_error_shift;
 	u32			ntp_err_mult;
 	u32			skip_second_overflow;
+	s32			tai_offset;
 };
 
 #ifdef CONFIG_GENERIC_TIME_VSYSCALL
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 1e67d076f1955..a009c91f7b05f 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -164,10 +164,34 @@ static inline struct timespec64 tk_xtime(const struct timekeeper *tk)
 	return ts;
 }
 
+static inline struct timespec64 tk_xtime_coarse(const struct timekeeper *tk)
+{
+	struct timespec64 ts;
+
+	ts.tv_sec = tk->xtime_sec;
+	ts.tv_nsec = tk->coarse_nsec;
+	return ts;
+}
+
+/*
+ * Update the nanoseconds part for the coarse time keepers. They can't rely
+ * on xtime_nsec because xtime_nsec could be adjusted by a small negative
+ * amount when the multiplication factor of the clock is adjusted, which
+ * could cause the coarse clocks to go slightly backwards. See
+ * timekeeping_apply_adjustment(). Thus we keep a separate copy for the coarse
+ * clockids which only is updated when the clock has been set or  we have
+ * accumulated time.
+ */
+static inline void tk_update_coarse_nsecs(struct timekeeper *tk)
+{
+	tk->coarse_nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
+}
+
 static void tk_set_xtime(struct timekeeper *tk, const struct timespec64 *ts)
 {
 	tk->xtime_sec = ts->tv_sec;
 	tk->tkr_mono.xtime_nsec = (u64)ts->tv_nsec << tk->tkr_mono.shift;
+	tk_update_coarse_nsecs(tk);
 }
 
 static void tk_xtime_add(struct timekeeper *tk, const struct timespec64 *ts)
@@ -175,6 +199,7 @@ static void tk_xtime_add(struct timekeeper *tk, const struct timespec64 *ts)
 	tk->xtime_sec += ts->tv_sec;
 	tk->tkr_mono.xtime_nsec += (u64)ts->tv_nsec << tk->tkr_mono.shift;
 	tk_normalize_xtime(tk);
+	tk_update_coarse_nsecs(tk);
 }
 
 static void tk_set_wall_to_mono(struct timekeeper *tk, struct timespec64 wtm)
@@ -708,6 +733,7 @@ static void timekeeping_forward_now(struct timekeeper *tk)
 		tk_normalize_xtime(tk);
 		delta -= incr;
 	}
+	tk_update_coarse_nsecs(tk);
 }
 
 /**
@@ -804,8 +830,8 @@ EXPORT_SYMBOL_GPL(ktime_get_with_offset);
 ktime_t ktime_get_coarse_with_offset(enum tk_offsets offs)
 {
 	struct timekeeper *tk = &tk_core.timekeeper;
-	unsigned int seq;
 	ktime_t base, *offset = offsets[offs];
+	unsigned int seq;
 	u64 nsecs;
 
 	WARN_ON(timekeeping_suspended);
@@ -813,7 +839,7 @@ ktime_t ktime_get_coarse_with_offset(enum tk_offsets offs)
 	do {
 		seq = read_seqcount_begin(&tk_core.seq);
 		base = ktime_add(tk->tkr_mono.base, *offset);
-		nsecs = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
+		nsecs = tk->coarse_nsec;
 
 	} while (read_seqcount_retry(&tk_core.seq, seq));
 
@@ -2161,7 +2187,7 @@ static bool timekeeping_advance(enum timekeeping_adv_mode mode)
 	struct timekeeper *real_tk = &tk_core.timekeeper;
 	unsigned int clock_set = 0;
 	int shift = 0, maxshift;
-	u64 offset;
+	u64 offset, orig_offset;
 
 	guard(raw_spinlock_irqsave)(&tk_core.lock);
 
@@ -2172,7 +2198,7 @@ static bool timekeeping_advance(enum timekeeping_adv_mode mode)
 	offset = clocksource_delta(tk_clock_read(&tk->tkr_mono),
 				   tk->tkr_mono.cycle_last, tk->tkr_mono.mask,
 				   tk->tkr_mono.clock->max_raw_delta);
-
+	orig_offset = offset;
 	/* Check if there's really nothing to do */
 	if (offset < real_tk->cycle_interval && mode == TK_ADV_TICK)
 		return false;
@@ -2205,6 +2231,14 @@ static bool timekeeping_advance(enum timekeeping_adv_mode mode)
 	 */
 	clock_set |= accumulate_nsecs_to_secs(tk);
 
+	/*
+	 * To avoid inconsistencies caused adjtimex TK_ADV_FREQ calls
+	 * making small negative adjustments to the base xtime_nsec
+	 * value, only update the coarse clocks if we accumulated time
+	 */
+	if (orig_offset != offset)
+		tk_update_coarse_nsecs(tk);
+
 	timekeeping_update_from_shadow(&tk_core, clock_set);
 
 	return !!clock_set;
@@ -2248,7 +2282,7 @@ void ktime_get_coarse_real_ts64(struct timespec64 *ts)
 	do {
 		seq = read_seqcount_begin(&tk_core.seq);
 
-		*ts = tk_xtime(tk);
+		*ts = tk_xtime_coarse(tk);
 	} while (read_seqcount_retry(&tk_core.seq, seq));
 }
 EXPORT_SYMBOL(ktime_get_coarse_real_ts64);
@@ -2271,7 +2305,7 @@ void ktime_get_coarse_real_ts64_mg(struct timespec64 *ts)
 
 	do {
 		seq = read_seqcount_begin(&tk_core.seq);
-		*ts = tk_xtime(tk);
+		*ts = tk_xtime_coarse(tk);
 		offset = tk_core.timekeeper.offs_real;
 	} while (read_seqcount_retry(&tk_core.seq, seq));
 
@@ -2350,12 +2384,12 @@ void ktime_get_coarse_ts64(struct timespec64 *ts)
 	do {
 		seq = read_seqcount_begin(&tk_core.seq);
 
-		now = tk_xtime(tk);
+		now = tk_xtime_coarse(tk);
 		mono = tk->wall_to_monotonic;
 	} while (read_seqcount_retry(&tk_core.seq, seq));
 
 	set_normalized_timespec64(ts, now.tv_sec + mono.tv_sec,
-				now.tv_nsec + mono.tv_nsec);
+				  now.tv_nsec + mono.tv_nsec);
 }
 EXPORT_SYMBOL(ktime_get_coarse_ts64);
 
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 01c2ab1e89719..32ef27c71b57a 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -98,12 +98,12 @@ void update_vsyscall(struct timekeeper *tk)
 	/* CLOCK_REALTIME_COARSE */
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME_COARSE];
 	vdso_ts->sec	= tk->xtime_sec;
-	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
+	vdso_ts->nsec	= tk->coarse_nsec;
 
 	/* CLOCK_MONOTONIC_COARSE */
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC_COARSE];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
-	nsec		= tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
+	nsec		= tk->coarse_nsec;
 	nsec		= nsec + tk->wall_to_monotonic.tv_nsec;
 	vdso_ts->sec	+= __iter_div_u64_rem(nsec, NSEC_PER_SEC, &vdso_ts->nsec);
 
-- 
2.49.0.805.g082f7c87e0-goog

