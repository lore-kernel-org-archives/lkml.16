Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457D28A1C7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060750; cv=none; b=G6kU65dWLWht8Udxrb9vKHnifsJhAICham7lGCP4TTsmVPMf82kMi8tjo5F8KrZPhTTeM9HstCY8BW3VcpJgkblDe6kl4FNeXF46MJrwdccekS12CMOTHtnY35zDKAVgkQ1WO/75WH293+M66PCcbEjNbaD9MAQrpydFxuFyiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060750; c=relaxed/simple;
	bh=9GX3wmoEmfqSCzbnh3QdFetERHUu7YbKgD/DnlJFAg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFZZFJkHmkKmU62kbQNqdNUvF1I6vTIj1PIvBcrSr3L9FxGglqEbFeJa4fPfcvcTfiwLGbz6KKaGYa5ZtEnSeiPwoahW6njvwdfgqcZYvThIJjMAwU/mFiLZp664eDlTG9mFAWNljFTn2uxJN38CpgA+8nsqPBioDoeyz9oRVAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WN8u1y+t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WN8u1y+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751060749; x=1782596749;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9GX3wmoEmfqSCzbnh3QdFetERHUu7YbKgD/DnlJFAg4=;
  b=WN8u1y+tboTg4Wxce0YHwpSxOCqsE1rTfeP3pTtkSFeyPYkhOjHu5AZv
   XhFAlgcHleeJ0FK/VfE/1UYc3YpdUBL7D/vN/SDHHLkFyvCeCVdd0FIuT
   STl5I2OjbqJGPywl0di1AH74wl6uEca+OAsvbHIqhs3MHYE0dgQSCIK8/
   r3kCYKORMSRiM7QrlmpSC/SuZeCkZDCzC1gC2rerK176WK4wclc9zNWBS
   x/2xjUuyKMhHHYDrnkVTlW6d+A0Uq0tSECODyJiKmicdJZkK46v4aJibf
   3m5qMxCZTEkg6bk7ZWHEEeKA3EGPf1zXKfT0gJ0euLUzwndHnuEYTy+Q2
   w==;
X-CSE-ConnectionGUID: TO4kALWgTneXqeMXLl7mKQ==
X-CSE-MsgGUID: /LB4OVq4SXKYRzSnlghHkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57063795"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57063795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:47 -0700
X-CSE-ConnectionGUID: kta/k6nuR2K6TAbYkFO7jw==
X-CSE-MsgGUID: SPWyOUGtTDGxQZrchFHUvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190092837"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:46 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Fri, 27 Jun 2025 14:45:29 -0700
Subject: [PATCH 3/4] sched/fair: Allow load balancing between CPUs of equal
 capacity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rneri-fix-cas-clusters-v1-3-121ffb50bbc7@linux.intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751060764; l=1174;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=9GX3wmoEmfqSCzbnh3QdFetERHUu7YbKgD/DnlJFAg4=;
 b=i3a2m59+Tyx9minyOdIrTmzd7sy+1MpFhNgUt2NuLAIahVFS8IVMhhOg6g+Mdr6w7g8alZDcE
 536p9VgtFzPClmz8d+6mb/AJzF9qKVwfNO/CktWjyVS3AJpXc8VGvbC
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

sched_balance_find_src_rq() is supposed to avoid picking as busiest a
runqueue with a single running task since that would result in the task
migrating to a lower-capacity CPU. It also prevents migrations between CPUs
of equal capacity.

Migrating tasks between CPUs of equal capacity helps when balancing load in
a scheduling domain in which there are CPUs of different capacity and are
grouped in clusters of CPUs of equal capacity that share L2 cache. Load
should be balanced among these clusters when CONFIG_SCHED_CLUSTER is
enabled.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 kernel/sched/fair.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3c50ecffa4c7..a7fd4f1f4348 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11388,6 +11388,7 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 		 * average load.
 		 */
 		if (env->sd->flags & SD_ASYM_CPUCAPACITY &&
+		    capacity_of(env->dst_cpu) != capacity &&
 		    !capacity_greater(capacity_of(env->dst_cpu), capacity) &&
 		    nr_running == 1)
 			continue;

-- 
2.43.0

