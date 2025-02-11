Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A626726216C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299863; cv=none; b=dtA60lzkCBgwRsiWsydH7y02ba0530KLuCqM7tRS/G1IQD4oasAv33Bc34Mj9y27HCd15AqRmC0K8o7yTu9ilaNhZOigiIiIao7O9AAc8psaHSfwOQ2tfkJKkParVxhKfpfB3WJlwH9NantD5pcgLqdD++btzS7GV4+8cZuxc1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299863; c=relaxed/simple;
	bh=KvD64n1sCC3nFjL1QK3wFnW07eGqIY53VAtDy0ce238=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulwkD8Gq6V/kbsCaBa2RwlEg5mtNP0bg99lhB6TjMFagKqMO+gXNfdy9LAKY6sEahFSgUX1gQkgxA8J3GAhfslEZMOBIFxctGTkiGD/RCwYJabqNESjBbHLc/Pd2bjIiObHOzt5SxeQ+O9ltuttg2WVDxcpsGn+cwJLhzzxT2Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaNAMWFz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaNAMWFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299862; x=1770835862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KvD64n1sCC3nFjL1QK3wFnW07eGqIY53VAtDy0ce238=;
  b=QaNAMWFzFRNxUeqTrwgOvDcOYNcVWYjKwatvlxvsG2Qd5t83zzzIfGNb
   LgGhjeo5qdV8eziu2zJVevTT0deHblEnv+MfEfF9g9B8h86vj2GWUYICg
   l/HJrcssDsE3Y4Xz732I7OIF9H2OA4RBiV2iZLSDG8FwqEVRuC6JONwKj
   jlzU5UD6m+MLJjUNhZVE2z30XdJitwmRjaAF7F72kwE9csewOxQq4YMkG
   24xla9/1WJBD/PWHtwIetdWwuB2aCA3dBDy4G5Su/DNp4gacjSGJvGUA4
   gBWRtbs+P6xR03IePIcQJwtNXgLp3BfQ3mu7W/FOV1LbGAIHqI5J/Mdq2
   Q==;
X-CSE-ConnectionGUID: CEpHIdlqQnil7ZYYt97VoA==
X-CSE-MsgGUID: FObv3pTJTBO0OL5nWfdpoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57345449"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57345449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:51:01 -0800
X-CSE-ConnectionGUID: 0UMHnJgpSd2kL1Zj3cm1yQ==
X-CSE-MsgGUID: zDbJiAQLTpWPvK3LYHkQSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149780241"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 10:51:00 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@kernel.org
Subject: [PATCH 4/5] intel_th: pci: Add Panther Lake-H support
Date: Tue, 11 Feb 2025 20:50:16 +0200
Message-ID: <20250211185017.1759193-5-alexander.shishkin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250211185017.1759193-1-alexander.shishkin@linux.intel.com>
References: <20250211185017.1759193-1-alexander.shishkin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Trace Hub in Panther Lake-H.

Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: stable@kernel.org
---
 drivers/hwtracing/intel_th/pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 3e03ee788bb9..004e68286fd4 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -339,6 +339,11 @@ static const struct pci_device_id intel_th_pci_id_table[] = {
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x7724),
 		.driver_data = (kernel_ulong_t)&intel_th_2x,
 	},
+	{
+		/* Panther Lake-H */
+		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xe324),
+		.driver_data = (kernel_ulong_t)&intel_th_2x,
+	},
 	{
 		/* Alder Lake CPU */
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x466f),
-- 
2.47.2

