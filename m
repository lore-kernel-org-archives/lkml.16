Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F05205AB5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591188; cv=none; b=hKptd2CMWolDjdRFt4uZmQKUvNiF47VBwyuVkPTehTyhJVyipsQRyNQsVUx8oL8y1uH4jg/I6agfStGGWnVoZtcE+JtmuQnSXds8WMm7IN67J3T2GKG+rkHNiuo/N7TNZejg/WauAFKQ01x17aSo274yIOzvNGyu8K8zRhBjMGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591188; c=relaxed/simple;
	bh=0XXWylux21wmXCjjhIFOvVe9sS4zaU/MFgX+/8PLhvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLMbTJYkq32GXFYHQvWzO3rMgUY4lS2oGG6YHb03goeHOdOzSJeUNg7hriOPRiW43Sq8w6sKsh1jwq9MR3Dq1uEOdmzw7Mkg+rB1MjYd0a1rYJazAIvUI5M0AMfcVaF6qLv9ui+kW1f7wEmSrHnzxY6+DuBheH1LupmUu7Pg6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E4nICYjn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mZ+vOkIr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E4nICYjn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mZ+vOkIr"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7xCSCJQLcL9ZuyvcbAlBoIzs1uRrQYGWOhagszxr9E=;
	b=E4nICYjnr19U+nUwGA1oShLP23NPjHkVeP8x8UA2intYCkNs/gGPgNa7+7p6x5tQad/bIp
	RDQeoIpJCA3fCBsGAtSW8rYTemJMSdjAhsYPCqprYUWawuV+UMT0Wramx8GzYX6asHkpkA
	X6/ba4P0leV9O/gIulsAasYhzRlehYeaLBPCub8bjbwmyILfbvMKi2MZQ48GeluclV85LD
	VobrokdlIgkvLrQjU9bJCFvb86GJIuZwEKHSXYXMoXNQt9ktWJFPJP4jXWDrhTTWLkeLK6
	yNhjOnUiNVbxrHf0p8E/7RIIdjquUYT1Nye3goXQybjrTy3Q3LYCgvoGedxc8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7xCSCJQLcL9ZuyvcbAlBoIzs1uRrQYGWOhagszxr9E=;
	b=mZ+vOkIrHXaQ+FU/c/rN+YBtWmT1eE92CgkPN51vMuUodMeNQQRw3Qg6BsUPmg40ZmKaa1
	7oKnVLxrhS/F7iDw==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	kernel test robot <oliver.sang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v8 01/15] rcuref: Avoid false positive "imbalanced put" report.
Date: Mon,  3 Feb 2025 14:59:21 +0100
Message-ID: <20250203135935.440018-2-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Thomas Gleixner <tglx@linutronix.de>

The kernel test robot reported an "imbalanced put" which turned out to
be false positive. Consider the following race:

            ref  =3D 0 (via rcuref_init(ref, 1))
 T1                                      T2
 rcuref_put(ref)
 -> atomic_add_negative_release(-1, ref)                                   =
      # ref -> 0xffffffff
 -> rcuref_put_slowpath(ref)
                                         rcuref_get(ref)
                                         -> atomic_add_negative_relaxed(1, =
&ref->refcnt)
                                           -> return true;                 =
      # ref -> 0

                                         rcuref_put(ref)
                                         -> atomic_add_negative_release(-1,=
 ref) # ref -> 0xffffffff
                                         -> rcuref_put_slowpath()

    -> cnt =3D atomic_read(&ref->refcnt);                                  =
        # cnt -> 0xffffffff / RCUREF_NOREF
    -> atomic_try_cmpxchg_release(&ref->refcnt, &cnt, RCUREF_DEAD))        =
      # ref -> 0xe0000000 / RCUREF_DEAD
       -> return true
                                           -> cnt =3D atomic_read(&ref->ref=
cnt);   # cnt -> 0xe0000000 / RCUREF_DEAD
                                           -> if (cnt > RCUREF_RELEASED)   =
      # 0xe0000000 > 0xc0000000
                                             -> WARN_ONCE(cnt >=3D RCUREF_R=
ELEASED, "rcuref - imbalanced put()")

The problem is the additional read in the slow path (after it
decremented to RCUREF_NOREF) which can happen after the counter has been
marked RCUREF_DEAD.

Avoid the false positive by reusing the returning value from the
decrement. Now every "final" put uses RCUREF_NOREF in the slow path and
attempts the final cmpxchg() to RCUREF_DEAD.

Fixes: ee1ee6db07795 ("atomics: Provide rcuref - scalable reference countin=
g")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202412311453.9d7636a2-lkp@intel.com
Debugged-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/rcuref.h | 9 ++++++---
 lib/rcuref.c           | 5 ++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/rcuref.h b/include/linux/rcuref.h
index 2c8bfd0f1b6b3..6322d8c1c6b42 100644
--- a/include/linux/rcuref.h
+++ b/include/linux/rcuref.h
@@ -71,27 +71,30 @@ static inline __must_check bool rcuref_get(rcuref_t *re=
f)
 	return rcuref_get_slowpath(ref);
 }
=20
-extern __must_check bool rcuref_put_slowpath(rcuref_t *ref);
+extern __must_check bool rcuref_put_slowpath(rcuref_t *ref, unsigned int c=
nt);
=20
 /*
  * Internal helper. Do not invoke directly.
  */
 static __always_inline __must_check bool __rcuref_put(rcuref_t *ref)
 {
+	int cnt;
+
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held() && preemptible(),
 			 "suspicious rcuref_put_rcusafe() usage");
 	/*
 	 * Unconditionally decrease the reference count. The saturation and
 	 * dead zones provide enough tolerance for this.
 	 */
-	if (likely(!atomic_add_negative_release(-1, &ref->refcnt)))
+	cnt =3D atomic_sub_return_release(1, &ref->refcnt);
+	if (likely(cnt >=3D 0))
 		return false;
=20
 	/*
 	 * Handle the last reference drop and cases inside the saturation
 	 * and dead zones.
 	 */
-	return rcuref_put_slowpath(ref);
+	return rcuref_put_slowpath(ref, cnt);
 }
=20
 /**
diff --git a/lib/rcuref.c b/lib/rcuref.c
index 97f300eca927c..5bd726b71e393 100644
--- a/lib/rcuref.c
+++ b/lib/rcuref.c
@@ -220,6 +220,7 @@ EXPORT_SYMBOL_GPL(rcuref_get_slowpath);
 /**
  * rcuref_put_slowpath - Slowpath of __rcuref_put()
  * @ref:	Pointer to the reference count
+ * @cnt:	The resulting value of the fastpath decrement
  *
  * Invoked when the reference count is outside of the valid zone.
  *
@@ -233,10 +234,8 @@ EXPORT_SYMBOL_GPL(rcuref_get_slowpath);
  *	with a concurrent get()/put() pair. Caller is not allowed to
  *	deconstruct the protected object.
  */
-bool rcuref_put_slowpath(rcuref_t *ref)
+bool rcuref_put_slowpath(rcuref_t *ref, unsigned int cnt)
 {
-	unsigned int cnt =3D atomic_read(&ref->refcnt);
-
 	/* Did this drop the last reference? */
 	if (likely(cnt =3D=3D RCUREF_NOREF)) {
 		/*
--=20
2.47.2

