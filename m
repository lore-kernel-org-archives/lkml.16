Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0721FF2B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716149; cv=none; b=ESSs3PLXFENb7l0jePuMtn+R5yRS7nytQB32J++nuHb//iLwcHQ4t0v+Zj8BVOnd4JuX39ljDLykZapVxHdKxxqripFJ+8rTaX1fV+2r0hKufMPDEnq4sENILUUXLLDKCM5rHJ6QS8meP26SMTFawSJEa0IOdiLpvCb9xHtfE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716149; c=relaxed/simple;
	bh=fvvdS25ZOF+u2TiGjC9+OgPPwz5ZhHwKvokRBu3sWbQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=upr6NND6z/a3Qfoec9p8pr1wVIxvR2afh9hcUzzmaRXrNoHcRJbpu6RntG7rF8yed0PUOki5g45tP4sXuSIP86Jf8qDO/MiL6VOgEYdAPrQ1B10SfHZoPy6JAa2Yf9MLTwDaNPQQh0i0J8yE3T5SUxJqkP+bw5hsN1QNTlu4tXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LMAkVQy1; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LMAkVQy1"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so3363509a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750716147; x=1751320947; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8L3Fi/GhTiu7PX70iFvVvD6e0wO/bSirTG1iuZpTaEI=;
        b=LMAkVQy1Mo0do0+pV+SaeFHrE8BOJdERqVx449wvRMgSiirC3pBC+YWuFIeiqOaJju
         kSs+vr5HlEUz0Vp1W6L+Xx+F1m+aMrfyT7DC7NbwCfo83nXyvEtqgNeqF+ngsULia4nG
         at2EMGLXeg8nRRqseDT2nO4MQi9HH5u/hdbLXkt8yMwtqJlVGA5Il7PoHcgHzAJ8r7Px
         ku4h4nsT7ylmS0BCj/TPcaG2zM52KiFq2FWCMcf9JrViyiDdkrL3ae1u5KOsnnGm1gt9
         GMAubbtXCh6FEIaDTzw0kHwkYFsMoUVR/wCUSy+YXoDMgKUj0nGnyTxJSNohXZ9h9Ak7
         GfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716147; x=1751320947;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8L3Fi/GhTiu7PX70iFvVvD6e0wO/bSirTG1iuZpTaEI=;
        b=dDm6oAJbk1Zi0BNXsbjn1Ht+XHPGe/as+pqwUFuWqAuvzB6EMB8F1VurQ0KkI/Xr27
         qf08KCbWh1FhbwVM5Nhm5o9hdZ9zYb0CVPHGN78UIkVwrIpQhzY0IO2mqkVgeouRciSc
         q43phC/PiQ6AKd7Tu7NbPZ1VMZG0LD9ZnNPT/0/b3SnCW5fHFwiAyM8z3I5JZ+8VTP6Z
         zpPXj5B1rnipa6Yib0n6swOFNEXJ2jJHVZOJFUIOMHcFnVvduwV25w1tzYvrTfr6e5g+
         WNSUBZSpeKjacFXjWrJR68Y+jKEN2NFYeK4rWTZd37bckU2aLRbFmfNGCgf2raEgPFQV
         DC2Q==
X-Gm-Message-State: AOJu0YxHx1dV9JzFM8ZFkVyPxX9eYJqyB279q4pE9MzsDFx1gmwE+IET
	uf2RrCJKDuKTG3YF6GfkCJdIe1CsIi6br6JIi26dpz1UwvhqDjWtywkx7lw6jMgNrKGDlNYpvn3
	bTUtdB6k/GaAxNlWwCGXgFw5ucXkEgaVmLTWP5bNP9xAU1PftYEvFNyxoRzAbJQgXAO8ZUh7jCu
	gIek3TbJzxb0DNdH1vlhurPNToINTj+ImfhQ3HtmOvwJ5LJSA6
