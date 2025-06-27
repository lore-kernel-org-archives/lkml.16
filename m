Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786BA1FBCB5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060749; cv=none; b=FXsRCp5w7Sa+ooaJLq4l6Lg3UrTM2vM92zljsfS4AZ0dxMURG3OimRQsN9P4LKWmSq0JhrEyAcAwSi7h1LBhc5t5Z7coMEMDIm+yfVAuw2w9X/AtM/bB+kK3W+/mwT90R5nA6Fr+2YSQsRQGizoVxb5LwfbLqQSSCiPYM0WvmD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060749; c=relaxed/simple;
	bh=f64UsPq6wjxSA5DEwGW3ZoYCxNvCsqfGeVpf0rwbeac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvDhjO6uM4ARikAhC+NEJWa/zcbYHaDmt5VM15ZCXEUL2pmKApsqQlHF1kBAOrTEycos0yAWk7NoRo6qrCujmsMVqwql7ftB6syQhIOkW9ISjVRdOQSNWIhXCRiD00kUA9S+IN/X63msMmuGde9wTWVZ5yOaohv+3lRdxDii+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7xHO4v1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7xHO4v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751060748; x=1782596748;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=f64UsPq6wjxSA5DEwGW3ZoYCxNvCsqfGeVpf0rwbeac=;
  b=k7xHO4v1w59A7vhmgmZE82v+jV6Uh4+P8kjY1I0/gkTCqDrpS2Q4Id8U
   QZJWJekruE/7pHWgohsZsW2d3wJCC0wQLFlrD06m3HfDg5Ewq0DAGRHDH
   IoGxCT2JH02uZOKaBM03/pHWQ9HC847gXS20W25Uofg8NiSVr9g1QePnT
   l6h8KOzk1/HQUldFZjg6VmJDtBLR3HZtF02BcsjRiIwZNOnVbdDpfwPga
   +ic2W5bLhRQYgjZgWrG53bQTyvVDwtenW7LnfCChEg6DjEeu1PPfUDLao
   y/WDPtXqjNKwm/FUeEalsBcDICx1zssiDkfyw6z0hAQukibZMYNdBj+MZ
   g==;
X-CSE-ConnectionGUID: zo1w0zEST+KdaO0rxlHrrA==
X-CSE-MsgGUID: c065NwrbRX+BQl8LWUCO+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57063786"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57063786"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:46 -0700
X-CSE-ConnectionGUID: EJfiIypERnaUyQk0l0yQGQ==
X-CSE-MsgGUID: eeU7k8/XT5OGXxaB3NoQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190092832"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:46 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Fri, 27 Jun 2025 14:45:28 -0700
Subject: [PATCH 2/4] sched/fair: Ignore misfit load if the destination CPU
 cannot help
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rneri-fix-cas-clusters-v1-2-121ffb50bbc7@linux.intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751060764; l=1642;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=f64UsPq6wjxSA5DEwGW3ZoYCxNvCsqfGeVpf0rwbeac=;
 b=v+jvgzjlv3UeMWH9QFvZH/oQKs5LTSAzHcWSONOngAFUeZj73IQrzLaRs3xsUoLepEdXz9n6/
 WL13M0ox+zNCW+sK87pJBvfoi0XiG1Ntc4cnqTVeso6rhda0cucJXYz
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

There is no point in identifying scheduling groups with misfit tasks if the
destination CPU cannot help (i.e., it has less than 20% greater capacity
than the most performant CPU in the group).

Since migrating misfit tasks takes precedence over relieving fully_busy
groups, identifying a group with misfit tasks causes a destination CPU of
smaller maximum capacity to back off (see capacity checks in update_sd_
pick_busiest()) even if it can help: it could help a group of equally small
maximum capacity if classified as fully_busy or has_spare.

The described situation can happen if a scheduling domain has groups of
big CPUs alongside two or more clusters of smaller CPUs that share L2
cache. Load should be balanced between these sets of smaller CPUs when
CONFIG_SCHED_CLUSTER is enabled.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 kernel/sched/fair.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 9da5014f8387..3c50ecffa4c7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10302,7 +10302,9 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		if (local_group)
 			continue;
 
-		if (sd_flags & SD_ASYM_CPUCAPACITY) {
+		/* Only look for misfit load if dst_cpu can help */
+		if (sd_flags & SD_ASYM_CPUCAPACITY &&
+		    capacity_greater(capacity_of(env->dst_cpu), group->sgc->max_capacity)) {
 			/* Check for a misfit task on the cpu */
 			if (sgs->group_misfit_task_load < rq->misfit_task_load) {
 				sgs->group_misfit_task_load = rq->misfit_task_load;

-- 
2.43.0

