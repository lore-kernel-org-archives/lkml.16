Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41528ECC9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037082; cv=none; b=e7NxhauvFtMbBhrIXqSUUmD/SUJMcec9BB3jra4fhWqCVD3oN39FoLGXbj6LEru1f2LIBzSTsBUAJciLV3lKqtgfZP2xEUy/TVbBRF1QXaBPAK5ITddZHl8n2EvwTz9aI27FNnzaJsOXiK5H8SP83T7z9X0T8EJpAEVvJoIiEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037082; c=relaxed/simple;
	bh=EXf9ilVpwK7qhf3Xh6ueV+kNhH+KvXii9ls7+ipW8wA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sEZgHndEN4yaeiD1d3f9G44S3hNW4kl7WIRWbzUHFBdUB7Pc20rdCjNYj+QnSRsmrHaJwuq6+5gq7I6D/DEUwIKB6uB0/fUyyQcn3wo9VP/YLQl5EWMivJHqVbIEQ3ofUB2zH4oyzi+mZxSleHvkYEFaWuWyCAcSeo/2DSn5pu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: lirongqing <lirongqing@baidu.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] sched/cputime: Fix a mostly theoretical divide by zero
Date: Wed, 4 Jun 2025 19:04:42 +0800
Message-ID: <20250604110442.8251-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc8.internal.baidu.com (172.31.50.52) To
 BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex15_2025-06-04 19:04:49:062
X-FEAS-Client-IP: 10.127.64.38
X-FE-Policy-ID: 52:10:53:SYSTEM

From: Li RongQing <lirongqing@baidu.com>

Sum of utime and stime can overflow to 0, when a process with
many threads run over total 2^64 ns

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 kernel/sched/cputime.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 6dab4854..c35fc4c 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -579,7 +579,8 @@ void cputime_adjust(struct task_cputime *curr, struct prev_cputime *prev,
 		goto update;
 	}
 
-	stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
+	if (likely(stime + utime))
+		stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
 	/*
 	 * Because mul_u64_u64_div_u64() can approximate on some
 	 * achitectures; enforce the constraint that: a*b/(b+c) <= a.
-- 
2.9.4

