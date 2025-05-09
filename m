Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EC26FDA7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774419; cv=none; b=STalB10nXpEK+Pp8/9s/QeN6tuXK+DltAgFvbUFivYZp5wNdBAGmqZVke5xqqjo8HHLISSn1jecWlHth8i2b6Wc4lSaHBDQetitBrMi/c1JAasysx0cf8kZkWZGSfNUNPHcXIDav/3ZN18Y4DmlHRXF1AaMHxNWmgUjZnsMEnPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774419; c=relaxed/simple;
	bh=xuh3+d3PyJHPLx/vRAjNd3dPRlG+l4xvonJuqToDVxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dnQn4OK+HPaloRkrt32NZA4izGwncqa/qprBk5RD8bhNUaxklcBk3fKcRPxRlq5+V60fq2ECCFrgYVBNhUtqFRYp1cJiyNdI3l9WjvOXtodCQfQaJpiZ6DOp1IMe+5YO3uX/DMlMj+LhSSI8zfnw0kB0GObHZTUw/zFk862JDDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Zv0R959F8z4f3jch
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 4ED5B1A0847
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:54 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgAnesR4qR1ofcXLLg--.60961S11;
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
Subject: [RFC next 3/5] user_namespace: add user_ns iteration helper
Date: Fri,  9 May 2025 06:54:15 +0000
Message-Id: <20250509065417.147515-10-chenridong@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgAnesR4qR1ofcXLLg--.60961S11
X-Coremail-Antispam: 1UD129KBjvJXoWxGF43KFWfZF1Utry7Gw4fGrg_yoW5XFWDpF
	4Skr9xAw47JrnrKwn8ZFs5u34fWr10vFy8JFyxu3s3tF1agFy5Arn7A3WrZr9xGr4UGrW5
	XFWUKws8Kr4Uu37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRUDGrUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

Add a helper function named 'ns_next_child_pre' that performs
a pre-order traversal of a namespace's descendants.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 include/linux/user_namespace.h |  9 +++++++
 kernel/user_namespace.c        | 44 ++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index d84b2703caab..823df9267a4a 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -169,6 +169,15 @@ static inline void set_userns_rlimit_max(struct user_namespace *ns,
 	ns->rlimit_max[type] = max <= LONG_MAX ? max : LONG_MAX;
 }
 
+struct user_namespace *ns_next_child(struct user_namespace *pos,
+					   struct user_namespace *parent);
+struct user_namespace *ns_next_child_pre(struct user_namespace *pos,
+						    struct user_namespace *root);
+
+#define ns_for_each_child_pre(pos, ns)				\
+	for ((pos) = ns_next_child_pre(NULL, (ns)); (pos);	\
+	     (pos) = ns_next_child_pre((pos), (ns)))
+
 #ifdef CONFIG_USER_NS
 
 static inline struct user_namespace *get_user_ns(struct user_namespace *ns)
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index cbe8f96c3e60..9a2e77505b97 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -30,6 +30,50 @@ static bool new_idmap_permitted(const struct file *file,
 				struct uid_gid_map *map);
 static void free_user_ns(struct work_struct *work);
 
+struct user_namespace *ns_next_child(struct user_namespace *pos,
+					   struct user_namespace *parent)
+{
+	struct user_namespace *next;
+
+	if (!pos)
+		/* Get the first child of the parent. */
+		next = list_entry_rcu(parent->children.next, struct user_namespace, ns_node);
+	else
+		next = list_entry_rcu(pos->ns_node.next, struct user_namespace, ns_node);
+
+	if (&next->ns_node != &parent->children)
+		return next;
+
+	return NULL;
+}
+
+/* Should be called under rcu_read_lock() */
+struct user_namespace *ns_next_child_pre(struct user_namespace *pos,
+						    struct user_namespace *root)
+{
+	struct user_namespace *next;
+
+
+	/* if first iteration, visit @root */
+	if (!pos)
+		return root;
+
+	/* visit the first child if exists */
+	next = ns_next_child(NULL, pos);
+	if (next)
+		return next;
+
+	/* no child, visit my or the closest ancestor's next ns_node */
+	while (pos != root) {
+		next = ns_next_child(pos, pos->parent);
+		if (next)
+			return next;
+		pos = pos->parent;
+	}
+
+	return NULL;
+}
+
 static struct ucounts *inc_user_namespaces(struct user_namespace *ns, kuid_t uid)
 {
 	return inc_ucount(ns, uid, UCOUNT_USER_NAMESPACES);
-- 
2.34.1

