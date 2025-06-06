Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D4C1D432D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236154; cv=none; b=ONzRbIBCWGF6Ne3HvbxWmIwvXhyIqBG9CMt0QwLrXiISyYtt5UHgrsvzdTEp8t1a1H8g++DoGT3aDJiwPRIIeXWaOLOwdVkafq9d30HdRr3GranWKmwE5K0H0RQgjt9LkoaNmTyJ1xCFGlgNugOLt/I3BvrX3xSCi587u9I+q1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236154; c=relaxed/simple;
	bh=xDV/0BXb2ORellxFwZ8IWXbME1ZTMo+BGUq9JkGa65U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tMOKsX97Ygn9bY+V4eEevgV+/cv9b1fhhUy4ID/9SC1hLfHV3WzYBfmt5VOLEloX60es3pBCosAZi4fKU25aa4hxvQmA5yK9ETBxnYjuRJWBupKZveOOnWSvObzwGH127y5/p2PYfcE1m9o6vsuoGAZU8gHVqd8u0Nfqrmq0AeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wv1Ff2QU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5onIdyQG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wv1Ff2QU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5onIdyQG"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749236149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ujwPNxYI7VasmytWvTWCSEWX6+HE714eWGUUwhccM0Y=;
	b=Wv1Ff2QUV3LqhH13rABVSJZGA2KqRaqSj1IUkvfhuven/doexVPYU3ba+eKKZ9rc/u7FD/
	xfZG+u6p2uAex7VYR9Zktga72ey+VLGd42e4oQpR98YME01K1VwkHuDUQXJ6eieRc46AFy
	dXK0a/tIOoQqW2ksJGrxHmX8m0aQF7Ta1ZMhmgybSLH4LaOvCsoaUvmxFdWe3TYXX9kd9K
	Q673Ko2r4GfDa9Z+qsCNcQ7tplIrr8VX8cjsC1W26t/kGLVnslzXn7aP9IrkjKiUZelJeC
	rBjJLrYxRbOAKmbLuznrCFlfyc3z29iwxElRbEuUF2fPVuO30IQdRohaY/7rqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749236149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ujwPNxYI7VasmytWvTWCSEWX6+HE714eWGUUwhccM0Y=;
	b=5onIdyQGBJVI+dYwpuudsnKBhsYDOHVdVqzoBVAMlAxJcQYdXbaetbkQLhcpynREDrRiqn
	y53I/3lCf7Kfv7DQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Toshiyuki Sato <fj6611ie@fujitsu.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v1] printk: nbcon: Allow reacquire during panic
Date: Fri,  6 Jun 2025 21:01:49 +0206
Message-Id: <20250606185549.900611-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a console printer is interrupted during panic, it will never
be able to reacquire ownership in order to perform and cleanup.
That in itself is not a problem, since the non-panic CPU will
simply quiesce in an endless loop within nbcon_reacquire_nobuf().

However, in this state, platforms that do not support a true NMI
to interrupt the quiesced CPU will not be able to shutdown that
CPU from within panic(). This then causes problems for such as
being unable to load and run a kdump kernel.

Fix this by allowing non-panic CPUs to reacquire ownership using
a direct acquire. Then the non-panic CPUs can successfullyl exit
the nbcon_reacquire_nobuf() loop and the console driver can
perform any necessary cleanup. But more importantly, the CPU is
no longer quiesced and is free to process any interrupts
necessary for panic() to shutdown the CPU.

All other forms of acquire are still not allowed for non-panic
CPUs since it is safer to have them avoid gaining console
ownership that is not strictly necessary.

Reported-by: Michael Kelley <mhklinux@outlook.com>
Closes: https://lore.kernel.org/r/SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 63 ++++++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index fd12efcc4aed..e7a3af81b173 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -214,8 +214,9 @@ static void nbcon_seq_try_update(struct nbcon_context *ctxt, u64 new_seq)
 
 /**
  * nbcon_context_try_acquire_direct - Try to acquire directly
- * @ctxt:	The context of the caller
- * @cur:	The current console state
+ * @ctxt:		The context of the caller
+ * @cur:		The current console state
+ * @is_reacquire:	This acquire is a reacquire
  *
  * Acquire the console when it is released. Also acquire the console when
  * the current owner has a lower priority and the console is in a safe state.
@@ -225,17 +226,17 @@ static void nbcon_seq_try_update(struct nbcon_context *ctxt, u64 new_seq)
  *
  * Errors:
  *
- *	-EPERM:		A panic is in progress and this is not the panic CPU.
- *			Or the current owner or waiter has the same or higher
- *			priority. No acquire method can be successful in
- *			this case.
+ *	-EPERM:		A panic is in progress and this is neither the panic
+ *			CPU nor is this a reacquire. Or the current owner or
+ *			waiter has the same or higher priority. No acquire
+ *			method can be successful in these cases.
  *
  *	-EBUSY:		The current owner has a lower priority but the console
  *			in an unsafe state. The caller should try using
  *			the handover acquire method.
  */
 static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
