Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCB4220F57
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572265; cv=none; b=Hev8tnvnKxYB43iPdmvC3KrTQwh1JHWT11ScFYt3FsmRRP7ZC8ZtFjND8UWOP6mpUbHMG/o9Ts25slCzgPKuMvJ9L6JdaTgc+xX9H0+jyuVUJDsz5b+Kdr+NC2cByswyR25iIV+nYg2CupBjkcLhzr5QhN7Xa1BwwFSvs5Jga8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572265; c=relaxed/simple;
	bh=kgYIpqC3kdhwbgazXvdMTlmn17dcW7g0J3sZ3oezZQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGf32ttlKkUnJjFfqxFIVHqLtvCCKmztlsLNGJCnqmYJ/VwU0NXJLrX99wmhqRw+7mD8B5OIj/ghexPJO7C4aMJHSO55xOD74ssYPJp/HC5zn3ijoW8lcy8KUbvFKmVsZnAfztq8bPZnuKDd0Mafd1uiwuzzh3EkwQ/My7nBAd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5hi+O0O; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5hi+O0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746572262; x=1778108262;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=kgYIpqC3kdhwbgazXvdMTlmn17dcW7g0J3sZ3oezZQo=;
  b=j5hi+O0OfVxxsXJSGTDMQuI3yCNAJGWMl5QymY1nE/kSQ8EVxWTSorWm
   mDPNv8Nps8/nrI0y5/xgT7YGeVhFyB/hMWa0Hpy+8x6u72fDWqFJ+9eAM
   hSX1vmfPTyNjRQ02TIM90ctZoDy1EMUJyYsP/sTArzToWTnA84t20qgUe
   rNKuy1sTX3UYJmP7uXFvfjz0ZsDrhG+3OKtDgSEaTrdowhtaoqH0svJYP
   H3kOwTlpJC+7bGPBFd5B9O01SNKk24rOPh1Z9RgHNXHW/KE2O1Aeu8ce8
   mn0BFy376CE6fBtrF6rIrTdjazseU5nEr5L4zdaDX+h9kdMfoXhBoavR7
   g==;
X-CSE-ConnectionGUID: 07mi7bqGTiCk87YKWm7D/Q==
X-CSE-MsgGUID: tKYG+sbITj+J7Cz2cByIfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35898364"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="35898364"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:42 -0700
X-CSE-ConnectionGUID: 6al7VJIJRYizL5QBgE7LSg==
X-CSE-MsgGUID: VNUn4wcWSNOrQOkQSYFZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135477019"
Received: from sjdobek-mobl3.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.114.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:40 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Tue, 06 May 2025 17:57:12 -0500
Subject: [PATCH v6 6/7] virt: tdx-guest: Refactor and streamline TDREPORT
 generation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-tdx-rtmr-v6-6-ac6ff5e9d58a@intel.com>
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

Consolidate instances (code segments) of TDREPORT generation to improve
readability and maintainability, by refactoring each instance into invoking
a unified subroutine throughout the TDX guest driver. Implement proper
locking around TDG.MR.REPORT and TDG.MR.RTMR.EXTEND to avoid race inside
the TDX module. Preallocate TDREPORT buffer to reduce overhead in
subsequent TDREPORT generation.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 63 ++++-----------------------------
 1 file changed, 7 insertions(+), 56 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 452520ad1b32341405cae63a9cea02fdf8baf9b9..e94fed82839e767cb803cafb3f69fec7a7de6364 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -202,37 +202,8 @@ static u32 getquote_timeout = 30;
 
 static long tdx_get_report0(struct tdx_report_req __user *req)
 {
-	u8 *reportdata, *tdreport;
-	long ret;
-
-	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
-	if (!reportdata)
-		return -ENOMEM;
-
-	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
-	if (!tdreport) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN)) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
-	ret = tdx_mcall_get_report0(reportdata, tdreport);
-	if (ret)
-		goto out;
-
-	if (copy_to_user(req->tdreport, tdreport, TDX_REPORT_LEN))
-		ret = -EFAULT;
-
-out:
-	kfree(reportdata);
-	kfree(tdreport);
-
-	return ret;
+	return tdx_do_report(USER_SOCKPTR(req->reportdata),
+			     USER_SOCKPTR(req->tdreport));
 }
 
 static void free_quote_buf(void *buf)
@@ -293,7 +264,7 @@ static int wait_for_quote_completion(struct tdx_quote_buf *quote_buf, u32 timeou
 
 static int tdx_report_new(struct tsm_report *report, void *data)
 {
-	u8 *buf, *reportdata = NULL, *tdreport = NULL;
+	u8 *buf;
 	struct tdx_quote_buf *quote_buf = quote_data;
 	struct tsm_desc *desc = &report->desc;
 	int ret;
@@ -318,34 +289,16 @@ static int tdx_report_new(struct tsm_report *report, void *data)
 		goto done;
 	}
 
-	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
-	if (!reportdata) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
-	if (!tdreport) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	memcpy(reportdata, desc->inblob, desc->inblob_len);
-
-	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
-	ret = tdx_mcall_get_report0(reportdata, tdreport);
-	if (ret) {
-		pr_err("GetReport call failed\n");
-		goto done;
-	}
-
 	memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
 
 	/* Update Quote buffer header */
 	quote_buf->version = GET_QUOTE_CMD_VER;
 	quote_buf->in_len = TDX_REPORT_LEN;
 
-	memcpy(quote_buf->data, tdreport, TDX_REPORT_LEN);
+	ret = tdx_do_report(KERNEL_SOCKPTR(desc->inblob),
+			    KERNEL_SOCKPTR(quote_buf->data));
+	if (ret)
+		goto done;
 
 	err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
 	if (err) {
@@ -375,8 +328,6 @@ static int tdx_report_new(struct tsm_report *report, void *data)
 	 */
 done:
 	mutex_unlock(&quote_lock);
-	kfree(reportdata);
-	kfree(tdreport);
 
 	return ret;
 }

-- 
2.43.0

