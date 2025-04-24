Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D50215B102
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502467; cv=none; b=KBq/zXy9DVApx8litQagerkeIhnjcRla/eDLKt6jbdJNQf4IYe33WZqV2XbCNjOjQjp1RiuVQFBhh+9xi1EQM3mpYVRg0PZM29FAkXz7SYMFs5tZaV1WaMrjr04fJTHQTDe4vTDbLPPTDnwWVtrun/TO+rGU4JqxiSLIGJvfkkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502467; c=relaxed/simple;
	bh=kzqSUUxl/QZhVtZBYRGlwQbvV/n70GorqZ7VsvWOTwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WjaOav/WSbRBMZ3gKWeL3ksJCoJ1cakX8n+RlKJ0saJzNjy4TALg9BgIOLWDBcWogdOkZcY6TvZuJIXEt0hZ9fHzxmyYJBygizeuwzvPkFoh99CqsWcwgiXtedWdzSsjdx6imqd2XQs+baonS7fQsAuD9+QEoMvvb9/oYuLDhjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1ByfGxf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1ByfGxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745502466; x=1777038466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kzqSUUxl/QZhVtZBYRGlwQbvV/n70GorqZ7VsvWOTwc=;
  b=P1ByfGxfzDkiRMoczXCGom10/Ko2cieAFaOZkt37RIFVMThBE5IPb1Vd
   JhOlWzamridOviyfTzwpRpFcBW5PR3pCXe44dXH2NwLMzDIJCbtnJvo7w
   QruM/utnFp5mvXWfnCYALWyhyJT4ON/gaB3M7XE6JsyC5hZQRiSktOJKF
   Arijwn11+Y9hNa5u12kZcOSu9DXaSu0o16qxPZVptzCyhSbhHDI3oXq1o
   oL59jZ90/hVPr1yz6CmOqLb5ZM9ZQy1PSC4qk8+nnFZyECali0alG2pRH
   SaNrRf3CkMW53/X0PuB8mNc4wdv0dluE7tktj4eVrhjFdl6HbkF6WRsEG
   g==;
X-CSE-ConnectionGUID: 4egvKi/JTLKSQZ7Fcc4Wpw==
X-CSE-MsgGUID: HNi744Z0SlKt6ZKaDegMMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58508203"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="58508203"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:47:44 -0700
X-CSE-ConnectionGUID: ClXWIuBjTtOhCQNwpikxdQ==
X-CSE-MsgGUID: +JBGqAWKQN6zpQxC4n/UPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137718960"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2025 06:47:44 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH V2 2/5] perf/x86/intel: Check the X86 leader for pebs_counter_event_group
Date: Thu, 24 Apr 2025 06:47:15 -0700
Message-Id: <20250424134718.311934-3-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250424134718.311934-1-kan.liang@linux.intel.com>
References: <20250424134718.311934-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The PEBS counters snapshotting group also requires a group flag in the
leader. The leader must be a X86 event.

Fixes: e02e9b0374c3 ("perf/x86/intel: Support PEBS counters snapshotting")
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/perf_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 4fc61a09c30e..fd409d70e568 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -124,7 +124,7 @@ static inline bool is_branch_counters_group(struct perf_event *event)
 
 static inline bool is_pebs_counter_event_group(struct perf_event *event)
 {
-	return event->group_leader->hw.flags & PERF_X86_EVENT_PEBS_CNTR;
+	return check_leader_group(event->group_leader, PERF_X86_EVENT_PEBS_CNTR);
 }
 
 static inline bool is_acr_event_group(struct perf_event *event)
-- 
2.38.1

