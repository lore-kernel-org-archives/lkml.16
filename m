Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260A1F0E50
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270340; cv=none; b=D+NFRklHm+w73nNbWhCHbUxQS/D/JIJZ2gXVr+fBNVkk7DwFrgJBYP1s7QVjVkvb0IhyOr0RQqfYCJl1GJw43+jDoAk2uhTnccS5E2W2e452FuuDFyPDZVMvkj0864Nf4U/bgLMWXSJ5Eotl48YoyedXksbpESBJWIz4kWWJHNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270340; c=relaxed/simple;
	bh=V2SvI6xhIEoKeMffSEBKpelQmtnkLgViLFFADvupy1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rY4GTxn2P6LOTUyNo7lR+iMA/Gw27aCc7z3x1/G5mLxqGpCeYQM6McIMyaZvHqlU6QpjmciWlNOp8hLZWt83bzpPGpTBRFeOVjIR9AWv5l79WGLiOwcghgEd7EzsN4MsxaZv808bd4jZjuC9TZYnfZOPZzQ8Vjjh/Sas1IGtLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMaV3OLW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMaV3OLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744270338; x=1775806338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V2SvI6xhIEoKeMffSEBKpelQmtnkLgViLFFADvupy1k=;
  b=bMaV3OLW941/k+XFiC8AFFTtx9xy0Onx5xcvIdQQ1EjBYJgwE1Ee8Lyo
   yVRqMdWbHkxuGdZ6dLMJQ5BZ9mXntnHvJm3wMb0n8f20Md/3FwazoycYB
   xL9RZoYi+fYGSz1/V1QiGAEj1ek2xvJChNHnPRa9flmiPCmm6znCPh+xO
   h+KaElbGxK6YMG+WSSPtj/EERDWHUqpgmQ9SXumqWteC29ueFaD2M6n8c
   0nax7svlYK+uXLiPFBDS0w6Nhhgx9COtoa6lfXRijPCrHJXHiZhKpS2kM
   9j2kxSFb4fdbxXY0e1xUWwNOkggeywE2rwUwKlUqipyIUBbOBFNBHeUt5
   A==;
X-CSE-ConnectionGUID: slykmzLqSv+UA4ZrQ8sIUQ==
X-CSE-MsgGUID: 3m89Gaz2TA2Ds7e8eRwzvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="48478800"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48478800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:32:17 -0700
X-CSE-ConnectionGUID: y963QcPkQO6xmwJ9liRhGQ==
X-CSE-MsgGUID: DBB294ZGSCOpU/eYd3cwHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129166467"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2025 00:32:15 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Sean Christopherson <seanjc@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] [PULL REQUEST] iommu/vt-d: Fixes for v6.15-rc2
Date: Thu, 10 Apr 2025 15:32:45 +0800
Message-ID: <20250410073247.1454287-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joerg,

The following fixes have been queued for v6.15-rc2:

- Fix posted MSI issue when users change cpu affinity
- Remove invalid set_dma_ops() call in the iommu driver

They have been reviewed and are ready for merge. Can you please take
them?

Best regards,
baolu

Petr Tesarik (1):
  iommu/vt-d: Remove an unnecessary call set_dma_ops()

Sean Christopherson (1):
  iommu/vt-d: Wire up irq_ack() to irq_move_irq() for posted MSIs

 drivers/iommu/intel/iommu.c         |  1 -
 drivers/iommu/intel/irq_remapping.c | 29 +++++++++++++++--------------
 2 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.43.0

