Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489B20E71D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728086; cv=none; b=nYe1DKpLIsHGTY221xvgCKN2kbnJXtVzjzyIn4Qn+TGl087hIgAorC7ntoUKtGx2qw65xqCFt/OqTdFylscAv9FnZWa5SrdwpcORmYAzdkTmLsX9fvJfAceChcAiXRDvMQ2uNLzSv3q8QtLsLvbjCZcBdd+krcaxL06ycfnTAzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728086; c=relaxed/simple;
	bh=LaiWjx3hTb6Th/EihTa9jdCHV/ntKJQvs/k+9SaZYS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/ZgP7/tsO8XBowp5FHR36MruqvvNuAlBTVEBgSy0KIpmphOlT+CGz3niifFOh6Sxs1xNvrb9NiFuYIzjOYAMmzd5gepq8PfoivZNqD3tXH/KHbaO8WpPn3mMl86c/D3OeRHHyEitGzydebvnM4OXYiQogAgg+IW5nhyrG2UGI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXnv5qwF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXnv5qwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747728086; x=1779264086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LaiWjx3hTb6Th/EihTa9jdCHV/ntKJQvs/k+9SaZYS0=;
  b=LXnv5qwFFom604p69SkIqQoZgbTdu1DQuwyYgYZySrX/NraiIgfF7FAb
   VaDPpdOMvWTz9PXEeGcNFySzjd0dWVoroT+C7JaMJ6HqLYX6SUYcxvRkJ
   U6YU/4fPsKWI0q6SaCQDMwjt9wpSWBIxeJIJgr//AkTMWJ+glR2z0qI8R
   53NP1mCAEiQgn6oAWyl6tRYXXDS5/B/MKlO7rdRq8Jos2GP2RmpIQ8tQS
   biDu4PkJXadaNkgFGEs6yv3v+ACUZGABcz6OZFs2Wz0yRCo3GHz/tL+L+
   iAusFLcANANPTg9WxWQJahfYNnwtZzlY1o9KyazThSMoH4emkmdyIdBma
   w==;
X-CSE-ConnectionGUID: ni9zivxxSpuGJ/z0KtBccg==
X-CSE-MsgGUID: m4hGNq68QRSTbfHNNKPdJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48763129"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48763129"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:01:25 -0700
X-CSE-ConnectionGUID: 3WPXLGIZSCKVdpqXnAqu8g==
X-CSE-MsgGUID: vhPPT1zvSS6kObQln6tdcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144474226"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2025 01:01:24 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1][PULL REQUEST] iommu/vt-d: Fixes for v6.16-rc1
Date: Tue, 20 May 2025 15:58:48 +0800
Message-ID: <20250520075849.755012-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joerg,

The following fix has been queued for the Intel iommu driver. It aims to
solve the following problem:

- Keyboard and touchpad stopped working on several Apple Macbooks

This fix is not so critical for v6.15-rc. Considering the upcoming merge
window, it would be fine to include them with other patches for v6.16.

Best regards,
baolu

Lu Baolu (1):
  iommu/vt-d: Restore context entry setup order for aliased devices

 drivers/iommu/intel/iommu.c  | 11 +++++++++++
 drivers/iommu/intel/iommu.h  |  1 +
 drivers/iommu/intel/nested.c |  4 ++--
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.43.0

