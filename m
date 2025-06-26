Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B82F0C7D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967822; cv=none; b=UNJyEynRIulZB63Xep/2gShe0TO2TbDOMMzbVi2GvaPgL7i8B1tmhI89ShtUk85rKAZBHE0OHJIw9m3k+qMahTCG2r54/r9t+BsZUeDwuzjLeq9Zpw+2DVMxzWiEW+PZs7dZBYeHTTE8n8nJqpCSc0rZGdEGVhYdUcEjyGiIf6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967822; c=relaxed/simple;
	bh=QJCPyGq/8+1SlLUHgMpK6zoVk7NJb9wK746eGcBYWM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkMU14gq5K6Faw3CBqnPuGedOVA19BFT3PYV8JF1FqOys6AOGlGKpRWXT2UjZaNG0/r5IccZyLDsfg8t+3kM73oVcJbi/cN3vsWt88JMSZ7ZsEwCZRmVzZ/T0hCe2+Uica4X169ahnvjFCJJZe+hbGsqUT/7HwxNPhayWzP83Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkfUjg2z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkfUjg2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967820; x=1782503820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QJCPyGq/8+1SlLUHgMpK6zoVk7NJb9wK746eGcBYWM8=;
  b=CkfUjg2zhY1Da+1kzWqWcEw6wnW8TUMHh/xUuubonYNnCfR4M5HaOnfd
   PgyZ0RKv9gW4ZwDUtysI6N2Qtddy8JoZz99bTUSnUs9bWgbd6GHdaNEek
   j3RIc/kW8xMYX82ws0Pu5JrW3kCGHWf/KOt1jecHmsIbNKtN8YxYXLDJ9
   ywp3y42Pu5hJlGPvSG5ojFSan8DYyr7b8F8gj72KK/G5yAPrQhvpw49dh
   LLhPcnh1U20xJvIsquf0kHSsLrphIVUUV0VRb44O5He1AB7W1I8RBI74B
   8lNzwFghRFpES8uITzlRqcYUkMxpSeetKwss2MJfP/H0C8gvhltBm1M8i
   A==;
X-CSE-ConnectionGUID: jTlh2OTAS8OVMCss3Cd9rA==
X-CSE-MsgGUID: XNVM6b8+QbafY0vnjQfL6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002148"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002148"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:56:59 -0700
X-CSE-ConnectionGUID: QvoswWgQSoSHYWDuV4y1og==
X-CSE-MsgGUID: 9AKpfC8mT/+lzPGggIBr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902907"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:56:58 -0700
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
Subject: [RFC PATCH V2 04/13] perf: Move has_extended_regs() to header file
Date: Thu, 26 Jun 2025 12:56:01 -0700
Message-Id: <20250626195610.405379-5-kan.liang@linux.intel.com>
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

