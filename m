Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300A22FDFF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752937; cv=none; b=lLG9FVSw0SbbVWrL7ea7zYvcQWfLEre6uapOJk6YxoSrvI68TLDKT+ohW1lMQPbstG9Q7G/vzqHGBWLFHtH18VnJfIUaap4/ncYF0SeryVnhYD2Mc4Ub/M4vj5ZzcT5lSzbu0bJOCPuVp8TNoNytpztgl6O66E3sw7DK8m8cUiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752937; c=relaxed/simple;
	bh=OmIlPGYCDCYeDqIb4Dfqqj2wtPfR7xVqkLu3w72/+Gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gefyk0NmdHmn+NcOstN+YHSvT7LIDjbv6cOD8mC7lzC5+LwjNEgBRaKWqKV3BVDSJ5TnPMdznhiYDZ/YHK5/VZEYowhJt0sW/zI6PwD48Xmwl/UVGC4VJ9eKVop0VuArAdP/a6s1U5GtrGCwdiWkLddbHMWBlV4soJmRLZS07xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BbyzYvxz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5jdyIdia; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BbyzYvxz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5jdyIdia"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNYrWFFk5eB1KCTWCnS6jvP/ys5vwAloHCdt+pWXr4E=;
	b=BbyzYvxzEfNVYnynZl2LOsYTobjmQzUDX0tfFFjF/KCqzCfpTswiwaKncNg0gqrIjbJ3vj
	1q2hDQHsofF1wCQak/+f0nsP5I+eJrpY2YQvxSRwR2YxPtUuJdvI7dD90AfYnyXDvUV/zE
	5In+xjcmULCAuIbV20Ds/2fkNv1N8NG4bNI7zFHb+qubNplcU3gCTK3CzAbjXso3fYiw0j
	wYqU2LKltJFg9+ZM6qnTDlPBi5YaZdV1QekWbXUmIgm6x/PtOLnWjnEfgI08k92DEHGJwp
	v7gnA2fQmg+JFCbQg1dC15Zk+EiOzJltnAWDv0oQ+ZmxzL+66Qwe46iR9hOyxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNYrWFFk5eB1KCTWCnS6jvP/ys5vwAloHCdt+pWXr4E=;
	b=5jdyIdia8qRnYY4osYnvUuJGHWIufNGUBPCdPuUzIOraCRurI9wcZ7bSltpElznaKLb3YJ
	fxlzfI5VaZJjU/CA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 12/12] tracing/timers: Rename hrtimer_init event to hrtimer_setup
Date: Wed,  5 Feb 2025 11:55:21 +0100
Message-Id: <cba84c3d853c5258aa3a262363a6eac08e2c7afc.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The function hrtimer_init() doesn't exist anymore. It was replaced by
hrtimer_setup().

Thus, rename the hrtimer_init trace event to hrtimer_setup to keep it
consistent.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>
---
 Documentation/trace/ftrace.rst           | 4 ++--
 include/trace/events/timer.h             | 4 ++--
 kernel/time/hrtimer.c                    | 4 ++--
 tools/perf/tests/shell/trace_btf_enum.sh | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 2b74f96d09d5..c9e88bf65709 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -3077,7 +3077,7 @@ Notice that we lost the sys_nanosleep.
   # cat set_ftrace_filter
   hrtimer_run_queues
   hrtimer_run_pending
-  hrtimer_init
+  hrtimer_setup
   hrtimer_cancel
   hrtimer_try_to_cancel
   hrtimer_forward
@@ -3115,7 +3115,7 @@ Again, now we want to append.
   # cat set_ftrace_filter
   hrtimer_run_queues
   hrtimer_run_pending
-  hrtimer_init
+  hrtimer_setup
   hrtimer_cancel
   hrtimer_try_to_cancel
   hrtimer_forward
diff --git a/include/trace/events/timer.h b/include/trace/events/timer.h
index f8c906be4cd0..1641ae3e6ca0 100644
--- a/include/trace/events/timer.h
+++ b/include/trace/events/timer.h
@@ -185,12 +185,12 @@ TRACE_EVENT(timer_base_idle,
 		{ HRTIMER_MODE_REL_PINNED_HARD,	"REL|PINNED|HARD" })
=20
 /**
- * hrtimer_init - called when the hrtimer is initialized
+ * hrtimer_setup - called when the hrtimer is initialized
  * @hrtimer:	pointer to struct hrtimer
  * @clockid:	the hrtimers clock
  * @mode:	the hrtimers mode
  */
-TRACE_EVENT(hrtimer_init,
+TRACE_EVENT(hrtimer_setup,
=20
 	TP_PROTO(struct hrtimer *hrtimer, clockid_t clockid,
 		 enum hrtimer_mode mode),
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index a0727a45e8e3..1fba75f076d0 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -478,14 +478,14 @@ static inline void debug_hrtimer_deactivate(struct hr=
timer *timer) { }
 static inline void debug_setup(struct hrtimer *timer, clockid_t clockid, e=
num hrtimer_mode mode)
 {
 	debug_hrtimer_init(timer);
-	trace_hrtimer_init(timer, clockid, mode);
+	trace_hrtimer_setup(timer, clockid, mode);
 }
=20
 static inline void debug_setup_on_stack(struct hrtimer *timer, clockid_t c=
lockid,
 					enum hrtimer_mode mode)
 {
 	debug_hrtimer_init_on_stack(timer);
-	trace_hrtimer_init(timer, clockid, mode);
+	trace_hrtimer_setup(timer, clockid, mode);
 }
=20
 static inline void debug_activate(struct hrtimer *timer,
diff --git a/tools/perf/tests/shell/trace_btf_enum.sh b/tools/perf/tests/sh=
ell/trace_btf_enum.sh
index 8d1e6bbeac90..3b2a82e08807 100755
--- a/tools/perf/tests/shell/trace_btf_enum.sh
+++ b/tools/perf/tests/shell/trace_btf_enum.sh
@@ -6,7 +6,7 @@ err=3D0
 set -e
=20
 syscall=3D"landlock_add_rule"
-non_syscall=3D"timer:hrtimer_init,timer:hrtimer_start"
+non_syscall=3D"timer:hrtimer_setup,timer:hrtimer_start"
=20
 TESTPROG=3D"perf test -w landlock"
=20
--=20
2.39.5

