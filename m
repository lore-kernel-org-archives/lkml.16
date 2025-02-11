Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726E14F6C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235308; cv=none; b=ua/7q39ySQvrKFdcYTgYmK4eUR2mWTFBaI5XMuPqnPRYhYf+q1PQ9atYeEBs5XnURrOjikAXouLzYwvCLpaiVI02XrS6vHoScsJCWabw1UeZWb0egyiLEv8EIbnUcyQK+FDyFZtE7lKe6Npcd2lmef+6bni48PlluZ0yv7I6dOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235308; c=relaxed/simple;
	bh=9UPE4gAjA3kdh0cfDkk/TDuCcO9wTQ/O5a49YqPV3V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFeHo8QMet/vk3lnwjskL6NG+mSMlRgVGY4/YF7BGwUz9QJV1oDyq7V67qkKvQJn/UItpgjwAIGlQk93qc1JDIArPeo2nrRsGnRZxrVR9LL/6VYnqLzihyqNXXQmTQVIVTub2mi7crGZX3jx/Bz0CY/Pvxdks7hPFCQgGy/7BKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbxU8AQK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbxU8AQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739235307; x=1770771307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9UPE4gAjA3kdh0cfDkk/TDuCcO9wTQ/O5a49YqPV3V4=;
  b=KbxU8AQKOPcbLzRlHV17QxGnVgaU4pqaKTDldBiF4UQFvFhNXvt5WBEG
   Z1BQbohOHK7PYo+W0VEiJh5KTzMh2kdeP0Jejtp2r8p8g2ksmcn4wytFE
   /vg/yK2mqW6hOiiWCf1B/nqTXr+8hRC7GORGJZjq+DqBlqFXLFpRspHnl
   Dwe5AucZY6bSeEWXhXgWEJcABQ5WyBJldJv6tIDODVjB2HJiza/glNVRm
   2TXtlugIVAAQfiLC7K4RGnkCNHZil9HE2Fy+tOy0H6mrZZ4Ne4BWHi3PL
   Q96bwpoOzyMeJ6IW/6gpnJDWlFQQbwWe7dWcPJU4gCY8tWW8L1R7VbY16
   A==;
X-CSE-ConnectionGUID: EJCDx45LQRKMlNsBw2LHdg==
X-CSE-MsgGUID: be6lpnNcSHOORnZdrHr7Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39756007"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39756007"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:55:05 -0800
X-CSE-ConnectionGUID: BnzoMNqASkG1Uvq77yJj7A==
X-CSE-MsgGUID: Y1PQ1Y+vQWurqnOvyHSnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112186405"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2025 16:55:04 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] iommu/vt-d: Make intel_iommu_drain_pasid_prq() cover faults for RID
Date: Tue, 11 Feb 2025 08:55:12 +0800
Message-ID: <20250211005512.985563-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211005512.985563-1-baolu.lu@linux.intel.com>
References: <20250211005512.985563-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver supports page faults on PCI RID since commit <9f831c16c69e>
("iommu/vt-d: Remove the pasid present check in prq_event_thread") by
allowing the reporting of page faults with the pasid_present field cleared
to the upper layer for further handling. The fundamental assumption here
is that the detach or replace operations act as a fence for page faults.
This implies that all pending page faults associated with a specific RID
or PASID are flushed when a domain is detached or replaced from a device
RID or PASID.

However, the intel_iommu_drain_pasid_prq() helper does not correctly
handle faults for RID. This leads to faults potentially remaining pending
in the iommu hardware queue even after the domain is detached, thereby
violating the aforementioned assumption.

Fix this issue by extending intel_iommu_drain_pasid_prq() to cover faults
for RID.

Fixes: 9f831c16c69e ("iommu/vt-d: Remove the pasid present check in prq_event_thread")
Cc: stable@vger.kernel.org
Suggested-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Link: https://lore.kernel.org/r/20250121023150.815972-1-baolu.lu@linux.intel.com
---
 drivers/iommu/intel/prq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/prq.c b/drivers/iommu/intel/prq.c
index c2d792db52c3..064194399b38 100644
--- a/drivers/iommu/intel/prq.c
+++ b/drivers/iommu/intel/prq.c
@@ -87,7 +87,9 @@ void intel_iommu_drain_pasid_prq(struct device *dev, u32 pasid)
 		struct page_req_dsc *req;
 
 		req = &iommu->prq[head / sizeof(*req)];
-		if (!req->pasid_present || req->pasid != pasid) {
+		if (req->rid != sid ||
+		    (req->pasid_present && pasid != req->pasid) ||
+		    (!req->pasid_present && pasid != IOMMU_NO_PASID)) {
 			head = (head + sizeof(*req)) & PRQ_RING_MASK;
 			continue;
 		}
-- 
2.43.0

