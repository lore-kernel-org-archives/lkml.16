Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653E1FF5E3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661098; cv=none; b=CzGrWuUSw1u+4SvViVhf7LdRdCz0ZREZz9IT27Zo61QTk+MlM+9ELgYSqEVSju3qP4lRlnjr4Vh48AfbnpBsU/Jayi3vUnZXSTLzGOFCOgx1IHK7LZ2nB1ccmswL9rZC7PVW7+J9q31iPSO7KZNNfJgLXfPkqTpAofr9QR+WGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661098; c=relaxed/simple;
	bh=24MdMqHnsa1q2E8nZ1//rOnV2wF+GFe3tThZ75IavTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nn5yRiOP+0/YsFjVm8zp4miv5Q7OlBGck2Eqzs5b7YdMPSwXlGGyZdmUh2Rd5CPIqod5wX0AiArv+AaVvBX2jgn4NIeXh3l36f760hnDpg6rEDgrhMzbDglnbcCh5idUGqwzLfIN3yYpHivAwD2LZd/6jatDgaafIrWwbtpoMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b1JLl4d57z4f3k6d
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:24:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 6A1461A1096
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:24:51 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP2 (Coremail) with SMTP id Syh0CgDXk2YDMSto5JogMw--.10967S4;
	Mon, 19 May 2025 21:24:50 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de,
	bigeasy@linutronix.de,
	paulmck@kernel.org,
	chenridong@huawei.com,
	roman.gushchin@linux.dev,
	brauner@kernel.org,
	pmladek@suse.com,
	geert@linux-m68k.org,
	mingo@kernel.org,
	rrangel@chromium.org,
	francesco@valla.it,
	kpsingh@kernel.org,
	guoweikang.kernel@gmail.com,
	link@vivo.com,
	viro@zeniv.linux.org.uk,
	neil@brown.name,
	nichen@iscas.ac.cn,
	tglx@linutronix.de,
	frederic@kernel.org,
	peterz@infradead.org,
	oleg@redhat.com,
	joel.granados@kernel.org,
	linux@weissschuh.net,
	avagin@google.com,
	legion@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lujialin4@huawei.com
Subject: [RFC next v2 2/2] ucounts: turn the atomic rlimit to percpu_counter
Date: Mon, 19 May 2025 13:11:51 +0000
Message-Id: <20250519131151.988900-3-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519131151.988900-1-chenridong@huaweicloud.com>
References: <20250519131151.988900-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgDXk2YDMSto5JogMw--.10967S4
X-Coremail-Antispam: 1UD129KBjvAXoWfGrWfZry8Jw4UZr1xuFy5CFg_yoW8Jw43Co
	WxCws8JF18Gr1Ivr1DKrn5CF15Xry5Aay5Xr43Jr4q93W7Zw4UWrWDAF15Xa9xuw1v9r1D
	Z343t3yftFsrJa4Dn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOn7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr
	yl82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U0KiiDUUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

The will-it-scale test case signal1 [1] has been observed. and the test
results reveal that the signal sending system call lacks linearity.
To further investigate this issue, we initiated a series of tests by
launching varying numbers of dockers and closely monitored the throughput
of each individual docker. The detailed test outcomes are presented as
follows:

  | Dockers 	|1	|4	|8	|16	|32	|64	|
  | Throughput 	|380068	|353204	|308948	|306453	|180659	|129152	|

The data clearly demonstrates a discernible trend: as the quantity of
dockers increases, the throughput per container progressively declines.
In-depth analysis has identified the root cause of this performance
degradation. The ucounts module conducts statistics on rlimit, which
involves a significant number of atomic operations. These atomic
operations, when acting on the same variable, trigger a substantial number
of cache misses or remote accesses, ultimately resulting in a drop in
performance.

To address the above issues, this patch converts the atomic rlimit to a
percpu_counter. After the optimization, the performance data is shown
below, demonstrating that the throughput no longer declines as the number
of Docker containers increases:

  | Dockers 	|1	|4	|8	|16	|32	|64	|
  | Throughput 	|374737	|376377	|374814	|379284	|374950	|377509	|

[1] https://github.com/antonblanchard/will-it-scale/blob/master/tests/
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 include/linux/user_namespace.h | 16 ++++--
 init/main.c                    |  1 +
 ipc/mqueue.c                   |  6 +--
 kernel/signal.c                |  8 +--
 kernel/ucount.c                | 98 ++++++++++++++++++++++------------
 mm/mlock.c                     |  5 +-
 6 files changed, 81 insertions(+), 53 deletions(-)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 6e2229ea4673..0d1251e1f9ea 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -12,6 +12,7 @@
 #include <linux/rwsem.h>
 #include <linux/sysctl.h>
 #include <linux/err.h>
