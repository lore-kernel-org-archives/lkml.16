Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC128001E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628489; cv=none; b=SDnVb6YTIy3U0dhuqIpuM6EHgQwVbE2+yMsclWwUhLH+1nYXtrrHxeRN15XHxGrq6fhbw/N8Ewnae2Ofh3WIrzFZqBZ0HJiuAX9brMOgpnadSgRu8Uv0y6EfbORvKxONtkqsBBRabvhhloAxbzUuPuCS9ziBQaeN3SfpUn3QxQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628489; c=relaxed/simple;
	bh=HCQxImdfb7/m/S5RbimedqdetxKy7uYq0Xv06siVEas=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lT2SiNW4oUiD40U6Q1jLP8tTforKuBz2WUwDCw6DaLcOLJ4v4/oRfA+HdtaZ9VYz7ydSQeT92d4WF0tcm8uqv1HwraoYiNmwkbQ3E35+piyblyyfv2bKainoQqqBb7kBDhT+/0V3StX+2j9+DFfFMi9LS2BvQj1tUxnvPXWiUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVhLKmAS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVhLKmAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746628488; x=1778164488;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HCQxImdfb7/m/S5RbimedqdetxKy7uYq0Xv06siVEas=;
  b=eVhLKmAS5sT1PcIWAYR5q8Aftq4K7k4TQTuSZ16vsth/PYd2ZL3LlcXk
   CDyLphsmGTM3VRpqPXHo6AKjaQ8FOqkYdKhqZNFeTCwBaIQC/QPEXbFIz
   TscWmYopIG60aObc35E6KB13AQYg06mL6iMA+WxtlgwnnmGlJpaU5k6UD
   mWxmjlgNTLOZJFfSmIj/W8Z9MZIgqR0gOdj7FNKs68hy3QAeOpqrOLgfE
   LgCNM/iPIgBxBR6lYWKmKtRtQA1Oe6x0G1IQ9dq62vjngiYaevFZuiuzn
   U638KnqPZB99B6dydXwx6RXapi6FSRMRVQWjkv23v20k7ARZAxhHxWYLl
   Q==;
X-CSE-ConnectionGUID: ODDDJ0SbS+Oc0sR+LvoOKQ==
X-CSE-MsgGUID: 1v0g6c5LRkqMJ338HgydRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48378072"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48378072"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:34:48 -0700
X-CSE-ConnectionGUID: wm+0hUqPSyS4cShVMGiZWA==
X-CSE-MsgGUID: aE36WwzOTa6Ii2B1fr0TSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135943609"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 07:34:47 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [RESEND PATCH V2 0/4] perf: Support Panther Lake uncore
Date: Wed,  7 May 2025 07:34:23 -0700
Message-Id: <20250507143427.1319818-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

Starting from the Panther Lake, the uncore discovery table mechanism is
also introduced into the client platforms. The difference is that the
portal of the global discovery table is retrieved from an MSR, rather
than MMIO space.

The first two patches provide a generic support for the extension of the
uncore discovery table mechanism.
The rest patches enable the uncore PMU on Panther Lake.

Kan Liang (4):
  perf/x86/intel/uncore: Support MSR portal for discovery tables
  perf/x86/intel/uncore: Support customized MMIO map size
  perf/x86/intel/uncore: Add Panther Lake support
  perf/x86/intel/uncore: Add iMC freerunning for Panther Lake

 arch/x86/events/intel/uncore.c           |  7 ++
 arch/x86/events/intel/uncore.h           |  2 +
 arch/x86/events/intel/uncore_discovery.c | 89 ++++++++++++++++++------
 arch/x86/events/intel/uncore_discovery.h |  7 ++
 arch/x86/events/intel/uncore_snb.c       | 79 +++++++++++++++++++++
 arch/x86/events/intel/uncore_snbep.c     |  4 +-
 6 files changed, 166 insertions(+), 22 deletions(-)

-- 
2.38.1

