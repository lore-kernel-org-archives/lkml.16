Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB101ABEA5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745657427; cv=none; b=nkujr13SyHIjJQ8K3SdfAOITkkt4MKSrT+YaEfyK9GR72i/WScYtEc3xJDOdK5TAmnZSgd0jzdRngWZZkROE1KFZjLE1/D8/gsWdWBKSMMn/tB77tuil6+39MuXHTANBHJC5DUxW+/iBcHU+XLsP/aUwnB422KmCGvC+n46nusk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745657427; c=relaxed/simple;
	bh=XcUeaAZt8IbD2wHYlVKSdeWnQ/W6qrJDTR3sqZuLT2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VxovNKzQidoBsMairj0GEeOe21NlNNEn2Lx7Smd31r+s/lONQzDSsRLSFJ1mb9Edov/ArDKnZT7yjV+6aoDx0QUE9YqQke741AnfEgE8JEfXLRJaPUYTrv2ir1GwRWPLiUcwOht9KxoJTv6Eu7Ty5lXYNes+WaKd9TY2phfRfX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrlNMfwu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrlNMfwu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404C5C4CEE2;
	Sat, 26 Apr 2025 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745657426;
	bh=XcUeaAZt8IbD2wHYlVKSdeWnQ/W6qrJDTR3sqZuLT2Q=;
	h=Date:From:To:Cc:Subject:From;
	b=NrlNMfwuUxDajFRcbHoVyXuFFKN2wZkdMalwQpeUv5kuWY3j/ythNAbCzoGu1xqu/
	 s6LEMINTh+WPBaW4h3yRxLSgAGUIwP1W3YJ88aNS/3lDzgLDbRspXULykoa1nxHNG3
	 H3RlE+bcW/rO55xEfAlvCXKultchCvTvhkj93Gbo1gp1BXrFXxilg9AzHJG5uaTmVf
	 HTxkT6rzn7x+mI3heZhXpunybcFBDi+2OZY+v2ovGQfuoooPxlYNe0obHcCpq9q2V0
	 AwG5v5JqRiBcj6DPm4fRg0DmuJJNa6Yw5otsc8GMp/r1dnd4zO+EleBUb4aoaGp7d9
	 7fSx04raVZuHg==
Date: Sat, 26 Apr 2025 10:50:21 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [GIT PULL] scheduler fix
Message-ID: <aAyeTUAkDVb9usoI@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest sched/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-04-26

   # HEAD: bbce3de72be56e4b5f68924b7da9630cc89aa1a8 sched/eevdf: Fix se->slice being set to U64_MAX and resulting crash

Fix sporadic crashes in dequeue_entities() due to ... bad math.

[ Arguably if pick_eevdf()/pick_next_entity() was less trusting
  of complex math being correct it could have de-escalated a
  crash into a warning, but that's for a different patch. ]

 Thanks,

	Ingo

------------------>
Omar Sandoval (1):
      sched/eevdf: Fix se->slice being set to U64_MAX and resulting crash


 kernel/sched/fair.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e580..0fb9bf995a47 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7081,9 +7081,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		h_nr_idle = task_has_idle_policy(p);
 		if (task_sleep || task_delayed || !se->sched_delayed)
 			h_nr_runnable = 1;
-	} else {
-		cfs_rq = group_cfs_rq(se);
-		slice = cfs_rq_min_slice(cfs_rq);
 	}
 
 	for_each_sched_entity(se) {
@@ -7093,6 +7090,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 			if (p && &p->se == se)
 				return -1;
 
+			slice = cfs_rq_min_slice(cfs_rq);
 			break;
 		}
 
