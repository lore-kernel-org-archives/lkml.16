Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15817741
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060748; cv=none; b=a7GJeByWbKHaWzoogI/BZFzdbYGX9thXjArQBOEcfHtRDocjqwJ9p85Ddc/cEKQ5AYwXUpqr7U/K1cVtCnLUZ0fnyfcqFIJGPB/kosilwhzQI6g5Z4OBSS+wMMZHgPsmd9fcD4Z/KlAXFvepR8hN0c1aY5JzTY6C6B1Gm+R4XNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060748; c=relaxed/simple;
	bh=Ib/qYtkNBuD2ULEkcWydKJN8EeTwxREYetARM8T/PiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SQT6phwZ9h2u/qf8LTSBVn4aT0GtDsxDQEryAdqV/d4F96DB1duYzvjXZFpP0Ib89SGK5oAxUqpSd7YyO0y02wFoxljmZIhlz1MMTQdXS4T42o1USJ5WAeE6lBoZsmJe9R5UZ9F2J3bcE9TV+EEV40QTEAsl83xw7K60fO+QFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuDZEEQO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuDZEEQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751060746; x=1782596746;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Ib/qYtkNBuD2ULEkcWydKJN8EeTwxREYetARM8T/PiU=;
  b=YuDZEEQOsRsP0aEwe6UFdKKqf95TSITUHruBxHFFRrw0YycClrtVCYxj
   ov5IWEsLecOTC6jvyuQkIAFxmRXm114AuBa2ht5I/cHx6WOIs5ZJFZCSn
   C7Y1SB7q34mKX7YKz9jUqmTPJnbkmd5LIjSBBcKWqZ08xlQUWA0ZDaz3H
   pmaXwykX/O0FCouWKKX+VXYLzGqgVyxOy4qlQgDsfWD/b9MXBMYBhimRc
   0Ps3E3xTDscJLEdqNDM1bm+Cv5WCE4lrINX0d0EP2cRI+OqyAliue2d5W
   6O94AHhlZiErtT4+QxXACWibz1V2z96JhGltc3mZ6KESkKPqlkP3EsZOx
   g==;
X-CSE-ConnectionGUID: oqgAMY1ERFm0Wwzoz3qf9A==
X-CSE-MsgGUID: MtJRTVG/QPuRj8BjXax0Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57063769"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57063769"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:46 -0700
X-CSE-ConnectionGUID: 0VlZhW4NRGu1pkIN7wRHTA==
X-CSE-MsgGUID: hToZ26LsS4+KEi6tGBjkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190092819"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:45 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH 0/4] sched: Fix cluster scheduling in the presence of
 asymmetric capacity
Date: Fri, 27 Jun 2025 14:45:26 -0700
Message-Id: <20250627-rneri-fix-cas-clusters-v1-0-121ffb50bbc7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYQX2gC/x2MywqDQAwAf0VybmA3+Cj+ivSga9SAbCXRUhD/3
 eBxYGZOMFZhg7Y4QfknJt/sEF8FpKXPM6OMzkCBqlBTQM0e4CR/TL1hWg/bWQ2HoaR3M0aOFYH
 Hm7I7z7j7XNcNkTpV2mgAAAA=
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Tim C Chen <tim.c.chen@linux.intel.com>, Barry Song <baohua@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 ricardo.neri@intel.com, linux-kernel@vger.kernel.org, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751060764; l=3148;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=Ib/qYtkNBuD2ULEkcWydKJN8EeTwxREYetARM8T/PiU=;
 b=S6SalDCyv7qpIbCjRiYKbGr24mdIDE8b/BUOM3j6/c02ehgMV6k+gqFT5jJFfUagRe1B4Gqsx
 lkbyLfGweI5B+JLd0wc6RHdQ0Fn74AfU4P83A4oUk2EJw7nGqBNtDJc
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

Cluster scheduling balances load among clusters of CPUs sharing a resource
[1]. It was broken on Intel hybrid processors using asymmetric packing of
tasks. Tim fixed that [2]. It is broken again when combined with asymmetric
CPU capacity.

The diagram below shows a processor with big (B) and small (s) CPUs. Also,
small CPUs are grouped in cluster sharing mid-level cache. This topology is
common in Intel hybrid processors.

         ------   ------
         | B  |   | B  |   -----------------   -----------------
         |    |   |    |   | s | s | s | s |   | s | s | s | s |
         ------   ------   -----------------   -----------------
         | L2 |   | L2 |   |      L2       |   |       L2      |
         -------------------------------------------------------
         |                          L3                         |
         -------------------------------------------------------

On a partially busy system (one with idle CPUs; busy CPUs have one task
each), scheduling for asymmetric capacity ensures that misfit tasks are
placed on the big CPUs. The remaining tasks, misfit or not, run on the
small CPUs. If CONFIG_SCHED_CLUSTER is enabled, these remaining tasks
should be evenly spread between the two small-CPU clusters.

This does not happen today because various checks in the load balancer
prevent a small CPU in one cluster from pulling tasks from another:

  * A bug in update_sd_pick_busiest() causes it to not check for capacity
    when preferring a fully_busy big CPU (which it cannot help) vs a has_
    spare small-CPU cluster (which it can).

  * Accounting misfit load in a group is pointless if the destination CPU
    is equally a small CPU. Moreover, update_sd_pick_busiest() will not
    pick such group as busiest anyway.

  * Once a busiest group has been identified, sched_balance_find_src_rq()
    will refuse to migrate tasks to CPUs of equal capacity.

  * The SD_PREFER_SIBLING flag is removed from scheduling domains with
    asymmetric capacity.

I address these issues in this series. Details are in the changelog of each
patch.

I tested these patches on an Alder Lake system with Hyper-Threading
disabled. I also tested with CONFIG_SCHED_CLUSTER=n to ensure that
processors without clusters continue to work.

[1]. https://lore.kernel.org/r/20210924085104.44806-1-21cnbao@gmail.com/
[2]. https://lore.kernel.org/r/cover.1688770494.git.tim.c.chen@linux.intel.com/

---
Ricardo Neri (4):
      sched/fair: Always skip fully_busy higher-capacity groups for load balance
      sched/fair: Ignore misfit load if the destination CPU cannot help
      sched/fair: Allow load balancing between CPUs of equal capacity
      sched/topology: Keep SD_PREFER_SIBLING for domains with clusters

 kernel/sched/fair.c     | 27 +++++++++++++++------------
 kernel/sched/topology.c | 11 +++++++++--
 2 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: e51a38e71974982abb3f2f16141763a1511f7a3f
change-id: 20250620-rneri-fix-cas-clusters-bb4287d1e152

Best regards,
-- 
Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

