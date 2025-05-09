Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59726FD91
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774419; cv=none; b=AVdwwWG3j7j36I3RQGGBpwBjTXfAI/WTVBhgr7tfDjo+J1vN7p+FuoEU5qVtA3/OCnLR9U9LaQpAnKag1TNTlwyioUZzWD6hhvMnly7K+5rkhqTg+XQukYRm1Wh5OPysJ3hnW2Ir9CtYKy7aBBmubCgFoB5koHmonQ4dw6DyZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774419; c=relaxed/simple;
	bh=ty5BFu9gW6qxlgzjuzhCGDP4r6MgxNpDMaV/Ale1lok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FkohYaLb2DTOaZbjUQZ2H7SIsbVu9ZCqXwFh0oDThe3OIS810YmZX/tPfoHiiIBkYkBLB2mDqsy5knL6DM29chStWjvNd5y+mBW10/zLJYcEGj71bKT0v2pwxzX22hCyTv0GGp/1D1TIb3oe5hmtazgJk9S0rWqDBjt+W7Gi9tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Zv0R90Tftz4f3jY1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 9CFF71A0359
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:53 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgAnesR4qR1ofcXLLg--.60961S4;
	Fri, 09 May 2025 15:06:53 +0800 (CST)
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
Subject: [RFC next 2/5] usernamespace: make usernamespace rcu safe
Date: Fri,  9 May 2025 06:54:08 +0000
Message-Id: <20250509065417.147515-3-chenridong@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgAnesR4qR1ofcXLLg--.60961S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4rKw1DZryrKF43Kr4UJwb_yoW8CFyrpF
	92kr9xGa1xJr1qkw1UZFs5u34fWr4FqFyUCa1ku3s5tFyagryjyr4xAa48Zr15Gr48G3y3
	XFWjgrWDKr4UW37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjTRNiSHDUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

To ensure a safe top-down iteration, the user namespace should be made
RCU safe. This way, it is safe to iterate over all the child namespaces
of a root namespace while holding an RCU read lock.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 include/linux/user_namespace.h |  1 +
 kernel/user_namespace.c        | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 7b1e180227c8..d84b2703caab 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -80,6 +80,7 @@ struct user_namespace {
 	struct user_namespace	*parent;
 	struct list_head	ns_node;
 	struct list_head	children;
+	struct rcu_head		rcu;
 	int			level;
 	kuid_t			owner;
 	kgid_t			group;
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index b570536934cc..cbe8f96c3e60 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -196,6 +196,15 @@ int unshare_userns(unsigned long unshare_flags, struct cred **new_cred)
 	return err;
 }
 
+static void __free_user_ns(struct rcu_head *p)
+{
+	struct user_namespace *ns =
+		container_of(p, struct user_namespace, rcu);
+
+	list_del_rcu(&ns->ns_node);
+	kmem_cache_free(user_ns_cachep, ns);
+}
+
 static void free_user_ns(struct work_struct *work)
 {
 	struct user_namespace *parent, *ns =
@@ -220,10 +229,9 @@ static void free_user_ns(struct work_struct *work)
 		kfree(ns->binfmt_misc);
 #endif
 		retire_userns_sysctls(ns);
-		list_del_rcu(&ns->ns_node);
 		key_free_user_ns(ns);
 		ns_free_inum(&ns->ns);
-		kmem_cache_free(user_ns_cachep, ns);
+		call_rcu(&ns->rcu, __free_user_ns);
 		dec_user_namespaces(ucounts);
 		ns = parent;
 	} while (refcount_dec_and_test(&parent->ns.count));
-- 
2.34.1

