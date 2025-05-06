Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF371917D0;
	Tue,  6 May 2025 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549337; cv=none; b=MDjqTSEXOjDdfEm+d+DSgfzwKbvkEtODsGxQ8ieuvr1wF1JHBf9kFYig1XKwYYXT/V4AqZquXbXWg0SBZMSg45ErrRQFETfoCDKtxxxfbfBZOO8+uypO3gu9enyksPDQMMpANkCmWAe2XKluMPPnm8a4sHNHggrEGrY7OZ0lLTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549337; c=relaxed/simple;
	bh=v6Itnp1G5LphqWttVBNTnAaNLzUOuYnCneRQuBD8SoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=achm3b5VQ/2rbYhe7F08hrZ3aIyT0TZqEUkHpnSShbEiT+IHZGwO6LL0Va8GDi/xyUzSPWZI9t1yAPy9QnTM+3jcdH6/KHNvsepFuZ2ZMMPdIbEOla7WSBlCydKaEsFq/FhtV9mkfMRn7/bxBzVXydyQ1XOwe1egT/azTtylO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ln2+NDnR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ln2+NDnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746549336; x=1778085336;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v6Itnp1G5LphqWttVBNTnAaNLzUOuYnCneRQuBD8SoM=;
  b=Ln2+NDnR/aibpFf4NM++kFYM+n/euM4vx3BhTZfjP057cqP030Ku0X6c
   fNbUYkl4h1TOKBfC8FgUxereot5PfS7kbVKOZbVyloU59+fJ4lZtvcgF4
   awTVx1S8mcRHtSlCcw/aHvPs4Sde3G33fkc6xZi571ukICpbC5dTVyJ3w
   RRqVk4RUBP1YPA4PCP5hom4cYRcr2orVQH0j+rnXFMGKwtHhXoi6Gs4pI
   UI7oVzDBmtzyPEi/Geu4L71DxiDqw2CZlmZFeOrJwNEdA/B3qAyF0nRYE
   drZirWLW4AE+ak8uL9G9gX7sRG+PrBchWT8G6vT5Za5mxVo7cuHjN2hJE
   A==;
X-CSE-ConnectionGUID: 6SV1GmflRPqXRW5icj3kQQ==
X-CSE-MsgGUID: sQB9xLyFTq22rW2qs7mpZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70736089"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="70736089"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:35:35 -0700
X-CSE-ConnectionGUID: tXM5XiClT6q/bBXNFEXQ3A==
X-CSE-MsgGUID: /2H47fQfTPOGe0I8IUa51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136636279"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 06 May 2025 09:35:35 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 0/3] platform/x86: ISST: SST PP and TF revision 2
Date: Tue,  6 May 2025 09:35:28 -0700
Message-ID: <20250506163531.1061185-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SST PP and TF revison 2 support.

Changes:
- Minor change related to variable name and change to define
- Add additional patch to update minor rev

Srinivas Pandruvada (3):
  platform/x86: ISST: Support SST-TF revision 2
  platform/x86: ISST: Support SST-PP revision 2
  platform/x86: ISST: Update minor version

 .../intel/speed_select_if/isst_tpmi_core.c    | 103 +++++++++++++++++-
 include/uapi/linux/isst_if.h                  |  26 +++++
 2 files changed, 127 insertions(+), 2 deletions(-)

-- 
2.49.0

