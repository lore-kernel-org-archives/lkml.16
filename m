Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A712F0E48
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968582; cv=none; b=L+nIUosgAfQw8Bkl3PcsfVbwpEvF3YBNf3QwDetjRMnjQAnm6cWK/A8oFExfbemHdsTCTXq8NlbEMYFqPKuB0qRxltL2khCykeu3xEX4TxmGBp94zcwPy65zLTD9umD3YDZEitTT3P+UtXjC8WOVeDj9tZGr0N6sopnZsPixrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968582; c=relaxed/simple;
	bh=ln4b4F6zbQLtPvkdDx7c5LG1EAHYXZ7uc9DAGBAKvGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQJ/sY+XVo/hR+xR0+FG3I0i/nlznFVEpWNSmdipUkKgKJYBd/ValiK/zXahGFnPciej5y0NjtBWz3bVSUL9c8+6RqfGK0tonh8uz9fgPBZwQOw08d+Fx/nV4Rnkn97XhP8W7InWWqA0c/kzz0M3uD0+OjaPeXSOMFjFYl5eUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rx8zMaWx; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx8zMaWx"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70a57a8ffc3so16406827b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750968579; x=1751573379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkomMQFK2naO5Td/U8diUi8TzBSBojT4mBxZFqTyC2A=;
        b=Rx8zMaWx+TSRwWv1OcQzg+fpwEnltjtDr/PABk1TKEmrykeg7xAH9yi/6tdtdWqplL
         4H83Nb0ZLycKsb67bdAMwGKiIU27lrhUMUTNIe8gXtpXTrXP4axzM+GJQdD4hKuh94Ip
         DTcu0//icsNxYnJLAwy/gPO/QQ3vyoRapQjWzo7MQckqXLWUE2GNtpYO6LfbHhTI0DsR
         RVW+QfJpXTrbrf3ZUivDNjNQgMkDXK3EtSqKL2jvAgjVltt6TZ1FmnUaKMRQzrtXnq7d
         BwJ9Zo8Lvsoe3bbJ/++YH6UTnpV/ucOtkn/HTkE8IlZqQEIF4T6HCbLGyir3pojJuZGO
         fdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968579; x=1751573379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkomMQFK2naO5Td/U8diUi8TzBSBojT4mBxZFqTyC2A=;
        b=OyrKNWC3GSyKhNHAwLR/ihkbxjdqCMiIVinuKWw9JCtCgQV/ryJMVF7zXwU0SfPB+7
         yYna8dhZjGsqVMOP86Rdzhfi+FDxH1TkZjehLMTqP+IDVk9+QyQyRQEZoMvuMI6yjCUp
         aahxAtbSV10Y2MjOppLPMIIIrwT30K9cHJsm5QMZmhwr+D1YG4Ytxu1nTEZpZdX43BdJ
         kAK0bCwSq0Kd0YUJ2oZ2ozUAEgEOxPVvUe1m8oHl5CWtmiywALcoxjvr5RjJIHJPSsCH
         KHrRbhW9PBNYdpmmZxjQ2G0c4VxpcVDrnfavdinZlapqGof1DolI9BT98WmHHbY6H1n4
         s3lg==
X-Forwarded-Encrypted: i=1; AJvYcCXZxdm5K7IVTfysX1CcRS7evDKmAYFcfw4QOx4g28a7AUj3fFoTwnogmqH/yEeu/gLMxKxGuaGZhEbQK/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDczWi9/MR5Gbe9LC6h/8t0437nUFHAIF21UJ4F2C6DikaLIQh
	95qaG/5/1UiJnsnwEN+9xnyvOKWpSSw5xp2RcV+Qp4xDFNpYV1cNsfoz
X-Gm-Gg: ASbGncvMKFvBHex9hmNo5zdFohYf+xcPscUjyvzWb5coWQ37KtEi23WsJD86SdMQfuZ
	10lMtS361m5lgzhgbkSlsO1OClJGaD0VrGN5lSbwWxlveTOHwjb5c9cOqgdp3wHYAZtN+46dxJ+
	PI5L/DR+WWaFchUm2VATesopveQJ/YVyvxjkLqHcHNfNe82pq6af2bCmSrHGE+PAoE/mDNwMmFs
	DOZHo6W4KDm2rfUqCHktbNAmhq5P0NESjxYE6y9EWZV9POEfvs8wd1Yve6YL6uGKJAqj8uOB2T5
	+5bV9oozoaLMmhoZ0rcT3L8NPCV4jTHPXlABcLbZTQaPw6e943KWlu6srvtNnYIstnv2pVZf
X-Google-Smtp-Source: AGHT+IG0TCS7LX5hXAapjcI47CD8a3h/pDdk4+7qaAM9DfaiQOLdgREVmRaWEyhLA67mK9b72dDlAQ==
X-Received: by 2002:a05:690c:b17:b0:712:e516:2a30 with SMTP id 00721157ae682-715171c74e9mr8955137b3.28.1750968579204;
        Thu, 26 Jun 2025 13:09:39 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:4d::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cc7bcesm1313407b3.112.2025.06.26.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 13:09:38 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk in weighted interleave
