Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F309D200B9B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525584; cv=none; b=FKKgq1zzrtho+cxCiXKU+gmOfL5WIMHIWa0gxKsSQRSWHCh3rAfRy5LHnEwgDiD50s5w1+y4ZKS4aW49bpqBKb9CCLVMuHvsYghCDygdD8aokb6pYElI2iOhBFNBCqaPsAB17FCt6Z42JEihGHEuGe792Z8oBw8RdRqNG61xAHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525584; c=relaxed/simple;
	bh=wcWUb4LEHMi+z65GmONMCHgkJDpHkk2hFLXwtJ4q1R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOiKzluY8SkX7V44SKvs6c84+RpMaORPubD+zRFfHB+qCBdHFdX21nHtURuN1D+Wt/6frKlCI4aVy2JX73hO2pymjChDGjVSixjp4YC9GYZEgprw72ggjHtY/1g2/FDLVLG148JBxJ9m0FIpNc85L14UJrQeTamMIrppUCIuuZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYLP1iYs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYLP1iYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745525579; x=1777061579;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wcWUb4LEHMi+z65GmONMCHgkJDpHkk2hFLXwtJ4q1R4=;
  b=QYLP1iYsrdwZ9QXqWw7Yasc/12/EBPmg10wVcmioa/JpMxMCKMjkB1Aj
   40RgOHzVHj23nsKgGVkFOWyA4CRKgoKEsxCeEwyNTSu7Pm2gtUQS6me55
   5jzOAFjtQhywRQCfzJ+rbpPvjxp/jweYtT1chZ77ddAE0okTVHIU3XLY1
   jUbbGAm14qU+ldJI/5OCOq0zie/ZFkvlBtxV/nDp4wei6rwq/gb6JXRDk
   6UqepK7aEyKW4T1f/jYLBzqv+ixsGT4CD+XhkWtSR1wryQ2BimvIU/XEr
   c8cUM9gg1R8M5gQ3FUX6NNVIFG20o8P4LKbDo3UFAFYzaAq69d3dDc7si
   g==;
X-CSE-ConnectionGUID: YFupVUVaSfSvLBi3oPoPAg==
X-CSE-MsgGUID: 2mkic6UYTbeXsElbWxF5dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50986732"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="50986732"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:12:59 -0700
X-CSE-ConnectionGUID: 8qUKluR1QP6JGga2XFcwAg==
X-CSE-MsgGUID: ow7RcP5/S4uUZr9mVLdH7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="155945380"
Received: from ajatsiv-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.112.111])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:12:59 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Thu, 24 Apr 2025 15:12:28 -0500
Subject: [PATCH v5 4/5] x86/tdx: tdx_mcall_get_report0: Return -EBUSY on
 TDCALL_OPERAND_BUSY error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-tdx-rtmr-v5-4-4fe28ddf85d4@intel.com>
References: <20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com>
In-Reply-To: <20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, 
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 Dionna Amalie Glaze <dionnaglaze@google.com>, 
 Guorui Yu <guorui.yu@linux.alibaba.com>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Dan Middleton <dan.middleton@linux.intel.com>, 
 Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Cedric Xing <cedric.xing@intel.com>
X-Mailer: b4 0.13.0

Return `-EBUSY` from tdx_mcall_get_report0() when `TDG.MR.REPORT` returns
`TDCALL_OPERAND_BUSY`. This enables the caller to retry obtaining a
TDREPORT later if another VCPU is extending an RTMR concurrently.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 arch/x86/coco/tdx/tdx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 0b6804d2a5e1..7b2833705d47 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -110,12 +110,13 @@ static inline u64 tdg_vm_wr(u64 field, u64 value, u64 mask)
  *              REPORTDATA to be included into TDREPORT.
  * @tdreport: Address of the output buffer to store TDREPORT.
  *
- * Refer to section titled "TDG.MR.REPORT leaf" in the TDX Module
- * v1.0 specification for more information on TDG.MR.REPORT TDCALL.
+ * Refer to section titled "TDG.MR.REPORT leaf" in the TDX Module v1.0
+ * specification for more information on TDG.MR.REPORT TDCALL.
+ *
  * It is used in the TDX guest driver module to get the TDREPORT0.
  *
- * Return 0 on success, -EINVAL for invalid operands, or -EIO on
- * other TDCALL failures.
+ * Return 0 on success, -ENXIO for invalid operands, -EBUSY for busy operation,
+ * or -EIO on other TDCALL failures.
  */
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 {
@@ -129,7 +130,9 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 	ret = __tdcall(TDG_MR_REPORT, &args);
 	if (ret) {
 		if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
-			return -EINVAL;
+			return -ENXIO;
+		else if (TDCALL_RETURN_CODE(ret) == TDCALL_OPERAND_BUSY)
+			return -EBUSY;
 		return -EIO;
 	}
 

-- 
2.43.0

