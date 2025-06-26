Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2481A2ECE8E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967820; cv=none; b=Odyv3xAwa0Tp0o9pFnHGmbfoY5dfOn0FZNPaKVWeNveEDfqstk8iyeFRBrHGxZghl0QuuRKjMWGEldmo5AUAEEZeN3MFbuWPYStXWAXKLGXskgQ1phgT7gYbPZZLqFBUZqcWUehjcKtsBW7ZTCvkP7NzaRgpn0Zm8rycpXaUVN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967820; c=relaxed/simple;
	bh=ilZZDLKFtvjxpxoBhhniohVxQ7x9krgeaddVpbJsspM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ap56xkMH/yyRLuB7d0wDCTwsd4B3RU5O71cwbBfrz3kSlr3Odl2LmgW4WOsD0FrIR5kbgeqanz2KfiTDQTheACuyjjGO69asopiGyYa2OPT6/pGi5IYAqkgOf9xgr9V5HwmDvHB7/q1IASy/DtPJwB/mZlF+V3CCCexZIFZd9bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bq8XlBvG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bq8XlBvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967819; x=1782503819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ilZZDLKFtvjxpxoBhhniohVxQ7x9krgeaddVpbJsspM=;
  b=bq8XlBvGEiHKQ9rI6Rr73o+tySIeo+LzXe8Wugn/I/psZtj02JzoH+bC
   z9US7ImRJD59LUD8tl0KBFSMSrSCRBmnMFg/+kn1yu6C4mFNjgGFPAdSh
   1HESCUaEVne95dbm78XE/0CWy6fkTCGj4gn5Zhm+shX9ZJkOZ4lmX7oUt
   e3jzk4Hyraw+F6ATZUFlpO2QO2XiCfOEJ33azYy8kXiP2vV1dBsofcbV4
   mUrdjgNrnIxNsnOh2eyjbAiuBCKFX8dqDiv9dF2t7CPGAGdHGFMGwN8XV
   S/kWzTNYLqR6oH1kvs30jUSORPxXrLgpJbymGJSLpgbimzvabP89rLWlV
   g==;
X-CSE-ConnectionGUID: D1/l0RDBQg6rApVr4ykrLg==
X-CSE-MsgGUID: O8JLlBmaTaSEwwNxOZQXxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002122"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:56:57 -0700
X-CSE-ConnectionGUID: PYcqLTJRT269/olE/fK1Og==
X-CSE-MsgGUID: YmUqp189QMiKDn9N2qKKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902894"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:56:57 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	irogers@google.com,
	adrian.hunter@intel.com,
	jolsa@kernel.org,
	alexander.shishkin@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com,
	ak@linux.intel.com,
	zide.chen@intel.com,
	mark.rutland@arm.com,
	broonie@kernel.org,
	ravi.bangoria@amd.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH V2 01/13] perf/x86: Use x86_perf_regs in the x86 nmi handler
Date: Thu, 26 Jun 2025 12:55:58 -0700
Message-Id: <20250626195610.405379-2-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250626195610.405379-1-kan.liang@linux.intel.com>
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

More and more regs will be supported in the overflow, e.g., more vector
registers, SSP, etc. The generic pt_regs struct cannot store all of
them. Use a X86 specific x86_perf_regs instead.

The struct pt_regs *regs is still passed to x86_pmu_handle_irq(). There
is no functional change for the existing code.

AMD IBS's NMI handler doesn't utilize the static call
x86_pmu_handle_irq(). The x86_perf_regs struct doesn't apply to the AMD
IBS. It can be added separately later when AMD IBS supports more regs.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 7610f26dfbd9..64a7a8aa2e38 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1752,6 +1752,7 @@ void perf_events_lapic_init(void)
 static int
 perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
 {
+	struct x86_perf_regs x86_regs;
 	u64 start_clock;
 	u64 finish_clock;
 	int ret;
@@ -1764,7 +1765,8 @@ perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
 		return NMI_DONE;
 
 	start_clock = sched_clock();
-	ret = static_call(x86_pmu_handle_irq)(regs);
+	x86_regs.regs = *regs;
+	ret = static_call(x86_pmu_handle_irq)(&x86_regs.regs);
 	finish_clock = sched_clock();
 
 	perf_sample_event_took(finish_clock - start_clock);
-- 
2.38.1

