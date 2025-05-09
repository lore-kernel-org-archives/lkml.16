Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FAF270EDB
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774423; cv=none; b=CIw/KDCba1EuDlly4RF0+wlrVrYQKNuG8NpXEIvDWkV9G6E9ayR7qrZGlQ4yUJI+0ogAhT+DDZ6w1BVUzkm1aNMUzFdKo0N0SEpyx7oWktVCe08SstQ54xMhmNy/GOfM3bNpymYST31w/75Pk/FlzO0dBpuZx36J5DT+sKGF2BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774423; c=relaxed/simple;
	bh=DeBb3Y+XWScfnqwEU5Q9GlaoCLY2ynWxUuVwmcUq9kY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NnysXLthl2owpFiIPlcq16JDAS7/bw71RR0de0h5LZz0jTzPi83g8i5U3a/PxDZLpsHzC86PnZkNfjThv5tq1gHQ9CeUqBcxd8nPsBFX08BS3i20t4k3KRz6BCH+zUKmUVwcOYEzDJRq2FfNtr3t09eTrpnG9YS90sskR/0GS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zv0R83s9Zz4f3lVL
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 994FF1A103E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:54 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgAnesR4qR1ofcXLLg--.60961S13;
	Fri, 09 May 2025 15:06:54 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: akpm@linux-foundation.org,
	paulmck@kernel.org,
	bigeasy@linutronix.de,
	legion@kernel.org,
	roman.gushchin@linux.dev,
	brauner@kernel.org,
	tglx@linutronix.de,
	frederic@kernel.org,
	peterz@infradead.org,
	oleg@redhat.com,
	joel.granados@kernel.org,
	viro@zeniv.linux.org.uk,
	lorenzo.stoakes@oracle.com,
	avagin@google.com,
	mengensun@tencent.com,
	linux@weissschuh.net,
	jlayton@kernel.org,
	ruanjinjie@huawei.com,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	lujialin4@huawei.com,
	chenridong@huaweicloud.com
Subject: [RFC next 5/5] ucount: add rlimit cache for ucount
Date: Fri,  9 May 2025 06:54:17 +0000
Message-Id: <20250509065417.147515-12-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509065417.147515-1-chenridong@huaweicloud.com>
References: <20250509065417.147515-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAnesR4qR1ofcXLLg--.60961S13
X-Coremail-Antispam: 1UD129KBjvJXoWfGrWfWr18Cr1kKw17AF1UWrg_yoWkZrWrpF
	WfG347Ar48XFsxtr1kt3yxZ34rGryrZry3JFWrG3sayF1agr1ruw17AFy5u343Jr4rJ3y2
	qFW2gaykC3WUZ3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRUDGrUUUUU=
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
degradation. The ucouts module conducts statistics on rlimit, which
involves a significant number of atomic operations. These atomic
operations, when acting on the same variable, trigger a substantial number
of cache misses or remote accesses, ultimately resulting in a drop in
performance.

Notably, even though a new user_namespace is created upon docker startup,
the problem persists. This is because all these dockers share the same
parent node, meaning that rlimit statistics continuously modify the same
atomic variable.

Currently, when incrementing a specific rlimit within a child user
namespace by 1, the corresponding rlimit in the parent node must also be
incremented by 1. Specifically, if the ucounts corresponding to a task in
Docker B is ucount_b_1, after incrementing the rlimit of ucount_b_1 by 1,
the rlimit of the parent node, init_ucounts, must also be incremented by 1.
This operation should be ensured to stay within the limits set for the
user namespaces.

	init_user_ns                             init_ucounts
	^                                              ^
	|                        |                     |
	|<---- usr_ns_a(docker A)|usr_ns_a->ucount---->|
	|                        |                     |
	|<---- usr_ns_b(docker B)|usr_ns_b->ucount---->|
			^		^
			|		|
		  (add) cache_rlimit--->|
					|
					ucount_b_1(user1)

What is expected is that dockers operating within separate namespaces
should remain isolated and not interfere with one another. Regrettably,
the current signal system call fails to achieve this desired level of
isolation.

To address the aforementioned issues, the concept of implementing a cache
for each namespace's rlimit has been proposed. If a cache is added for
each user namespace's rlimit, a certain amount of rlimits can be allocated
to a particular namespace in one go. When resources are abundant, these
resources do not need to be immediately returned to the parent node. Within
a user namespace, if there are available values in the cache, there is no
need to request additional resources from the parent node.

The ultimate objective of this solution is to achieve complete isolation
among namespaces. After applying this patch set, the final test results
indicate that in the signal1 test case, the performance does not
deteriorate as the number of containers increases. This effectively meets
the goal of linear scalability.

  | Dockers 	|1	|4	|8	|16	|32	|64	|
  | Throughput 	|381809	|382284	|380640	|383515	|381318	|380120	|

