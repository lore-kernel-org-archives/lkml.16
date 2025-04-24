Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D9E1F4CBE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525584; cv=none; b=tlvBswECBoutWND4wI3CW3ibxLZ1yYHuWJp+LGKjZ4qTsw5U8qed0rwUJZcv8/Zr9ykse4fIjHbfiw6cPgvbeBuJlf6WQ7wG+6s3jG/LNIIIyksgVBMdiU4y3UAp3hUeWfCsMoBMbBOrXcTv4gRBJy0ZMT1Z9HMLw0ZH45SLAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525584; c=relaxed/simple;
	bh=CzslO/qJdYHI3PGng48OqW/c8FJSQM2QKEdpsLBTVRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILxE+7JU/5vQIGQcHpNw9v0rCkL9LYDVtanuAkwtCtxph00Eek/CqB+QzEQdCW1jqB/p2BCQYVYH9EiVtz4J5dZkqnhJwZhwkHExEw0Zk0FrqLa1SKmsQ/Au2EEf/wDM7cS4wPDpeZDKmMSNQMWq7dgF9UhP4zcB+ffwMPFc33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihq0Af3/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihq0Af3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745525580; x=1777061580;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=CzslO/qJdYHI3PGng48OqW/c8FJSQM2QKEdpsLBTVRI=;
  b=ihq0Af3/48Enobf7CtvrvKSjhLeC6LmTWsU7yBAbxqXlrOVUTQYwQIOj
   OVLvQPG88iIShFbUPCrDDUHBO3Xfq10Jt0OiVf37YL4kxyuD1GN9wD4Nt
   pHzeE7fY0t2pbcm4YWDMrB5LXL75HqdLLLpCPxOsThEhmSyTj9tLWRyzZ
   x1nivGovKQjk48MO38T5WT+WX+irKnzi1c4kdCV6Fq3ji2E+j520x1s4b
   UMPLUHrRb4NTGZyvH9eAniy18jvyH4YMEHWGHO3v9/+xYp/hSL1NDp/F9
   HwuB7GJ6M1iXrA4KonCNOkAXFq1244M2g9TzaoDzRhvpYwwcy6VVUyckw
   Q==;
X-CSE-ConnectionGUID: o8XEDZGJQ+O/6QgV+WU3tA==
X-CSE-MsgGUID: v1yMeDMPTeClI3dS4+5cAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50986745"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="50986745"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:13:00 -0700
X-CSE-ConnectionGUID: ue/hGjiBRyKOK3hLdD1rgw==
X-CSE-MsgGUID: hV+x9LtMTMGyHo2V952vNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="155945387"
Received: from ajatsiv-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.112.111])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:13:01 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Thu, 24 Apr 2025 15:12:29 -0500
Subject: [PATCH v5 5/5] virt: tdx-guest: Expose TDX MRs as sysfs attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-tdx-rtmr-v5-5-4fe28ddf85d4@intel.com>
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

Expose the most commonly used TDX MRs (Measurement Registers) as sysfs
attributes. Use the ioctl() interface of /dev/tdx_guest to request a full
TDREPORT for access to other TD measurements.

Directory structure of TDX MRs inside a TDVM is as follows:

/sys/class/misc/tdx_guest
└── mr
    ├── mrconfigid
    ├── mrowner
    ├── mrownerconfig
    ├── mrtd:sha384
    ├── rtmr0:sha384
    ├── rtmr1:sha384
    ├── rtmr2:sha384
    └── rtmr3:sha384

Read the file/attribute to retrieve the current value of an MR. Write to
the file/attribute (if writable) to extend the corresponding RTMR. Refer to
Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest for more
information.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 .../testing/sysfs-devices-virtual-misc-tdx_guest   |  60 +++++
 MAINTAINERS                                        |   1 +
 drivers/virt/coco/tdx-guest/Kconfig                |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c            | 291 +++++++++++++--------
 4 files changed, 250 insertions(+), 103 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
