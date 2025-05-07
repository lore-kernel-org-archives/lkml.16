Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311FA289362
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628493; cv=none; b=Si/9x94pRiIo5RwcVpir57Xg7NO/qgID933LGXrzOxcqQwGFZm7wEOJZarE7Wz82W0RGYVTLJpvY7kvjF/QLMNV+u0IyWOE2YcNs0wsognYKd2dMCj6lwkwSVTYpD8W233kPJ14XpUe9SiDiMNhC+K3CIcArxi9GDDRL7Hgqous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628493; c=relaxed/simple;
	bh=pOUkHTeSo9LMNRHv1Rw3zA1/OZeSTDnWdy8XZfiuXyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sS7QiCPhhzaO3K7ccHzJIYh0xkXif52CmfmO5ZPY8i/uc96Njdo2BSxPIbRSe4tUIrEbg5r9KgggaCvmURJYoBwa7Nq/wxO5SVNslAxG7Yn8kTSjDX83LTuz8F8SEBfYT4E+TPmXON5WEgtkgsQtjgnSPiVt9ZR96fi3htC4wHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lG9QfylI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lG9QfylI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746628493; x=1778164493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pOUkHTeSo9LMNRHv1Rw3zA1/OZeSTDnWdy8XZfiuXyg=;
  b=lG9QfylIE4OqqT2P3rxXSBtxhIxAvHdM2nnlfqm10AnHK2onFivi4Goe
   29ehfiEi+NOob6E5RMSrrO5JzV2cnhiW5aKKetyFlH0vmjX2cKfs6Lq1t
   C71J95rrqI7n+xqe7A0B2I+pf5HgxWNdbfEPU60DFGUrtPSlHgom3rQgh
   CqbXcbGTCiPt28GEnNLskBhE7YxIDCpbA2812hI7Vvp9tg0gEkqGkc0oh
   Fk1KMN+0HhxMLF0Vo9uiorF82mvmAzmXCnmCOrRXh1yOlXBWFLwCo7oso
   DTSv0pLX3tpHg3iIQhHsNt58N7kDHXPjJTgXGPL+oAxPeAR5K6dDBH9km
   A==;
X-CSE-ConnectionGUID: guK5lQkwSoC5a2X1yh3C7A==
X-CSE-MsgGUID: T/5d59VNRUW5tIIUgiIiIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48378089"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48378089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:34:48 -0700
X-CSE-ConnectionGUID: NFGKn0qpQA+IjMh9RR5LeA==
X-CSE-MsgGUID: FjehlFa0Sa6FXcXQHvZ6GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135943615"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 07:34:48 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [RESEND PATCH V2 4/4] perf/x86/intel/uncore: Add iMC freerunning for Panther Lake
Date: Wed,  7 May 2025 07:34:27 -0700
Message-Id: <20250507143427.1319818-5-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250507143427.1319818-1-kan.liang@linux.intel.com>
References: <20250507143427.1319818-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

PTL uncore imc freerunning counters are the same as the previous HW.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/uncore_snb.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/uncore_snb.c b/arch/x86/events/intel/uncore_snb.c
index 817dddc1454d..a8c4afc9cdff 100644
--- a/arch/x86/events/intel/uncore_snb.c
+++ b/arch/x86/events/intel/uncore_snb.c
@@ -1905,9 +1905,17 @@ static struct intel_uncore_type *ptl_uncores[UNCORE_PTL_MAX_NUM_UNCORE_TYPES] =
 	[UNCORE_PTL_TYPE_HBO] = &ptl_uncore_hbo,
 };
 
+#define UNCORE_PTL_MMIO_EXTRA_UNCORES		1
+
+static struct intel_uncore_type *ptl_mmio_extra_uncores[UNCORE_PTL_MMIO_EXTRA_UNCORES] = {
+	&adl_uncore_imc_free_running,
+};
+
 void ptl_uncore_mmio_init(void)
 {
-	uncore_mmio_uncores = uncore_get_uncores(UNCORE_ACCESS_MMIO, 0, NULL,
+	uncore_mmio_uncores = uncore_get_uncores(UNCORE_ACCESS_MMIO,
+						 UNCORE_PTL_MMIO_EXTRA_UNCORES,
+						 ptl_mmio_extra_uncores,
 						 UNCORE_PTL_MAX_NUM_UNCORE_TYPES,
 						 ptl_uncores);
 }
-- 
2.38.1