[1] https://github.com/antonblanchard/will-it-scale/blob/master/tests/
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 include/linux/user_namespace.h |  11 ++-
 kernel/signal.c                |   2 +-
 kernel/ucount.c                | 131 +++++++++++++++++++++++++++++++--
 kernel/user_namespace.c        |   2 +
 4 files changed, 139 insertions(+), 7 deletions(-)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 823df9267a4a..30e80d46ab5f 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -113,6 +113,7 @@ struct user_namespace {
 	struct ucounts		*ucounts;
 	long ucount_max[UCOUNT_COUNTS];
 	long rlimit_max[UCOUNT_RLIMIT_COUNTS];
+	atomic_t rlimit_cache[UCOUNT_RLIMIT_COUNTS];
 
 #if IS_ENABLED(CONFIG_BINFMT_MISC)
 	struct binfmt_misc *binfmt_misc;
@@ -139,6 +140,8 @@ void dec_ucount(struct ucounts *ucounts, enum ucount_type type);
 struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid);
 void put_ucounts(struct ucounts *ucounts);
 
+void rlimit_drain_cache(struct user_namespace *root);
+
 static inline struct ucounts * __must_check get_ucounts(struct ucounts *ucounts)
 {
 	if (rcuref_get(&ucounts->count))
@@ -154,7 +157,7 @@ static inline long get_rlimit_value(struct ucounts *ucounts, enum rlimit_type ty
 long inc_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v);
 bool dec_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v);
 long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
-			    bool override_rlimit);
+			    bool override_rlimit, long tlimit);
 void dec_rlimit_put_ucounts(struct ucounts *ucounts, enum rlimit_type type);
 bool is_rlimit_overlimit(struct ucounts *ucounts, enum rlimit_type type, unsigned long max);
 
@@ -169,6 +172,12 @@ static inline void set_userns_rlimit_max(struct user_namespace *ns,
 	ns->rlimit_max[type] = max <= LONG_MAX ? max : LONG_MAX;
 }
 
