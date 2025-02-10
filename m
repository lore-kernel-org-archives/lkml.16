Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAD20485F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200379; cv=none; b=mdHD8vfS1PdawWjRk3WtzlcnA7ker596tv7cBitEXO/Haj3CaEw/HYVPU9oK3JxfgSsHr5samxTIq3T/EfyNYaFUftITc3ZxhvjRuY1s/6+5N123MkQ94Ig3O83WNd7TCUeSkbdwo7e+51AWxfhIkTkxU4DCdTsfTqaQTo2o4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200379; c=relaxed/simple;
	bh=+0+OTGy/IlZfe8fbfVCeZWpUYt2alRVziCCdrmZbW30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbM0S9j2tBogUpGDGi3YVz7n6/c3PhFQyLZr06r64JWOrXOaxwbHFK55J94bUZUhw7SEqGa1ptjKv2ywstXRLZIIzxcI/PrDlunvAx6UQiYgE/SR0S0Xn/H78Z5n9RVHOD6hc56mAcCCw8tYsSFRE8kuLmIM3RTFJcnTeWz9h2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bAWZkfOu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bAWZkfOu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa68b513abcso856617066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200375; x=1739805175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHPvs5h0lN5qcRjT7tnplrDlfrX3Yssy64qHxvPIi1w=;
        b=bAWZkfOuJYPgN8oSyv5kk9kNLMHhI2QytCT4UlwY0q/lc0OTtiUJGGtQ7vFGLw+THX
         IxUbUReEknQxZZsU4dWzhWqU3jQeVvYBm3vrQDuy+3ggPo4qH2sgFydZhrfNaRpv+EBt
         O/GIJVyUuLUp6+Abqnq9IAVbcQmBT21LVqj26jS0G1On1KR6lmPPgu1jQ+P1vEKoUd6x
         C1i120JGZl3m/iOeLSIg21i3i/ClRVCU6lHBpk97ym9TJOyRZp2w04C4X1pAuGjECl29
         lfCb5wUGYvQgi/wJboagn0jXOzOHa3pKJWyn9MCoOtTMrW5NsnmXqtFdbXpeJR4q3ZKY
         BMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200375; x=1739805175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHPvs5h0lN5qcRjT7tnplrDlfrX3Yssy64qHxvPIi1w=;
        b=k7/AOmGfGoP2h+1iAX+j63bQvr8HbZdtVcfbkExBJtWszCEhLZc9J6rHFLWWyP9KJY
         jdtdkWRBUSmeMDhH0NkWxoUva3rXwaEvwKW0+b7Yit4UnFIukH81NujGkmwHhuM6oQhp
         ghkh0z+WRb0WDWng5q0e5LWA4xPjZcC0+wKZCocps3LMFyS0LiEpKu3n3CW4m/QzGxcx
         UdZbzJ9u1GjL6ZYtRV2wcmKH95k88zA13u3MYgTOhd2+4OFU0JnEb2MoQCh/YzC336rp
         SrNc08dMmNuo4D/SgF95hmXPXSf6LrGjF3nVHed/evotLNCBzcUhbX1EE2iocZUrXYY8
         d38g==
X-Forwarded-Encrypted: i=1; AJvYcCXN+LbYswjw+EaD/MXzb4fbXfdZbqeFoNgkL1Zb92P451rVfGz8fyYcfSAsybWsGcyju1wS2+5j0RdSjdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6Tgbfez+5NkDGUgotRlLm14vqICvhbp0HGXKgL7OvzpGs4w5
	TaqUGAYSG70TJUZYwBmcl8s5xWUv4G69QUn+exC5QrjfR8neYsES7rttwJs6Dff8DBUAWKDBzMZ
	z
X-Gm-Gg: ASbGncu3i1yS3vH3BYQnZIV95mH3d+KufL406fEJCEBOJZDkblcS2zIscEaKPZzSkWx
	4eDigMv8Vs8K4Js9dc1L6oL8IGgiG+EpXC2TDTNCSFosN6QtXr5fQvoeybrCicU7uqAO138J85P
	bBSuo6hLHN/YssAb7SnnkmPfrRGS3UFKRNkwW2Q9/kspXCsokMzBdTlkoo/8EsM7A30mucIkSMj
	OyaDXr195S0NiFLECE26sB4njsGmiq2406PZgw/Dr+t4+ELBTO+eYXSTVnMVzid70No4hyOONhF
	EKRzHUopI5NkPti81g==
X-Google-Smtp-Source: AGHT+IEqT2HqyEU97xbfdsBL84h2jKrpMtkd/2pq59J3hPZeDg9i4UwQ1Su0OfZqBDIMGK/V+nmmOw==
X-Received: by 2002:a17:907:748:b0:ab7:a39:db4 with SMTP id a640c23a62f3a-ab789cfaef4mr1355751566b.57.1739200375206;
        Mon, 10 Feb 2025 07:12:55 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:12:54 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: [PATCH 1/9] sched: Convert CONFIG_RT_GROUP_SCHED macros to code conditions
Date: Mon, 10 Feb 2025 16:12:31 +0100
Message-ID: <20250210151239.50055-2-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151239.50055-1-mkoutny@suse.com>
References: <20250210151239.50055-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the blocks guarded by macros to regular code so that the RT
group code gets more compile validation. Reasoning is in
Documentation/process/coding-style.rst 21) Conditional Compilation.
With that, no functional change is expected.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/sched/rt.c       | 10 ++++------
 kernel/sched/syscalls.c |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 4b8e33c615b12..3116745be304b 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1068,13 +1068,12 @@ inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 {
 	struct rq *rq = rq_of_rt_rq(rt_rq);
 
-#ifdef CONFIG_RT_GROUP_SCHED
 	/*
 	 * Change rq's cpupri only if rt_rq is the top queue.
 	 */
-	if (&rq->rt != rt_rq)
+	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && &rq->rt != rt_rq)
 		return;
-#endif
+
 	if (rq->online && prio < prev_prio)
 		cpupri_set(&rq->rd->cpupri, rq->cpu, prio);
 }
@@ -1084,13 +1083,12 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 {
 	struct rq *rq = rq_of_rt_rq(rt_rq);
 
-#ifdef CONFIG_RT_GROUP_SCHED
 	/*
 	 * Change rq's cpupri only if rt_rq is the top queue.
 	 */
-	if (&rq->rt != rt_rq)
+	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && &rq->rt != rt_rq)
 		return;
-#endif
+
 	if (rq->online && rt_rq->highest_prio.curr != prev_prio)
 		cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
 }
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 456d339be98fb..8629a87628ebf 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -640,7 +640,7 @@ int __sched_setscheduler(struct task_struct *p,
 			retval = -EPERM;
 			goto unlock;
 		}
-#endif
+#endif /* CONFIG_RT_GROUP_SCHED */
 #ifdef CONFIG_SMP
 		if (dl_bandwidth_enabled() && dl_policy(policy) &&
 				!(attr->sched_flags & SCHED_FLAG_SUGOV)) {
-- 
2.48.1