new file mode 100644
index 000000000000..fb7b27ae0b74
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
@@ -0,0 +1,60 @@
+What:		/sys/devices/virtual/misc/tdx_guest/mr/MRNAME[:HASH]
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		Value of a TDX measurement register (MR). MRNAME and HASH above
+		are placeholders. The optional suffix :HASH is used for MRs
+		that have associated hash algorithms. See below for a complete
+		list of TDX MRs exposed via sysfs. Refer to Intel TDX Module
+		ABI Specification for the definition of TDREPORT and the full
+		list of TDX measurements.
+
+		Intel TDX Module ABI Specification can be found at:
+		https://www.intel.com/content/www/us/en/developer/tools/trust-domain-extensions/documentation.html#architecture
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrconfigid
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MRCONFIGID - 48-byte immutable storage typically used for
+		software-defined ID for non-owner-defined configuration of the
+		guest TD – e.g., run-time or OS configuration.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrowner
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MROWNER - 48-byte immutable storage typically used for
+		software-defined ID for the guest TD’s owner.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrownerconfig
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MROWNERCONFIG - 48-byte immutable storage typically used
+		for software-defined ID for owner-defined configuration of the
+		guest TD – e.g., specific to the workload rather than the
+		run-time or OS.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrtd:sha384
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MRTD - Measurement of the initial contents of the TD.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/rtmr[0123]:sha384
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RW) RTMR[0123] - 4 Run-Time extendable Measurement Registers.
+		Read from any of these returns the current value of the
+		corresponding RTMR. Write extends the written buffer to the
+		RTMR. All writes must start at offset 0 and be 48 bytes in
+		size. Partial writes will result in EINVAL returned by the
+		write() syscall.
diff --git a/MAINTAINERS b/MAINTAINERS
index fd5bbf78ec8b..3afbf6c310a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26284,6 +26284,7 @@ L:	x86@kernel.org
 L:	linux-coco@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
+F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
 F:	arch/x86/boot/compressed/tdx*
 F:	arch/x86/coco/tdx/
 F:	arch/x86/include/asm/shared/tdx.h
diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
index 22dd59e19431..dbbdc14383b1 100644
--- a/drivers/virt/coco/tdx-guest/Kconfig
+++ b/drivers/virt/coco/tdx-guest/Kconfig
@@ -2,6 +2,7 @@ config TDX_GUEST_DRIVER
 	tristate "TDX Guest driver"
 	depends on INTEL_TDX_GUEST
 	select TSM_REPORTS
+	select TSM_MEASUREMENTS
 	help
 	  The driver provides userspace interface to communicate with
 	  the TDX module to request the TDX guest details like attestation
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 224e7dde9cde..e76810d89e0b 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2022 Intel Corporation
  */
 
+#define pr_fmt(fmt)			KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
@@ -15,8 +17,9 @@
 #include <linux/set_memory.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/sockptr.h>
 #include <linux/tsm.h>
-#include <linux/sizes.h>
+#include <linux/tsm-mr.h>
 
 #include <uapi/linux/tdx-guest.h>
 
@@ -66,39 +69,144 @@ static DEFINE_MUTEX(quote_lock);
  */
 static u32 getquote_timeout = 30;
 
-static long tdx_get_report0(struct tdx_report_req __user *req)
+/* Buffers for TDREPORT and RTMR extension */
+static u8 *tdx_report_buf, *tdx_extend_buf;
+
+/* Lock to serialize TDG.MR.REPORT & TDG.MR.RTMR.EXTEND requests */
+static DEFINE_MUTEX(mr_lock);
+
+/* TDREPORT fields */
+enum {
+	TDREPORT_reportdata = 128,
+	TDREPORT_tee_tcb_info = 256,
+	TDREPORT_tdinfo = TDREPORT_tee_tcb_info + 256,
+	TDREPORT_attributes = TDREPORT_tdinfo,
+	TDREPORT_xfam = TDREPORT_attributes + sizeof(u64),
+	TDREPORT_mrtd = TDREPORT_xfam + sizeof(u64),
+	TDREPORT_mrconfigid = TDREPORT_mrtd + SHA384_DIGEST_SIZE,
+	TDREPORT_mrowner = TDREPORT_mrconfigid + SHA384_DIGEST_SIZE,
+	TDREPORT_mrownerconfig = TDREPORT_mrowner + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr0 = TDREPORT_mrownerconfig + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr1 = TDREPORT_rtmr0 + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr2 = TDREPORT_rtmr1 + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr3 = TDREPORT_rtmr2 + SHA384_DIGEST_SIZE,
+	TDREPORT_servtd_hash = TDREPORT_rtmr3 + SHA384_DIGEST_SIZE,
+};
+
+static inline int tdx_mr_report_locked(sockptr_t data, sockptr_t tdreport)
 {
-	u8 *reportdata, *tdreport;
-	long ret;
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
+		u8 *p = tdx_report_buf + TDREPORT_reportdata;
+		int ret;
 
-	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
-	if (!reportdata)
-		return -ENOMEM;
+		if (!sockptr_is_null(data) &&
+		    copy_from_sockptr(p, data, TDX_REPORTDATA_LEN))
+			return -EFAULT;
 
-	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
-	if (!tdreport) {
-		ret = -ENOMEM;
-		goto out;
+		ret = tdx_mcall_get_report0(p, tdx_report_buf);
+		if (WARN(ret, "tdx_mcall_get_report0() failed: %d", ret))
+			return ret;
+
+		if (!sockptr_is_null(tdreport) &&
+		    copy_to_sockptr(tdreport, tdx_report_buf, TDX_REPORT_LEN))
+			return -EFAULT;
 	}
+	return 0;
+}
 