-					    struct nbcon_state *cur)
+					    struct nbcon_state *cur, bool is_reacquire)
 {
 	unsigned int cpu = smp_processor_id();
 	struct console *con = ctxt->console;
@@ -243,14 +244,20 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
 
 	do {
 		/*
-		 * Panic does not imply that the console is owned. However, it
-		 * is critical that non-panic CPUs during panic are unable to
-		 * acquire ownership in order to satisfy the assumptions of
-		 * nbcon_waiter_matches(). In particular, the assumption that
-		 * lower priorities are ignored during panic.
+		 * Panic does not imply that the console is owned. However,
+		 * since all non-panic CPUs are stopped during panic(), it
+		 * is safer to have them avoid gaining console ownership.
+		 *
+		 * If this acquire is a reacquire (and an unsafe takeover
+		 * has not previously occurred) then it is allowed to attempt
+		 * a direct acquire in panic. This gives console drivers an
+		 * opportunity to perform any necessary cleanup if they were
+		 * interrupted by the panic CPU while printing.
 		 */
-		if (other_cpu_in_panic())
+		if (other_cpu_in_panic() &&
+		    (!is_reacquire || cur->unsafe_takeover)) {
 			return -EPERM;
+		}
 
 		if (ctxt->prio <= cur->prio || ctxt->prio <= cur->req_prio)
 			return -EPERM;
@@ -301,8 +308,9 @@ static bool nbcon_waiter_matches(struct nbcon_state *cur, int expected_prio)
 	 * Event #1 implies this context is EMERGENCY.
 	 * Event #2 implies the new context is PANIC.
 	 * Event #3 occurs when panic() has flushed the console.
-	 * Events #4 and #5 are not possible due to the other_cpu_in_panic()
-	 * check in nbcon_context_try_acquire_direct().
+	 * Event #4 occurs when a non-panic CPU reacquires.
+	 * Event #5 is not possible due to the other_cpu_in_panic() check
+	 *          in nbcon_context_try_acquire_handover().
 	 */
 
 	return (cur->req_prio == expected_prio);
@@ -431,6 +439,16 @@ static int nbcon_context_try_acquire_handover(struct nbcon_context *ctxt,
 	WARN_ON_ONCE(ctxt->prio <= cur->prio || ctxt->prio <= cur->req_prio);
 	WARN_ON_ONCE(!cur->unsafe);
 
+	/*
+	 * Panic does not imply that the console is owned. However, it
+	 * is critical that non-panic CPUs during panic are unable to
+	 * wait for a handover in order to satisfy the assumptions of
+	 * nbcon_waiter_matches(). In particular, the assumption that
+	 * lower priorities are ignored during panic.
+	 */
+	if (other_cpu_in_panic())
+		return -EPERM;
+
 	/* Handover is not possible on the same CPU. */
 	if (cur->cpu == cpu)
 		return -EBUSY;
@@ -558,7 +576,8 @@ static struct printk_buffers panic_nbcon_pbufs;
 
 /**
  * nbcon_context_try_acquire - Try to acquire nbcon console
- * @ctxt:	The context of the caller
+ * @ctxt:		The context of the caller
+ * @is_reacquire:	This acquire is a reacquire
  *
  * Context:	Under @ctxt->con->device_lock() or local_irq_save().
  * Return:	True if the console was acquired. False otherwise.
@@ -568,7 +587,7 @@ static struct printk_buffers panic_nbcon_pbufs;
  * in an unsafe state. Otherwise, on success the caller may assume
  * the console is not in an unsafe state.
  */
-static bool nbcon_context_try_acquire(struct nbcon_context *ctxt)
+static bool nbcon_context_try_acquire(struct nbcon_context *ctxt, bool is_reacquire)
 {
 	unsigned int cpu = smp_processor_id();
 	struct console *con = ctxt->console;
@@ -577,7 +596,7 @@ static bool nbcon_context_try_acquire(struct nbcon_context *ctxt)
 
 	nbcon_state_read(con, &cur);
 try_again:
-	err = nbcon_context_try_acquire_direct(ctxt, &cur);
+	err = nbcon_context_try_acquire_direct(ctxt, &cur, is_reacquire);
 	if (err != -EBUSY)
 		goto out;
 
@@ -913,7 +932,7 @@ void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt)
 {
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
 
-	while (!nbcon_context_try_acquire(ctxt))
+	while (!nbcon_context_try_acquire(ctxt, true))
 		cpu_relax();
 
 	nbcon_write_context_set_buf(wctxt, NULL, 0);
@@ -1101,7 +1120,7 @@ static bool nbcon_emit_one(struct nbcon_write_context *wctxt, bool use_atomic)
 		cant_migrate();
 	}
 
-	if (!nbcon_context_try_acquire(ctxt))
+	if (!nbcon_context_try_acquire(ctxt, false))
 		goto out;
 
 	/*
@@ -1486,7 +1505,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq,
 	ctxt->prio			= nbcon_get_default_prio();
 	ctxt->allow_unsafe_takeover	= allow_unsafe_takeover;
 
-	if (!nbcon_context_try_acquire(ctxt))
+	if (!nbcon_context_try_acquire(ctxt, false))
 		return -EPERM;
 
 	while (nbcon_seq_read(con) < stop_seq) {
@@ -1762,7 +1781,7 @@ bool nbcon_device_try_acquire(struct console *con)
 	ctxt->console	= con;
 	ctxt->prio	= NBCON_PRIO_NORMAL;
 
-	if (!nbcon_context_try_acquire(ctxt))
+	if (!nbcon_context_try_acquire(ctxt, false))
 		return false;
 
 	if (!nbcon_context_enter_unsafe(ctxt))

base-commit: 9827cd0d6498075a2ce80dfbb499086bbd948c49
-- 
2.39.5

