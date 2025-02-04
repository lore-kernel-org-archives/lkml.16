Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB1203710
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703093; cv=none; b=dfrc/48qZUDfuhxzMbRw5Bjd0YlbCh61rcN0BgYfFfdbkiZ+/yT05BXtSvWhjnzyHz9rrbK83HfcQ3tpAHOa0KL1XkVf81hlL6LCERau+uM5c7N+4PxxHZJrUu6fX/JhFbxp5dCofvlqd171yF7IprW/pp2FOS+XwZTQbU4OCH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703093; c=relaxed/simple;
	bh=UvZeU/UTlZoXsif4tOjgXzXg6RqnL7CW1PgUUlVD7MM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UYN2ye9VNNhG3yUp2DrHWF0tj0Ra0aAu00G2XaIUpGt3blcJThUyWpwiYcvCjlvOt25pwao4rUjl0t2oGtJgyik7bBuj+StgAmLPxHiZH6vwMsY8L/pDaRc0kNKltd3qXN9yVbPGgcoYuqr5zBYl4Ag5gZQngh4nuhVqC6AOwDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md2TD2lB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md2TD2lB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738703091; x=1770239091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UvZeU/UTlZoXsif4tOjgXzXg6RqnL7CW1PgUUlVD7MM=;
  b=Md2TD2lBtVE+pqvggh91iP6BaL/fO9AgbGU+97YZ3p9+IwdEAcilAi68
   I7L4DDkXhfhF8XgBI69+UlMyDpjWqoypjHeXyJaOYCz78554oQKCIZ/4f
   22qlv9oY+9bvX4nJlNBPFcWhh7YsInWPyoVqtyueYqco5DyNfkFq7O5bD
   bQp2PmoqzoKibec1hXhxl6EbIozRIMoTYWxdTzDOT3IsO/V2/zST6kpWS
   eoUwufT88LX3YXgFjT9smiouhPnvN9txoDSmxvpQOBhpz/iI8YYXyenps
   E2bs4FdCOOIdmwcgJZOzgnbRdjPffIL+49ZpGvJ0wXO+Khz4D4RtzsHPD
   A==;
X-CSE-ConnectionGUID: 5FF/jJsTQweY//hjRWDzkQ==
X-CSE-MsgGUID: 5+oTeAYPQy+gJ5d7tN5+Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26849294"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="26849294"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 13:04:50 -0800
X-CSE-ConnectionGUID: 5xlq5YiQTbqeFWvp1Akh7g==
X-CSE-MsgGUID: ERb0ct4RQpCQqHQ4rB+cmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="115741702"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa004.fm.intel.com with ESMTP; 04 Feb 2025 13:04:49 -0800
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	linux-kernel@vger.kernel.org
Cc: ak@linux.intel.com,
	eranian@google.com,
	dapeng1.mi@linux.intel.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH] perf/x86/intel/ds: Fix counter backwards of non-precise events counters-snapshotting
Date: Tue,  4 Feb 2025 13:05:14 -0800
Message-Id: <20250204210514.4089680-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/ds.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 46aaaeae0c8d..e8f808905871 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2377,8 +2377,25 @@ __intel_pmu_pebs_last_event(struct perf_event *event,
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

