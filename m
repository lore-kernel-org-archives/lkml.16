Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1028FD
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747117172; cv=none; b=CSaD12qjH+WJ1HIVfC5Msun1yESbgucesZDFEBvjlgw0F667+EY+dW1ALwM16USwwH/jBg6kbTM9qN5SsHJYc60Di0wvUqG9JCNgRCHH/opkbB3k7rSFG2GMTrv1xg9P/kVYEqq1uaeXaOhWNG6XzeZ6rAhv/6yvPbf9vHsC6G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747117172; c=relaxed/simple;
	bh=b849Uj9pFyqMSduAwvU5TNlCR9UrHCQwOHhscd1NKGw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LaUdD9VLuqU2+f0hARIhlbEHTR9mJHUsQeZJtnCfFhSJdN7tJH9wCfJK7KKE3j8l6FgJeoEHlAvtbejpluOEQcSqAz3FgCjKRo1Lia/Soq3TjidppRCkuBXpa7TmAxATIj82mw8IcNVRXKnTmzeLln9fKSOOjg7W782lO9BLnno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: Ke Zhao <zhaoke09@baidu.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<linux-kernel@vger.kernel.org>
CC: <zhaoke09@baidu.com>
Subject: [PATCH] sched/fair: Remove unused function and related comment
Date: Tue, 13 May 2025 14:18:45 +0800
Message-ID: <20250513061845.13868-1-zhaoke09@baidu.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJHW-Mail-Ex12.internal.baidu.com (10.127.64.35) To
 BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43)
X-FEAS-Client-IP: 172.31.51.53
X-FE-Policy-ID: 52:10:53:SYSTEM

Different from min_vruntime(), there is no function actually
using max_vruntime() now. So there is no reason to keep it,
just remove this function and related comment.

Signed-off-by: Ke Zhao <zhaoke09@baidu.com>
---
 kernel/sched/fair.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index eb5a2572b4f8..e78a3c16a845 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -526,15 +526,6 @@ void account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec);
  * Scheduling class tree data structure manipulation methods:
  */
 
-static inline __maybe_unused u64 max_vruntime(u64 max_vruntime, u64 vruntime)
-{
-	s64 delta = (s64)(vruntime - max_vruntime);
-	if (delta > 0)
-		max_vruntime = vruntime;
-
-	return max_vruntime;
-}
-
 static inline __maybe_unused u64 min_vruntime(u64 min_vruntime, u64 vruntime)
 {
 	s64 delta = (s64)(vruntime - min_vruntime);
@@ -745,9 +736,7 @@ int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se)
 static u64 __update_min_vruntime(struct cfs_rq *cfs_rq, u64 vruntime)
 {
 	u64 min_vruntime = cfs_rq->min_vruntime;
-	/*
-	 * open coded max_vruntime() to allow updating avg_vruntime
-	 */
+
 	s64 delta = (s64)(vruntime - min_vruntime);
 	if (delta > 0) {
 		avg_vruntime_update(cfs_rq, delta);
-- 
2.39.3 (Apple Git-146)

