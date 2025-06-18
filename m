Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A42F4A13
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270911; cv=none; b=H37a6GaMCpKVbBfru0xhkv/YQMjuzakfh40XV8mJ06HkLTiVswK7M40TUc0iJ2+QdHbjvIsa3fkD0Ch9hrzqgWR417U/tS7He62fpoRnc/RWieBtEAO7KEIcS4LI+2bm+YmBVIN6m7jaZ7yUlmNHWqu6HcD8VDmZ1CHMeSMizgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270911; c=relaxed/simple;
	bh=56rh2PM2yAL35gap+jzrhdtnDXnsh7kQnStk2sSwL5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G2idI3SEXApx4GgXZ/P+aOwo15Jk0qYkNXdo1GgZkBwTVB4/wZnkC8GaXlcdpiVIBcXRH+vvno/YvO528eUsbhW6TDkWnRait/B5YQRy1pg5uGy44IKpVEiwxTH7cssQJgE1Tsmt4x5g8AlJKz8IC1CaADUdr9RqjRgXQ9GaDLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWZpvDE7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWZpvDE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270909; x=1781806909;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=56rh2PM2yAL35gap+jzrhdtnDXnsh7kQnStk2sSwL5M=;
  b=nWZpvDE7SLXGGfo3jHHGEomAw3ClY8hUPhWrfFErNHzBVjyIHSQntZd2
   1nZXjrvyQxuRk9ZxQYH3QHfm14LYHc70BTSraxKI+8chQcuVj6tsAgrD1
   RWdBKfVBbXjt+LaiRwCbUYMll6u+jjqnmEMHSrUpZujg3klH237md9SXa
   37yFQxyarddD1nF8E+ny40AEdtC3cTGt5Ar19Wsp+W6417mEmx6ktZkZd
   2s4JDPZkFpV3gOOZumfVaiUV2iM+gjXUhTEiJqzIpaoYdgOiBcYYH7tlm
   I/na3T9fEDfmsq6JxtGp9O8CDC/E09i7K1m27+a7hskfivj2Uj+kXW6uY
   w==;
X-CSE-ConnectionGUID: iTxb4W8TSr+JVDmjhHc1nA==
X-CSE-MsgGUID: 3TLdAYAnTC6j+0rzbFr1IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931484"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:47 -0700
X-CSE-ConnectionGUID: VnM+trhjTJSnHQCXxzcG2w==
X-CSE-MsgGUID: xdjg5U3US8yEOUARte8LqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959793"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:47 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Libo Chen <libo.chen@oracle.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	Len Brown <len.brown@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC patch v3 03/20] sched: Avoid task migration within its preferred LLC
Date: Wed, 18 Jun 2025 11:27:51 -0700
Message-Id: <284223928844c9ae64de1fa142f8db89775de27b.1750268218.git.tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1750268218.git.tim.c.chen@linux.intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Yu <yu.c.chen@intel.com>

It was found that when running schbench, there is a
significant amount of in-LLC task migrations, even if
the wakee is woken up on its preferred LLC. This
leads to core-to-core latency and impairs performance.

Inhibit task migration if the wakee is already in its
preferred LLC.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 kernel/sched/fair.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 89db97f8ef02..567ad2a0cfa2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8813,6 +8813,8 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 	if (cpu < 0)
 		return prev_cpu;
 
+	if (cpus_share_cache(cpu, prev_cpu))
+		return prev_cpu;
 
 	if (static_branch_likely(&sched_numa_balancing) &&
 	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
-- 
2.32.0

