Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9312AF1C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747105620; cv=none; b=V7THkbPS+pfztC75iJqxQdDaA/HVdtWp/vC1TfiCiiLyaAADncQ1w3KwK8X0QYsmnWAzOvuI7nAcoNPtq+VQSHA7zlSB/IiaSNAwDBQEXLXePlMq5kJM8nskvo7FM/96QTe7BU3liLOjcUU8kYeZL8EKAASYFz1qisCK/eju3/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747105620; c=relaxed/simple;
	bh=7Sq8YaAZmVI9KNclbZEAVx+oOCp0RssOb8yh6fyMa1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+eet0I7tBNhpPTwl5fBeql0qyNfV4GYYI8MOKW7rpcwIh05U60lqNM1Hz48OBfD1ECfa5wtI/kDqp6+sTjdOtDDx8zyC6489LNdO3vMASUlLXWVxZeYlZ1/slRoqyjkYShdPggHXh62hBqShtwwBSQw9fImAL9m2QkX3Yp2+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4qKgyKE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4qKgyKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747105617; x=1778641617;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7Sq8YaAZmVI9KNclbZEAVx+oOCp0RssOb8yh6fyMa1g=;
  b=j4qKgyKElxue38uDjsljdOxMM1TlTl1eradEQihL9RFnsKTIifdb/hDL
   DHTMFGZ6c1gDIlezy9aRPBj0IgK7BVlUN+cDP/S8wcgjh5a7+ovoQBTZ4
   wBmiKYB58dhq/yFQGNKNyL1ZTubJLWmufToICSFUT86VzIHxxfO9Lc9BX
   tKucqfHKtuzm7uXY30XmwtXyQLsyXqcInE2cGtGrH66KD2D2Z5GbBESg5
   ESsNg2amJpAFqyscbPYhbcWH8MOFZeO7jYLWunkUB/YQGy4FjKf5igUkZ
   fASoL9/LSlFnSh+pELbdiBMOhJX91IFfN+JvyPiiBH7wnv5vFGeMp4+bt
   w==;
X-CSE-ConnectionGUID: QvNjekQJSTuUivouGcSj9A==
X-CSE-MsgGUID: Sl+YTeaPQYSc4uWQBrtqVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52735270"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="52735270"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 20:06:56 -0700
X-CSE-ConnectionGUID: IseoW6NdTYS/sPrNIPjUwA==
X-CSE-MsgGUID: AIbmauM9TOOcdbM3GNc0mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138522214"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2025 20:06:56 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] [PULL REQUEST] Intel IOMMU updates for v6.16
Date: Tue, 13 May 2025 11:07:34 +0800
Message-ID: <20250513030739.2718555-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joerg,

The following changes have been queued for v6.16-rc1. They are about new
features and code refactoring, including:

 - Restore WO permissions on second-level paging entries
 - Use ida to manage domain id
 - Miscellaneous cleanups

These patches are based on v6.15-rc6. Please consider them for the
iommu/vt-d branch.

Best regards,
baolu

Jason Gunthorpe (1):
  iommu/vt-d: Restore WO permissions on second-level paging entries

Lu Baolu (2):
  iommu/vt-d: Use ida to manage domain id
  iommu/vt-d: Replace spin_lock with mutex to protect domain ida

Wei Wang (2):
  iommu/vt-d: Eliminate pci_physfn() in dmar_find_matched_satc_unit()
  iommu/vt-d: Change dmar_ats_supported() to return boolean

 drivers/iommu/intel/dmar.c  |   4 ++
 drivers/iommu/intel/iommu.c | 113 ++++++++++--------------------------
 drivers/iommu/intel/iommu.h |  21 +++++--
 3 files changed, 51 insertions(+), 87 deletions(-)

-- 
2.43.0

