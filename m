Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD1A1EBA08
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446229; cv=none; b=qz738HoR1EMP75zynzs7eTR5blZUQhUqA22OxHc/bJ4D9h69lmDWYnTAUcx7+m/UCY0GLB/gAQ5Ep9OMqtro1EJT1FysptNL6fjw+wIs+9q702GYUJw+O8RNs6+d6oAJV8qkjj6NJpH1k/fG+LoW9R7eKvE3RDLtdx642ivfum8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446229; c=relaxed/simple;
	bh=KCOnpMM4t+8tKON7USAlM/Bt4CPGdXJQNiC+oAKyAS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E7CyfpZEr82uvccTMuoTt48zLPlQG0w9wQaxfZXWtz7S6917/ZX8YjahCOHuYAHNAIUxEowHY9dEAbfJbCbH/p4p7NB9thvfGNPRvlB7G80Lkb7GYrCvqKRiZxnpRFAd/ZLpDW7YMQ2koQZLrxw4ZYobYrEL7sYv30K/MU6yeco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRBkVx2Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRBkVx2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745446228; x=1776982228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KCOnpMM4t+8tKON7USAlM/Bt4CPGdXJQNiC+oAKyAS0=;
  b=bRBkVx2Zu7LnTc0/E1zQdlHtACZI8U/JC9HQjf7FAbVEIlScpvYvmJw7
   vYl1eIIzNm9RL6f/Q7U4xzkv9bkKiPCYvxWianxWB5sNd6x72o8sBUQ5G
   hW22BsqOQajMtgL9vu42Xw2XxyHD99p7Fdsra4oSK8iPdLu3kKr45t8hm
   n3kV+WaIKxFGTJLnTFsm7/XREVy3qejYerqyIAX2FiGvX39LhB1xpS8Bx
   TdEBSGDRcAxCsUi6RgoC1VVauQ3wIpvr8fMqG5WTNnklNHHYY5yj8Iqey
   PMFlZn42MuBeX1DE2wXXoQEv+wu1qZzFFEJcc+jUnMCfvOf2fPEaThXAN
   w==;
X-CSE-ConnectionGUID: Lu5bApVwQeCl+r+36edt6w==
X-CSE-MsgGUID: xrUU9UwWTyybV5uatJlW+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="34673157"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="34673157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 15:10:24 -0700
X-CSE-ConnectionGUID: 4I2/vakpRs+BcaqIueZ0ZQ==
X-CSE-MsgGUID: wEU9E1ucQA+ETqK5powGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132967191"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2025 15:10:24 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH 2/2] perf/x86: Optimize the is_x86_event
Date: Wed, 23 Apr 2025 15:10:15 -0700
Message-Id: <20250423221015.268949-2-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250423221015.268949-1-kan.liang@linux.intel.com>
References: <20250423221015.268949-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The current is_x86_event has to go through the hybrid_pmus list to find
the matched pmu, then check if it's a X86 PMU and a X86 event. It's not
necessary.

The X86 PMU has a unique type ID on a non-hybrid machine, and a unique
capability type. They are good enough to do the check.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index b0ef07d14c83..1aaa77875c5c 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -757,15 +757,16 @@ void x86_pmu_enable_all(int added)
 
 int is_x86_event(struct perf_event *event)
 {
-	int i;
-
-	if (!is_hybrid())
-		return event->pmu == &pmu;
-
-	for (i = 0; i < x86_pmu.num_hybrid_pmus; i++) {
-		if (event->pmu == &x86_pmu.hybrid_pmu[i].pmu)
-			return true;
-	}
+	/*
+	 * For a non-hybrid platforms, the type of X86 pmu is
+	 * always PERF_TYPE_RAW.
+	 * For a hybrid platform, the PERF_PMU_CAP_EXTENDED_HW_TYPE
+	 * is a unique capability for the X86 PMU.
+	 * Use them to detect a X86 event.
+	 */
+	if (event->pmu->type == PERF_TYPE_RAW ||
+	    event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_HW_TYPE)
+		return true;
 
 	return false;
 }
-- 
2.38.1

