Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F52EF2A3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433059; cv=none; b=oDdUPgXBPs7R3zYE6GxBfEIHd1uEglCLSsHLJKuQEGbxhihLftVneX28RiuQ6UlC/z0dU9LugVy1bzx7eomYxZQSLl+2mWUblUIHO1RCGU1+Ej0vgeFQIhMd+XsYBe0vzQaHmEzI06nVenKJApyBYY3yN6GVDL+ZghVOJq65EUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433059; c=relaxed/simple;
	bh=twoxbeTMGkniqCFrzdy3nm9knKsAh3KTQan5m/kwiBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUEGG1QXhYjgRJzPQ2NuA7fJsbEO0t1vby4g7T0jQoPHoaWpAfvdr+j1ZvZbxH/Guqqh11h8AK48nDseR35236jxUa9nezN/JcqYGAhg9Zz9fkxgi7uJKSnZ0h953nwRDqP7OEUv0l2ZrNxhfm3zwx2eg0cdAxqOC3hCCk62o/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aa6wAJOJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aa6wAJOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F45C4CEF0;
	Fri, 20 Jun 2025 15:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433056;
	bh=twoxbeTMGkniqCFrzdy3nm9knKsAh3KTQan5m/kwiBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aa6wAJOJNBmKK3dCwCp26/7VmVS4d/gR+fX44/oXGFHNJCkLGttEiwF8vEjdOeNky
	 Ljz4OGtc69qWvEnlEYeglGCwpu7j5LtbfNBn1ggyzxg38nArwSqXQ5uZSUct7WnG9J
	 F4Xaffwsi31iyTQR7nGD+lfzo5NJRgh3I62oacDppI4/5tf+fp6ZOYoRwUWeLpmw71
	 X/xdGfbn8Eh8f3EPY2V2PuxtcAe0l2sCb4ZtAHvJkop2i7Mg8r+kn4GijzCAEK/kKn
	 iLZ9lhJIb6vvcxmfHH5CuQo8p+lVymCClF8brY3SAPkeODzCvO7OMa5uPnrnq6jYOn
	 fWYip5d4oyKhg==
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
Subject: [PATCH 23/27] kthread: Include kthreadd to the managed affinity list
Date: Fri, 20 Jun 2025 17:23:04 +0200
Message-ID: <20250620152308.27492-24-frederic@kernel.org>
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

The unbound kthreads affinity management performed by cpuset is going to
be imported to the kthread core code for consolidation purposes.

Treat kthreadd just like any other kthread.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 138bb41ca916..4aeb09be29f0 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -821,12 +821,13 @@ int kthreadd(void *unused)
 	/* Setup a clean context for our children to inherit. */
 	set_task_comm(tsk, comm);
 	ignore_signals(tsk);
-	set_cpus_allowed_ptr(tsk, housekeeping_cpumask(HK_TYPE_KTHREAD));
 	set_mems_allowed(node_states[N_MEMORY]);
 
 	current->flags |= PF_NOFREEZE;
 	cgroup_init_kthreadd();
 
+	kthread_affine_node();
+
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
 		if (list_empty(&kthread_create_list))
-- 
2.48.1

