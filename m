Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7F32D6626
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822620; cv=none; b=BY5Fm2m+Wm1PhM95yUAXI5kwTUE/amfRu3KpQ6WJ/UY7GNY7kmTOG3eCzTWzRKALYEzkvtcsdTu/B0i6BauGWU7GSS71GnHWEgOiJynpgttX1MGB0Rf/1CKiip8PU74TDw7DnVtR43vww061oq59i1eMj00hCGyPimNa+/WEUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822620; c=relaxed/simple;
	bh=QJCPyGq/8+1SlLUHgMpK6zoVk7NJb9wK746eGcBYWM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XF12OHuIsqzUw9HuHbJr4Rst1jqgGnaMajgyCsxdUchZUS+Eh6H6bpw4vOagU+TKGNdmw2d86PJsoclLBgimpcyf9I81NIDeNoDYINgljWSoYCnhdg3PvAx6RXs0M+0Te+FYuMT7Vo7Y1LOo7+yZkj1MCy6yZvueSWRnfP6PAN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlX15WL4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlX15WL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822619; x=1781358619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QJCPyGq/8+1SlLUHgMpK6zoVk7NJb9wK746eGcBYWM8=;
  b=QlX15WL4z8U25nVtvHn2KX17icGJY8NcneirDBpQTL5lgGKBu8BFVezX
   MuVpbG3or1eXBnUwTJ/3G4gxLzjb2gZ/fNIdNMUF1N71uoDz3t39W34XI
   eoGPKiRY7P8uf0XBCQeISVWKZ/TpE6wF3hk53CxEM8d2ubkWvcLR3R4o+
   mbHfMZxl5crjEduQee1k3PuU5IloMO9Yvesbz7UfQSADF/7qCWlNnYgFh
   BmpqboaGrQ3khmuv6HnYSiIg4FjTvBaN8w8zndmQetHoRSKWAfNmabf8+
   XNWt+ThmuSMzUbL3AmnkP8RKEwnIWfkpTWuPbOVm40ci8s3M2dTIqmJC7
   w==;
X-CSE-ConnectionGUID: 1eVbdod+QKOIZXURIDVZ2w==
X-CSE-MsgGUID: HuaKLpWdQuGQBo/SVTVTsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837570"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837570"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:18 -0700
X-CSE-ConnectionGUID: HxVde+W7Q7yxIEPhJxvrdA==
X-CSE-MsgGUID: 3GMc6gA1RCWv6/wIPc7JZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017612"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:18 -0700
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
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH 04/12] perf: Move has_extended_regs() to header file
Date: Fri, 13 Jun 2025 06:49:35 -0700
Message-Id: <20250613134943.3186517-5-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250613134943.3186517-1-kan.liang@linux.intel.com>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The function will also be used in the ARCH-specific code.

Rename it to follow the naming rule of the existing functions.

No functional change.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 include/linux/perf_event.h | 8 ++++++++
 kernel/events/core.c       | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 52dc7cfab0e0..74c188a699e4 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1488,6 +1488,14 @@ perf_event__output_id_sample(struct perf_event *event,
 extern void
 perf_log_lost_samples(struct perf_event *event, u64 lost);
 
+static inline bool event_has_extended_regs(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+
+	return (attr->sample_regs_user & PERF_REG_EXTENDED_MASK) ||
+	       (attr->sample_regs_intr & PERF_REG_EXTENDED_MASK);
+}
+
 static inline bool event_has_any_exclude_flag(struct perf_event *event)
 {
 	struct perf_event_attr *attr = &event->attr;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index cc77f127e11a..7f0d98d73629 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12502,12 +12502,6 @@ int perf_pmu_unregister(struct pmu *pmu)
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
 
-static inline bool has_extended_regs(struct perf_event *event)
-{
-	return (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK) ||
-	       (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK);
-}
-
 static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 {
 	struct perf_event_context *ctx = NULL;
@@ -12542,7 +12536,7 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 		goto err_pmu;
 
 	if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
-	    has_extended_regs(event)) {
+	    event_has_extended_regs(event)) {
 		ret = -EOPNOTSUPP;
 		goto err_destroy;
 	}
-- 
2.38.1

