Received: from cockroach.aspen.relay.mailchannels.net (cockroach.aspen.relay.mailchannels.net [23.83.221.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845D91EEA47
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.221.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750707427; cv=pass; b=WLQIWeJbLPBYbKgzk2sDV1ekZOJwk/2TMymerUx2IHmwHXqo+ctBZ3NJHqSF+CMZmU3zadwqVpiCT6lqvaTEb5Fo8LTQ6VgTb5S/vfC9TTl/vnmWryBBOQlUu80UjyAdItTDOEcgqfQsYasHng8qJsSJJfnh7wwr4kc/b5rKUj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750707427; c=relaxed/simple;
	bh=FQdS/iHMdgR1d6e2CJCZ270V4evMEorpLeZ6xNIYbjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JT1f0L6ugALzp6xgoz4R6q2VySg9HzL1ozdVCL1ZdHk+dN+ikYxXLSuGd8qbIp1KeuSeC4WONdOBwr/zpK083t2rqBIE8MMsUiaPjIn9hFetW/MME13ocyHNaIx/eY96dM9uJFF1s0Hq0nSyFmWlfS4tvEFij9X0wYuzR/hzFlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=hvTN30EZ; arc=pass smtp.client-ip=23.83.221.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="hvTN30EZ"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BC84F8C44E8;
	Mon, 23 Jun 2025 18:59:42 +0000 (UTC)
Received: from pdx1-sub0-mail-a316.dreamhost.com (trex-green-9.trex.outbound.svc.cluster.local [100.100.179.195])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 52D228C43AA;
	Mon, 23 Jun 2025 18:59:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750705182; a=rsa-sha256;
	cv=none;
	b=PlqQa34u3UZccgZc0QKXVKRr5YkKBOjGo4mea1yme7WqOqfgM/zUoO1RrsnAI6svgSgsgm
	LsU7TQBBB3oBexAx7GUFCncgoJGv4l4P9ykowNDs99RMVq1HRefKYsn4mtjuwvGgnMFPU4
	fYwA6rQulFyE1klrK2IqoDibzpUiBsoMTCGhx5rYH3he9uK7NAfcApt61GeUsHoGOKsJkQ
	b7wNjEFTT4hiftnurDDpje1P+ehXWcrUHobhZZSsxUmHi7QnQqgvmd/U6eZd8gx1TUKSWC
	vKXI4lGr8kEptsyVa6LfUAXxoO0df/RlF3scLZ3GHQnuvhnZo6KHYz/xw+KBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750705182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mt3lKtDUlqQmGfkV47DV+HkBDubWGgXlm4Qkq/4S8B0=;
	b=8nWXneFgev4K728mW+/JIRQcTlyrgomERMm8JIjwjIv5inHF/MZ2zZiK+3fSluTZSt+G5k
	pQYEcR+10L/Rb9yZYNkdXEftXRZZpzcC8VpFfvL1qVLlvH2aR2Lf3l10usC+ntLj+L1rfk
	9RqzqdQK8g/4HQnd5948EbiFIzTgtG5YghxZjs+5JQ6HBStNm7jVtMNH3CdbgzhAg1NXva
	w+uiUEN1nZii+xuG+D429T/4W7B052zmWefCsxUXCDU4nuA4xQEHndc90dXpodrow+a0xf
	zLnlwrvCqweeFlGeu+2t+VCcT945FTfaoj4M9ELMrksVNc084hoGewmuHMAhqQ==
ARC-Authentication-Results: i=1;
	rspamd-679c59f89-d566l;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Bad
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Battle-Whistle: 54b253224de5bc78_1750705182640_19299719
X-MC-Loop-Signature: 1750705182640:151215034
X-MC-Ingress-Time: 1750705182640
Received: from pdx1-sub0-mail-a316.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.179.195 (trex/7.0.3);
	Mon, 23 Jun 2025 18:59:42 +0000
Received: from offworld.lan (syn-076-167-199-067.res.spectrum.com [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a316.dreamhost.com (Postfix) with ESMTPSA id 4bQy7K4XFMzHx;
	Mon, 23 Jun 2025 11:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1750705182;
	bh=mt3lKtDUlqQmGfkV47DV+HkBDubWGgXlm4Qkq/4S8B0=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=hvTN30EZtlW/Q3gnfxaPAsszTKCf+xmFzaEwQrq+K/3Bu+8wvoDTefvht5/etFolg
	 NuKKIPOshZo2ytNFd4kCusbzok59BQLTaXeiwzX4NTZv2HM+Dd54O4bOhFaYwZwU/O
	 M0akVsnMYAC/QhPH+tNiK5VPAgwWHKGGSy0Q8p6cmwuhTe4aFG1k8+Mg3+Mce819Me
	 73bZUBuFReHIdDK2DkiIwZfKYCvvys+CWpXpgSMNQ/dG81RT7sqyfCpvqr/cSp0wzM
	 GXzD7n/MLkvRBKqG/DFUUuNGiM/pMOMsJJ2yBKi+2b65pks467DpTgm1qQlVxgqPWG
	 9myJkyWmPWXAQ==
From: Davidlohr Bueso <dave@stgolabs.net>
To: akpm@linux-foundation.org
Cc: mhocko@kernel.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosryahmed@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net
Subject: [PATCH 2/4] mm/memcg: make memory.reclaim interface generic
Date: Mon, 23 Jun 2025 11:58:49 -0700
Message-Id: <20250623185851.830632-3-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623185851.830632-1-dave@stgolabs.net>
References: <20250623185851.830632-1-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a general call for both parsing as well as the
common reclaim semantics. memcg is still the only user and
no change in semantics.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 mm/internal.h   |  2 +
 mm/memcontrol.c | 77 ++------------------------------------
 mm/vmscan.c     | 98 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+), 73 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 3823fb356d3b..fc4262262b31 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -517,6 +517,8 @@ extern unsigned long highest_memmap_pfn;
 bool folio_isolate_lru(struct folio *folio);
 void folio_putback_lru(struct folio *folio);
 extern void reclaim_throttle(pg_data_t *pgdat, enum vmscan_throttle_state reason);
+int user_proactive_reclaim(char *buf,
+			   struct mem_cgroup *memcg, pg_data_t *pgdat);
 
 /*
  * in mm/rmap.c:
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 902da8a9c643..015e406eadfa 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -51,7 +51,6 @@
 #include <linux/spinlock.h>
 #include <linux/fs.h>
 #include <linux/seq_file.h>
-#include <linux/parser.h>
 #include <linux/vmpressure.h>
 #include <linux/memremap.h>
 #include <linux/mm_inline.h>
@@ -4566,83 +4565,15 @@ static ssize_t memory_oom_group_write(struct kernfs_open_file *of,
 	return nbytes;
 }
 
-enum {
-	MEMORY_RECLAIM_SWAPPINESS = 0,
-	MEMORY_RECLAIM_SWAPPINESS_MAX,
-	MEMORY_RECLAIM_NULL,
-};
-
-static const match_table_t tokens = {
-	{ MEMORY_RECLAIM_SWAPPINESS, "swappiness=%d"},
-	{ MEMORY_RECLAIM_SWAPPINESS_MAX, "swappiness=max"},
-	{ MEMORY_RECLAIM_NULL, NULL },
-};
-
 static ssize_t memory_reclaim(struct kernfs_open_file *of, char *buf,
 			      size_t nbytes, loff_t off)
 {
 	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
-	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
-	unsigned long nr_to_reclaim, nr_reclaimed = 0;
-	int swappiness = -1;
-	unsigned int reclaim_options;
-	char *old_buf, *start;
-	substring_t args[MAX_OPT_ARGS];
-
-	buf = strstrip(buf);
-
-	old_buf = buf;
-	nr_to_reclaim = memparse(buf, &buf) / PAGE_SIZE;
-	if (buf == old_buf)
-		return -EINVAL;
-
-	buf = strstrip(buf);
-
-	while ((start = strsep(&buf, " ")) != NULL) {
-		if (!strlen(start))
-			continue;
-		switch (match_token(start, tokens, args)) {
-		case MEMORY_RECLAIM_SWAPPINESS:
-			if (match_int(&args[0], &swappiness))
-				return -EINVAL;
-			if (swappiness < MIN_SWAPPINESS || swappiness > MAX_SWAPPINESS)
-				return -EINVAL;
-			break;
-		case MEMORY_RECLAIM_SWAPPINESS_MAX:
-			swappiness = SWAPPINESS_ANON_ONLY;
-			break;
-		default:
-			return -EINVAL;
-		}
-	}
-
-	reclaim_options	= MEMCG_RECLAIM_MAY_SWAP | MEMCG_RECLAIM_PROACTIVE;
-	while (nr_reclaimed < nr_to_reclaim) {
-		/* Will converge on zero, but reclaim enforces a minimum */
-		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
-		unsigned long reclaimed;
-
-		if (signal_pending(current))
-			return -EINTR;
-
-		/*
-		 * This is the final attempt, drain percpu lru caches in the
-		 * hope of introducing more evictable pages for
-		 * try_to_free_mem_cgroup_pages().
-		 */
-		if (!nr_retries)
-			lru_add_drain_all();
-
-		reclaimed = try_to_free_mem_cgroup_pages(memcg,
-					batch_size, GFP_KERNEL,
-					reclaim_options,
-					swappiness == -1 ? NULL : &swappiness);
-
-		if (!reclaimed && !nr_retries--)
-			return -EAGAIN;
+	int ret;
 
-		nr_reclaimed += reclaimed;
-	}
+	ret = user_proactive_reclaim(buf, memcg, NULL);
+	if (ret)
+		return ret;
 
 	return nbytes;
 }
diff --git a/mm/vmscan.c b/mm/vmscan.c
index c13c01eb0b42..63ddec550c3b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -57,6 +57,7 @@
 #include <linux/rculist_nulls.h>
 #include <linux/random.h>
 #include <linux/mmu_notifier.h>
+#include <linux/parser.h>
 
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -6714,6 +6715,15 @@ unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
 
 	return nr_reclaimed;
 }
