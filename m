Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A01DEFCD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036271; cv=none; b=pbkCPnUnyBG21dZFGEH8zeLBjq3i5yPU+YcmJNxyqhEY0oViBDcVFMFAZzEWcR06gSeMLJGAAyhRXRcjzg4/6pHiHOB6BfLA+PApNAU79tKD5+dqYVJcCqibWvD0vW/VKCjkM5+z08nrK35vVhCjir7+fgS7arEjtdI5zmE7s94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036271; c=relaxed/simple;
	bh=l1I8S9KlFuH6EBT6dvp6x+4PuXAB5IzRP6X9YdfBr5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXuWn2Kwn4hfLjQt5MyxOt8rb/bXPjDhstHXdZe7V6ZdrnnFEBmfKxROzoTuR8PUYddxSgt0PzedLQz5XLdcjJG9js8ly+QCdpyWtGL6yf8ME/nnCZm/piE2h7W59UXSrP8WPpe87OZ21kBFKw57jiOfZ3wSX43dCURQf3vXCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PU+YHiV3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU+YHiV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744036269; x=1775572269;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l1I8S9KlFuH6EBT6dvp6x+4PuXAB5IzRP6X9YdfBr5k=;
  b=PU+YHiV3js0GUzQw5XLna78x3b6KIWDCzxWowEBZd3nd3XiOCuTK/QPm
   F3SrH8i1kYS3qwUXPm1X8LSbbA67qgpEsR8s0IaneFnKKSAU3CJwYsoj3
   QbAkgcmuB1UAqkuwXWAW1wBnSw1YiGpon8TteHsGN2a3wgNSQcKAhCIG5
   khABIVvFGHESvO9l88nRp0nnLkA+nqnyIYiYUOGFJ+AK7asPMztWmDxP6
   M5QUObs6l90W6nyyPLpEZG1v7JkerBW9M27ZpJHD3O9EDPqJ9/3n/Yqd/
   DG/UPggeUzaXz7SCKkyQjxszdedFfeXxJLarCY8u8BgZtZDCn3Ro6+3ms
   A==;
X-CSE-ConnectionGUID: etd4AFk2TSK8tOTVvHnopg==
X-CSE-MsgGUID: bOI8m+FFSEOaWV6ZPwGlYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56405670"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56405670"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:31:08 -0700
X-CSE-ConnectionGUID: UuG+okTaQ+yz3xXF0yDfMw==
X-CSE-MsgGUID: 4WHXvdZJTgShdXeF3pzqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127954234"
Received: from colinkin-mobl.ger.corp.intel.com ([10.245.102.255])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2025 07:31:06 -0700
From: Colin Ian King <colin.king@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] md/raid6 algorithms: scale test duration for speedier boots
Date: Mon,  7 Apr 2025 15:31:04 +0100
Message-ID: <20250407143105.60-1-colin.king@intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using jiffies (and waiting for jiffies to wrap before
benchmarking the algorithms) instead use the higher precision local_time
for benchmarking. This patch performs 2,500 iterations of the benchmark
measurements which works out to be accurate enough for benchmarking the
raid algorithm data rates. Also add division by zero checking in case
timing measurements are bogus.

Measuring 100 re-boots on Intel(R) Core(TM) Ultra 9 285K with
improves raid64 benchmarking loop from ~68000 usecs to ~5300 usec.

This patch has been in use in Clear Linux for ~2 years w/o issues.

Signed-off-by: Colin Ian King <colin.king@intel.com>
---
 lib/raid6/algos.c | 53 ++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index cd2e88ee1f14..b846635542bc 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -18,6 +18,8 @@
 #else
 #include <linux/module.h>
 #include <linux/gfp.h>
+#include <linux/sched/clock.h>
+
 /* In .bss so it's zeroed */
 const char raid6_empty_zero_page[PAGE_SIZE] __attribute__((aligned(256)));
 EXPORT_SYMBOL(raid6_empty_zero_page);
