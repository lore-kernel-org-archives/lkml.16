Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D48B29D0D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744946171; cv=none; b=u8tXxJxwzVAeEYv9dgAI+RibE7G27bMQMzuIxSoM6951eVmZDh6+xN6ia1S1nSg/a3/vmoVb4EvJMPlNbBzMft1d9VclbFcv/GbUNHb3lwQo7PxOl9Q6iJGoglaBe8hoIN2AqBRwjfNtHJ/1YLp8dRSCHfB5DeipJMN9T+uYjSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744946171; c=relaxed/simple;
	bh=uorGrXOER5uz0Fdk/6/uzEQLryQBUc55065VLpWEkNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iO6gVUiKxkJGd9bRsqixSekzd9D3vytE6G5Ml1GEdnxUoXeZhGDDfSjAKom2rr6V54rReTdhjuuTXjwGVzOO+i18nBZLJxTf839owVqnwN83VcYQedcsfBqcb6WKSB50bsg+ftVX9YVj/XM1Gvs7e0bNme/fclr402JjQCMF1nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUplm39h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUplm39h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744946170; x=1776482170;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uorGrXOER5uz0Fdk/6/uzEQLryQBUc55065VLpWEkNM=;
  b=hUplm39hXq/YmdIEZ2pQojsjpf2wJnW/i16zlXzawgkVAr6Wy2YjfIOI
   FZOhkLkyaBRsQkdclJI9rYg6cP+rh3Idew7r1heRaDXXEdzipe9AbNMmM
   X3N/A4R0Kt3udwQjv2oGpKoxibmh/9BFSD/VK5umi3mdR4PDU1Ll9HSRU
   MyRS+fWlFpRIu/zJ5lBhLAzUSjJ80tWYrpjkVw3Ij0UNfzVyV/+fn+BqQ
   4i+OCxbT3Frfy91+65bp1etPhOvbwESfLDXn30muDw0XtuSc2/KizuypY
   94ajl5n0v19myTIVvYQI9Kmhgsu+KUFA7rdeJTFVhO2hanLdLzsUgJHO3
   g==;
X-CSE-ConnectionGUID: rZRu6FjATzOP+TO48FVoLg==
X-CSE-MsgGUID: 8OTNDfeMQVKP4GzLKQ0YRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="34188972"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="34188972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 20:16:10 -0700
X-CSE-ConnectionGUID: h1DnVM9ZS1CWLDuBwDijeA==
X-CSE-MsgGUID: WLQB05UASOyfK1YpLBysDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="130994563"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2025 20:16:08 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Mingcong Bai <jeffbai@aosc.io>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] [PULL REQUEST] iommu/vt-d: Fixes for v6.15-rc3
Date: Fri, 18 Apr 2025 11:16:41 +0800
Message-ID: <20250418031642.1810175-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joerg,

The following fix is queued for v6.15-rc3:

- Apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)

It has been reviewed and is ready for merge. Can you please take it?

Best regards,
baolu

Mingcong Bai (1):
  iommu/vt-d: Apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)

 drivers/iommu/intel/iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0

