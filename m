Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4826FD9E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774419; cv=none; b=o/9hJypr6n33GL6PYD2DcfGR4ZCwd0+KNLEkqmRt25aerz5dMF7Xq055mxes8f/xXx/fQh87T55h6WtoxGXXw619Z4QdGhfIYpSoUZ4oTXYbphGre+hOvuDrOYusi3Ku0pT/8cQdYtz6AiyF5WFM94i9GEjScdsDJ5/cQ1oy6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774419; c=relaxed/simple;
	bh=EZlt0cvhp3NrCL+YaqANcp2crpQa/wInckL0SK34i5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GJ10P8EkfCwONKWDBxxo7wTifgu4ELyBsAYlronGgYhZFXb8bgPNFD+mqsYJ8gt2jypTyDhaeTn+P6TenTyyElhoQ66+xchevm47umKsV7E3KazHKH8baHob9epVALC2Vc6NHwLFJRLnXOYq0HWZABxE0JhGzrFMYS1M9Bmox6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zv0R80RSRz4f3m6t
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 246621A07BD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:54 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgAnesR4qR1ofcXLLg--.60961S9;
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
Subject: [RFC next 1/5] user_namespace: add children list node
Date: Fri,  9 May 2025 06:54:13 +0000
Message-Id: <20250509065417.147515-8-chenridong@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgAnesR4qR1ofcXLLg--.60961S9
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1Uur13ZFy8ZFWxtr1kXwb_yoW8uFy3pF
	ZIyr9xGws3Jr1qkryUWan5u34xWw48JF17Ca4v934rtryagFy0kr4UC3Wj9r15Xr48GrWY
	qFWjgrs0y3yUW37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Add the 'children' and 'ns_node' fields to the user_namespace structure.
This addition enables the user_namespace to locate all of its nested
child namespaces efficiently.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 include/linux/user_namespace.h | 2 ++
 kernel/user.c                  | 2 ++
 kernel/user_namespace.c        | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index a0bb6d012137..7b1e180227c8 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -78,6 +78,8 @@ struct user_namespace {
 	struct uid_gid_map	gid_map;
 	struct uid_gid_map	projid_map;
 	struct user_namespace	*parent;
+	struct list_head	ns_node;
+	struct list_head	children;
 	int			level;
 	kuid_t			owner;
 	kgid_t			group;
diff --git a/kernel/user.c b/kernel/user.c
index f46b1d41163b..3a712a6894fd 100644
--- a/kernel/user.c
+++ b/kernel/user.c
@@ -65,6 +65,8 @@ struct user_namespace init_user_ns = {
 			.nr_extents = 1,
 		},
 	},
+	.ns_node = LIST_HEAD_INIT(init_user_ns.ns_node),
+	.children = LIST_HEAD_INIT(init_user_ns.children),
 	.ns.count = REFCOUNT_INIT(3),
 	.owner = GLOBAL_ROOT_UID,
 	.group = GLOBAL_ROOT_GID,
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 682f40d5632d..b570536934cc 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -135,6 +135,9 @@ int create_user_ns(struct cred *new)
 	ns->level = parent_ns->level + 1;
 	ns->owner = owner;
 	ns->group = group;
+	INIT_LIST_HEAD(&ns->children);
+	INIT_LIST_HEAD(&ns->ns_node);
+	list_add_tail_rcu(&ns->ns_node, &parent_ns->children);
 	INIT_WORK(&ns->work, free_user_ns);
 	for (i = 0; i < UCOUNT_COUNTS; i++) {
 		ns->ucount_max[i] = INT_MAX;
@@ -217,6 +220,7 @@ static void free_user_ns(struct work_struct *work)
 		kfree(ns->binfmt_misc);
 #endif
 		retire_userns_sysctls(ns);
+		list_del_rcu(&ns->ns_node);
 		key_free_user_ns(ns);
 		ns_free_inum(&ns->ns);
 		kmem_cache_free(user_ns_cachep, ns);
-- 
2.34.1

