Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB72EE27A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433052; cv=none; b=LRDm86QBSz4hn8LkjIYr4FWAafYuFXuuNVO88VoWhuaXbUQhz3hgNZH2xwafOzJB58WQL0K9Cx/ytBddY3XbA5htEYJoijK3VXfB2O+UUJveWW0GS0epEPIFsgtGrfCQLZ2JaUGjtM7aT6zpHVjUfzv0gMnWeIK6hZ/Hlo764Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433052; c=relaxed/simple;
	bh=wTItNQ/7MRbjxIguDhes2nWpTdXMtZcyR20Xbv98DcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcM3//vMX2pk9zjB52uSfBQarP9bkleV07NCaXwnJ7+T+JXoxF2R9LiJftcz8R140AgzW5OE/wvXv+WwGjKCVGVOxTockM9ZqzkAY0Ok7IQtz+4W6aS1Q9J2vG7ZlgHn1PoOiPGcNi1rzDloERRmwQZf1/ta2QRgMqEluAcdMg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SruWTEvA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SruWTEvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EDDC4CEF0;
	Fri, 20 Jun 2025 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433052;
	bh=wTItNQ/7MRbjxIguDhes2nWpTdXMtZcyR20Xbv98DcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SruWTEvA/h7BkosV1Q/tXdcnpLcdJ84qtJC45Y4LuBfhkfO2EMjRpYfHEXkrxaJ15
	 6w75dvjF3UxuqOYb8qyyboBcrZXV6YRONX2cB0GAxoyMbKGb21kbvHEfAN1J8URG76
	 DaLiSeS0RqEHlSRO9wM2Jjljz76glA5gwaVoz/xVaoyEmdZ8vCucDVk8GVEGkTEpS2
	 EJT+snzoufMS1lo2cE0L502Su8IfqSVhUuBsFGK5S/sJQ9SN+2BPfAFzHqefgsJ9Ut
	 Uv61pbkzoVzz6lpETvxi+8kAwjp8r0SxiLeLS5xfKICZmTdrKY7bMSlVlI5jG9FUHY
	 0dgrzCN+IpnWw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 21/27] kthread: Refine naming of affinity related fields
Date: Fri, 20 Jun 2025 17:23:02 +0200
Message-ID: <20250620152308.27492-22-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kthreads preferred affinity related fields use "hotplug" as the base
of their naming because the affinity management was initially deemed to
deal with CPU hotplug.

The scope of this role is going to broaden now and also deal with
cpuset isolated partition updates.

Switch the naming accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 85fc068f0083..24008dd9f3dc 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -35,8 +35,8 @@ static DEFINE_SPINLOCK(kthread_create_lock);
 static LIST_HEAD(kthread_create_list);
 struct task_struct *kthreadd_task;
 
-static LIST_HEAD(kthreads_hotplug);
-static DEFINE_MUTEX(kthreads_hotplug_lock);
+static LIST_HEAD(kthread_affinity_list);
+static DEFINE_MUTEX(kthread_affinity_lock);
 
 struct kthread_create_info
 {
@@ -69,7 +69,7 @@ struct kthread {
 	/* To store the full name if task comm is truncated. */
 	char *full_name;
 	struct task_struct *task;
-	struct list_head hotplug_node;
+	struct list_head affinity_node;
 	struct cpumask *preferred_affinity;
 };
 
@@ -129,7 +129,7 @@ bool set_kthread_struct(struct task_struct *p)
 
 	init_completion(&kthread->exited);
 	init_completion(&kthread->parked);
-	INIT_LIST_HEAD(&kthread->hotplug_node);
+	INIT_LIST_HEAD(&kthread->affinity_node);
 	p->vfork_done = &kthread->exited;
 
 	kthread->task = p;
@@ -324,10 +324,10 @@ void __noreturn kthread_exit(long result)
 {
 	struct kthread *kthread = to_kthread(current);
 	kthread->result = result;
-	if (!list_empty(&kthread->hotplug_node)) {
-		mutex_lock(&kthreads_hotplug_lock);
-		list_del(&kthread->hotplug_node);
-		mutex_unlock(&kthreads_hotplug_lock);
+	if (!list_empty(&kthread->affinity_node)) {
+		mutex_lock(&kthread_affinity_lock);
+		list_del(&kthread->affinity_node);
+		mutex_unlock(&kthread_affinity_lock);
 
 		if (kthread->preferred_affinity) {
 			kfree(kthread->preferred_affinity);
@@ -391,9 +391,9 @@ static void kthread_affine_node(void)
 			return;
 		}
 
-		mutex_lock(&kthreads_hotplug_lock);
-		WARN_ON_ONCE(!list_empty(&kthread->hotplug_node));
-		list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
+		mutex_lock(&kthread_affinity_lock);
+		WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
+		list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
 		/*
 		 * The node cpumask is racy when read from kthread() but:
 		 * - a racing CPU going down will either fail on the subsequent
@@ -403,7 +403,7 @@ static void kthread_affine_node(void)
 		 */
 		kthread_fetch_affinity(kthread, affinity);
 		set_cpus_allowed_ptr(current, affinity);
-		mutex_unlock(&kthreads_hotplug_lock);
+		mutex_unlock(&kthread_affinity_lock);
 
 		free_cpumask_var(affinity);
 	}
@@ -877,10 +877,10 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 		goto out;
 	}
 
-	mutex_lock(&kthreads_hotplug_lock);
+	mutex_lock(&kthread_affinity_lock);
 	cpumask_copy(kthread->preferred_affinity, mask);
-	WARN_ON_ONCE(!list_empty(&kthread->hotplug_node));
-	list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
+	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
+	list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
 	kthread_fetch_affinity(kthread, affinity);
 
 	/* It's safe because the task is inactive. */
@@ -888,7 +888,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 	do_set_cpus_allowed(p, affinity);
 	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
 
-	mutex_unlock(&kthreads_hotplug_lock);
+	mutex_unlock(&kthread_affinity_lock);
 out:
 	free_cpumask_var(affinity);
 
@@ -908,9 +908,9 @@ static int kthreads_online_cpu(unsigned int cpu)
 	struct kthread *k;
 	int ret;
 
-	guard(mutex)(&kthreads_hotplug_lock);
+	guard(mutex)(&kthread_affinity_lock);
 
-	if (list_empty(&kthreads_hotplug))
+	if (list_empty(&kthread_affinity_list))
 		return 0;
 
 	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
@@ -918,7 +918,7 @@ static int kthreads_online_cpu(unsigned int cpu)
 
 	ret = 0;
 
-	list_for_each_entry(k, &kthreads_hotplug, hotplug_node) {
+	list_for_each_entry(k, &kthread_affinity_list, affinity_node) {
 		if (WARN_ON_ONCE((k->task->flags & PF_NO_SETAFFINITY) ||
 				 kthread_is_per_cpu(k->task))) {
 			ret = -EINVAL;
-- 
2.48.1

