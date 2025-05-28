Received: from mailgw2.hygon.cn (mailgw.hygon.cn [110.188.70.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8E1244690
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=110.188.70.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417785; cv=none; b=P+r5tmLDHB1rcJr7lwQJ765KRTN6CdykDYbdIudB2ooicq/AP9vipZIYP7ASb7CB+rI+OLDppCzv8HYuEHOkHHc9L5B1dcgY12KR03KqlBeUQp4kz3VvjYTk+nPvMdH2ma/tffn5VezhoEgZm/lgE6lKV3lariotceK23TS6MCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417785; c=relaxed/simple;
	bh=EjirPwbF84IP/LlWXtis12M0WD4AyVy/eAmVl1PS2lc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jsGZHgCLdPP8txx9z5aUFr/NmWLqOUPrsVHSKtJQ9JM0sYl4VGk+Wv6NyEL83leEvLJJlqRbfpyv/e0waDGyT7/V8Lz9nvGBH2lXjuJTKaVlHQi0+ZeH3upYN1vKIayew7qxFkbwbeJFwP7RhHoZkawe0709E+S7s1gZDLXdowc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=110.188.70.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw2.hygon.cn (Postfix) with ESMTP id 4b6gk645fJz1YQrG9;
	Wed, 28 May 2025 15:14:54 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw2.hygon.cn (Postfix) with ESMTP id 4b6gk56gQPz1YQrG9;
	Wed, 28 May 2025 15:14:53 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 2E9701036;
	Wed, 28 May 2025 15:14:49 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.22.175) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 May
 2025 15:14:47 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<wujianyong@hygon.cn>, <jianyong.wu@outlook.com>
Subject: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
Date: Wed, 28 May 2025 07:09:49 +0000
Message-ID: <20250528070949.723754-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

The efficiency gains from co-locating communicating tasks within the same
LLC are well-established. However, in multi-LLC NUMA systems, the load
balancer unintentionally sabotages this optimization.

Observe this pattern: On a NUMA node with 4 LLCs, the iperf3 client first
wakes the server within its initial LLC (e.g., LLC_0). The load balancer
subsequently migrates the client to a different LLC (e.g., LLC_1). When
the client next wakes the server, it now targets the server’s placement
to LLC_1 (the client’s new location). The server then migrates to LLC_1,
but the load balancer may reallocate the client to another
LLC (e.g., LLC_2) later. This cycle repeats, causing both tasks to
perpetually chase each other across all four LLCs — a sustained
cross-LLC ping-pong within the NUMA node.

Our solution: Permit controlled load imbalance between LLCs on the same
NUMA node, prioritizing communication affinity over strict balance.

Impact: In a virtual machine with one socket, multiple NUMA nodes (each
with 4 LLCs), unpatched systems suffered 3,000+ LLC migrations in 200
seconds as tasks cycled through all four LLCs. With the patch, migrations
stabilize at ≤10 instances, largely suppressing the NUMA-local LLC
thrashing.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0fb9bf995a47..749210e6316b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11203,6 +11203,22 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 		}
 #endif
 
+		/* Allow imbalance between LLCs within a single NUMA node */
+		if (env->sd->child && env->sd->child->flags & SD_SHARE_LLC && env->sd->parent
+				&& env->sd->parent->flags & SD_NUMA) {
+			int child_weight = env->sd->child->span_weight;
+			int llc_nr = env->sd->span_weight / child_weight;
+			int imb_nr, min;
+
+			if (llc_nr > 1) {
+				/* Let the imbalance not be greater than half of child_weight */
+				min = child_weight >= 4 ? 2 : 1;
+				imb_nr = max_t(int, min, child_weight >> 2);
+				if (imb_nr >= env->imbalance)
+					env->imbalance = 0;
+			}
+		}
+
 		/* Number of tasks to move to restore balance */
 		env->imbalance >>= 1;
 
-- 
2.43.0


