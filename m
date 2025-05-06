Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA7221285
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572266; cv=none; b=R/AZ2R2m8p46QxHcGMludqgxSEQ4SJ+K8nEdyH2yNNY7qui5rkIH6gQJEs7Ysja14HbE6NzimovHElNblUW1BVh7/UZwcR2TkPDj5zkciEyTJNsECyPSf89j+O/Kn436Uo6h0WPGKvUuS3fAMuj0zHJ1ce2iFW1+mtlIEtWOcpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572266; c=relaxed/simple;
	bh=CFTTTB/Sfth5Tc8ufiUW6cjlXNWo2V9l0fswDLjLn1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaVK1czXZS21cYuOQyNFOqPGItznhO9slx3BAKzxqyU3B5/mRozYdoF6dhuByyB1VLYZwRFVWE3a+qWhmaZgFBpOQm+iVpkbwjP5hzWtpJkU1TO7nA14qeyPn/1X3GMpIl+iU6msbY83AW58nCRYQ33pZiht95tmyV6lXnjUIw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXbYLpX/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXbYLpX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746572264; x=1778108264;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=CFTTTB/Sfth5Tc8ufiUW6cjlXNWo2V9l0fswDLjLn1I=;
  b=kXbYLpX/OXsWqjoZ9/GeaezA1BBDoII1zIA8MCHWWCYDA5twOwGnGpsf
   1iFLM9UxNPAbXv2lWqk8Zli8a9WH1RJmREKagzHg6EgFDX8w2oKJZ9qCr
   1TQfdrTlyimOhcZyCJ6KRkYZSWnaBURTO2oM/Xib2xn7gFvbpbBpIPtN1
   NzlFUI9C5HgM5EX3WpVaJ9Sp5th6btcm22bEVJfBpnD+HTzKbghR56mqT
   mDyEsOKfvNlDoDHggMe4aqGJsI+cEKnIlladj1euvL6pOKoo90pLV72ul
   M144Zv14F5EgvH2J42zZaLg01PzUTgaSmHQo8dlSQFbGOvPWUJX/L+p2d
   A==;
X-CSE-ConnectionGUID: d8qu78ciS8Kue+XJnPGo1w==
X-CSE-MsgGUID: 7/Q8CMXbS52SDdomFg7rSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35898375"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="35898375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:43 -0700
X-CSE-ConnectionGUID: JxRXEfVPTuSHZls4ntFqAg==
X-CSE-MsgGUID: RYUkEmPgR82076rZpGZyuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135477030"
Received: from sjdobek-mobl3.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.114.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:42 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Tue, 06 May 2025 17:57:13 -0500
Subject: [PATCH v6 7/7] virt: tdx-guest: Transition to scoped_cond_guard
 for mutex operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-tdx-rtmr-v6-7-ac6ff5e9d58a@intel.com>
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

Replace mutex_lock_interruptible()/mutex_unlock() with scoped_cond_guard to
enhance code readability and maintainability.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 39 ++++++++++++++-------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index e94fed82839e767cb803cafb3f69fec7a7de6364..5d74f652b8bd16835f06e8f27c986c5c5747e1b0 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -262,7 +262,7 @@ static int wait_for_quote_completion(struct tdx_quote_buf *quote_buf, u32 timeou
 	return (i == timeout) ? -ETIMEDOUT : 0;
 }
 
-static int tdx_report_new(struct tsm_report *report, void *data)
+static int tdx_report_new_locked(struct tsm_report *report, void *data)
 {
 	u8 *buf;
 	struct tdx_quote_buf *quote_buf = quote_data;
@@ -270,24 +270,16 @@ static int tdx_report_new(struct tsm_report *report, void *data)
 	int ret;
 	u64 err;
 
-	/* TODO: switch to guard(mutex_intr) */
-	if (mutex_lock_interruptible(&quote_lock))
-		return -EINTR;
-
 	/*
 	 * If the previous request is timedout or interrupted, and the
 	 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
 	 * VMM), don't permit any new request.
 	 */
-	if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
-		ret = -EBUSY;
-		goto done;
-	}
+	if (quote_buf->status == GET_QUOTE_IN_FLIGHT)
+		return -EBUSY;
 
-	if (desc->inblob_len != TDX_REPORTDATA_LEN) {
-		ret = -EINVAL;
-		goto done;
-	}
+	if (desc->inblob_len != TDX_REPORTDATA_LEN)
+		return -EINVAL;
 
 	memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
 
@@ -298,26 +290,23 @@ static int tdx_report_new(struct tsm_report *report, void *data)
 	ret = tdx_do_report(KERNEL_SOCKPTR(desc->inblob),
 			    KERNEL_SOCKPTR(quote_buf->data));
 	if (ret)
-		goto done;
+		return ret;
 
 	err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
 	if (err) {
 		pr_err("GetQuote hypercall failed, status:%llx\n", err);
-		ret = -EIO;
-		goto done;
+		return -EIO;
 	}
 
 	ret = wait_for_quote_completion(quote_buf, getquote_timeout);
 	if (ret) {
 		pr_err("GetQuote request timedout\n");
-		goto done;
+		return ret;
 	}
 
 	buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
-	if (!buf) {
-		ret = -ENOMEM;
-		goto done;
-	}
+	if (!buf)
+		return -ENOMEM;
 
 	report->outblob = buf;
 	report->outblob_len = quote_buf->out_len;
@@ -326,12 +315,16 @@ static int tdx_report_new(struct tsm_report *report, void *data)
 	 * TODO: parse the PEM-formatted cert chain out of the quote buffer when
 	 * provided
 	 */
-done:
-	mutex_unlock(&quote_lock);
 
 	return ret;
 }
 
+static int tdx_report_new(struct tsm_report *report, void *data)
+{
+	scoped_cond_guard(mutex_intr, return -EINTR, &quote_lock)
+		return tdx_report_new_locked(report, data);
+}
+
 static bool tdx_report_attr_visible(int n)
 {
 	switch (n) {

-- 
2.43.0