X-Google-Smtp-Source: AGHT+IHaom54WyfH82+zTeT2+vyask2nvVs188X83oWPBfRqKnoxY2ZMSTtxjLseXadhIfRLBm3vNzSLKY37
X-Received: from pgbfe24.prod.google.com ([2002:a05:6a02:2898:b0:b2f:556f:74a2])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d486:b0:21f:5adb:52c4
 with SMTP id adf61e73a8af0-22026e6f2bfmr23660974637.30.1750716146702; Mon, 23
 Jun 2025 15:02:26 -0700 (PDT)
Date: Mon, 23 Jun 2025 22:02:17 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250623220221.978054-1-jstultz@google.com>
Subject: [PATCH 1/2] test-ww_mutex: Allow test to be run (and re-run) from userland
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

In cases where the ww_mutex test was occasionally tripping on
hard to find issues, leaving qemu in a reboot loop was my best
way to reproduce problems. These reboots however wasted time
when I just wanted to run the test-ww_mutex logic.

So tweak the test-ww_mutex test so that it can be re-triggered
via a sysfs file, so the test can be run repeatedly without
doing module loads or restarting.

This has been particularly valuable to stressing and finding
issues with the proxy-exec series.

To use, run as root:
  echo 1 > /sys/kernel/test_ww_mutex/run_tests

Signed-off-by: John Stultz <jstultz@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kernel-team@android.com
---
 kernel/locking/test-ww_mutex.c | 70 ++++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 7 deletions(-)

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 10a5736a21c22..cc0d2e59049a8 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -636,19 +636,15 @@ static int stress(int nlocks, int nthreads, unsigned int flags)
 	return 0;
 }
 
-static int __init test_ww_mutex_init(void)
+static DEFINE_MUTEX(run_lock);
+
+static int run_tests(void)
 {
 	int ncpus = num_online_cpus();
 	int ret, i;
 
 	printk(KERN_INFO "Beginning ww mutex selftests\n");
 
-	prandom_seed_state(&rng, get_random_u64());
-
-	wq = alloc_workqueue("test-ww_mutex", WQ_UNBOUND, 0);
-	if (!wq)
-		return -ENOMEM;
-
 	ret = test_mutex();
 	if (ret)
 		return ret;
@@ -687,8 +683,68 @@ static int __init test_ww_mutex_init(void)
 	return 0;
 }
 
+static ssize_t run_tests_store(struct kobject *kobj, struct kobj_attribute *attr,
+			       const char *buf, size_t count)
+{
+	if (!mutex_trylock(&run_lock)) {
+		pr_err("Test already running\n");
+		return count;
+	}
+
+	run_tests();
+	mutex_unlock(&run_lock);
+
+	return count;
+}
+
+static struct kobj_attribute run_tests_attribute =
+	__ATTR(run_tests, 0664, NULL, run_tests_store);
+
+static struct attribute *attrs[] = {
+	&run_tests_attribute.attr,
+	NULL,   /* need to NULL terminate the list of attributes */
+};
+
+static struct attribute_group attr_group = {
+	.attrs = attrs,
+};
+
+static struct kobject *test_ww_mutex_kobj;
+
+static int __init test_ww_mutex_init(void)
+{
+	int ret;
+
+	prandom_seed_state(&rng, get_random_u64());
+
+	wq = alloc_workqueue("test-ww_mutex", WQ_UNBOUND, 0);
+	if (!wq)
+		return -ENOMEM;
+
+	test_ww_mutex_kobj = kobject_create_and_add("test_ww_mutex", kernel_kobj);
+	if (!test_ww_mutex_kobj) {
+		destroy_workqueue(wq);
+		return -ENOMEM;
+	}
+
+	/* Create the files associated with this kobject */
+	ret = sysfs_create_group(test_ww_mutex_kobj, &attr_group);
+	if (ret) {
+		kobject_put(test_ww_mutex_kobj);
+		destroy_workqueue(wq);
+		return ret;
+	}
+
+	mutex_lock(&run_lock);
+	ret = run_tests();
+	mutex_unlock(&run_lock);
+
+	return ret;
+}
+
 static void __exit test_ww_mutex_exit(void)
 {
+	kobject_put(test_ww_mutex_kobj);
 	destroy_workqueue(wq);
 }
 
-- 
2.50.0.727.gbf7dc18ff4-goog

