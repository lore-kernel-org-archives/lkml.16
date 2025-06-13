Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A302E175B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822625; cv=none; b=UPRhqkpnE+rgyonKlMmlHU+Havv6PgLW/WoyLqN6cCN+SrYIYoPDwOwdsEgsbeIUwF/bUqU9A6yRQFW+WfNGXHXrFWW0qjQpBrfCjkuRlqqaezjzJvRgIPvHFzgF6MIRp0MbBJeMZZM3FARJbK/kNFzDfvY9xJVUv4yJfuMel00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822625; c=relaxed/simple;
	bh=Pj+WNZIWRrgwW/LUYQRXNiJRdWKQig8NyY1KKUlYSac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RjiHmistov6imn6vUrlGxqKfV3wmTctBYBOLeh8AQgZLnOoeCgN46434s8NNvjAD4O+ujTnfor7sgnmQhrWEvlb1Uc7fRJxNmFaerABGEnvRQ1gHTAsEzvZnabHE4nNZvvvLxkjCtw6h/aHhdhATg4aDDuahFToQRc99AcA0xK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoUEyxJF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoUEyxJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822624; x=1781358624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pj+WNZIWRrgwW/LUYQRXNiJRdWKQig8NyY1KKUlYSac=;
  b=CoUEyxJF4zL7tx9g2kDKPWvKa9ZRe8mYw7y5YFMzBQMyrz61GBZ89ATM
   7nRBqXh4l5jARzFKUxM/GoTzttFPML2uLBr7gIBK/4JnS8C/+1eLJBIz9
   hHCj0v6pLQdhCzW5pAFJlUJDU2RHZEUD1mNX14kER4zKlWbkXcf5L6NBo
   580sjujNa2mBneGD8GI7z608rihkzFzgPCpItMuz81+y7MbUo8y55EmSh
   i4j7IyzXF4a1qO5cb89Gpfh7PEEBUXsLpiKLJPse+luM5YCPgSR5HS9FQ
   WNyfRF6fB86uEeS4tnTXNHvmEJnTBLLNkupdRYokAVi9xw2Unmsq18rad
   Q==;
X-CSE-ConnectionGUID: 3mIcixCZQ5iOhEonoRIdqg==
X-CSE-MsgGUID: lW2KDQF6QdqCZciG13GKkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837626"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:24 -0700
X-CSE-ConnectionGUID: ECnIzSi6Rie4LAeQjOoTGA==
X-CSE-MsgGUID: pdubbUBYTHG+hCX72ehkLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017649"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:24 -0700
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
Subject: [RFC PATCH 12/12] perf/x86/intel: Support extended registers
Date: Fri, 13 Jun 2025 06:49:43 -0700
Message-Id: <20250613134943.3186517-13-kan.liang@linux.intel.com>
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

Support YMM, APX, OPMASK, ZMM, and SSP if there is XSAVES support.

Disable large PEBS if the extended regs are required.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/core.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 5706ee562684..4218067b1843 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4035,6 +4035,8 @@ static unsigned long intel_pmu_large_pebs_flags(struct perf_event *event)
 		flags &= ~PERF_SAMPLE_REGS_USER;
 	if (event->attr.sample_regs_user & ~PEBS_GP_REGS)
 		flags &= ~(PERF_SAMPLE_REGS_USER | PERF_SAMPLE_REGS_INTR);
+	if (event_has_extended_regs2(event))
+		flags &= ~(PERF_SAMPLE_REGS_USER | PERF_SAMPLE_REGS_INTR);
 	return flags;
 }
 
@@ -5295,6 +5297,26 @@ static void intel_extended_regs_init(struct pmu *pmu)
 
 	x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_XMM);
 	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_EXTENDED_REGS;
+
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_YMM, NULL))
+		x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_YMM);
+	if (boot_cpu_has(X86_FEATURE_APX) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_APX, NULL))
+		x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_APX);
+	if (boot_cpu_has(X86_FEATURE_AVX512F)) {
+		if (cpu_has_xfeatures(XFEATURE_MASK_OPMASK, NULL))
+			x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_OPMASK);
+		if (cpu_has_xfeatures(XFEATURE_MASK_ZMM_Hi256, NULL))
+			x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_ZMMH);
+		if (cpu_has_xfeatures(XFEATURE_MASK_Hi16_ZMM, NULL))
+			x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_H16ZMM);
+	}
+	if (cpu_feature_enabled(X86_FEATURE_USER_SHSTK))
+		x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_CET);
+
+	if (x86_pmu.ext_regs_mask != BIT_ULL(X86_EXT_REGS_XMM))
+		x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_EXTENDED_REGS2;
 }
 
 static void update_pmu_cap(struct pmu *pmu)
-- 
2.38.1

