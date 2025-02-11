Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054DA1805E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235306; cv=none; b=sWDy6PQtdYF6j7LqCn5PcmdQU4gQGOFzlz/noF7laf+pg29BKCzS8xRzZG8Twg07TFNmQhSEdl8Oo/0sCEiQYSIWMym3W8Rtn1uG9BLMGuSByRVoxFrJDqfhpLTv0keFTWYkSgn2HEhsoSsoON3yIZ7OYwStrCPo2VNbsFtB+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235306; c=relaxed/simple;
	bh=DVK1BM6fsgQdcrJqVs9z4/2JlTjuP1XLF668jqOTA2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hf4KeS0KypIS4/7g/ldybsgpTvQqh966/urMcx6skXVMvrzED4nqJHl3pIjRvsDLj4QO+AObUV2Rrq737LesiUMCFJew+o/a6GvC9mSZ3OCf2S3Ss74bWDxgTalTORdlHp6TP1zvmOEObfr1D7znhsMLs9UYIHVvgPWkYRNcpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmRPetxe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmRPetxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739235305; x=1770771305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DVK1BM6fsgQdcrJqVs9z4/2JlTjuP1XLF668jqOTA2c=;
  b=jmRPetxeTGiTEHbO6pJTALkqOaGFTp6SuiqtqtGx/3h1nQE0B1T6X0ku
   3niMIKXl9nbfc3c2qHp47GKj1n3ijNlReah/kJRQTLR2HPMttEXpk9Usk
   z2BMBJDwn0QpPblhYOsnE8NrET53kgOmxIckze45JAM1MyLaj78VE8kgF
   AYF7w/WOes6sIuPObrfRvVY2E2o4GyTNUd+Ik22DhoTaeKWR11ObSPVz1
   3gG3BWlIUhzLPdhb4TVKEiZh0TPDoKwdC4CYSpmSyQAYxWNLCRJvmbqaH
   LFDYhWuWEoeNQswIIDLUSB6xBBYZV0AmDxajYI8md3eiWh4QJAl9fHwJo
   A==;
X-CSE-ConnectionGUID: pBEtuiuXTqKPMMVN9PANpA==
X-CSE-MsgGUID: LUU9XtNWSKOf7ckp+P3apA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39756003"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39756003"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:55:05 -0800
X-CSE-ConnectionGUID: FobcnFARQG2swwv7OZQ6HA==
X-CSE-MsgGUID: 25lPm/0AR0OgfDN0Y1zmLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112186399"
Received: from allen-box.sh.intel.com ([10.239.159.52])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2025 16:55:03 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1][PULL REQUEST] iommu/vt-d: Fixes for v6.14-rc
Date: Tue, 11 Feb 2025 08:55:11 +0800
Message-ID: <20250211005512.985563-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joerg,

The following fix has been queued for v6.14-rc:

- Add a missed check in intel_iommu_drain_pasid_prq()

It has been reviewed and tested. Can you please consider it?

Best regards,
baolu

Lu Baolu (1):
  iommu/vt-d: Make intel_iommu_drain_pasid_prq() cover faults for RID

 drivers/iommu/intel/prq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0

