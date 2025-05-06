Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2442797BF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530729; cv=none; b=q71IrVVv6sZ/eBUACirPADrdAQCLchFQWDRd1vDdsD8wZ0uqenp3lWmuUr3fjjTShEYhnWDxVGacFwINIJ9dHoXdCDyB+83DonSvICGTs23ot5IL1YSiKiwYCAZ/drmDB9DmPjjtf/z5XeNabCzOjKmOboeMpRCiy9SZ+SzCzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530729; c=relaxed/simple;
	bh=OG+DaHpQoABz0yaUf2njJpjVIeCOKuXCgAfRG+0+XS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m1RMzBkNlm7/U5dT2VSBlhrRMEfIRyMFv36Ux9YVpSpf4+lEMSEOV3A3Q+fOIrl82ISp+UfAiS4sZ9XQR0GOO2zOzZT9qMuMXMqx6VWPHWLKbG6d526H1LuvkD/mw0wPhf0Csrb4ypCvzcOdW2udh8PtzRNAgM2eDYaIo1TbTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9CSTMWH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9CSTMWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746530728; x=1778066728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OG+DaHpQoABz0yaUf2njJpjVIeCOKuXCgAfRG+0+XS0=;
  b=W9CSTMWH0gqlvvvi07p+jNKJEvAd69lYJ++l6o1KPkB/Sfc21mTjRybc
   Q7kHNNHegzi7rwclukCI4PPoiJyyfK517p8KSR89P0JttjRLK0MCyNdlq
   wzjcrYTwCBnWU5lS+TOmYSjT3cirw93EOz+UWkoYzhw2IyNUUhZQWimlu
   7hA3DlxiilJSdqeRubjnrjskQ7JnvME8AODbMdvydJa6r3IvpsYv2NnR1
   YkoIzsXyiPZ+02m5MupRNVVTFj+x71QoiSbdpaQ7owBLIhijvEGq0YSZ9
   7e89Xjbv4x0AygVKBaIodtZwdiSKbyHTFCfLWanU06g8Ny9sQya+enOV6
   A==;
X-CSE-ConnectionGUID: ZqnHoJaVTYyez7UUp4dYlQ==
X-CSE-MsgGUID: nB6iLaEjTcWhOZ2UXj1w+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48064212"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48064212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:25:27 -0700
X-CSE-ConnectionGUID: adgt7VNMTQmDY74H/cnhtw==
X-CSE-MsgGUID: W8joM+VkRwWBuL4JJHWryw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="166639746"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2025 04:25:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 44DC2199; Tue, 06 May 2025 14:25:21 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: akpm@linux-foundation.org,
	vbabka@suse.cz,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	bp@alien8.de,
	tglx@linutronix.de,
	david@redhat.com
Cc: ast@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 0/2] mm/page_alloc: Fix couple of unaccepted memory issues
Date: Tue,  6 May 2025 14:25:07 +0300
Message-ID: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix issues with unaccepted memory:

  - try_alloc_pages() gives up too early on machines with unaccepted
    memory;
  - race around zones_with_unaccepted_pages static branch;

Kirill A. Shutemov (2):
  mm/page_alloc: Ensure try_alloc_pages() plays well with unaccepted
    memory
  mm/page_alloc: Fix race condition in unaccepted memory handling

 mm/internal.h   |  1 -
 mm/mm_init.c    |  1 -
 mm/page_alloc.c | 73 ++++++++++---------------------------------------
 3 files changed, 14 insertions(+), 61 deletions(-)

-- 
2.47.2