Date: Thu, 26 Jun 2025 13:09:34 -0700
Message-ID: <20250626200936.3974420-3-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
References: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, alloc_pages_bulk_weighted_interleave can make up to nr_node_ids+1
calls to __alloc_pages_bulk. The additional allocation can happen if the
previous call to this function finished the weighted round robin allocation
partially on a node. To make up for this, the next time this function is
called, an extra allocation is made to finish cleanly on the node boundaries
before performing the weighted round-robin cycles again.

Instead of making an additional call, we can calculate how many additional
pages should be allocated from the first node (aka carryover) and add that
value to the number of pages that should be allocated as part of the current
round-robin cycle.

Running a quick benchmark by compiling the kernel shows a small increase
in performance. These experiments were run on a machine with 2 nodes, each
with 125GB memory and 40 CPUs.

time numactl -w 0,1 make -j$(nproc)

+----------+---------+------------+---------+
| Time (s) |  6.16   | With patch | % Delta |
+----------+---------+------------+---------+
| Real     |  88.374 |    88.3356 | -0.2019 |
| User     |  3631.7 |   3636.263 |  0.0631 |
| Sys      | 366.029 |    363.792 | -0.7534 |
+----------+---------+------------+---------+

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

---
 mm/mempolicy.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 78ad74a0e249..0d693f96cf66 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2569,7 +2569,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	unsigned long node_pages, delta;
 	u8 *weights, weight;
 	unsigned int weight_total = 0;
-	unsigned long rem_pages = nr_pages;
+	unsigned long rem_pages = nr_pages, carryover = 0;
 	nodemask_t nodes;
 	int nnodes, node;
 	int resume_node = MAX_NUMNODES - 1;
@@ -2594,18 +2594,12 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	node = me->il_prev;
 	weight = me->il_weight;
 	if (weight && node_isset(node, nodes)) {
-		node_pages = min(rem_pages, weight);
-		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
-						  page_array);
-		page_array += nr_allocated;
-		total_allocated += nr_allocated;
-		/* if that's all the pages, no need to interleave */
 		if (rem_pages <= weight) {
-			me->il_weight -= rem_pages;
-			return total_allocated;
+			node_pages = rem_pages;
+			me->il_weight -= node_pages;
+			goto allocate;
 		}
-		/* Otherwise we adjust remaining pages, continue from there */
-		rem_pages -= weight;
+		carryover = weight;
 	}
 	/* clear active weight in case of an allocation failure */
 	me->il_weight = 0;
@@ -2614,7 +2608,7 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	/* create a local copy of node weights to operate on outside rcu */
 	weights = kzalloc(nr_node_ids, GFP_KERNEL);
 	if (!weights)
-		return total_allocated;
+		return 0;
 
 	rcu_read_lock();
 	state = rcu_dereference(wi_state);
@@ -2634,16 +2628,17 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	/*
 	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
 	 * Track which node weighted interleave should resume from.
+	 * Account for carryover. It is always allocated from the first node.
 	 *
 	 * if (rounds > 0) and (delta == 0), resume_node will always be
 	 * the node following prev_node and its weight.
 	 */
-	rounds = rem_pages / weight_total;
-	delta = rem_pages % weight_total;
+	rounds = (rem_pages - carryover) / weight_total;
+	delta = (rem_pages - carryover) % weight_total;
 	resume_node = next_node_in(prev_node, nodes);
 	resume_weight = weights[resume_node];
+	node = carryover ? prev_node : next_node_in(prev_node, nodes);
 	for (i = 0; i < nnodes; i++) {
-		node = next_node_in(prev_node, nodes);
 		weight = weights[node];
 		/* when delta is depleted, resume from that node */
 		if (delta && delta < weight) {
@@ -2651,12 +2646,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 			resume_weight = weight - delta;
 		}
 		/* Add the node's portion of the delta, if there is one */
-		node_pages = weight * rounds + min(delta, weight);
+		node_pages = weight * rounds + min(delta, weight) + carryover;
 		delta -= min(delta, weight);
+		carryover = 0;
 
 		/* node_pages can be 0 if an allocation fails and rounds == 0 */
 		if (!node_pages)
 			break;
+allocate:
 		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
 						  page_array);
 		page_array += nr_allocated;
@@ -2664,10 +2661,14 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 		if (total_allocated == nr_pages)
 			break;
 		prev_node = node;
+		node = next_node_in(prev_node, nodes);
+	}
+
+	if (weights) {
+		me->il_prev = resume_node;
+		me->il_weight = resume_weight;
+		kfree(weights);
 	}
-	me->il_prev = resume_node;
-	me->il_weight = resume_weight;
-	kfree(weights);
 	return total_allocated;
 }
 
-- 
2.47.1
