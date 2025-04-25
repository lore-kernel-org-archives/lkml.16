Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1753D635
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745539942; cv=none; b=k0nYl8KlbvEKu7uR+bNG6clynb7lR7YnXFeVcVR5NIC1DFF3UGzq0owfBJtWLXio5b7rZtxYbnmC+NEBqiPABcOeg3giEEjww4GeEwnn3lbCuse3KzPmoRdhkfSL2hy1nBJHAsdroQ+u1Y8eQ7CWY1siRn7xdvPyjkvkx/IzJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745539942; c=relaxed/simple;
	bh=mSAkyRrlS4RWs9dUH73a6X0GtRQm7FphjXDyJwnCwmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=deUjVsxasd/j3H3OW25XgD6jBJ5G2ghY5GrC+6Ls2RuSdzJtZc3Ga/Fec6/ZrnNXr1z6yUdkcPItYZojMQeBGNMbrg6ijM5OFg8/V7jw2J2zP5Dxx7nhLYA3lmIpqsDqpwj13ZW0B70H9cSCAAIQwRg+WRTVWKq/2kvB1KMtvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vv83FbgG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vv83FbgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745539938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kQcvzcnT5aScS8ASOkFqskiyRQfrz1IO3IY/1lp2bgQ=;
	b=Vv83FbgGeQ4rAxI4t2OL36TvhKatBQUp4VU/WU0QSh4zP5WS5ZUOkfqyTVTmqaDQcRKgZr
	1T8BaGoMOkCIlLbS7hew4LD8wdoVIiUqz1323fljnXdoHTQWITXPNsPaSTSif8XOEfRjZ3
	x+gyqyaml3bDJGjaGQi91rB36ST6XzM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-3MXQFOTrMOSVDT5QpR7uPQ-1; Thu,
 24 Apr 2025 20:12:13 -0400
X-MC-Unique: 3MXQFOTrMOSVDT5QpR7uPQ-1
X-Mimecast-MFC-AGG-ID: 3MXQFOTrMOSVDT5QpR7uPQ_1745539932
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF3E919560AB;
	Fri, 25 Apr 2025 00:12:11 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.81.10])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DB4C018001D5;
	Fri, 25 Apr 2025 00:12:09 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats
Date: Thu, 24 Apr 2025 20:11:55 -0400
Message-ID: <20250425001155.775458-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

There have been recent reports about running out of lockdep keys
(MAX_LOCKDEP_KEYS too low!). One possible reason is that too many
dynamic keys have been registered. A possible culprit is the
lockdep_register_key() call in qdisc_alloc() of net/sched/sch_generic.c.

Currently, there is no way to find out how many dynamic keys have been
registered. Add such a stat to the /proc/lockdep_stats to get better
clarity.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/lockdep.c           | 3 +++
 kernel/locking/lockdep_internals.h | 1 +
 kernel/locking/lockdep_proc.c      | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 58d78a33ac65..aeedaaaa403c 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -219,6 +219,7 @@ static DECLARE_BITMAP(list_entries_in_use, MAX_LOCKDEP_ENTRIES);
 static struct hlist_head lock_keys_hash[KEYHASH_SIZE];
 unsigned long nr_lock_classes;
 unsigned long nr_zapped_classes;
+unsigned long nr_dynamic_keys;
 unsigned long max_lock_class_idx;
 struct lock_class lock_classes[MAX_LOCKDEP_KEYS];
 DECLARE_BITMAP(lock_classes_in_use, MAX_LOCKDEP_KEYS);
@@ -1238,6 +1239,7 @@ void lockdep_register_key(struct lock_class_key *key)
 			goto out_unlock;
 	}
 	hlist_add_head_rcu(&key->hash_entry, hash_head);
+	nr_dynamic_keys++;
 out_unlock:
 	graph_unlock();
 restore_irqs:
@@ -6606,6 +6608,7 @@ void lockdep_unregister_key(struct lock_class_key *key)
 		pf = get_pending_free();
 		__lockdep_free_key_range(pf, key, 1);
 		need_callback = prepare_call_rcu_zapped(pf);
+		nr_dynamic_keys--;
 	}
 	lockdep_unlock();
 	raw_local_irq_restore(flags);
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 20f9ef58d3d0..82156caf77d1 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -138,6 +138,7 @@ extern unsigned long nr_lock_classes;
 extern unsigned long nr_zapped_classes;
 extern unsigned long nr_zapped_lock_chains;
 extern unsigned long nr_list_entries;
+extern unsigned long nr_dynamic_keys;
 long lockdep_next_lockchain(long i);
 unsigned long lock_chain_count(void);
 extern unsigned long nr_stack_trace_entries;
diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 6db0f43fc4df..b52c07c4707c 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -286,6 +286,8 @@ static int lockdep_stats_show(struct seq_file *m, void *v)
 #endif
 	seq_printf(m, " lock-classes:                  %11lu [max: %lu]\n",
 			nr_lock_classes, MAX_LOCKDEP_KEYS);
+	seq_printf(m, " dynamic-keys:                  %11lu\n",
+			nr_dynamic_keys);
 	seq_printf(m, " direct dependencies:           %11lu [max: %lu]\n",
 			nr_list_entries, MAX_LOCKDEP_ENTRIES);
 	seq_printf(m, " indirect dependencies:         %11lu\n",
-- 
2.49.0

