Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F5C1917C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502469; cv=none; b=ngeVd5JlxmILUaCOrl8RbR8Dw+QGS4Lm5EvbxQSkwmmZUPZ4pokWJfKNOVd5EjqGgg7JcmfalwQ+4znhp2dtO4jIDJbyrM0M1EguT7Cga1Y7srgO1iWY3o4NUQcxqvfULjkSbniHxIoMWY23fHGwS/PZ+1lRbsRcNXgZUVbCm64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502469; c=relaxed/simple;
	bh=xmC+569+8AF2+9YjjAU1ncRPqd/+A4Q4tbSC+zlSkTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XS76N/s+MOsy2hFlm0c702WJW114dVo3PSiQyX7FkGNBgPp9O3Z3hvo2nQCwZ8KE4549a6q9Qp6u5U13euRtSPu3aYaCcRf14tpfUOxX4V58sOum98GMUKjAhG+Mso3CO4Xhf0IBFEld5QS+awQlDTS+27Z8XO2SzSHJc+Bgnys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5/nUQGs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5/nUQGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745502468; x=1777038468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xmC+569+8AF2+9YjjAU1ncRPqd/+A4Q4tbSC+zlSkTA=;
  b=k5/nUQGsv3v306nY4P2i2X8HSvXbuPdzNSAfM/G0ZJp5feS/6q0SgSHo
   9zQevawJhoRMEXXOUl5D2w2Ew2uGmoApzB3ZKKOgeFypH+jXtAGaBNS33
   TaKM/NPMeKI2Q0U0ftTHuQmUh44GCxVz+LWz1xsa12Jp0rJxveRFs9wRe
   RdCujcX8L/oRFhbJziy2pHGUCv8cNEliBHouTSv3bvbZwhzaTT3w4Kk3k
   VpgJ0vJGosPLLJTTWvrojNO9JvkMfb5rlzYjXWC294jEQOWkm2moANdua
   FWzIzK4QtlP7734eSN9ZIZ8R6ZPyCsTKz+7g5wmP4Cl7TtoPiM18TH/T+
   Q==;
X-CSE-ConnectionGUID: qPlZ19QoQC+CPeuO5Q8MjQ==
X-CSE-MsgGUID: DpLqQ+NGS1SeZzF8P0sD7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58508220"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="58508220"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:47:45 -0700
X-CSE-ConnectionGUID: JySRxCZ3SvmiqKVATCXWIA==
X-CSE-MsgGUID: iFtgBmQYTRKQZUZoXprd2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137718967"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2025 06:47:45 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH V2 5/5] perf/x86/intel/ds: Fix counter backwards of non-precise events counters-snapshotting
Date: Thu, 24 Apr 2025 06:47:18 -0700
Message-Id: <20250424134718.311934-6-kan.liang@linux.intel.com>
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

The counter backwards may be observed in the PMI handler when
counters-snapshotting some non-precise events in the freq mode.

For the non-precise events, it's possible the counters-snapshotting
records a positive value for an overflowed PEBS event. Then the HW
auto-reload mechanism reset the counter to 0 immediately. Because the
pebs_event_reset is cleared in the freq mode, which doesn't set the
PERF_X86_EVENT_AUTO_RELOAD.
In the PMI handler, 0 will be read rather than the positive value
recorded in the counters-snapshotting record.

The counters-snapshotting case has to be specially handled. Since the
event value has been updated when processing the counters-snapshotting
record, only needs to set the new period for the counter via
x86_pmu_set_period().

Fixes: e02e9b0374c3 ("perf/x86/intel: Support PEBS counters snapshotting")
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/ds.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 486881fe162e..83ffbfdf4982 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2376,8 +2376,25 @@ __intel_pmu_pebs_last_event(struct perf_event *event,
 			 */
 			intel_pmu_save_and_restart_reload(event, count);
 		}
-	} else
-		intel_pmu_save_and_restart(event);
+	} else {
+		/*
+		 * For a non-precise event, it's possible the
+		 * counters-snapshotting records a positive value for the
+		 * overflowed event. Then the HW auto-reload mechanism
+		 * reset the counter to 0 immediately, because the
+		 * pebs_event_reset is cleared if the PERF_X86_EVENT_AUTO_RELOAD
+		 * is not set. The counter backwards may be observed in a
+		 * PMI handler.
+		 *
+		 * Since the event value has been updated when processing the
+		 * counters-snapshotting record, only needs to set the new
+		 * period for the counter.
+		 */
+		if (is_pebs_counter_event_group(event))
+			static_call(x86_pmu_set_period)(event);
+		else
+			intel_pmu_save_and_restart(event);
+	}
 }
 
 static __always_inline void
-- 
2.38.1

