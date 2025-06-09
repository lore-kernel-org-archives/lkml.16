Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2D27FB2A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452304; cv=none; b=YreND1BubIjzq98SdvCA7QEU4adXsijHp4AM2DK8TJY79DZbLl0e+7L6FLQTYt2rRQIPv4qdKcEgqBYZ9XqhZauMSrrnV3XFCm3fh+yYx3DcIvaVIzhV+QwPBTqeD6zKVOCpoWSmaC6QYihVigaT1155rmtywaiYV9gmWnYOUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452304; c=relaxed/simple;
	bh=b849Uj9pFyqMSduAwvU5TNlCR9UrHCQwOHhscd1NKGw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lvRXx93KnXAiamPmyu8d4HzVZl2InQQIJJtiWKrYHhSHhX02WxxgyUhPtU7j32UqeIqAJW8hGn4lYPtI8nn3vCE5PPWFq3fYzXn4PA+5hCPVsmD7vgFEDAsaKkvm70XRwkc0zfhgDlPj67GPkbrlVKAvZqUR5mUnW/e5XACIRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: Ke Zhao <zhaoke09@baidu.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <zhaoke09@baidu.com>
Subject: [PATCH RESEND] sched/fair: Remove unused function and related comment
Date: Mon, 9 Jun 2025 14:57:33 +0800
Message-ID: <20250609065733.15704-1-zhaoke09@baidu.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc5.internal.baidu.com (172.31.50.49) To
 BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43)
X-FEAS-Client-IP: 172.31.51.56
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