+#include <linux/percpu_counter.h>
 
 #define UID_GID_MAP_MAX_BASE_EXTENTS 5
 #define UID_GID_MAP_MAX_EXTENTS 340
@@ -124,7 +125,7 @@ struct ucounts {
 	rcuref_t count;
 	atomic_long_t freed;
 	atomic_long_t ucount[UCOUNT_COUNTS];
-	atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
+	struct percpu_counter rlimit[UCOUNT_RLIMIT_COUNTS];
 };
 
 extern struct user_namespace init_user_ns;
@@ -136,6 +137,7 @@ struct ucounts *inc_ucount(struct user_namespace *ns, kuid_t uid, enum ucount_ty
 void dec_ucount(struct ucounts *ucounts, enum ucount_type type);
 struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid);
 void put_ucounts(struct ucounts *ucounts);
+void __init ucounts_init(void);
 
 static inline struct ucounts * __must_check get_ucounts(struct ucounts *ucounts)
 {
@@ -146,13 +148,17 @@ static inline struct ucounts * __must_check get_ucounts(struct ucounts *ucounts)
 
 static inline long get_rlimit_value(struct ucounts *ucounts, enum rlimit_type type)
 {
-	return atomic_long_read(&ucounts->rlimit[type]);
+	return percpu_counter_sum(&ucounts->rlimit[type]);
 }
 
-long inc_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v);
-bool dec_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v);
+bool inc_rlimit_ucounts_limit(struct ucounts *ucounts, enum rlimit_type type, long v, long limit);
+static inline bool inc_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v)
+{
+	return inc_rlimit_ucounts_limit(ucounts, type, v, LONG_MAX);
+}
+void dec_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v);
 long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
-			    bool override_rlimit);
+			    bool override_rlimit, long limit);
 void dec_rlimit_put_ucounts(struct ucounts *ucounts, enum rlimit_type type);
 bool is_rlimit_overlimit(struct ucounts *ucounts, enum rlimit_type type, unsigned long max);
 
diff --git a/init/main.c b/init/main.c
index 7f0a2a3dbd29..1168c0c453ff 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1071,6 +1071,7 @@ void start_kernel(void)
 		efi_enter_virtual_mode();
 #endif
 	thread_stack_cache_init();
