Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037384D13
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120130; cv=none; b=ib/YuMTRKF3mMLef1I552ez9B3mzXi4+T5iBEyjruglxd1MiNrPJG7elSWjtkVlYuC34AnlmfMMiumquoiSY4wj9T9dfeJXiK/E0PbWPiXvrjEXpKv3ip56usUZiT1Rze541d2y2cPfR/mf3zwEl7nMYK0nJw/xZyTrHng6W/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120130; c=relaxed/simple;
	bh=DNYx0jN278tFjVNlGD6/FNfTdkJ6AW2W0zgETbwdnck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/VjuHzr142Za/G+JGH9Oc/FY47oaYZSLhMH4Wbl2Iy/alGdOAKeUfRzcQqzdqdXYbpnZ0rWAWZt1jj/3NVVm0/hq0uYjq6kaki9HOqGiJaJX9WX+KMQsAicWOxGNfzfIpk3g44oZcDmHYmFM5ezah3dEKbowYfjFb8ipJ6aWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/gV5w7t; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/gV5w7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120129; x=1775656129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DNYx0jN278tFjVNlGD6/FNfTdkJ6AW2W0zgETbwdnck=;
  b=K/gV5w7t8PWqiYalZkwxjjVx22E6wd80O7kqW2mQ+FC3Sm/3+pOQoX6T
   D4uXrPtWugX3OoA77n/f2GYJz/VOg7WUhCt/On/d43qKV/aQu4p+Kblgt
   eKclYR5zYi/6UZi2rdJ/n7HFW0acDGvY++lmtIPqk1HpDhAons9Cl0+NK
   2/1PZs16PJNpRCKfHvQG21zjJdFF8lUy9C5fuZi3b65sEt+JzFUHDoJuS
   YBkID4zShPrf0EbJyeFTFCWdSSW6LLIMOmlXt9ghcrpmKzlV9iVTYHAHi
   PDTGJ5hDZdL3Rbnhztvp8Avvmla+yVTZ8um8e+Um/Ss9yRci1xxwKA2GG
   Q==;
X-CSE-ConnectionGUID: Fxclwdh7SNOX5tc2/UkIHw==
X-CSE-MsgGUID: lGzZPHJLRlConIB9W4GEMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56533958"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56533958"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:48:49 -0700
X-CSE-ConnectionGUID: EOhDVs93SEiF2ATugOx2mg==
X-CSE-MsgGUID: D7nqERuzTqOs/lKdE3C/2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133427979"
Received: from colinkin-mobl.ger.corp.intel.com ([10.245.86.105])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 06:48:46 -0700
From: Colin Ian King <colin.king@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH][V2] md/raid6 algorithms: scale test duration for speedier boots
Date: Tue,  8 Apr 2025 14:48:44 +0100
Message-ID: <20250408134844.141-1-colin.king@intel.com>
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

V2: Use div64_u64 to fix 64 bit division build failure on m68k. Break
    overly long pr_info lines. Remove { } braches for one statement
    for-loops.

---
 lib/raid6/algos.c | 57 ++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 33 deletions(-)

diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index cd2e88ee1f14..f587adeb1b24 100644
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
+			for (perf = 0; perf < max_perf; perf++)
 				(*algo)->gen_syndrome(disks, PAGE_SIZE, *dptrs);
-				perf++;
-			}
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
+			pr_info("raid6: %-8s gen() %5llu MB/s (%llu ns)\n",
+				(*algo)->name, (ns > 0) ? div64_u64(n, ns) : 0, ns);
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
+		best->name, (ns_best > 0) ? div64_u64(n, ns_best) : 0, ns_best);
 
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
+		for (perf = 0; perf < max_perf; perf++)
 			best->xor_syndrome(disks, start, stop,
 					   PAGE_SIZE, *dptrs);
-			perf++;
-		}
+		ns = local_clock() - t;
 		preempt_enable();
 
-		pr_info("raid6: .... xor() %ld MB/s, rmw enabled\n",
-			(perf * HZ * (disks - 2)) >>
-			(20 - PAGE_SHIFT + RAID6_TIME_JIFFIES_LG2 + 1));
+		n = max_perf * PAGE_SIZE * ns_per_mb * (disks - 2);
+		pr_info("raid6: .... xor() %llu MB/s, rmw enabled (%llu ns)\n",
+			(ns > 0) ? div64_u64(n, ns) : 0, ns);
 	}
-
 out:
 	return best;
 }
-- 
2.49.0

