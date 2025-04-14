Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88948202C34
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667695; cv=none; b=eNSXh4J4KKV4EBQymujlpcd+w2QUAqJvCODNmzl83/335c22O2qTEkLFEq4k4BjFqOx7NnqXNcX8HrivHodPSBSZMfT0lNzOPyocled9isC/OVtjNXk0J9pudYpo1ehMuAQO3DB2DfhowgKWV3ucGyVfBJecMxnHcH2FoxuWR04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667695; c=relaxed/simple;
	bh=wcWUb4LEHMi+z65GmONMCHgkJDpHkk2hFLXwtJ4q1R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myzLSrbCDjx4XYykxlxI1ur/3idgqzhUoIASXIHxSNV3Pkek4kgZvb+6F03w2soVxGGyYlPLSDKS5rEtGeQzL6kq0SHzEydRsWI5BJafhXI8dH4iqqR2lOfJhkR1ph9wGHriGGrltfFPvg1nyk1NZDl8XZS03Ny7eLM3j6J7Z1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vd9IAA4h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vd9IAA4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744667693; x=1776203693;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wcWUb4LEHMi+z65GmONMCHgkJDpHkk2hFLXwtJ4q1R4=;
  b=Vd9IAA4hWadPmg/LeE+ZqPEgTICzw8edSaf6FnCdJvptN0xYP4PPkozB
   TLZh/0hO59pL4i+qQyqm5d+rjJ0AE0JqLr4efA9kNY1SytDTI08TdzsZo
   StR705I2ArLt/B5ooocOio+GennxOLnotgx2+vQKzDlU3YgUllTWYfc0t
   4OohHnq8BwYmzE6eSXcMuSX+kFuzkh6NzF0iFqXwG+GjmbPqL9o2gjrxK
   dkQKfOxhibzMYy1UyJUfIdPOkf/p2y8pcEysvvYXLWcilD+U1nR+JAxLD
   fMJuhXRCd7z21oT+fhB0jzshpqExP9teive2emzXZP9sQWs0RhW8iI+x2
   w==;
X-CSE-ConnectionGUID: 5QyNfDOzTzqmvvPNbFMLIA==
X-CSE-MsgGUID: ys6geaalSRKAkZ8V/oi2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="71544375"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="71544375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:54:52 -0700
X-CSE-ConnectionGUID: +C2r4XhJQJiICrdomcxVGQ==
X-CSE-MsgGUID: nqbFPfPGSkmUgocOGnQ4gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130474168"
Received: from hasmith-mobl1.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.115.71])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:54:51 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Mon, 14 Apr 2025 16:54:22 -0500
Subject: [PATCH v4 4/5] x86/tdx: tdx_mcall_get_report0: Return -EBUSY on
 TDCALL_OPERAND_BUSY error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-tdx-rtmr-v4-4-7edfa8d98716@intel.com>
References: <20250414-tdx-rtmr-v4-0-7edfa8d98716@intel.com>
In-Reply-To: <20250414-tdx-rtmr-v4-0-7edfa8d98716@intel.com>
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

