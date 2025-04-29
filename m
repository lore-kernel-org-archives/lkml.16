Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0165B29DB7E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917081; cv=none; b=Cx2DRqsbO5YY06MCe5W6/sbufvTYiUgzZ/CrWO9f5Nao664gvt/w3ROUQ+LwBRc/uHzqgFRv/Zb5NlBRgP72P3HMlBWaan4wJTwIMHhkBfdiqf+5BJfldGHwVbzIO5CTu0DqoJ0Mbe1MhUCGuriB47CCz/F7NKFCbBuPraUX8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917081; c=relaxed/simple;
	bh=XZ7JYuhvD6ePls1dpFIbgKEYUhz15NUdlYgRpodk1vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzAmOxAhXZ35FyKLp4BgQZk3G1q5eCloEhGxgyCO1Jnb9BOxGnTA6MrKXW/fqP/4FB7EYfC/zYHhba1rsKDpImBuUrn62gzJkfAEqfeNDoVNQ2I/zKfW13WpwR7blKyswRgzFhlOmRZjSvaI7XQ/li2ynh1nr7EB8kZ9EJcWakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVma3bfx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVma3bfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745917079; x=1777453079;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XZ7JYuhvD6ePls1dpFIbgKEYUhz15NUdlYgRpodk1vY=;
  b=EVma3bfxcU8suxE+rCNisSaXFIWZU9o4DSjGwg5/QuNRpaYQaQThWJR3
   4Q9kSKSwNxAfOA7s7kcTYNUdSF1H3BXmovCl8vd7j/R5iMyAyQxv2ymn8
   aZy96cVNPvWkPbd17kVosXA454+Xd3N6w2iPrfk50lhOrLY2WlWEU7gbW
   +f2DxdNFoIoxbDMDK5sa1sV2RCH1KcQIvdL3UKAqU0GPafNIi0cx6Av2S
   8xhjoBlKxUrtNqfBIvPtrDVHJZ3PHs9zGFkr/YDY2wpvFiuvV5duzwbQ4
   NbCzvLa5pnoUsF84rlwZBXqzZ0oU3xctPgJ4+sjwT+CnSARP7ASMtN0YS
   Q==;
X-CSE-ConnectionGUID: HOyeBCqjTMOseG2DblOo3g==
X-CSE-MsgGUID: dZ8wxwl2RIK31PW7UybUqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72907642"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="72907642"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:57:58 -0700
X-CSE-ConnectionGUID: nAEbRkOvT/iLlXFgVaaneg==
X-CSE-MsgGUID: T8W9ExEhSj6Os6Uan4KV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="164865189"
Received: from unknown (HELO CannotLeaveINTEL.bj.intel.com) ([10.238.153.146])
  by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2025 01:57:56 -0700
From: Jun Miao <jun.miao@intel.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	jun.miao@intel.com,
	fan.du@intel.com
Subject: [PATCH] swiotlb: add a SWIOTLB_ANY flag to lift restricted low memory for encryption
Date: Tue, 29 Apr 2025 12:53:30 -0400
Message-ID: <20250429165330.2644155-1-jun.miao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDX guest wants to allocate a swiotlb buffer that is not restricted
to low memory for the trusted hypervisor scheme. So that allow to pick
a location everywhere for hypervisors with guest memory encryption in
swiotlb_memblock_alloc() interface by adding a new flag.

Signed-off-by: Jun Miao <jun.miao@intel.com>
---
 arch/x86/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 6267363e0189..73b9320c4a7d 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -61,7 +61,7 @@ static void __init pci_swiotlb_detect(void)
 	 */
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		x86_swiotlb_enable = true;
-		x86_swiotlb_flags |= SWIOTLB_FORCE;
+		x86_swiotlb_flags |= SWIOTLB_ANY | SWIOTLB_FORCE;
 	}
 }
 #else
-- 
2.43.0

