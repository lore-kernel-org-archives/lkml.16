Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299AF2EF290
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433059; cv=none; b=LM16Tvq01cvm4IIq9uM5nE+A7KUeaEZlwjbjrQRTemFyFE0jv5m+7R6yhsui3AI3dLrWv1JvoMUIWcLN97N0RAaqx0M0GpEqrnSh7MBZC5LWBjwmzTtfFZRe+mDXt1TyRZRFt1k5hBtGn5WHw0EBj+0DnQuxXgfKdDC9r6wp+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433059; c=relaxed/simple;
	bh=UV3VyURymvSUapUQQPhpkbrDPxSIsZH5yBdm53mj+3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWD759cLcfi6Zm6ra2WW4paroIhEOv8RlWLcIEua2gEKaHfeTFD3B4KZTcu/4Yzp7H9WyKUhViRDL+Jtr85obcPBHiDlMbN6ZccWETkZ5cOw4ShxLdLmrfPX7m9Pva2xjsW3MUk3i8vQuCxEQWGRrVTJ/CVXbveplbMgwGWe7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9AS5h+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9AS5h+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD72C4CEE3;
	Fri, 20 Jun 2025 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433059;
	bh=UV3VyURymvSUapUQQPhpkbrDPxSIsZH5yBdm53mj+3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l9AS5h+3hJJV9B0ge45p7UVR+KMUPjC6LcP836Bc5B8IwxD235Pz1hB0H36fqcBLg
	 ZzE27hZNJaQGuHHFiTzqpvGS+DZTQtpsc7+UBqgE9Zd+Mr00wbhPHnnGmFIaICjXe8
	 Y4SDQaBwUaHyM8q/ue5b4Lch/Ygpy9dmWO+BnyuDRLynSeoAy9EyhYb6NujPGquXAE
	 zNqgu4fJ5u0vzDdetDHY8WUFGa/tf2XJ+0qgZDeAOiuZ5sUtcifEp7uvIgUkxXQ0za
	 FPnYeutDcjSc9YA69dbHiI6JXdZn55pUNUqIASnemI1pVWPd6AozI/frjxTsFI237T
	 3N4QU1gqWluow==
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
Subject: [PATCH 24/27] kthread: Rely on HK_TYPE_DOMAIN for preferred affinity management
Date: Fri, 20 Jun 2025 17:23:05 +0200
Message-ID: <20250620152308.27492-25-frederic@kernel.org>
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

Unbound kthreads want to run neither on nohz_full CPUs nor on domain
isolated CPUs. And since nohz_full implies domain isolation, checking
the latter is enough to verify both.

Therefore exclude kthreads from domain isolation.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/kthread.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 4aeb09be29f0..42cd6e119335 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -363,18 +363,20 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
 {
 	const struct cpumask *pref;
 
+	guard(rcu)();
+
 	if (kthread->preferred_affinity) {
 		pref = kthread->preferred_affinity;
 	} else {
 		if (kthread->node == NUMA_NO_NODE)
-			pref = housekeeping_cpumask(HK_TYPE_KTHREAD);
+			pref = housekeeping_cpumask(HK_TYPE_DOMAIN);
 		else
 			pref = cpumask_of_node(kthread->node);
 	}
 
-	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_KTHREAD));
+	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_DOMAIN));
 	if (cpumask_empty(cpumask))
-		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_KTHREAD));
+		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_DOMAIN));
 }
 
 static void kthread_affine_node(void)
-- 
2.48.1