+	ucounts_init();
 	cred_init();
 	fork_init();
 	proc_caches_init();
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 35b4f8659904..e4bd211900ab 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -371,11 +371,9 @@ static struct inode *mqueue_get_inode(struct super_block *sb,
 		mq_bytes += mq_treesize;
 		info->ucounts = get_ucounts(current_ucounts());
 		if (info->ucounts) {
-			long msgqueue;
-
 			spin_lock(&mq_lock);
-			msgqueue = inc_rlimit_ucounts(info->ucounts, UCOUNT_RLIMIT_MSGQUEUE, mq_bytes);
-			if (msgqueue == LONG_MAX || msgqueue > rlimit(RLIMIT_MSGQUEUE)) {
+			if (!inc_rlimit_ucounts_limit(info->ucounts, UCOUNT_RLIMIT_MSGQUEUE,
+							mq_bytes, rlimit(RLIMIT_MSGQUEUE))) {
 				dec_rlimit_ucounts(info->ucounts, UCOUNT_RLIMIT_MSGQUEUE, mq_bytes);
 				spin_unlock(&mq_lock);
 				put_ucounts(info->ucounts);
diff --git a/kernel/signal.c b/kernel/signal.c
index f8859faa26c5..2b6ed2168db6 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -416,13 +416,9 @@ static struct ucounts *sig_get_ucounts(struct task_struct *t, int sig,
 	rcu_read_lock();
 	ucounts = task_ucounts(t);
 	sigpending = inc_rlimit_get_ucounts(ucounts, UCOUNT_RLIMIT_SIGPENDING,
-					    override_rlimit);
+					    override_rlimit, task_rlimit(t, RLIMIT_SIGPENDING));
 	rcu_read_unlock();
-	if (!sigpending)
-		return NULL;
-
-	if (unlikely(!override_rlimit && sigpending > task_rlimit(t, RLIMIT_SIGPENDING))) {
-		dec_rlimit_put_ucounts(ucounts, UCOUNT_RLIMIT_SIGPENDING);
+	if (!sigpending) {
 		print_dropped_signal(sig);
 		return NULL;
 	}
diff --git a/kernel/ucount.c b/kernel/ucount.c
index 125471af7d59..a856f3d4a9a1 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -158,6 +158,7 @@ struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid)
 {
 	struct hlist_nulls_head *hashent = ucounts_hashentry(ns, uid);
 	struct ucounts *ucounts, *new;
+	int i = 0, j = 0;
 
 	ucounts = find_ucounts(ns, uid, hashent);
 	if (ucounts)
@@ -170,11 +171,16 @@ struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid)
 	new->ns = ns;
 	new->uid = uid;
 	rcuref_init(&new->count, 1);
-
+	for (i = 0; i < UCOUNT_RLIMIT_COUNTS; ++i) {
+		if (percpu_counter_init(&new->rlimit[i], 0, GFP_KERNEL))
+			goto failed;
+	}
 	spin_lock_irq(&ucounts_lock);
 	ucounts = find_ucounts(ns, uid, hashent);
 	if (ucounts) {
 		spin_unlock_irq(&ucounts_lock);
+		for (j = 0; j < UCOUNT_RLIMIT_COUNTS; ++j)
+			percpu_counter_destroy(&new->rlimit[j]);
 		kfree(new);
 		return ucounts;
 	}
@@ -183,6 +189,12 @@ struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid)
 	get_user_ns(new->ns);
 	spin_unlock_irq(&ucounts_lock);
 	return new;
+
+failed:
+	for (j = 0; i > 0 && j < i - 1; ++j)
+		percpu_counter_destroy(&new->rlimit[j]);
+	kfree(new);
+	return NULL;
 }
 
 /*
@@ -197,7 +209,7 @@ static bool rlimits_are_zero(struct ucounts *ucounts)
 
 	for (int i = 0; i < sizeof(rtypes)/sizeof(int); ++i) {
 		rtype = rtypes[i];
-		if (atomic_long_read(&ucounts->rlimit[rtype]) > 0)
+		if (get_rlimit_value(ucounts, rtype) > 0)
 			return false;
 	}
 	return true;
@@ -225,7 +237,8 @@ static void free_ucounts(struct ucounts *ucounts)
 	spin_lock_irqsave(&ucounts_lock, flags);
 	hlist_nulls_del_rcu(&ucounts->node);
 	spin_unlock_irqrestore(&ucounts_lock, flags);
-
+	for (int i = 0; i < UCOUNT_RLIMIT_COUNTS; ++i)
+		percpu_counter_destroy(&ucounts->rlimit[i]);
 	put_user_ns(ucounts->ns);
 	kfree_rcu(ucounts, rcu);
 }
@@ -289,36 +302,35 @@ void dec_ucount(struct ucounts *ucounts, enum ucount_type type)
 	put_ucounts(ucounts);
 }
 
-long inc_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v)
+bool inc_rlimit_ucounts_limit(struct ucounts *ucounts, enum rlimit_type type,
+					long v, long limit)
 {
 	struct ucounts *iter;
 	long max = LONG_MAX;
-	long ret = 0;
+	bool good = true;
 
 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
-		long new = atomic_long_add_return(v, &iter->rlimit[type]);
-		if (new < 0 || new > max)
-			ret = LONG_MAX;
-		else if (iter == ucounts)
-			ret = new;
+		max = min(limit, max);
+		if (!percpu_counter_limited_add(&iter->rlimit[type], max, v))
+			good = false;
+
 		max = get_userns_rlimit_max(iter->ns, type);
 	}
-	return ret;
+	return good;
 }
 
-bool dec_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v)
+void dec_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v)
 {
 	struct ucounts *iter;
-	long new = -1; /* Silence compiler warning */
-	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
-		long dec = atomic_long_sub_return(v, &iter->rlimit[type]);
-		WARN_ON_ONCE(dec < 0);
-		if (iter == ucounts)
-			new = dec;
-	}
-	return (new == 0);
+
+	for (iter = ucounts; iter; iter = iter->ns->ucounts)
+		percpu_counter_sub(&iter->rlimit[type], v);
 }
 
+/*
+ * The inc_rlimit_get_ucounts does not grab the refcount.
+ * The rlimit_release should be called very time the rlimit is decremented.
+ */
 static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
 				struct ucounts *last, enum rlimit_type type)
 {
@@ -327,8 +339,7 @@ static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
 		bool to_free;
 
 		rcu_read_lock();
-		long dec = atomic_long_sub_return(1, &iter->rlimit[type]);
-		WARN_ON_ONCE(dec < 0);
+		percpu_counter_sub(&iter->rlimit[type], 1);
 		next = iter->ns->ucounts;
 		to_free = ucounts_can_be_freed(iter);
 		rcu_read_unlock();
@@ -343,29 +354,37 @@ void dec_rlimit_put_ucounts(struct ucounts *ucounts, enum rlimit_type type)
 	do_dec_rlimit_put_ucounts(ucounts, NULL, type);
 }
 
