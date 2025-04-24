Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107518DB34
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502469; cv=none; b=N0w189YavigCk0zhMgkQKDm0fIozqQmmr/anrBIZxTNcGe/GXsInFl4wj8TYLs2yjtXjepM4QdvblToceyEMl8BY+1xJCOT8YlkmACM2xRExR3arrpWupKQC3rslsreSRWJfCvIvXpzpvLjlJjB8eu+r0XrLSxIothOKVCblwNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502469; c=relaxed/simple;
	bh=ZdZJog103PjdTsGGO0CcUxRKRwD5l2l9ILCbQlG9Z9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NypzyNsbsEXHeRz1XQaWtUNUHPIwaO1b8yGit44Jw1MtkIKiGGcRvcIuExZmH6aJloJQW+Z8dZSl/SCBfFICGSByOL+OXfR4g9N8LyIvDsifg6XoHWoJXgZL1nQ7E9gSMpvSzaVy2jWsu5++b5U0KI3VLLGMlle/UYY1N/RG/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmeD5rY2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmeD5rY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745502467; x=1777038467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZdZJog103PjdTsGGO0CcUxRKRwD5l2l9ILCbQlG9Z9k=;
  b=NmeD5rY2AQvGWNZz9iRnAzx3MVvi4YiI443E36RcM0ox3SJjbRyKy+KC
   4DUmNWF/fYm1Wk29+WShhEdI//v4MI0fVntQAfO9MkLUYqDJoiNlpWj4N
   Md+LfCUotaUKk7IwRLcloUpV/opm6d0dvrrkbtM7C06zaZS+0lF0L88HR
   emkWFiT/eECrh7p08VJepzLSIxgVMLZo3BMd7CAXrJglF4HIGMFTgymKk
   HRhZwQvVWKjdhmPMhwO2IxSVQqnXSpJ6PFlOH4qHQRcoVqiN6brJwikWz
   DbnlZlmZQFBrWI3tBzhAPti6FYZtybo4DdD9rIku3vHLRijZDMg4r0lfg
   A==;
X-CSE-ConnectionGUID: eDXpCZUFSsa8s1iYVuUxcQ==
X-CSE-MsgGUID: 1OXxS6feT+asAs7eI6qlaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58508213"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="58508213"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:47:44 -0700
X-CSE-ConnectionGUID: Vw3gdJ8hQBSZce4R1O6gcw==
X-CSE-MsgGUID: IibXVzH4S2uQcRdGse4OjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137718966"
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
Subject: [PATCH V2 4/5] perf/x86: Optimize the is_x86_event
Date: Thu, 24 Apr 2025 06:47:17 -0700
Message-Id: <20250424134718.311934-5-kan.liang@linux.intel.com>
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
index b0ef07d14c83..43053ddd7073 100644
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

