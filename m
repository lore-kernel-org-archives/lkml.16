Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7AC2638BB
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299865; cv=none; b=JZyUXD5GYf9ukDxBcC4nuLSw2paJfp1cp6gAnqVlM5sDS2suxhiL+66QTtjwsu0u4mimb85frjPHDdMFrsLkMkyRNxwbeljpdGHCFgYj9YqPLHZ+QOQ8616vi4gUyfKtSsozruOefKL46iEeti2RG2OVAHsYYOEeMuelCmLCHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299865; c=relaxed/simple;
	bh=S/uKl96K9qoenzfMbQD38+NxbSlQi83LrvWfBIho2/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7RgKjBRwuydnyafisCYAr7IfaRYEmeLBuZWrgh+7SwB6TVLwDawpBZlUKQLrd6yFo03rK1FP+kNgimqqdA+ebF5boWAQdGeB2LTGNfcsysJSVuPLenkZKxF24s/FDyoRjwVbKqSFZUtxkNAxAhbW3EtlIw7kObGJbeq0LbVQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQR5AP+/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQR5AP+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299864; x=1770835864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S/uKl96K9qoenzfMbQD38+NxbSlQi83LrvWfBIho2/s=;
  b=bQR5AP+/UXPmlbonPWgRCZUhsrcWG43FnNQ5dWIoigTNaheMBDs+9U3X
   ai1EYM6qsmiq6s71PRwKlWIjztn+ZIUU2v5PhyHpFw9HKsV9orPngR6E0
   L72NSjaq2TX45XyayZIdaPeALtoG//7A+YxwinabCiFoiNbT6n7Iwn4Nz
   ShxhIML0d92yPGH5c1KgK1Rg39MlMj2sUo5SUsIxTD3FRPJuogMHz3ENe
   WeIE3f8XTkGrD5cmY+ee7BwWftEsEbUfB+KfImhMg5d2u7lwsbI/zaRYa
   diW4qV3GSFSpWrX0AlmqVt8RPgwvRRisWaQVx6agvi8NOixPkyNd6WL5F
   g==;
X-CSE-ConnectionGUID: m92g1wRtQOWiY7whVywhOA==
X-CSE-MsgGUID: FzNiy1UMQmiN7QRC3U0puA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57345452"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57345452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:51:03 -0800
X-CSE-ConnectionGUID: qH4Ljx/QSqyjtKAwWPBcKQ==
X-CSE-MsgGUID: CwF1fRcRShmcWFrVUMlhDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149780249"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 10:51:02 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@kernel.org
Subject: [PATCH 5/5] intel_th: pci: Add Panther Lake-P/U support
Date: Tue, 11 Feb 2025 20:50:17 +0200
Message-ID: <20250211185017.1759193-6-alexander.shishkin@linux.intel.com>
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

Add support for the Trace Hub in Panther Lake-P/U.

Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: stable@kernel.org
---
 drivers/hwtracing/intel_th/pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 004e68286fd4..e3def163d5cf 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -344,6 +344,11 @@ static const struct pci_device_id intel_th_pci_id_table[] = {
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xe324),
 		.driver_data = (kernel_ulong_t)&intel_th_2x,
 	},
+	{
+		/* Panther Lake-P/U */
+		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xe424),
+		.driver_data = (kernel_ulong_t)&intel_th_2x,
+	},
 	{
 		/* Alder Lake CPU */
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x466f),
-- 
2.47.2

