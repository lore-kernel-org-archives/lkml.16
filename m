Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F91D555
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545243; cv=none; b=OfwRMm9vruGcOPh3D6ncd+rAMk+HDmN//mZ0MM3YGcr17ifEugn0Ckb/hdW+l+P1SUjDZdjWN51wxVjHRU3FYxsuTk6NWnolR0vcDR47b+d65Zr0kN9/bqz1EBOMC9U5vw9f2ig2GvaY6RGd+8WGTNNPQ1Qoc4zuus87XGzbB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545243; c=relaxed/simple;
	bh=tjMRJn1sWssgIVQWvrgGyCSo8Ou42kA3Y8r8Url8yt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jKk7IV3TrvaS47cHfwmnod0WCKJEyAP2eJ9CSGWYzsLAZaCqdS05RVGbTEMmo9AyrtU9hZoNsANH+NAKdEB7hkKo86omD6m9kUmV6zRilTJtY2jyRFiSHbZwxPiC4HcDUncXas5CqkchbCZihTBjdxDzvY3wuTQShDobUa5bb0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHdmHA/q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHdmHA/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749545242; x=1781081242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tjMRJn1sWssgIVQWvrgGyCSo8Ou42kA3Y8r8Url8yt0=;
  b=bHdmHA/qpuxMmME+j0nM/9Er6gd/nlRkOqfj3gPdZmTb1iFu2nPRSVS/
   LFBrEdyEnxsNwr3cW1OV9eH6UuOTa+VshcWwGiS30T94NoDPUkAwlfjSZ
   o1s+/HyX74cx0qYLsqRj3MU/qy0VIaFh1uVyq+zKRhEamaZ7cSODVF4UO
   YPlAeCQhHIbxHw44kpP/nb01zdh7SBxVhNysKr+rn2E18r7a3zCCdEP/n
   4umSKsVVs+UgV6BRpddxz+eU4xlAbCcO8WDgaVp++Qf5PyrM1sfj4ztqN
   JeO0LioUjT8kz7Yad8UxxW8dY+49+G7uWMLBR4dBcmiT79fZ8778XnpSp
   w==;
X-CSE-ConnectionGUID: 1OM0oykaQfKOFz2jA7PZIw==
X-CSE-MsgGUID: ZdO6WA0WSTOA88T34VCuxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74178854"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="74178854"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:47:21 -0700
X-CSE-ConnectionGUID: V69+hN3PS/2YCXz22gHagw==
X-CSE-MsgGUID: rmRJ430EQQeTQeni5/qaxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147135116"
Received: from gklab-219-098.igk.intel.com ([10.211.219.98])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2025 01:47:17 -0700
From: michal.camacho.romero@linux.intel.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	mateusz.mowka@linux.intel.com,
	artem.fedko@intel.com,
	adamx.pawlicki@intel.com,
	Michal Camacho Romero <michal.camacho.romero@linux.intel.com>
Subject: [PATCH] x86: Change maintainers list for the Intel TXT project group
Date: Tue, 10 Jun 2025 10:46:24 +0200
Message-ID: <20250610084624.1225115-1-michal.camacho.romero@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Camacho Romero <michal.camacho.romero@linux.intel.com>

As the present INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT) group's maintainer
(Ning Sun) doesn't work currently on the TBOOT project's development, he was
replaced by the active TBOOT MLE project's developers, who will maintain
Intel TXT project group:

* Mateusz Mowka (mateusz.mowka@linux.intel.com)
* Michal Camacho Romero (michal.camacho.romero@linux.intel.com)

Signed-off-by: Michal Camacho Romero <michal.camacho.romero@linux.intel.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2668b81115c..9ba3bf8be8af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12506,7 +12506,8 @@ F:	drivers/hwtracing/intel_th/
 F:	include/linux/intel_th.h
 
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
-M:	Ning Sun <ning.sun@intel.com>
+M:	Michal Camacho Romero <michal.camacho.romero@linux.intel.com>
+M:	Mateusz Mowka <mateusz.mowka@linux.intel.com>
 L:	tboot-devel@lists.sourceforge.net
 S:	Supported
 W:	http://tboot.sourceforge.net
-- 
2.43.0

