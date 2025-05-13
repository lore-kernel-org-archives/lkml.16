Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720D1E1DF8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747105624; cv=none; b=b7IDo9eNAlNw0JBbJt/uPYijfY6mqUz9hpbIzaItQtgLkoZcj7A7qahCJ1XTlJSmwvZ8O0XCwr+nb+hNFfv5Xir6RJSvxLDvUzvW59X6EVUi2zQ2nWWxsv9svNtz7Ep+qH1uitBmbfp7LYcg3GNROd7zV+D6MTgDnFsWCUFg09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747105624; c=relaxed/simple;
	bh=EUmHdfZjaaKJUwIOOwp6R5jgHJBD5ZDdpY/Sad1GGu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrgSRDx99F21SI+dnvZBQ5IjMJS8IwBexPT9xzrsBJDgnHx8900dsGb+Nv2BEEMYRp9U2UIGz56OouFqhUSBDn4pR5n89dyrDB7F+QOxitgl+pjxnxO2x+RVK8dDA+8y6deXeTGMihgqfJf75HKnpXDcv3P8FLD9PrXrLBxATTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuThjl8K; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuThjl8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747105622; x=1778641622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EUmHdfZjaaKJUwIOOwp6R5jgHJBD5ZDdpY/Sad1GGu0=;
  b=LuThjl8KpOWXwtk3fSs/T2R1X6267v4G+7LSdq59VZoWyxRw0WnOro+d
   +uIu1q/a9mVZ3ZWREI7S02neg1PDAvpxuTysGEK0AFhRV6lykD933+YuW
   OmR75drQFRo8Eb0xWzTYxAvSsP5GwQ617clpqJPxM7zez3M5wKt/k+UKU
   Jw9yoiPgBZ0kP/NRzKJTZ8LyhAYN9vHLuF1ZO12w9LExoCLYvyMHAJYC8
   8Eyt/5QZFn9jpxJlT5cZq6wH/wmhIiELgtmzoHWY79tyZzoe0MwfgnBOO
   agmONr9+B/8zSY1ik5L7x+eEGFbE6zSK4fggvorJhnLms4oWbGnV+R7ce
   A==;
X-CSE-ConnectionGUID: Rgx/9A+WTfWCEP2Mk9rQxQ==
X-CSE-MsgGUID: UhtHfKCFSiqhGp98pXGiGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52735284"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="52735284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 20:07:01 -0700
X-CSE-ConnectionGUID: M/0IBQ0gRXODSBlz2H35Lg==
X-CSE-MsgGUID: UNaDqK3bRbOLCbD8DKAYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138522221"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2025 20:07:00 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] iommu/vt-d: Eliminate pci_physfn() in dmar_find_matched_satc_unit()
Date: Tue, 13 May 2025 11:07:38 +0800
Message-ID: <20250513030739.2718555-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513030739.2718555-1-baolu.lu@linux.intel.com>
References: <20250513030739.2718555-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Wang <wei.w.wang@intel.com>

The function dmar_find_matched_satc_unit() contains a duplicate call to
pci_physfn(). This call is unnecessary as pci_physfn() has already been
invoked by the caller. Removing the redundant call simplifies the code
and improves efficiency a bit.

Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Link: https://lore.kernel.org/r/20250509140021.4029303-2-wei.w.wang@intel.com
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 8c405532ddbf..2258814ffc70 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2686,7 +2686,6 @@ static struct dmar_satc_unit *dmar_find_matched_satc_unit(struct pci_dev *dev)
 	struct device *tmp;
 	int i;
 
-	dev = pci_physfn(dev);
 	rcu_read_lock();
 
 	list_for_each_entry_rcu(satcu, &dmar_satc_units, list) {
-- 
2.43.0

