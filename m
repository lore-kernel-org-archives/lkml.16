Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B195945948
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745377794; cv=none; b=Cj4UjzpASh1MasekaFv3nCKJ6Xvz5ZBdGJz8bySgyrRgRi+t3rpqFup6ESHuttYNhjP1Xh/t0/qXQzbYlqv0JddyAGLgxpo1GjVwmQeQChh0So/w1ht/mbe6Xl2aRDYcXFpVNIxUEPF+WOnoAMrPb/oULrGeN0Z0AjDzL6KCrlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745377794; c=relaxed/simple;
	bh=+bobhXJWy4M7WcoZFS6BHPfG6IDFULlMrkxEId7YGRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfBNHEInNzE3B7sr3f0fHVxwCo3nVp8pF4mjH0O2diWp/xQmiFqTaUgf/U0HzsibvqYb0zTtxdcm1EkIwkmRO1MGcSpofI1q28sCjpE2KdkfD4oIfiNHBspJr2jhSDk2ed/fHwQNUcGOP++IUObDYCZDBCwnTkoruAB0msFKl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoN9jzmC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoN9jzmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745377791; x=1776913791;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+bobhXJWy4M7WcoZFS6BHPfG6IDFULlMrkxEId7YGRE=;
  b=UoN9jzmCqZPWkVaP2yj/TeKmETS7ugM6WSzVu17rSAaA18YQ41xzEvzt
   onicKiq7r0D7fUF5+2Uc/a/KSipBoA+LXmE8ihdQ3f1T19fcxgjCuyPlY
   rVBgSCsbtVS9LXJPS1B/rFE2xmeP1hL6DySOgpmqlibROveEkp83dCvw3
   q+xI90WLiWlN3JGuL0he6umXKGX5eO9BrHP400BuAeTU2lEJd2jLuSPPq
   qd6Mk1C2bSwKfyMwDVxwOLZ12hKhGJksuT5CP+0uiepyyNbdHdXDSXqJp
   UUgwqICcB6bwsLE2FWyfqitT54/ztRuqnjtnkt9R+jTIW1uahgFUYf6Zo
   w==;
X-CSE-ConnectionGUID: FN7Q8Uy2TyyBOKtsxcv2/g==
X-CSE-MsgGUID: R6uEfFM+Seml0b6vyl9hCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57145930"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="57145930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 20:09:51 -0700
X-CSE-ConnectionGUID: vAPBAFEpTx+WNLLjhagOdA==
X-CSE-MsgGUID: J8N37Cn3RgKBGhQudSW08w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="155398692"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2025 20:09:49 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 0/3] iommu/vt-d: Use ida for domain ID management
Date: Wed, 23 Apr 2025 11:10:17 +0800
Message-ID: <20250423031020.2189546-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This converts the Intel iommu driver's domain ID management from a
fixed-size bitmap to the dynamic ida allocator. This improves memory
efficiency by only allocating resources for the domain IDs actually in
use, rather than the maximum possible number.

The also includes necessary cleanups after the ida conversion, including
locking adjustment for the ida and code simplification.

Please review and comment.

Lu Baolu (3):
  iommu/vt-d: Use ida to manage domain id
  iommu/vt-d: Replace spin_lock with mutex to protect domain ida
  iommu/vt-d: Simplify domain_attach_iommu()

 drivers/iommu/intel/dmar.c  |   3 +
 drivers/iommu/intel/iommu.c | 113 ++++++++----------------------------
 drivers/iommu/intel/iommu.h |  20 +++++--
 3 files changed, 44 insertions(+), 92 deletions(-)

-- 
2.43.0

