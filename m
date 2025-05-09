Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D5526A1DA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776005; cv=none; b=Cc0ffjUFMbDK/Q7foOFG/i2i0P6ZSxeVsMo27sIL/GQI7IyOgDk8S+GF3m65OwBwxsp7KCIJTu4u0Tu0Qx+uoO0Uqn+F6+a6/T4aSTG+p1drgc4//ra+evsVfGjDtO69zghOs7yICTRmfKo6HnG5dTXYUdRqPNf0vwcnMv8Zjd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776005; c=relaxed/simple;
	bh=xuh3+d3PyJHPLx/vRAjNd3dPRlG+l4xvonJuqToDVxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0TSsWWuglTjp1W/VKF8tDK/Ih7nWt/4jVjF+ueq20yRvQ/OtI42stNd4c8pKSmmsw6oGLN16bUy+O9N3HwEUqdJifVa6t5Xuo9AfBkzMH7o35aZDDvAJ9eqSnK9eOw17KxGIUEPJQ7hsX8Qj/oaxXzCzNQpOypeEnq6F9lsBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zv11n25CXz4f3kJq
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:33:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id A36731A1AD7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:33:20 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgCHJsG1rx1oiZnNLg--.58746S5;
	Fri, 09 May 2025 15:33:20 +0800 (CST)
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
Subject: [RFC next v2 3/5] user_namespace: add user_ns iteration helper
Date: Fri,  9 May 2025 07:20:52 +0000
Message-Id: <20250509072054.148257-4-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072054.148257-1-chenridong@huaweicloud.com>
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCHJsG1rx1oiZnNLg--.58746S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGF43KFWfZF1Utry7Gw4fGrg_yoW5XFWDpF
	4Skr9xAw47JrnrKwn8ZFs5u34fWr10vFy8JFyxu3s3tF1agFy5Arn7A3WrZr9xGr4UGrW5
	XFWUKws8Kr4Uu37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxc
	IEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_ZF0_GFyUMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUUnmRUUUUU
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

