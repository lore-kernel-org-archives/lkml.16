Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B621FF4E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572262; cv=none; b=eG7/Z7Q2M2YHrg2+/45+D5O8zNtUOxOJL4iCqQ9+IakgPag61ngWalA53F7oHxYAJR9F9EuJRB+mAzS215u4a4YhvPh//7ArVgnl65xbjqaUX60iV8r6O8V7c6jOrCWultSJ0JkQNFO4oQwMKWKURbX2450/bZEMDTgSMbUNci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572262; c=relaxed/simple;
	bh=M75ekw0TKpMwz4TYcftL8i72r/4m989Dtcu+6Sth1AI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1WOzxrncmGdtcXhTPFH0lp4cd5ywWbpCt7u2CeAdLWX8qM9lW9RTEdELvcTzK6KUHQixxC9QD0sbNGD0EJk0hej4lh0F/Q9/D2iLHdlrj5uuVaY9BRY6rIVUmjCg93nRD69gjUdOLSeVnZ5yKTBBg8dsLsCyGD62hGlL2XRHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX/aOBqY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX/aOBqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746572260; x=1778108260;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=M75ekw0TKpMwz4TYcftL8i72r/4m989Dtcu+6Sth1AI=;
  b=VX/aOBqY5xq8zdiO9zNK8drvz4xcCKMIMCUcH01vonISWjPqoUPPF+Om
   mop13Dpnjbl1XE/J3v3wY2WaQyfBgePbVJzmD23lwvAon/uWyNupK91Et
   MgFUG5mNyPUckP7+duA1Fkf9hIxn0XWPWBjzk9hJxk8mqqd5APmroRgW0
   5AHbkhHAAn+RSZMXjDJeYFiDxbPCAAsdMcM6wGCLShoY6p8esX81fhKBz
   FH9e7Az82qnY8MVBF6uXHr+5uqrB//ajDguecq6ym20oqkKp4Q1QHBFLK
   4fRHCDn/8QjgQS8oX7qjBEwGbfltdP9gwbtHmoqwr60IWdhxv2rmjLIEr
   g==;
X-CSE-ConnectionGUID: s/6q6CpJRr22UScyd0XsCg==
X-CSE-MsgGUID: ukCVmYJPRI6tQkV27sK8pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35898351"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="35898351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:40 -0700
X-CSE-ConnectionGUID: Qv31zdacTM2l5nuI54qBQg==
X-CSE-MsgGUID: EeYugMv9Q0aZhJGpIp3sbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135477012"
Received: from sjdobek-mobl3.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.114.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:38 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Tue, 06 May 2025 17:57:11 -0500
Subject: [PATCH v6 5/7] virt: tdx-guest: Expose TDX MRs as sysfs attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250506-tdx-rtmr-v6-5-ac6ff5e9d58a@intel.com>
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

Expose the most commonly used TDX MRs (Measurement Registers) as sysfs
attributes. Use the ioctl() interface of /dev/tdx_guest to request a full
TDREPORT for access to other TD measurements.

Directory structure of TDX MRs inside a TDVM is as follows:

/sys/class/misc/tdx_guest
└── measurements
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
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
---
 .../testing/sysfs-devices-virtual-misc-tdx_guest   |  63 +++++++++
 MAINTAINERS                                        |   1 +
 drivers/virt/coco/tdx-guest/Kconfig                |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c            | 151 ++++++++++++++++++++-
 4 files changed, 214 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
new file mode 100644
index 0000000000000000000000000000000000000000..8fca56c8c9dfe6abfad4148c91dfb50e35806b82
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
@@ -0,0 +1,63 @@
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/MRNAME[:HASH]
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
+		See also:
+		https://docs.kernel.org/driver-api/coco/measurement-registers.html
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrconfigid
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MRCONFIGID - 48-byte immutable storage typically used for
+		software-defined ID for non-owner-defined configuration of the
+		guest TD – e.g., run-time or OS configuration.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrowner
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MROWNER - 48-byte immutable storage typically used for
+		software-defined ID for the guest TD’s owner.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrownerconfig
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MROWNERCONFIG - 48-byte immutable storage typically used
+		for software-defined ID for owner-defined configuration of the
+		guest TD – e.g., specific to the workload rather than the
+		run-time or OS.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrtd:sha384
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MRTD - Measurement of the initial contents of the TD.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/rtmr[0123]:sha384
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
index 8bf8a818bce5225bd5e2a18685893efa5a9c5650..912e16ace0b4affec1e84b5c78060db7e58d9243 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26321,6 +26321,7 @@ L:	x86@kernel.org
 L:	linux-coco@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
+F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
 F:	arch/x86/boot/compressed/tdx*
 F:	arch/x86/coco/tdx/
 F:	arch/x86/include/asm/shared/tdx.h
diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
index 22dd59e194315a754472b510465af35a9f8c3b27..dbbdc14383b132616490dfed8be571190b657096 100644
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
index 224e7dde9cdee877fd587d2fc974f2ccc7481d0f..452520ad1b32341405cae63a9cea02fdf8baf9b9 100644
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
@@ -15,14 +17,146 @@
 #include <linux/set_memory.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/sockptr.h>
 #include <linux/tsm.h>
-#include <linux/sizes.h>
+#include <linux/tsm-mr.h>
 
 #include <uapi/linux/tdx-guest.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/tdx.h>
 
