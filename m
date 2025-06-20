Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB522BFC85
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433007; cv=none; b=Rnk0izO4BbtGS2o08cRhO4Dikm8zemFQM/aWUFmDH00VePTg3FzeRjVaR9eFALueheCOFmdZVC0HG8V/h1AZ+4pG81eVIPBdi6jp3ycGmsMvdFP5/qfAHF5AYLqHjqODMMRzoEdsiZGsk02cFXAUTL2bOcMqSVwEHsMVdDkfbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433007; c=relaxed/simple;
	bh=JN4dJiSi2xi+VDUMdEVl1DDIsCOCidPcCcz4BH7+O6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ozl/9OEotKU4k9xjCbDiig6EbkMX2iseUuQMne3Vlj9ugd6IgRGzMJZrH+AD0FCe2vcsTGna2CZS3a7IcaiDCAbNNUkJYOVuOsr/MY1AE0Z2IoIcFlvN7naFBYNWaPDiJEk7mDSg0p+bHeL9tjlaKZOBCZR/YgfiqyXw8G+1iKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6o4EKMF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6o4EKMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D39C4CEE3;
	Fri, 20 Jun 2025 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433007;
	bh=JN4dJiSi2xi+VDUMdEVl1DDIsCOCidPcCcz4BH7+O6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z6o4EKMFzmpVk9JrAFX395+lwSLETLDqKbF4Og9vl6696muk+th+eA7LJ8nyAZw9H
	 VyPJdy4vzbW6mQGJB3cZppL7VMPoo4m2NsYz5Y8yKt51IP4SQKQnPtFZAauDrwUqZ9
	 y56ui5ihbt8CD2lTpf401Iy37KIcv/u/ZHuWV9pBBxt/+C+n8L4Naa67UqQE0TRxUs
	 c5VKHxbJyTiWFFDliZgetGDDLMZE8q/f4Bgd7ywbX2Qlq7s4it0LSWpWVkIor2h6TU
	 u2T0aHAXvfJIx7WI1alDWAbJu6bGAJl7+ngFgzYu+mqeZM8NKiPf0IuGdQsVnL7VeK
	 F+K8RS32IQLVw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 05/27] memcg: Prepare to protect against concurrent isolated cpuset change
Date: Fri, 20 Jun 2025 17:22:46 +0200
Message-ID: <20250620152308.27492-6-frederic@kernel.org>
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

The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifyable at
runtime. In order to synchronize against memcg workqueue to make sure
that no asynchronous draining is pending or executing on a newly made
isolated CPU, read-lock the housekeeping rwsem lock while targeting
and queueing a drain work.

Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
workqueue flush will also be issued in a further change to make sure
that no work remains pending after a CPU had been made isolated.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 mm/memcontrol.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 902da8a9c643..29d44af6c426 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1975,6 +1975,14 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
 	return flush;
 }
 
+static void schedule_drain_work(int cpu, struct work_struct *work)
+{
+	housekeeping_lock();
+	if (!cpu_is_isolated(cpu))
+		schedule_work_on(cpu, work);
+	housekeeping_unlock();
+}
+
 /*
  * Drains all per-CPU charge caches for given root_memcg resp. subtree
  * of the hierarchy under it.
@@ -2004,8 +2012,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 				      &memcg_st->flags)) {
 			if (cpu == curcpu)
 				drain_local_memcg_stock(&memcg_st->work);
-			else if (!cpu_is_isolated(cpu))
-				schedule_work_on(cpu, &memcg_st->work);
+			else
+				schedule_drain_work(cpu, &memcg_st->work);
 		}
 
 		if (!test_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags) &&
@@ -2014,8 +2022,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 				      &obj_st->flags)) {
 			if (cpu == curcpu)
 				drain_local_obj_stock(&obj_st->work);
-			else if (!cpu_is_isolated(cpu))
-				schedule_work_on(cpu, &obj_st->work);
+			else
+				schedule_drain_work(cpu, &obj_st->work);
 		}
 	}
 	migrate_enable();
-- 
2.48.1

