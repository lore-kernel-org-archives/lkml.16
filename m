Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA3263892
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299861; cv=none; b=gWjJkSdKKMg6PHrLX+LYjJV11jnQctziVkwysrb2Yvl0nUe0xyaxFXmjvgE+BOFl4Xv6ggyp3a7Y6CsE0LhSCIgCog9GC46NyV8mPNFKIO51TXKcg3nGNllrtNTLZnfGsFwCQRAv6IHnIVFE2AYUvmQ1EYiOo6Hdei/EjOcRqpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299861; c=relaxed/simple;
	bh=7CL+MEp0Nt48XLpKgKF8al4uWjd9luZuL5TQDyPKIQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvtE1nmn6Nkezn7vGy0+E9z8qe4OAdzEY2SwMFsKtQjxEDZWSpryq8h242MggEs1aqMV5TKJLsGc127qms+PvNF6MJKypJK9iFq8SMFvPwLEEzBGKGa6k9Rv8+5KvflU8yCdRimt4NkRwnUWfNBs48joLxhyovx28WcDWeQ2ACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvt4iKM1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvt4iKM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299860; x=1770835860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7CL+MEp0Nt48XLpKgKF8al4uWjd9luZuL5TQDyPKIQk=;
  b=gvt4iKM1fzOR3BkdsfIvieNf/QMC7mqUjkmODFnK6IL303WbZK++s5BO
   CkwQ/YMkp8bkWNA+dL5QeMf3Oq4/DHkG8jLVmwSJtheWavAgMVsPqgkig
   CSAQmBvcdeup5Tz/Cv51Ma9k3F/+/HsqRsRTOZbIxKA1NOMjMbYl0uNdV
   h67HLS+RrUdyRmHPlxS60M6XN8uJ3yOKE/UcHSjSRVYOQHQ8EUbjNg4dN
   16msfrCCi/xwUxztNSlsuK3cHqLEEZuF/HdCKAKRfmqqK6jF8wYcoFRi8
   ZEsOybJIY7YGvaAnTuwBIvkaZEPiqhObY8RhQcpJ46iyL30WJTvl8zOj1
   Q==;
X-CSE-ConnectionGUID: 9frqcepBQmahU5aff6faaQ==
X-CSE-MsgGUID: k4lYzuJPTECVelNf368SpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57345446"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57345446"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:50:59 -0800
X-CSE-ConnectionGUID: BXnr1PmgSqm4C3Ec0GG1Bw==
X-CSE-MsgGUID: +M35gbiZQsWQ/y8OUtL3HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149780240"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 10:50:57 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@kernel.org
Subject: [PATCH 3/5] intel_th: pci: Add Arrow Lake support
Date: Tue, 11 Feb 2025 20:50:15 +0200
Message-ID: <20250211185017.1759193-4-alexander.shishkin@linux.intel.com>
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

From: Pawel Chmielewski <pawel.chmielewski@intel.com>

Add support for the Trace Hub in Arrow Lake.

Signed-off-by: Pawel Chmielewski <pawel.chmielewski@intel.com>
Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: stable@kernel.org
---
 drivers/hwtracing/intel_th/pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index e9d8d28e055f..3e03ee788bb9 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -334,6 +334,11 @@ static const struct pci_device_id intel_th_pci_id_table[] = {
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa824),
 		.driver_data = (kernel_ulong_t)&intel_th_2x,
 	},
+	{
+		/* Arrow Lake */
+		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x7724),
+		.driver_data = (kernel_ulong_t)&intel_th_2x,
+	},
 	{
 		/* Alder Lake CPU */
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x466f),
-- 
2.47.2