+#else
+unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
+					   unsigned long nr_pages,
+					   gfp_t gfp_mask,
+					   unsigned int reclaim_options,
+					   int *swappiness)
+{
+	return 0;
+}
 #endif
 
 static void kswapd_age_node(struct pglist_data *pgdat, struct scan_control *sc)
@@ -7708,6 +7718,94 @@ int node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned int order)
 
 	return ret;
 }
+
+enum {
+	MEMORY_RECLAIM_SWAPPINESS = 0,
+	MEMORY_RECLAIM_SWAPPINESS_MAX,
+	MEMORY_RECLAIM_NULL,
+};
+static const match_table_t tokens = {
+	{ MEMORY_RECLAIM_SWAPPINESS, "swappiness=%d"},
+	{ MEMORY_RECLAIM_SWAPPINESS_MAX, "swappiness=max"},
+	{ MEMORY_RECLAIM_NULL, NULL },
+};
+
+int user_proactive_reclaim(char *buf, struct mem_cgroup *memcg, pg_data_t *pgdat)
+{
+	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
+	unsigned long nr_to_reclaim, nr_reclaimed = 0;
+	int swappiness = -1;
+	char *old_buf, *start;
+	substring_t args[MAX_OPT_ARGS];
+
+	if (!buf || (!memcg && !pgdat))
+		return -EINVAL;
+
+	buf = strstrip(buf);
+
+	old_buf = buf;
+	nr_to_reclaim = memparse(buf, &buf) / PAGE_SIZE;
+	if (buf == old_buf)
+		return -EINVAL;
+
+	buf = strstrip(buf);
+
+	while ((start = strsep(&buf, " ")) != NULL) {
+		if (!strlen(start))
+			continue;
+		switch (match_token(start, tokens, args)) {
+		case MEMORY_RECLAIM_SWAPPINESS:
+			if (match_int(&args[0], &swappiness))
+				return -EINVAL;
+			if (swappiness < MIN_SWAPPINESS ||
+			    swappiness > MAX_SWAPPINESS)
+				return -EINVAL;
+			break;
+		case MEMORY_RECLAIM_SWAPPINESS_MAX:
+			swappiness = SWAPPINESS_ANON_ONLY;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	while (nr_reclaimed < nr_to_reclaim) {
+		/* Will converge on zero, but reclaim enforces a minimum */
+		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
+		unsigned long reclaimed;
+
+		if (signal_pending(current))
+			return -EINTR;
+
+		/*
+		 * This is the final attempt, drain percpu lru caches in the
+		 * hope of introducing more evictable pages.
+		 */
+		if (!nr_retries)
+			lru_add_drain_all();
+
+		if (memcg) {
+			unsigned int reclaim_options;
+
+			reclaim_options = MEMCG_RECLAIM_MAY_SWAP |
+					  MEMCG_RECLAIM_PROACTIVE;
+			reclaimed = try_to_free_mem_cgroup_pages(memcg,
+						 batch_size, GFP_KERNEL,
+						 reclaim_options,
+						 swappiness == -1 ? NULL : &swappiness);
+		} else {
+			return -EINVAL;
+		}
+
+		if (!reclaimed && !nr_retries--)
+			return -EAGAIN;
+
+		nr_reclaimed += reclaimed;
+	}
+
+	return 0;
+}
+
 #endif
 
 /**
-- 
2.39.5