-	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN)) {
-		ret = -EFAULT;
-		goto out;
+static inline int tdx_mr_extend_locked(ptrdiff_t mr_ind, const u8 *data)
+{
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
+		int ret;
+
+		memcpy(tdx_extend_buf, data, SHA384_DIGEST_SIZE);
+
+		ret = tdx_mcall_extend_rtmr(mr_ind, tdx_extend_buf);
+		if (WARN(ret, "tdx_mcall_extend_rtmr(%ld) failed: %d", mr_ind, ret))
+			return ret;
 	}
+	return 0;
+}
+
+#define TDX_MR_(r) .mr_value = (void *)TDREPORT_##r, TSM_MR_(r, SHA384)
+static struct tsm_measurement_register tdx_mrs[] = {
+	{ TDX_MR_(rtmr0) | TSM_MR_F_RTMR },
+	{ TDX_MR_(rtmr1) | TSM_MR_F_RTMR },
+	{ TDX_MR_(rtmr2) | TSM_MR_F_RTMR },
+	{ TDX_MR_(rtmr3) | TSM_MR_F_RTMR },
+	{ TDX_MR_(mrtd) },
+	{ TDX_MR_(mrconfigid) | TSM_MR_F_NOHASH },
+	{ TDX_MR_(mrowner) | TSM_MR_F_NOHASH },
+	{ TDX_MR_(mrownerconfig) | TSM_MR_F_NOHASH },
+};
+#undef TDX_MR_
+
+static int tdx_mr_refresh(const struct tsm_measurements *tm,
+			  const struct tsm_measurement_register *mr)
+{
+	return tdx_mr_report_locked(KERNEL_SOCKPTR(NULL), KERNEL_SOCKPTR(NULL));
+}
 
-	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
-	ret = tdx_mcall_get_report0(reportdata, tdreport);
+static int tdx_mr_extend(const struct tsm_measurements *tm,
+			 const struct tsm_measurement_register *mr,
+			 const u8 *data)
+{
+	return tdx_mr_extend_locked(mr - tm->mrs, data);
+}
+
+static struct tsm_measurements tdx_measurements = {
+	.mrs = tdx_mrs,
+	.nr_mrs = ARRAY_SIZE(tdx_mrs),
+	.refresh = tdx_mr_refresh,
+	.write = tdx_mr_extend,
+};
+
+/* attribute groups of tdx_misc_dev */
+static const struct attribute_group *tdx_attr_groups[] = {
+	NULL,
+	NULL,
+};
+
+static int tdx_mr_init(void)
+{
+	int ret;
+
+	u8 *report_buf __free(kfree) = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
+
+	/* TDG.MR.RTMR.EXTEND requires 64-byte aligned input */
+	u8 *extend_buf __free(kfree) = kmalloc(64, GFP_KERNEL);
+
+	if (!report_buf || !extend_buf)
+		return -ENOMEM;
+
+	tdx_report_buf = report_buf;
+	ret = tdx_mr_refresh(&tdx_measurements, NULL);
 	if (ret)
-		goto out;
+		return ret;
 
-	if (copy_to_user(req->tdreport, tdreport, TDX_REPORT_LEN))
-		ret = -EFAULT;
+	for (size_t i = 0; i < ARRAY_SIZE(tdx_mrs); ++i)
+		*(long *)&tdx_mrs[i].mr_value += (long)report_buf;
 
-out:
-	kfree(reportdata);
-	kfree(tdreport);
+	tdx_attr_groups[0] = tsm_mr_create_attribute_group(&tdx_measurements);
+	if (IS_ERR(tdx_attr_groups[0]))
+		return PTR_ERR(tdx_attr_groups[0]);
 
-	return ret;
+	tdx_report_buf = no_free_ptr(report_buf);
+	tdx_extend_buf = no_free_ptr(extend_buf);
+	return 0;
+}
+
+static void tdx_mr_deinit(void)
+{
+	tsm_mr_free_attribute_group(tdx_attr_groups[0]);
+	kfree(tdx_extend_buf);
+	kfree(tdx_report_buf);
+}
+
+static long tdx_get_report0(struct tdx_report_req __user *req)
+{
+	return tdx_mr_report_locked(USER_SOCKPTR(req->reportdata),
+				    USER_SOCKPTR(req->tdreport));
 }
 
 static void free_quote_buf(void *buf)
