Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640326A0DF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771138; cv=none; b=Ault3Bocs4w+KV0Q52x8jCQM2sZVfnqa2ciXG9sHETrixlVf3fTBe4WyZcRS2wliwUyx2tNs6VwSupZh/5B5hdvucFJoAN+D4B3Dx279bfr+brUx5nNcKibt3QWzAz2oYd+nKpwiQk2D8SvYwBdRmevA6ueLsPap96QyTC0kUoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771138; c=relaxed/simple;
	bh=lQmrVPsJMr30FmBtO2szLXBHQeEDUDOnmzNFoJYMLqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e78XJm3YbX5tAtl72H0RIDUKNKk00qpEg0EvCzWSI1ZsLPGdPmET5xEmPvu0OVcqD72xIr5vC10dQCFxLxbik6rZkxXyulJGaXHONU8Ehfwakno+nltt/BXTssve05bGbbYZKUIFByd09edec+Y0vuXWo2m4n98v7jvfX0HqSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frvyPnNB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frvyPnNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746771137; x=1778307137;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lQmrVPsJMr30FmBtO2szLXBHQeEDUDOnmzNFoJYMLqs=;
  b=frvyPnNBqU9ZWI9I90TasU5vyQ/TW5EvyDw/WhdGFIWanEkXx5l5RL1r
   jkbfLSfP+4Pq46gln1Ohzge2ZbaRJOjR1L/LiWfMgRtJIWF3y7wOG9ogv
   cmJdqJZnADM2ltZlwzSB57zwoj4ldiSYPIZLfJURO0qNqgGXi1WBXo+fa
   8pGhcJh+VY2p360q/DYA2jzW6xp6SyYpZWT2EOD9VgEf7AgFSj0ZzW2oI
   KiPQXrbnx4YCf38c8z7iIrOMizk7bDyahP6O0EeA0F+qqXzieR5PC4PeM
   i/Bkvbv+py2kFb8jg9DPi+RevoI2fngwqrmh03uGhVAE+UswCMEzpHahH
   Q==;
X-CSE-ConnectionGUID: 4UtdCE1ZRMS3uqV0wnpHZQ==
X-CSE-MsgGUID: 2eLNMYFbRBOv3eiZUtttng==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59927972"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59927972"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:12:16 -0700
X-CSE-ConnectionGUID: vXCcIy+3QfWf9t4AYmpCBA==
X-CSE-MsgGUID: DoPPaL3mTzix9NwDqNe/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136447508"
Received: from ww-dev.sh.intel.com ([10.239.48.95])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 23:12:14 -0700
From: Wei Wang <wei.w.wang@intel.com>
To: dwmw2@infradead.org,
	baolu.lu@linux.intel.com,
	kevin.tian@intel.com,
	yi.l.liu@intel.com,
	jroedel@suse.de,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Wei Wang <wei.w.wang@intel.com>
Subject: [PATCH v1 0/3] Improve ATS Support Check in IOMMU/VT-d
Date: Fri,  9 May 2025 22:00:18 +0800
Message-ID: <20250509140021.4029303-1-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset makes a few cleanups and fixes related to the check of ATS
support in iommu/vt-d. The first patch removes a duplicate call to
pci_physfn() in dmar_find_matched_satc_unit(). The second patch changes
dmar_ats_supported() to return boolean, aligning with the convention used
by other *_supported() functions. The third one addresses a corner case
where an integrated device, not recommended by the SATC structure, could
be incorrectly reported as "supported=true" by dmar_ats_supported().

Wei Wang (3):
  iommu/vt-d: Eliminate pci_physfn() in dmar_find_matched_satc_unit()
  iommu/vt-d: Change dmar_ats_supported() to return boolean
  iommu/vt-d: Fix ATS support check for integrated endpoints

 drivers/iommu/intel/iommu.c | 54 ++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 19 deletions(-)

-- 
2.43.0