+static inline void init_userns_rlimit_cache(struct user_namespace *ns)
+{
+	for (int i = 0; i < UCOUNT_RLIMIT_COUNTS; ++i)
+		atomic_set(&ns->rlimit_cache[i], 0);
+}
+
 struct user_namespace *ns_next_child(struct user_namespace *pos,
 					   struct user_namespace *parent);
 struct user_namespace *ns_next_child_pre(struct user_namespace *pos,
diff --git a/kernel/signal.c b/kernel/signal.c
index 148082db9a55..e7147fcaa55f 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -416,7 +416,7 @@ static struct ucounts *sig_get_ucounts(struct task_struct *t, int sig,
 	rcu_read_lock();
 	ucounts = task_ucounts(t);
 	sigpending = inc_rlimit_get_ucounts(ucounts, UCOUNT_RLIMIT_SIGPENDING,
-					    override_rlimit);
+					    override_rlimit, task_rlimit(t, RLIMIT_SIGPENDING));
 	rcu_read_unlock();
 	if (!sigpending)
 		return NULL;
diff --git a/kernel/ucount.c b/kernel/ucount.c
index 33605e416724..f29ed2d3b3c8 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -16,6 +16,8 @@ struct ucounts init_ucounts = {
 
 #define UCOUNTS_HASHTABLE_BITS 10
 #define UCOUNTS_HASHTABLE_ENTRIES (1 << UCOUNTS_HASHTABLE_BITS)
+#define UCOUNT_BATCH_SIZE 16
+
 static struct hlist_nulls_head ucounts_hashtable[UCOUNTS_HASHTABLE_ENTRIES] = {
 	[0 ... UCOUNTS_HASHTABLE_ENTRIES - 1] = HLIST_NULLS_HEAD_INIT(0)
 };
@@ -315,24 +317,143 @@ static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
 
 void dec_rlimit_put_ucounts(struct ucounts *ucounts, enum rlimit_type type)
 {
-	do_dec_rlimit_put_ucounts(ucounts, NULL, type, 1);
+	struct user_namespace *ns = ucounts->ns;
+	int cache;
+
+	if (ns != &init_user_ns) {
+		__dec_rlimit_put_ucounts(ucounts, type, 1);
+		cache = atomic_add_return(1, &ns->rlimit_cache[type]);
+		if (cache > UCOUNT_BATCH_SIZE) {
+			cache = atomic_sub_return(UCOUNT_BATCH_SIZE,
+						  &ns->rlimit_cache[type]);
+			if (cache > 0)
+				do_dec_rlimit_put_ucounts(ns->ucounts, NULL,
+							  type, UCOUNT_BATCH_SIZE);
+			else
+				atomic_add(UCOUNT_BATCH_SIZE, &ns->rlimit_cache[type]);
+		}
+	} else {
+		do_dec_rlimit_put_ucounts(ucounts, NULL, type, 1);
+	}
+}
+
+/* Drain the root cache, return how many cache have been relcaimed */
+static int rlimit_drain_type_cache(struct user_namespace *root, enum rlimit_type type)
+{
+	struct user_namespace *child;
+	int reclaim_cache = 0;
+
+	rcu_read_lock();
+	ns_for_each_child_pre(child, root) {
+		int cache;
+retry:
+		cache = atomic_read(&child->rlimit_cache[type]);
+		if (cache > 0) {
+			int old = atomic_cmpxchg(&child->rlimit_cache[type], cache, 0);
+
+			if (cache == old) {
+				reclaim_cache += cache;
+				do_dec_rlimit_put_ucounts(child->ucounts, NULL, type, cache);
+			} else {
+				goto retry;
+			}
+		}
+	}
+	rcu_read_unlock();
+	return reclaim_cache;
+}
+
+void rlimit_drain_cache(struct user_namespace *root)
+{
+	for (int i = 0; i < UCOUNT_RLIMIT_COUNTS; i++)
+		rlimit_drain_type_cache(root, i);
+}
+
+static bool rlimit_charge_cache(struct ucounts *ucounts, enum rlimit_type type)
+{
+	struct ucounts *iter;
+	long max = LONG_MAX;
+	long new;
+	struct user_namespace *ns = ucounts->ns;
+
+	for (iter = ns->ucounts; iter; iter = iter->ns->ucounts) {
+		max = get_userns_rlimit_max(iter->ns, type);
+		new = __inc_rlimit_get_ucounts(iter, type, UCOUNT_BATCH_SIZE);
+		if (new <= 0 || new > max)
+			goto dec_unwind;
+	}
+
+	/* charge ok, add the ns's cache */
+	atomic_add_return(UCOUNT_BATCH_SIZE, &ucounts->ns->rlimit_cache[type]);
+	return true;
+
+dec_unwind:
+	do_dec_rlimit_put_ucounts(ns->ucounts, iter, type, UCOUNT_BATCH_SIZE);
+	return false;
 }
 
 long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
-			    bool override_rlimit)
+			    bool override_rlimit, long tlimit)
 {
 	/* Caller must hold a reference to ucounts */
 	struct ucounts *iter;
 	long max = LONG_MAX;
 	long ret = 0;
+	struct user_namespace *ns = ucounts->ns;
+	bool is_trying = false;
+	bool non_cache = false;
+	long new;
+
+try_cache:
+	/* If the ucounts.ns is not init_user_ns, and it has cache in its ns, consume cache */
+	if (ns != &init_user_ns) {
+		if (atomic_dec_return(&ns->rlimit_cache[type]) >= 0) {
+			new =  __inc_rlimit_get_ucounts(ucounts, type, 1);
+			/*
+			 * If new is below tlimit, return success
+			 * Otherwise, goto non-cache logic. It should keep the
+			 * rlimit below the tlimit as much as possible
+			 */
+			if (new <= tlimit)
+				return new;
+			non_cache = true;
+		}
+		/* Restore the previously incremented value */
+		atomic_inc(&ns->rlimit_cache[type]);
+
+		if (!non_cache && !is_trying &&
+		    rlimit_charge_cache(ucounts, type)) {
+			is_trying = true;
+			goto try_cache;
+		}
+	}
 
 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
-		long new = __inc_rlimit_get_ucounts(iter, type, 1);
+retry_inc:
+		new = __inc_rlimit_get_ucounts(iter, type, 1);
+
+		/*
+		 * When the 'iter' is equal to 'ucounts', the 'new' value is what will be returned.
+		 *
+		 * Case 1: If the return value is larger than 'tlimit'.
+		 * Case 2: If the 'new' value is larger than the maximum of 'rlimit_max'.
+		 *
+		 * In both cases, we need to drain the cache. This is because when the cache is
+		 * present, the value might exceed the acceptable threshold. However, when the
+		 * cache is removed,the value should fall within the allowed limit
+		 */
+		if (iter == ucounts)
+			ret = new;
+
+		if ((new > max || ret > tlimit) &&
+			rlimit_drain_type_cache(iter->ns, type) > 0) {
+			__dec_rlimit_put_ucounts(iter, type, 1);
+			goto retry_inc;
+		}
 
 		if (new <= 0 || new > max)
 			goto dec_unwind;
-		if (iter == ucounts)
-			ret = new;
+
 		if (!override_rlimit)
 			max = get_userns_rlimit_max(iter->ns, type);
 	}
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 9a2e77505b97..bc77c9acf426 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -190,6 +190,7 @@ int create_user_ns(struct cred *new)
 	set_userns_rlimit_max(ns, UCOUNT_RLIMIT_MSGQUEUE, rlimit(RLIMIT_MSGQUEUE));
 	set_userns_rlimit_max(ns, UCOUNT_RLIMIT_SIGPENDING, rlimit(RLIMIT_SIGPENDING));
 	set_userns_rlimit_max(ns, UCOUNT_RLIMIT_MEMLOCK, rlimit(RLIMIT_MEMLOCK));
+	init_userns_rlimit_cache(ns);
 	ns->ucounts = ucounts;
 
 	/* Inherit USERNS_SETGROUPS_ALLOWED from our parent */
@@ -273,6 +274,7 @@ static void free_user_ns(struct work_struct *work)
 		kfree(ns->binfmt_misc);
 #endif
 		retire_userns_sysctls(ns);
+		rlimit_drain_cache(ns);
 		key_free_user_ns(ns);
 		ns_free_inum(&ns->ns);
 		call_rcu(&ns->rcu, __free_user_ns);
-- 
2.34.1

