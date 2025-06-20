Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA512C0333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433010; cv=none; b=ZnmWpwIodDHCyzqZxZNSy1jOqlhVh43laYTCYIOlqG+jwgwDw+stksL/M3a1Qwv2SBoI4HgncHoLvaNhLJwL9T37vfQCvIZDoWibxYWnsrJ9sZxt2SDW17xfgSZq52b6Bw3Co73t1NoepKKwEpnug1IfPhQoWKwHnrACcQoFIr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433010; c=relaxed/simple;
	bh=pRfQHigt/JUjt7Ua7aNjiQ8K2ZKMtGoq+XwcBsIjDcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m84qQnYPrwayToNoQizBoZ2xl29yoYiZdvhrO/MsrV0cmClaUUd2Iuas0IEM7ovnpJMJY1vorhICG57tcMjh+i1xvgL0VSoI5VNIuNSkwrwDGVDqCHPjVfP3cTaczBnchzFyGAbfvD1hF8Kpq3E8J3p9ChtnjaE8Nimc142XmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMOxLQew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMOxLQew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA057C4CEEF;
	Fri, 20 Jun 2025 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433010;
	bh=pRfQHigt/JUjt7Ua7aNjiQ8K2ZKMtGoq+XwcBsIjDcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LMOxLQew+8SD0QmKJR5IFcYSv9Ibc0MeI6Xv2VKk19HsGigM1Qm9amtVtp5hj2fQ0
	 pEslfbicQSZ8ekF5i02k2hUdg7d/IxxuoWmadNan3ALw9niHU6ev9IS9Jh+X6DX9I7
	 c9cZBpnrwRyJNmmX2hjp0ka9mnnRCWkK2HnlJp4QNZzl3ut8tlFbRu5Zd+UsKaoc7+
	 0jazqNeXyXTyz9G3bIEjDfJ0BolBqWY4EhiqHoMS9Ix/cI8P2zxdt2rdvgywUPAZId
	 kkX08YtsIcBB4EnRPi2j1vEDOpAm1DJV2lK7q2DCJUq9clpBDPKsRT0Kh4wAOx2Cb+
	 qkiMFu2Px64ZQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH 06/27] mm: vmstat: Prepare to protect against concurrent isolated cpuset change
Date: Fri, 20 Jun 2025 17:22:47 +0200
Message-ID: <20250620152308.27492-7-frederic@kernel.org>
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
runtime. In order to synchronize against vmstat workqueue to make sure
that no asynchronous vmstat work is pending or executing on a newly made
isolated CPU, read-lock the housekeeping rwsem lock while targeting
and queueing a vmstat work.

Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a vmstat
workqueue flush will also be issued in a further change to make sure
that no work remains pending after a CPU had been made isolated.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 mm/vmstat.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/vmstat.c b/mm/vmstat.c
index 429ae5339bfe..53123675fe31 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -2115,11 +2115,13 @@ static void vmstat_shepherd(struct work_struct *w)
 		 * infrastructure ever noticing. Skip regular flushing from vmstat_shepherd
 		 * for all isolated CPUs to avoid interference with the isolated workload.
 		 */
-		if (cpu_is_isolated(cpu))
-			continue;
+		scoped_guard(housekeeping) {
+			if (cpu_is_isolated(cpu))
+				continue;
 
-		if (!delayed_work_pending(dw) && need_update(cpu))
-			queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
+			if (!delayed_work_pending(dw) && need_update(cpu))
+				queue_delayed_work_on(cpu, mm_percpu_wq, dw, 0);
+		}
 
 		cond_resched();
 	}
-- 
2.48.1

