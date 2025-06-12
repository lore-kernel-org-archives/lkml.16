Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7418D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749697681; cv=none; b=U+wTa7XFFHHtipG5M5DbKqzCd1qqvtC3G5ZnmqXIoryZlwRPCbQMvmLkxPXLt4ZfOMQsZ6eeFejS1bLtQx3vzWDmjlnAfFO4rg38ittzq1VPwvJroPLwmUL1XvuAh+v0kVB5GqERbXy7y9EVTUSNy9X7HNK5/hv+Uq3o09Sl49Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749697681; c=relaxed/simple;
	bh=eco8uOA0x3rr85SY0bNw+tMBe8pl2ac67aigG/NP+5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaloS8LxcSzJ1VKP0jtQRmhaWW7n1PQU/bOtxvdBpC7nCGmGruR5CYMT7VFnM0w98Wsckoi5tXT7B+vp7PbeOKb7ivTDtSvRFWnvvbkTsGlmoBJrBKZFzO72l0n4r5ahyyjfRsH32MRUMKVZCm1081JFnW57RT8enVXgF71mntU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCOnfJ+W; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCOnfJ+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749697679; x=1781233679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eco8uOA0x3rr85SY0bNw+tMBe8pl2ac67aigG/NP+5A=;
  b=oCOnfJ+WH98NF6aVbgvpWzc6L+Ll+iZ2BO8RuTJQ06bqswLwFfXKbXgT
   yCUk5zpc+2PuQcUwLUxnQZauctU2w0fsf3Ne/nlrn7O/SBJT9PqqBMOpb
   04QOu4p0g99eXA+RzkVRdBAV3oYihJ5fLypSzz1eK/WpJjrLBidboyXkU
   fP1PbuDXDrEKWY4o+MEqR8GcifG95TNcRGSTooAw7psmC26Bs3EI4vKqk
   PkgANwpSKUJNLjFU6R8j3wxg67ClFvt8mn+0UV+nxnn3z4ie8+HPoYMOi
   b/TaKvIQLMM+huL/DR2KU/1A3GfxKwpPgUPka5x4U0IhqXl3q69KxVfvY
   g==;
X-CSE-ConnectionGUID: SeTUluYETuetWWmbUcsgIA==
X-CSE-MsgGUID: 3nr8o/8lSM6D6Z58Z2PjOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51738041"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51738041"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 20:07:59 -0700
X-CSE-ConnectionGUID: S4ioN1vLTrOEI7XeKgyi/g==
X-CSE-MsgGUID: n65m45VVSb681SK9vWuwng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147743721"
Received: from linux-pnp-server-17.sh.intel.com ([10.239.166.49])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jun 2025 20:07:57 -0700
From: Pan Deng <pan.deng@intel.com>
To: peterz@infradead.org,
	mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	tianyou.li@intel.com,
	tim.c.chen@linux.intel.com,
	pan.deng@intel.com
Subject: [PATCH] sched/rt: optimize cpupri_vec layout
Date: Thu, 12 Jun 2025 11:11:48 +0800
Message-ID: <20250612031148.455046-1-pan.deng@intel.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running a multi-instance ffmpeg transcoding workload which uses rt
thread in a high core count system, cpupri_vec->count contends with the
reading of mask in the same cache line in function cpupri_find_fitness
and cpupri_set.
This change separates each count and mask into different cache lines by
cache aligned attribute to avoid the false sharing.
Tested in a 2 sockets, 240 physical core 480 logical core machine, running
60 ffmpeg transcoding instances. With the change, the kernel cycles% is
reduced from ~20% to ~12%, the fps metric is improved ~11%.
The side effect of this change is that struct cpupri size is increased
from 26 cache lines to 203 cache lines.

Signed-off-by: Pan Deng <pan.deng@intel.com>
Signed-off-by: Tianyou Li <tianyou.li@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/cpupri.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/cpupri.h b/kernel/sched/cpupri.h
index d6cba0020064..245b0fa626be 100644
--- a/kernel/sched/cpupri.h
+++ b/kernel/sched/cpupri.h
@@ -9,7 +9,7 @@
 
 struct cpupri_vec {
 	atomic_t		count;
-	cpumask_var_t		mask;
+	cpumask_var_t		mask	____cacheline_aligned;
 };
 
 struct cpupri {
-- 
2.43.5

