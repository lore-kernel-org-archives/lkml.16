Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3F21D5A9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572260; cv=none; b=inG0uve72+mOoDgWwXVzhb7FOQlZ5Trhle9m2Sb8H245URM+24vcSK0Z9IoESGVoQLbK9HjsW1VXikkuFJ1VMdCTyjTYCedbcQQpCmjVPSo1TRMayXnDVq2po3z4m7Gpij4EirJxgRT2ZQzFdOraEOLMTrezuWhzKAJNHpV4LF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572260; c=relaxed/simple;
	bh=QktQjePJmdQh76RmXkFHAPBbgd+38gmYsixWYkuxDjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fk0LlWVwaOqafzAa3EJ5QtRtJy6tQqUWI3UCEcYGxpeY7vgzhmqsXhEU0omn7EWWJ/Fivl6Z4L6lfnF5YLc0B2vTC1xo4pDYnB4fN+BNUGQ1oRr70xHuQmjMvrHLePA6K78tgphhLdBgydeR4cRCYF1KwRYfOk9jO/gONY9QwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bL8O0lSg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bL8O0lSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746572259; x=1778108259;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=QktQjePJmdQh76RmXkFHAPBbgd+38gmYsixWYkuxDjM=;
  b=bL8O0lSgSWUxzTv6czoCg5ZvlsDICrSSjpnq3h6jKWFv2Pe3JrqdtgjT
   GY/+topCvlnho4UUyrWqBeFYrNBHyJpp3/KZBrUm6JhtWX1I/u1lmkHg9
   sgLAbGYAiSQDTJwCsADCtWJ7oEN97NhCcH5CaDjBMMohxhEJo/ORENq1Q
   cbFxJS3/qAHFlzK+AmA4nQb6+4u8fp4WrQM4TBK+9MdhGS3MTrzCU+9aV
   1O4UAizrO1nroEJZClnaKHu3RsRiZiL2+nDke6JeaIwBBL5z9ck9D096y
   IT8cex4KcVN16a0DHYO5Hs7e1i8QRu3jr3DyeSfRsOO7YpjJkarRD27x7
   A==;
X-CSE-ConnectionGUID: QgJp7mh/Sau5wrvR5rRicg==
X-CSE-MsgGUID: 86BLV7NHSuigROKylBuK2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35898337"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="35898337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:38 -0700
X-CSE-ConnectionGUID: Rs4agT2JTgiDcC1VdWNcuQ==
X-CSE-MsgGUID: Ax+Z+WKJRrG4DiffEsM1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135477005"
Received: from sjdobek-mobl3.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.114.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:36 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Tue, 06 May 2025 17:57:10 -0500
Subject: [PATCH v6 4/7] x86/tdx: tdx_mcall_get_report0: Return -EBUSY on
 TDCALL_OPERAND_BUSY error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-tdx-rtmr-v6-4-ac6ff5e9d58a@intel.com>
References: <20250506-tdx-rtmr-v6-0-ac6ff5e9d58a@intel.com>
In-Reply-To: <20250506-tdx-rtmr-v6-0-ac6ff5e9d58a@intel.com>
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
X-Mailer: b4 0.14.2

Return `-EBUSY` from tdx_mcall_get_report0() when `TDG.MR.REPORT` returns
`TDCALL_OPERAND_BUSY`. This enables the caller to retry obtaining a
TDREPORT later if another VCPU is extending an RTMR concurrently.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/coco/tdx/tdx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 0b6804d2a5e14d3ccbee5d19ad8ae6674527fb2f..7b2833705d475a8c0c0e8393685f923c5fd58945 100644
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

