Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07B13790B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748568386; cv=none; b=jIoXz9fyBvfQRvweh3Ng+4yRLId3P4oUUacVnHHZbfH5qxMbFUqoyt7T9gAGII5QmAM6seyZ4/p6p04dTv9+/gU1XN0tMxfLM4dimE5Rc5wJWntWwKvJx4ZxWoLa4Xl8PEZir76C2Fo1iNunTWXko7kxJGP7/QJm7gY5QsaP4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748568386; c=relaxed/simple;
	bh=Jx05D79xtEOaIc+U4Eu6BvQbH/flRDZEX3KCcj+bovU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mU9sYeYYBgnvzIW1JbHRA9ix7yx5mzPaHCMfh7JYuyWgn+7MK2wiINfPF4jhFT4s/LA7fuFPGQiOo+pIRbYJy1OLON2iTq2Sx2p9bYfOYCSo+yPzFR3Ym/Lvv4AWkNZcaJme7uCWNTguMfDEzohhdilXSPgFV/fzBu9Ju253Pd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRM/iCR+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRM/iCR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748568383; x=1780104383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jx05D79xtEOaIc+U4Eu6BvQbH/flRDZEX3KCcj+bovU=;
  b=TRM/iCR+Tqpr134pRYZS9xPbd7i7X5SUQ8EzlZNrRj6vToJ7j/rnIHcJ
   wVgo3B0gRrsPwsf1+bqupyyYOX66bCOXaFfGx5QKMvKXVNUIeR4KWT4a+
   piR0EqSL18ULmEZY0ntvglqxx8STlSHBmh/lFADSwA1LPyvIbyT/gZWMV
   G1yErkCE0Ff4QuCWrUNjc0mft1inU5AVvrm7N2Oz9IpfsWwD6ihJdz2Z1
   4Vb9n3vk5rCvskZZZBTs4JS9Hh3CiO3aNo0jPtQiWBr6aafqPcxWJPno4
   6Lpl+QwRCkg4AtXoE+EmOnvweV7fFXoXuAuJeKAiiuqDjos24W3wlPPqt
   Q==;
X-CSE-ConnectionGUID: V0ghbuQlTGGWLiGmwTZPsg==
X-CSE-MsgGUID: P8/NMt9xQdyZ6kySWl71nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49771739"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="49771739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 18:26:23 -0700
X-CSE-ConnectionGUID: 1tWwaJ+URkGiQntpI5yPoQ==
X-CSE-MsgGUID: K86HI9IbR8mUvDjGWmd8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="144712302"
Received: from ww-dev.sh.intel.com ([10.239.48.95])
  by fmviesa009.fm.intel.com with ESMTP; 29 May 2025 18:26:21 -0700
From: Wei Wang <wei.w.wang@intel.com>
To: baolu.lu@linux.intel.com,
	kevin.tian@intel.com,
	yi.l.liu@intel.com,
	dwmw2@infradead.org,
	jroedel@suse.de,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Wei Wang <wei.w.wang@intel.com>
Subject: [PATCH v1] iommu/vt-d: Remove dead code in intel_iommu_domain_alloc_paging_flags()
Date: Fri, 30 May 2025 17:13:25 +0800
Message-ID: <20250530091325.694456-1-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dirty_tracking is enabled, first_stage is set to false to use the
second stage translation table. dmar_domain->use_first_level, which is
assigned from first_page, is guaranteed to be false when the execution
reaches the location of the code to be removed by this patch. So the
handling for dmar_domain->use_first_level being true there will never
be executed.

Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 drivers/iommu/intel/iommu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index cb0b993bebb4..1145567c60f9 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3418,13 +3418,8 @@ intel_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 		spin_lock_init(&dmar_domain->s1_lock);
 	}
 
-	if (dirty_tracking) {
-		if (dmar_domain->use_first_level) {
-			iommu_domain_free(domain);
-			return ERR_PTR(-EOPNOTSUPP);
-		}
+	if (dirty_tracking)
 		domain->dirty_ops = &intel_dirty_ops;
-	}
 
 	return domain;
 }

base-commit: e0797d3b91de75b6c95b4a0e0649ebd4aac1d9d1
-- 
2.43.0

