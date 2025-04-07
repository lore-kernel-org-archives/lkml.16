Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBD259C9A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052394; cv=none; b=R/+Z/RyO9n6eCoSFo4bKihmzBm+n5B6V1/wqhjH7bNkwPfVtIaubMuY4e2r0Zjga88lU2P4C60TFJk2heog0uHLi/Q9rkbykGldE/cZlpdnBg4GObEdps7cwDkOo/Aip8ddlH20oqxqifSMdZNc+rOhs4udYav9zjxfvpJQKWJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052394; c=relaxed/simple;
	bh=ZECpWZmFTOCCjMu8O11c5UTIMsPsE5gaR3qSnn5+IkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3gZICB2tvkD9Snt8gqNQftcLde80Dph7BbsBKxbdICxsDu89bivL+dJ3IrvUeYX79uxugenBK5yItBfpqska3tOLdxyYpAGmX8S83Di8qLfhaMHA5V6vLytR0haiZw9DteojOPW80+jbaloHeHYz2BVrmd/vdv5A09PPHkX9Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAsaW2ne; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAsaW2ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744052392; x=1775588392;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ZECpWZmFTOCCjMu8O11c5UTIMsPsE5gaR3qSnn5+IkY=;
  b=nAsaW2neIunEoIBupM3w0SMjvJU6/SUiExihxWCJrB3LW2bn/LFcS7c8
   nmNMSe2s+Hwou4+KS2sKWIB4bmX3bC9/TVra86tnxnBr3r6NUMvEapC5H
   qOnMiVfFagp7H580us9E1KXv13ADh8HTMkCOg+04ywkk1GjDw59Lhq8tm
   2x4ZmICcvaHLV25xmVBen6kL/GLrf2CWRv0ZYfPEs9rkxVkcU8EnPUh5w
   xdggD47Sp136O1LAt0rG7wZJVozqNNFYEa6vlThsxrFdkg0EJ6xYGuPK/
   UdE/xD9z0c1fXgHeNxhHWVOZLeJEtRPL5cwWI2fJkicdS0EWsvkloz4tl
   g==;
X-CSE-ConnectionGUID: e4WJKU7ySf+UsmIdsmpDYQ==
X-CSE-MsgGUID: AOyTGjiIQEy+e7FxZOOiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62999721"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62999721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:51 -0700
X-CSE-ConnectionGUID: R3VwNTcXSdqBHI0wWVzOwA==
X-CSE-MsgGUID: NfViTsiUTyGU8C4XtJIUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128899328"
Received: from trung68x-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.115.210])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:50 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Mon, 07 Apr 2025 13:59:31 -0500
Subject: [PATCH v3 4/5] x86/tdx: tdx_mcall_get_report0: Return -EBUSY on
 TDCALL_OPERAND_BUSY error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-tdx-rtmr-v3-4-54f17bc65228@intel.com>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
In-Reply-To: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
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
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: b4 0.13.0

Return `-EBUSY` from tdx_mcall_get_report0() when `TDG.MR.REPORT` returns
`TDCALL_OPERAND_BUSY`. This enables the caller to retry obtaining a
TDREPORT later if another VCPU is extending an RTMR concurrently.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 arch/x86/coco/tdx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index b042ca74bcd3..c94e0061fe53 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -114,8 +114,8 @@ static inline u64 tdg_vm_wr(u64 field, u64 value, u64 mask)
  * v1.0 specification for more information on TDG.MR.REPORT TDCALL.
  * It is used in the TDX guest driver module to get the TDREPORT0.
  *
- * Return 0 on success, -EINVAL for invalid operands, or -EIO on
- * other TDCALL failures.
+ * Return 0 on success, -EINVAL for invalid operands, -EBUSY for busy
+ * operation or -EIO on other TDCALL failures.
  */
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 {
@@ -130,6 +130,8 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 	if (ret) {
 		if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
 			return -EINVAL;
+		else if (TDCALL_RETURN_CODE(ret) == TDCALL_OPERAND_BUSY)
+			return -EBUSY;
 		return -EIO;
 	}
 

-- 
2.43.0