+/*
+ * Though this function does not grab the refcount, it is promised that the
+ * ucounts will not be freed as long as there have any rlimit pins to it.
+ * Caller must hold a reference to ucounts or under rcu_read_lock().
+ *
+ * Return 1 if increments successful, otherwise return 0.
+ */
 long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
-			    bool override_rlimit)
+			    bool override_rlimit, long limit)
 {
-	/* Caller must hold a reference to ucounts */
 	struct ucounts *iter;
 	long max = LONG_MAX;
-	long dec, ret = 0;
+	long ret = 0;
+
+	if (override_rlimit)
+		limit = LONG_MAX;
 
 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
-		long new = atomic_long_add_return(1, &iter->rlimit[type]);
-		if (new < 0 || new > max)
+		/* Can not exceed the limit(inputed) or the ns->rlimit_max */
+		max = min(limit, max);
+
+		if (!percpu_counter_limited_add(&iter->rlimit[type], max, 1))
 			goto dec_unwind;
-		if (iter == ucounts)
-			ret = new;
+
 		if (!override_rlimit)
 			max = get_userns_rlimit_max(iter->ns, type);
 	}
-	return ret;
+	return 1;
 dec_unwind:
-	dec = atomic_long_sub_return(1, &iter->rlimit[type]);
-	WARN_ON_ONCE(dec < 0);
 	do_dec_rlimit_put_ucounts(ucounts, iter, type);
-	return 0;
+	return ret;
 }
 
 bool is_rlimit_overlimit(struct ucounts *ucounts, enum rlimit_type type, unsigned long rlimit)
@@ -374,15 +393,23 @@ bool is_rlimit_overlimit(struct ucounts *ucounts, enum rlimit_type type, unsigne
 	long max = rlimit;
 	if (rlimit > LONG_MAX)
 		max = LONG_MAX;
+
 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
-		long val = get_rlimit_value(iter, type);
-		if (val < 0 || val > max)
+		/* iter->rlimit[type] > max return 1 */
+		if (percpu_counter_compare(&iter->rlimit[type], max) > 0)
 			return true;
+
 		max = get_userns_rlimit_max(iter->ns, type);
 	}
 	return false;
 }
 
+void __init ucounts_init(void)
+{
+	for (int i = 0; i < UCOUNT_RLIMIT_COUNTS; ++i)
+		percpu_counter_init(&init_ucounts.rlimit[i], 0, GFP_KERNEL);
+}
+
 static __init int user_namespace_sysctl_init(void)
 {
 #ifdef CONFIG_SYSCTL
@@ -398,6 +425,7 @@ static __init int user_namespace_sysctl_init(void)
 	BUG_ON(!user_header);
 	BUG_ON(!setup_userns_sysctls(&init_user_ns));
 #endif
+
 	hlist_add_ucounts(&init_ucounts);
 	inc_rlimit_ucounts(&init_ucounts, UCOUNT_RLIMIT_NPROC, 1);
 	return 0;
diff --git a/mm/mlock.c b/mm/mlock.c
index 3cb72b579ffd..20f3b62b3ec0 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -793,7 +793,6 @@ static DEFINE_SPINLOCK(shmlock_user_lock);
 int user_shm_lock(size_t size, struct ucounts *ucounts)
 {
 	unsigned long lock_limit, locked;
-	long memlock;
 	int allowed = 0;
 
 	locked = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
@@ -801,9 +800,9 @@ int user_shm_lock(size_t size, struct ucounts *ucounts)
 	if (lock_limit != RLIM_INFINITY)
 		lock_limit >>= PAGE_SHIFT;
 	spin_lock(&shmlock_user_lock);
-	memlock = inc_rlimit_ucounts(ucounts, UCOUNT_RLIMIT_MEMLOCK, locked);
 
-	if ((memlock == LONG_MAX || memlock > lock_limit) && !capable(CAP_IPC_LOCK)) {
+	if (!inc_rlimit_ucounts_limit(ucounts, UCOUNT_RLIMIT_MEMLOCK, locked, lock_limit)
+		&& !capable(CAP_IPC_LOCK)) {
 		dec_rlimit_ucounts(ucounts, UCOUNT_RLIMIT_MEMLOCK, locked);
 		goto out;
 	}
-- 
2.34.1