+/* TDREPORT buffer */
+static u8 *tdx_report_buf;
+
+/* Lock to serialize TDG.MR.REPORT and TDG.MR.RTMR.EXTEND TDCALLs */
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
+static int tdx_do_report(sockptr_t data, sockptr_t tdreport)
+{
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
+		u8 *reportdata = tdx_report_buf + TDREPORT_reportdata;
+		int ret;
+
+		if (!sockptr_is_null(data) &&
+		    copy_from_sockptr(reportdata, data, TDX_REPORTDATA_LEN))
+			return -EFAULT;
+
+		ret = tdx_mcall_get_report0(reportdata, tdx_report_buf);
+		if (WARN_ONCE(ret, "tdx_mcall_get_report0() failed: %d", ret))
+			return ret;
+
+		if (!sockptr_is_null(tdreport) &&
+		    copy_to_sockptr(tdreport, tdx_report_buf, TDX_REPORT_LEN))
+			return -EFAULT;
+	}
+	return 0;
+}
+
+static int tdx_do_extend(u8 mr_ind, const u8 *data)
+{
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
+		/*
+		 * TDX requires @extend_buf to be 64-byte aligned.
+		 * It's safe to use REPORTDATA buffer for that purpose because
+		 * tdx_mr_report/extend_lock() are mutually exclusive.
+		 */
+		u8 *extend_buf = tdx_report_buf + TDREPORT_reportdata;
+		int ret;
+
+		memcpy(extend_buf, data, SHA384_DIGEST_SIZE);
+
+		ret = tdx_mcall_extend_rtmr(mr_ind, extend_buf);
+		if (WARN_ONCE(ret, "tdx_mcall_extend_rtmr(%u) failed: %d", mr_ind, ret))
+			return ret;
+	}
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
+static int tdx_mr_refresh(const struct tsm_measurements *tm)
+{
+	return tdx_do_report(KERNEL_SOCKPTR(NULL), KERNEL_SOCKPTR(NULL));
+}
+
+static int tdx_mr_extend(const struct tsm_measurements *tm,
+			 const struct tsm_measurement_register *mr,
+			 const u8 *data)
+{
+	return tdx_do_extend(mr - tm->mrs, data);
+}
+
+static struct tsm_measurements tdx_measurements = {
+	.mrs = tdx_mrs,
+	.nr_mrs = ARRAY_SIZE(tdx_mrs),
+	.refresh = tdx_mr_refresh,
+	.write = tdx_mr_extend,
+};
+
+static const struct attribute_group *tdx_mr_init(void)
+{
+	const struct attribute_group *g;
+	int rc;
+
+	u8 *buf __free(kfree) = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	tdx_report_buf = buf;
+	rc = tdx_mr_refresh(&tdx_measurements);
+	if (rc)
+		return ERR_PTR(rc);
+
+	/*
+	 * @mr_value was initialized with the offset only, while the base
+	 * address is being added here.
+	 */
+	for (size_t i = 0; i < ARRAY_SIZE(tdx_mrs); ++i)
+		*(long *)&tdx_mrs[i].mr_value += (long)buf;
+
+	g = tsm_mr_create_attribute_group(&tdx_measurements);
+	if (!IS_ERR(g))
+		tdx_report_buf = no_free_ptr(buf);
+
+	return g;
+}
+
+static void tdx_mr_deinit(const struct attribute_group *mr_grp)
+{
+	tsm_mr_free_attribute_group(mr_grp);
+	kfree(tdx_report_buf);
+}
+
 /*
  * Intel's SGX QE implementation generally uses Quote size less
  * than 8K (2K Quote data + ~5K of certificate blob).
@@ -285,10 +419,16 @@ static const struct file_operations tdx_guest_fops = {
 	.unlocked_ioctl = tdx_guest_ioctl,
 };
 
+static const struct attribute_group *tdx_attr_groups[] = {
+	NULL, /* measurements */
+	NULL
+};
+
 static struct miscdevice tdx_misc_dev = {
 	.name = KBUILD_MODNAME,
 	.minor = MISC_DYNAMIC_MINOR,
 	.fops = &tdx_guest_fops,
+	.groups = tdx_attr_groups,
 };
 
 static const struct x86_cpu_id tdx_guest_ids[] = {
@@ -311,9 +451,13 @@ static int __init tdx_guest_init(void)
 	if (!x86_match_cpu(tdx_guest_ids))
 		return -ENODEV;
 
+	tdx_attr_groups[0] = tdx_mr_init();
+	if (IS_ERR(tdx_attr_groups[0]))
+		return PTR_ERR(tdx_attr_groups[0]);
+
 	ret = misc_register(&tdx_misc_dev);
 	if (ret)
-		return ret;
+		goto deinit_mr;
 
 	quote_data = alloc_quote_buf();
 	if (!quote_data) {
@@ -332,6 +476,8 @@ static int __init tdx_guest_init(void)
 	free_quote_buf(quote_data);
 free_misc:
 	misc_deregister(&tdx_misc_dev);
+deinit_mr:
+	tdx_mr_deinit(tdx_attr_groups[0]);
 
 	return ret;
 }
@@ -339,6 +485,7 @@ module_init(tdx_guest_init);
 
 static void __exit tdx_guest_exit(void)
 {
+	tdx_mr_deinit(tdx_attr_groups[0]);
 	tsm_unregister(&tdx_tsm_ops);
 	free_quote_buf(quote_data);
 	misc_deregister(&tdx_misc_dev);

-- 
2.43.0