@@ -159,91 +267,60 @@ static int wait_for_quote_completion(struct tdx_quote_buf *quote_buf, u32 timeou
 
 static int tdx_report_new(struct tsm_report *report, void *data)
 {
-	u8 *buf, *reportdata = NULL, *tdreport = NULL;
+	u8 *buf;
 	struct tdx_quote_buf *quote_buf = quote_data;
 	struct tsm_desc *desc = &report->desc;
 	int ret;
 	u64 err;
 
-	/* TODO: switch to guard(mutex_intr) */
-	if (mutex_lock_interruptible(&quote_lock))
-		return -EINTR;
-
-	/*
-	 * If the previous request is timedout or interrupted, and the
-	 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
-	 * VMM), don't permit any new request.
-	 */
-	if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
-		ret = -EBUSY;
-		goto done;
-	}
-
-	if (desc->inblob_len != TDX_REPORTDATA_LEN) {
-		ret = -EINVAL;
-		goto done;
-	}
-
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
+	scoped_cond_guard(mutex_intr, ret = -EINTR, &quote_lock) {
+		/*
+		 * If the previous request is timedout or interrupted, and the
+		 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
+		 * VMM), don't permit any new request.
+		 */
+		if (quote_buf->status == GET_QUOTE_IN_FLIGHT)
+			return -EBUSY;
+
+		if (desc->inblob_len != TDX_REPORTDATA_LEN)
+			return -EINVAL;
+
+		memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
+
+		/* Update Quote buffer header */
+		quote_buf->version = GET_QUOTE_CMD_VER;
+		quote_buf->in_len = TDX_REPORT_LEN;
+
+		/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
+		ret = tdx_mr_report_locked(KERNEL_SOCKPTR(desc->inblob),
+					   KERNEL_SOCKPTR(quote_buf->data));
+		if (ret)
+			break;
+
+		err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
+		if (err) {
+			pr_err("GetQuote hypercall failed, status:%llx\n", err);
+			return -EIO;
+		}
+
+		ret = wait_for_quote_completion(quote_buf, getquote_timeout);
+		if (ret) {
+			pr_err("GetQuote request timedout\n");
+			break;
+		}
+
+		buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		report->outblob = buf;
+		report->outblob_len = quote_buf->out_len;
+
+		/*
+		 * TODO: parse the PEM-formatted cert chain out of the quote
+		 * buffer when provided
+		 */
 	}
-
-	memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
-
-	/* Update Quote buffer header */
-	quote_buf->version = GET_QUOTE_CMD_VER;
-	quote_buf->in_len = TDX_REPORT_LEN;
-
-	memcpy(quote_buf->data, tdreport, TDX_REPORT_LEN);
-
-	err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
-	if (err) {
-		pr_err("GetQuote hypercall failed, status:%llx\n", err);
-		ret = -EIO;
-		goto done;
-	}
-
-	ret = wait_for_quote_completion(quote_buf, getquote_timeout);
-	if (ret) {
-		pr_err("GetQuote request timedout\n");
-		goto done;
-	}
-
-	buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
-	if (!buf) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	report->outblob = buf;
-	report->outblob_len = quote_buf->out_len;
-
-	/*
-	 * TODO: parse the PEM-formatted cert chain out of the quote buffer when
-	 * provided
-	 */
-done:
-	mutex_unlock(&quote_lock);
-	kfree(reportdata);
-	kfree(tdreport);
-
 	return ret;
 }
 
@@ -289,6 +366,7 @@ static struct miscdevice tdx_misc_dev = {
 	.name = KBUILD_MODNAME,
 	.minor = MISC_DYNAMIC_MINOR,
 	.fops = &tdx_guest_fops,
+	.groups = tdx_attr_groups,
 };
 
 static const struct x86_cpu_id tdx_guest_ids[] = {
@@ -311,10 +389,14 @@ static int __init tdx_guest_init(void)
 	if (!x86_match_cpu(tdx_guest_ids))
 		return -ENODEV;
 
-	ret = misc_register(&tdx_misc_dev);
+	ret = tdx_mr_init();
 	if (ret)
 		return ret;
 
+	ret = misc_register(&tdx_misc_dev);
+	if (ret)
+		goto free_tsm_mr;
+
 	quote_data = alloc_quote_buf();
 	if (!quote_data) {
 		pr_err("Failed to allocate Quote buffer\n");
@@ -332,6 +414,8 @@ static int __init tdx_guest_init(void)
 	free_quote_buf(quote_data);
 free_misc:
 	misc_deregister(&tdx_misc_dev);
+free_tsm_mr:
+	tdx_mr_deinit();
 
 	return ret;
 }
@@ -342,6 +426,7 @@ static void __exit tdx_guest_exit(void)
 	tsm_unregister(&tdx_tsm_ops);
 	free_quote_buf(quote_data);
 	misc_deregister(&tdx_misc_dev);
+	tdx_mr_deinit();
 }
 module_exit(tdx_guest_exit);
 

-- 
2.43.0