@@ -155,12 +157,15 @@ static inline const struct raid6_recov_calls *raid6_choose_recov(void)
 static inline const struct raid6_calls *raid6_choose_gen(
 	void *(*const dptrs)[RAID6_TEST_DISKS], const int disks)
 {
-	unsigned long perf, bestgenperf, j0, j1;
+	unsigned long perf;
+	const unsigned long max_perf = 2500;
 	int start = (disks>>1)-1, stop = disks-3;	/* work on the second half of the disks */
 	const struct raid6_calls *const *algo;
 	const struct raid6_calls *best;
+	const u64 ns_per_mb = 1000000000 >> 20;
+	u64 n, ns, t, ns_best = ~0ULL;
 
-	for (bestgenperf = 0, best = NULL, algo = raid6_algos; *algo; algo++) {
+	for (best = NULL, algo = raid6_algos; *algo; algo++) {
 		if (!best || (*algo)->priority >= best->priority) {
 			if ((*algo)->valid && !(*algo)->valid())
 				continue;
@@ -170,26 +175,20 @@ static inline const struct raid6_calls *raid6_choose_gen(
 				break;
 			}
 
-			perf = 0;
-
 			preempt_disable();
-			j0 = jiffies;
-			while ((j1 = jiffies) == j0)
-				cpu_relax();
-			while (time_before(jiffies,
-					    j1 + (1<<RAID6_TIME_JIFFIES_LG2))) {
+			t = local_clock();
+			for (perf = 0; perf < max_perf; perf++) {
 				(*algo)->gen_syndrome(disks, PAGE_SIZE, *dptrs);
-				perf++;
 			}
+			ns = local_clock() - t;
 			preempt_enable();
 
-			if (perf > bestgenperf) {
-				bestgenperf = perf;
+			if (ns < ns_best) {
+				ns_best = ns;
 				best = *algo;
 			}
-			pr_info("raid6: %-8s gen() %5ld MB/s\n", (*algo)->name,
-				(perf * HZ * (disks-2)) >>
-				(20 - PAGE_SHIFT + RAID6_TIME_JIFFIES_LG2));
+			n = max_perf * PAGE_SIZE * ns_per_mb * (disks - 2);
+			pr_info("raid6: %-8s gen() %5llu MB/s (%llu ns)\n", (*algo)->name, (ns > 0) ? n / ns : 0, ns);
 		}
 	}
 
@@ -206,31 +205,23 @@ static inline const struct raid6_calls *raid6_choose_gen(
 		goto out;
 	}
 
-	pr_info("raid6: using algorithm %s gen() %ld MB/s\n",
-		best->name,
-		(bestgenperf * HZ * (disks - 2)) >>
-		(20 - PAGE_SHIFT + RAID6_TIME_JIFFIES_LG2));
+	n = max_perf * PAGE_SIZE * ns_per_mb * (disks - 2);
+	pr_info("raid6: using algorithm %s gen() %llu MB/s (%llu ns)\n",
+		best->name, (ns_best > 0) ? n / ns_best : 0, ns_best);
 
 	if (best->xor_syndrome) {
-		perf = 0;
-
 		preempt_disable();
-		j0 = jiffies;
-		while ((j1 = jiffies) == j0)
-			cpu_relax();
-		while (time_before(jiffies,
-				   j1 + (1 << RAID6_TIME_JIFFIES_LG2))) {
+		t = local_clock();
+		for (perf = 0; perf < max_perf; perf++) {
 			best->xor_syndrome(disks, start, stop,
 					   PAGE_SIZE, *dptrs);
-			perf++;
 		}
+		ns = local_clock() - t;
 		preempt_enable();
 
-		pr_info("raid6: .... xor() %ld MB/s, rmw enabled\n",
-			(perf * HZ * (disks - 2)) >>
-			(20 - PAGE_SHIFT + RAID6_TIME_JIFFIES_LG2 + 1));
+		n = max_perf * PAGE_SIZE * ns_per_mb * (disks - 2);
+		pr_info("raid6: .... xor() %llu MB/s, rmw enabled (%llu ns)\n", (ns > 0) ? n / ns : 0, ns);
 	}
-
 out:
 	return best;
 }
-- 
2.49.0

