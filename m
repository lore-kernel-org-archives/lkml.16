Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D119992D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060748; cv=none; b=ebifTfN9+ULlZgxUMUXlpEV7Mn625O+epB1yFdeWMM0pEj6rkOCxI0SXq+NSz++mQFfFKoNG4rI/1+m+D/C8L0H4eB1ld3MLdCI3q8D1x4EA9kP2CVGUfr1MRoXiLVdMxQFL05ldNSMper0EsD0Qmr46Rf+jB+vzd+60mFww87s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060748; c=relaxed/simple;
	bh=7YqlhjvelHHRmIPxxW3bFPLGOmOO13E0rrCXAYV/vfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyktF3cHToHPs8HR84C3G2+2sbrs7libJ+eIXNb5Gr6hoWT5TU2Af2e0Ohq2jkijlgtcHDQ1OCPp2JHvPIjKSq9WeZGD3soZv6CwMNEZZ4mh/SINzQibmhrq3Ml/9m+FG4+r3J+JZc8oe9nwGq9V3IjDEQU9Sv9FhOZqNgbO+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2aL3zbl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2aL3zbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751060747; x=1782596747;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=7YqlhjvelHHRmIPxxW3bFPLGOmOO13E0rrCXAYV/vfg=;
  b=b2aL3zbl3ZTks+pJAgZ0EIkCMP5rZhXEa1OB0qU8cvq17XRfHOptXVv1
   GtVKeIjR2XriMhknBsLczQ9+l2mMlvPolSrZgB4qf7diRGsQexFFv2VUw
   jJ5BU+0NN5YSEE34C0x9uaAV8uDtmnMU1rD5o47rwZYCxZOG6ZRSm5Tld
   7Vmw9aTkg3o2S9x/L8HRlCAkSJxLXhaacP+si0BUq7urM9oaS/HK7ldq5
   B4StB5KWpmMG+cMeZuJP0ZlyjXZadVt+CWbqHD64m0IHmdvp3XrJH3JO6
   K6xqYxgCkS1PbRiz3CEwVn6oQ3T9ko7LBZ5Yikk0h3l4/ffVKxBQDX69b
   w==;
X-CSE-ConnectionGUID: 6Muj57jyQ+q8cd9HIAeWxA==
X-CSE-MsgGUID: 84hsq0O7RtmN+fYi+xvpPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57063777"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57063777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:46 -0700
X-CSE-ConnectionGUID: Q0XYEZ7rQoSNOap9C+w9Sg==
X-CSE-MsgGUID: bl7IABFHStun07tCMa1xXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190092826"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:46 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Fri, 27 Jun 2025 14:45:27 -0700
Subject: [PATCH 1/4] sched/fair: Always skip fully_busy higher-capacity
 groups for load balance
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rneri-fix-cas-clusters-v1-1-121ffb50bbc7@linux.intel.com>
References: <20250627-rneri-fix-cas-clusters-v1-0-121ffb50bbc7@linux.intel.com>
In-Reply-To: <20250627-rneri-fix-cas-clusters-v1-0-121ffb50bbc7@linux.intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751060764; l=2176;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=7YqlhjvelHHRmIPxxW3bFPLGOmOO13E0rrCXAYV/vfg=;
 b=Sb9BplYPGiDxmeREwxAZVNDpA0JTwBBK/X9c9RbOxLd0sUzkiF7m28s5x+xXOFmbREiMlbXRJ
 BsvnJm//zWSDIDMJElygYm9vrQwSLTqCZxa1FdYKhFehU/RNHFFt8P+
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

update_sd_pick_busiest() is supposed to avoid picking as busiest a
candidate scheduling group with no more than one task if its per-CPU
capacity is greater than that of the destination CPU.

update_sd_pick_busiest() selects as busiest a group if its type is greater
than has_spare (the type of the busiest group is initialized as has_spare).
As a result, a fully_busy group with higher per-CPU capacity can still
be selected as busiest.

Relocate the existing comparison of capacities to occur before comparing
the types of the candidate and busiest groups.

Remove unnecessary parentheses while here.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 kernel/sched/fair.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7e2963efe800..9da5014f8387 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10372,6 +10372,17 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 	     sds->local_stat.group_type != group_has_spare))
 		return false;
 
+	/*
+	 * Candidate sg has no more than one task per CPU and has higher
+	 * per-CPU capacity. Migrating tasks to less capable CPUs may harm
+	 * throughput. Maximize throughput, power/energy consequences are not
+	 * considered.
+	 */
+	if (env->sd->flags & SD_ASYM_CPUCAPACITY &&
+	    sgs->group_type <= group_fully_busy &&
+	    capacity_greater(sg->sgc->min_capacity, capacity_of(env->dst_cpu)))
+		return false;
+
 	if (sgs->group_type > busiest->group_type)
 		return true;
 
@@ -10474,17 +10485,6 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 		break;
 	}
 
-	/*
-	 * Candidate sg has no more than one task per CPU and has higher
-	 * per-CPU capacity. Migrating tasks to less capable CPUs may harm
-	 * throughput. Maximize throughput, power/energy consequences are not
-	 * considered.
-	 */
-	if ((env->sd->flags & SD_ASYM_CPUCAPACITY) &&
-	    (sgs->group_type <= group_fully_busy) &&
-	    (capacity_greater(sg->sgc->min_capacity, capacity_of(env->dst_cpu))))
-		return false;
-
 	return true;
 }
 

-- 
2.43.0

