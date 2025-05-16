Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85382C9A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380980; cv=none; b=L8zsApdd1QMDkToLgb5qVV89ikG+vn3nEzFyB/Loh2/VCSxdsx2FIKlR7w7Xx91xPMYZLVa2tsKkQHRjOJtl2qfEb6VIf2FlwsaABFZhNHS/7KyiEdhN3KMgH6sUtXslWcPj1nMjwRYScmpGahHgXI0Iwt4DoHI95jM5cyxCDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380980; c=relaxed/simple;
	bh=WyijhUO0vfCazPTmjj8L4gst+H0Jhzn8MOknmFSSA94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c8pQ6lIqZOAKWwdxXSK2AnilBD5UdQCe49tdih/F0znnn8A85vSFE+eabunh9UF2Nc42i5K8+gAIo4IMaQwLxycTIopkPtibBJgakS6ts8bzxrBmuUPwzsZzjdGOXx4/sa2Wv9AZQ2Cl/zssggjWnfeLwtah6ztJ9F7eirdFUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uBPagzMx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2BhK2P6R; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uBPagzMx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2BhK2P6R"
Date: Fri, 16 May 2025 09:36:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747380974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5cgzWsQ8I/J4IHzkw06AbhnUPCnKULK4+BfgY7N/Ues=;
	b=uBPagzMx7tAIzLYWSdPRX2S12koia6mdKq4gz8vG4JZYaHO71XHlTjWWZ/3Mk3F7l3VBv/
	5Kj87o9odUszT2XIUcUPaOxYjuZ2Q8JjfrsIsoSX2Avyna6OIpDiv1Pg/RRvcg2OPebNbh
	RfGiX2Ah8CJbhJuzjsFoLNqYRDVvIhhgYtVPSgl1So1ki4BjzebqWhShN7TYuHyaSqi9ib
	Hrc/HV8HuVlOxzLSa8JZvTC+bCCrdRc5SWYjKIANhutyst2R/ot3CLRwGN7/zDHf4S5r3F
	Mg1ruvE7tQMPCaQP30jZ2hFPzn42Dg6P6qQsaode/EW/shXz/1oWzJt4uZ6DUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747380974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5cgzWsQ8I/J4IHzkw06AbhnUPCnKULK4+BfgY7N/Ues=;
	b=2BhK2P6RsnA6P4kw3DaVXQ/ZJP5/vXJmOOiNCvMbp9MhBM4Cuky7LsaEf0gcSc4/u05V5b
	ZW5CQ0E4lqSVzCAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Borislav Petkov <bp@kernel.org>, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: [PATCH v2] futex: Fix kernel-doc comments
Message-ID: <20250516073613.ZYaQZ1wZ@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: "Borislav Petkov (AMD)" <bp@alien8.de>

Fix those:

  ./kernel/futex/futex.h:208: warning: Function parameter or struct member =
'drop_hb_ref' not described in 'futex_q'
  ./kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wai=
t_queue(). Prototype was for futex_do_wait() instead
  ./kernel/futex/waitwake.c:594: warning: Function parameter or struct memb=
er 'task' not described in 'futex_wait_setup'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20250512185218.6bfd18b4@canb.auug.org.au
Closes: https://lore.kernel.org/r/20250512185641.0450a99b@canb.auug.org.au
Fixes: 93f1b6d79a73 ("futex: Move futex_queue() into futex_wait_setup()")
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Acked-by: Ingo Molnar <mingo@kernel.org>
---
v1=E2=80=A6v2: https://lore.kernel.org/all/20250515171641.24073-1-bp@kernel=
=2Eorg/
  - Add tags, references.
  - Futex spelling.

 kernel/futex/futex.h    | 1 +
 kernel/futex/waitwake.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 069fc2a83080d..6d163003ef7f6 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -175,6 +175,7 @@ typedef void (futex_wake_fn)(struct wake_q_head *wake_q=
, struct futex_q *q);
  * @requeue_pi_key:	the requeue_pi target futex key
  * @bitset:		bitset for the optional bitmasked wakeup
  * @requeue_state:	State field for futex_requeue_pi()
+ * @drop_hb_ref:	Waiter must drop the extra hash bucket reference if true
  * @requeue_wait:	RCU wait for futex_requeue_pi() (RT only)
  *
  * We use this hashed waitqueue, instead of a normal wait_queue_entry_t, so
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index bd8fef0f8d180..b3738fbe83c62 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -334,8 +334,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flag=
s, u32 __user *uaddr2,
 static long futex_wait_restart(struct restart_block *restart);
=20
 /**
- * futex_wait_queue() - futex_queue() and wait for wakeup, timeout, or sig=
nal
- * @hb:		the futex hash bucket, must be locked by the caller
+ * futex_do_wait() - wait for wakeup, timeout, or signal
  * @q:		the futex_q to queue up on
  * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
  */
@@ -578,7 +577,7 @@ int futex_wait_multiple(struct futex_vector *vs, unsign=
ed int count,
  * @flags:	futex flags (FLAGS_SHARED, etc.)
  * @q:		the associated futex_q
  * @key2:	the second futex_key if used for requeue PI
- * task:	Task queueing this futex
+ * @task:	Task queueing this futex
  *
  * Setup the futex_q and locate the hash_bucket.  Get the futex value and
  * compare it with the expected value.  Handle atomic faults internally.
--=20
2.49.0

