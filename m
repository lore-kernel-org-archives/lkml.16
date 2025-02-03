Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64391202C2F
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605820; cv=none; b=GYsJvo1Q5CWUoScjpbytGLYmuXmWf3jfnpJVIdEK+97tBH5BSY+/DYjV4PiKY8H/5n6q8h2JK80vS4NJnE10Sz75TpC4vawaBBBDBp4ehmzTSlbcDN1EcCJxwgk2ufYIPi+ZawdvhVbCTKFfoUHicrmUmRwYYi5VYrTx1awdMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605820; c=relaxed/simple;
	bh=mx89vJd0mZdkNeKER6qd6QkkKbtOiLuvZ7zCTY1Jq8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqTerUh4Qj2OV2cJRXT0B+lKWDPv1Qh9GzaE7Z+57xvxSoVQFOXG5fCn1CIRz7NjFd+Ml5hhT0R7o4xoXO8HYyqThEYCFNgPMzzjLjm7yzwgiW1AlSNjdrF6OknUH/0YTWFe21y3/YWDdGKgdC8fxK44ezqlMkyF0MvatQt3MgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=W8fO30FZ; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="W8fO30FZ"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YmvQs2cKtzlgTxF;
	Mon,  3 Feb 2025 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738605586; x=1741197587; bh=IO29O
	MTLluwkP+ZIQVeyVWjSC5idaDJLS0yi/Rvxkm8=; b=W8fO30FZriggBiLcV7DmV
	9yTQ7Yb/4hOBp+rz5D1SlPVS9oeJc0njeZ/iOhiGyMmKQHiYq6mAHjTvKZMz4VjA
	FiP4QUlq7aiM0iPGdEhVpZHz+0FHnIvCAuKzmkTgRmx5KWKjJN53Y++zAfgt0wIw
	tqnxwwdlmR/p7E4VSGNA4ARLseXJR66fc3UuGS/XuHMzgtxyRVQbReSj1sbMdZQG
	0eybUvdlP3zTI6dIkrY+8LqJ0LsFK++BH78Qm9jJ6yfonfxHmxCh/KgobFr7trYf
	BeOi+OVtGi8B6imGsR5Ng4vio02BgZR5yWBLoscLjVqg0MRgl9XBi6f3uudUGPC+
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 97SNJGlJjeSx; Mon,  3 Feb 2025 17:59:46 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YmvQn3gCqzlgTx2;
	Mon,  3 Feb 2025 17:59:45 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH 2/5] irqdesc: Use dynamic lockdep keys for interrupt descriptors
Date: Mon,  3 Feb 2025 09:59:36 -0800
Message-ID: <20250203175939.3133477-3-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250203175939.3133477-1-bvanassche@acm.org>
References: <20250203175939.3133477-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Having to call irq_set_lockdep_class() if nested locking is expected is
cumbersome. Hence, prepare for removing irq_set_lockdep_class() by
associating a dynamic key with the synchronization objects in interrupt
descriptors.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/irqdesc.h |  4 ++++
 kernel/irq/irqdesc.c    | 22 +++++++++-------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index fd091c35d572..5f4bd476fcc8 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -46,6 +46,7 @@ struct irqstat {
  * @threads_handled:	stats field for deferred spurious detection of thre=
aded handlers
  * @threads_handled_last: comparator field for deferred spurious detecti=
on of threaded handlers
  * @lock:		locking for SMP
+ * @lock_key:		Lockdep class for @lock
  * @affinity_hint:	hint to user space for preferred irq affinity
  * @affinity_notify:	context for notification of affinity changes
  * @pending_mask:	pending rebalanced interrupts
@@ -60,6 +61,7 @@ struct irqstat {
  * @rcu:		rcu head for delayed free
  * @kobj:		kobject used to represent this struct in sysfs
  * @request_mutex:	mutex to protect request/free before locking desc->lo=
ck
+ * @request_key:	Lockdep class for @request_mutex
  * @dir:		/proc/irq/ procfs entry
  * @debugfs_file:	dentry for the debugfs file
  * @name:		flow handler name for /proc/interrupts output
@@ -81,6 +83,7 @@ struct irq_desc {
 	atomic_t		threads_handled;
 	int			threads_handled_last;
 	raw_spinlock_t		lock;
+	struct lock_class_key	lock_key;
 	struct cpumask		*percpu_enabled;
 	const struct cpumask	*percpu_affinity;
 #ifdef CONFIG_SMP
@@ -111,6 +114,7 @@ struct irq_desc {
 	struct kobject		kobj;
 #endif
 	struct mutex		request_mutex;
+	struct lock_class_key	request_key;
 	int			parent_irq;
 	struct module		*owner;
 	const char		*name;
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 287830739783..261305a213fd 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -19,11 +19,6 @@
=20
 #include "internals.h"
=20
-/*
- * lockdep: we want to handle all irq_desc locks as a single lock-class:
- */
-static struct lock_class_key irq_desc_lock_class;
-
 #if defined(CONFIG_SMP)
 static int __init irq_affinity_setup(char *str)
 {
@@ -222,8 +217,11 @@ static int init_desc(struct irq_desc *desc, int irq,=
 int node,
 	}
=20
 	raw_spin_lock_init(&desc->lock);
-	lockdep_set_class(&desc->lock, &irq_desc_lock_class);
+	lockdep_register_key(&desc->lock_key);
+	lockdep_set_class(&desc->lock, &desc->lock_key);
 	mutex_init(&desc->request_mutex);
+	lockdep_register_key(&desc->request_key);
+	lockdep_set_class(&desc->lock, &desc->request_key);
 	init_waitqueue_head(&desc->wait_for_threads);
 	desc_set_defaults(irq, desc, node, affinity, owner);
 	irqd_set(&desc->irq_data, flags);
@@ -484,13 +482,17 @@ static struct irq_desc *alloc_desc(int irq, int nod=
e, unsigned int flags,
 	return desc;
 }
=20
+/* Called from RCU context. Hence, must not sleep. */
 static void irq_kobj_release(struct kobject *kobj)
 {
 	struct irq_desc *desc =3D container_of(kobj, struct irq_desc, kobj);
=20
 	free_masks(desc);
 	free_percpu(desc->kstat_irqs);
-	kfree(desc);
+	lockdep_unregister_key_nosync(&desc->request_key);
+	lockdep_unregister_key_nosync(&desc->lock_key);
+	init_rcu_head(&desc->rcu);
+	kfree_rcu(desc, rcu);
 }
=20
 static void delayed_free_desc(struct rcu_head *rhp)
@@ -1064,12 +1066,6 @@ unsigned int kstat_irqs_usr(unsigned int irq)
 void __irq_set_lockdep_class(unsigned int irq, struct lock_class_key *lo=
ck_class,
 			     struct lock_class_key *request_class)
 {
-	struct irq_desc *desc =3D irq_to_desc(irq);
-
-	if (desc) {
-		lockdep_set_class(&desc->lock, lock_class);
-		lockdep_set_class(&desc->request_mutex, request_class);
-	}
 }
 EXPORT_SYMBOL_GPL(__irq_set_lockdep_class);
 #endif
