Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56DA2798E1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661097; cv=none; b=W3062PxX2PKSIZK3OC0+6fiTPpAmAM1P0CABtSdXAre19Wghws2wMd2vT7HevyqstftYM8ZGEopd0aY5dqrbeM2lqP5Wx0Atcx4N81SmqJfnDaW4BfOk+h+kp9PIEUUBM3JeqwxzPZdEdczyDeVExvizaBGqarJWgFlIy4b1MJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661097; c=relaxed/simple;
	bh=9JEH3mVtNdJI82VDThuXzNHcSzoc/ID3W43FJCyW+QU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ji08EfZ/0cYvQPS6q8BKYveTSShcxrqpoJXeEFiQTw9q3ORdC3VfOtJhFjEACmwRDjLLGIPVnrGT9veXD3IuwXvl/CrMdCpLCkDl+Iv+RhPUIxYcnQCgqDxLH4off8PD2KWw5IUaeN/aLI24qYjP2E4feKbLGj3AFoZNrqw+Hds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4b1JLf25gTz4f3jdB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:24:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 438A01A1A84
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:24:51 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP2 (Coremail) with SMTP id Syh0CgDXk2YDMSto5JogMw--.10967S3;
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
Subject: [RFC next v2 1/2] ucounts: free ucount only count and rlimit are zero
Date: Mon, 19 May 2025 13:11:50 +0000
Message-Id: <20250519131151.988900-2-chenridong@huaweicloud.com>
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
X-CM-TRANSID:Syh0CgDXk2YDMSto5JogMw--.10967S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr17uw18Gr1furWUtF18Zrb_yoWrtF1fpr
	4xG345Aa1kJr43JwsxJw48Ary5tr1S9r15GFy7Gwn3Jr13Xr1Fgw1xAr1YgFnxXrn7Jrya
	qFnrWFyDCF4UXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jh
	b18UUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

After the commit fda31c50292a ("signal: avoid double atomic counter
increments for user accounting") and the commit 15bc01effefe ("ucounts:
Fix signal ucount refcounting"), the reference counting mechanism for
ucounts has the following behavior. The reference count is incremented
when the first pending signal pins to the ucounts, and it is decremented
when the last pending signal is dequeued. This implies that as long as
there are any pending signals pinned to the ucounts, the ucounts cannot
be freed.

To address the scalability issue, the next patch will mention, the
ucounts.rlimits will be converted to percpu_counter. However, summing up
the percpu counters is expensive. To overcome this, this patch modifies
the conditions for freeing ucounts. Instead of complex checks regarding
whether a pending signal is the first or the last one, the ucounts can now
be freed only when both the refcount and the rlimits are zero.
This change not only simplifies the logic but also reduces the number of
atomic operations.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 include/linux/user_namespace.h |  1 +
 kernel/ucount.c                | 75 ++++++++++++++++++++++++++--------
 2 files changed, 59 insertions(+), 17 deletions(-)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index a0bb6d012137..6e2229ea4673 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -122,6 +122,7 @@ struct ucounts {
 	kuid_t uid;
 	struct rcu_head rcu;
 	rcuref_t count;
+	atomic_long_t freed;
 	atomic_long_t ucount[UCOUNT_COUNTS];
 	atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
 };
diff --git a/kernel/ucount.c b/kernel/ucount.c
index 8686e329b8f2..125471af7d59 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -185,18 +185,61 @@ struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid)
 	return new;
 }
 
-void put_ucounts(struct ucounts *ucounts)
+/*
+ * Whether all the rlimits are zero.
+ * For now, only UCOUNT_RLIMIT_SIGPENDING is considered.
+ * Other rlimit can be added.
+ */
+static bool rlimits_are_zero(struct ucounts *ucounts)
+{
+	int rtypes[] = { UCOUNT_RLIMIT_SIGPENDING };
+	int rtype;
+
+	for (int i = 0; i < sizeof(rtypes)/sizeof(int); ++i) {
+		rtype = rtypes[i];
+		if (atomic_long_read(&ucounts->rlimit[rtype]) > 0)
+			return false;
+	}
+	return true;
+}
+
+/*
+ * Ucounts can be freed only when the ucount->count is released
+ * and the rlimits are zero.
+ * The caller should hold rcu_read_lock();
+ */
+static bool ucounts_can_be_freed(struct ucounts *ucounts)
+{
+	if (rcuref_read(&ucounts->count) > 0)
+		return false;
+	if (!rlimits_are_zero(ucounts))
+		return false;
+	/* Prevent double free */
+	return atomic_long_cmpxchg(&ucounts->freed, 0, 1) == 0;
+}
+
+static void free_ucounts(struct ucounts *ucounts)
 {
 	unsigned long flags;
 
-	if (rcuref_put(&ucounts->count)) {
-		spin_lock_irqsave(&ucounts_lock, flags);
-		hlist_nulls_del_rcu(&ucounts->node);
-		spin_unlock_irqrestore(&ucounts_lock, flags);
+	spin_lock_irqsave(&ucounts_lock, flags);
+	hlist_nulls_del_rcu(&ucounts->node);
+	spin_unlock_irqrestore(&ucounts_lock, flags);
+
+	put_user_ns(ucounts->ns);
+	kfree_rcu(ucounts, rcu);
+}
 
-		put_user_ns(ucounts->ns);
-		kfree_rcu(ucounts, rcu);
+void put_ucounts(struct ucounts *ucounts)
+{
+	rcu_read_lock();
+	if (rcuref_put(&ucounts->count) &&
+	    ucounts_can_be_freed(ucounts)) {
+		rcu_read_unlock();
+		free_ucounts(ucounts);
+		return;
 	}
+	rcu_read_unlock();
 }
 
 static inline bool atomic_long_inc_below(atomic_long_t *v, int u)
@@ -281,11 +324,17 @@ static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
 {
 	struct ucounts *iter, *next;
 	for (iter = ucounts; iter != last; iter = next) {
+		bool to_free;
+
+		rcu_read_lock();
 		long dec = atomic_long_sub_return(1, &iter->rlimit[type]);
 		WARN_ON_ONCE(dec < 0);
 		next = iter->ns->ucounts;
-		if (dec == 0)
-			put_ucounts(iter);
+		to_free = ucounts_can_be_freed(iter);
+		rcu_read_unlock();
+		/* If ucounts->count is zero and the rlimits are zero, free ucounts */
+		if (to_free)
+			free_ucounts(iter);
 	}
 }
 
@@ -310,14 +359,6 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
 			ret = new;
 		if (!override_rlimit)
 			max = get_userns_rlimit_max(iter->ns, type);
-		/*
-		 * Grab an extra ucount reference for the caller when
-		 * the rlimit count was previously 0.
-		 */
-		if (new != 1)
-			continue;
-		if (!get_ucounts(iter))
-			goto dec_unwind;
 	}
 	return ret;
 dec_unwind:
-- 
2.34.1

