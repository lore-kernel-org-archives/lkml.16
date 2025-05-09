Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68E20A5E5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776006; cv=none; b=YKDu5V5tGUGR2cqaESqH8tASF/eWFi/Kk9JMvoUY1baqMslPBzzwmDLHBpnq9mxGLMOVaKXtJsj1KsbRWP9PUm9vFio8f/RYTQYw+jT9kgIJV+/J75lyF5kDqh70S9TV/YGh7EJvzOR5pElhWUMiux3af4rbGOAjfDB50oF2wdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776006; c=relaxed/simple;
	bh=ty5BFu9gW6qxlgzjuzhCGDP4r6MgxNpDMaV/Ale1lok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CqXWtmRABmNWB5FMO1UCOONKImuA8IIKQRpTu5hGLnH1jgVWp7pAKaB2Tk19o7kf7DqaeZ6NxzzTNQeHnrYPV3K2qbQZhGVoNoKECMkqPhNZEvKQpjf7/i3fM/JGSsbRcckUbnTvBrNbOzCIjcX+2B4us4FRtI/OYxsRYVDLXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zv11n1bYbz4f3k6f
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:33:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 8B6D61A0F46
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:33:20 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgCHJsG1rx1oiZnNLg--.58746S4;
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
Subject: [RFC next v2 2/5] usernamespace: make usernamespace rcu safe
Date: Fri,  9 May 2025 07:20:51 +0000
Message-Id: <20250509072054.148257-3-chenridong@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgCHJsG1rx1oiZnNLg--.58746S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4rKw1DZryrKF43Kr4UJwb_yoW8CFyrpF
	92kr9xGa1xJr1qkw1UZFs5u34fWr4FqFyUCa1ku3s5tFyagryjyr4xAa48Zr15Gr48G3y3
	XFWjgrWDKr4UW37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxc
	IEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_ZF0_GFyUMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRRdgAUUUUU
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

