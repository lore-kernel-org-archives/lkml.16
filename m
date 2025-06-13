Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF752D9EF9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822618; cv=none; b=H1Trp91HwWRtSMBA7q/f8fj+of1tSA0sYOJnfTPUUDAFbSAmnvXT+SJc1Pgi0do/hZz401EzKeSYrwUKYnocYnx6x0SuHNh7qC4gQGdiD0SvAOzHfJKYHrxLLk6TMQsKMmK+QzpEFi/WrsjRhNlNoSUm55WBqdu1831wj/034ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822618; c=relaxed/simple;
	bh=WWSMNscjRKqDqvaRWCJBqmlgX5BK/JXK0+3JVVtjIaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n/H895k1RRenBe35z79MZxo8h1NgwbJQQ8ej4gJVHxEBL37HCkEy31oZ0fTt3D3CSe9FBZc9YiuqjbSJHUy5HWRQBAH8e3ZUkewxq+Xa0DtJaQdicsJ9PfdNTWZtDpcoci8tvPdOM2y/iH4ZPaX+p7lcZdCsgKvQZrImD6zBq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3iMRb5f; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3iMRb5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822617; x=1781358617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WWSMNscjRKqDqvaRWCJBqmlgX5BK/JXK0+3JVVtjIaM=;
  b=c3iMRb5fT7/t1xdOiTd5hX6sHRO9KizQOCBejjSN4+nbX/OgdI2HS/oa
   YO1pP4NaVUkTgq5kRolqEuWKJeI2h/i/150tyZYVPjoc4tqRzkIN+ZOhi
   C3bMeUhk6U6VkQJWrRXXqrc7GRD9Os65kwrtN+juT9jZ2XPwWRsdSHthF
   yRwICJLvqump9KQ0pcS3VDOmdgacCbNNnU5qfE0TxFwq0QHliRJxSvXGQ
   IviLdhxYXHIm1ZFPGiyzA8jMR1VilGWRFagpRBrEMGoqsvKWv/C/ng++u
   nHfetNheAK9Owln61nUmd6+jNlpZTFd1SIKJ+RBxvR28zan4QrJ5/Vx9P
   g==;
X-CSE-ConnectionGUID: mmxggCaWRTmX4OwakYZ3ZQ==
X-CSE-MsgGUID: cnqbagmdTgm+LKa5me5Azg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837549"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:16 -0700
X-CSE-ConnectionGUID: HYJePYyhQYewtHCH3lqvcQ==
X-CSE-MsgGUID: P/PvXNpCSaG+owfBuL8pmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017597"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:16 -0700
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
Subject: [RFC PATCH 01/12] perf/x86: Use x86_perf_regs in the x86 nmi handler
Date: Fri, 13 Jun 2025 06:49:32 -0700
Message-Id: <20250613134943.3186517-2-kan.liang@linux.intel.com>
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

More and more regs will be supported in the overflow, e.g., more vector
registers, SSP, etc. The generic pt_regs struct cannot store all of
them. Use the X86 specific x86_perf_regs instead. The x86_perf_regs is
already used in PEBS to store the XMM registers.

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

