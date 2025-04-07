Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC168259CBA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052395; cv=none; b=kSuuzG1Nv0fQJWMCJPKTvW0uu5/YJu503TrOIfbqN8kOPrg8BmpvUxsgCeBxwZFAp40X15XqesLPvoJHVLM6dg5Eb2z84ALq32QloQCAPp+uCIqNa7WKb6LM237Hbjo2BobgeUs2EodIPFOUXQVc6NzRGmfi/zTMbDoQmsUX+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052395; c=relaxed/simple;
	bh=NE0tNXAYqSzmOnnFtNjH0NP/9T7ARhN+xOJeISYddgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+QQ9LQsPNEpbuMpLF9ILb37Kw8m6+3i0q4blX91ZdBX5JYmqwQsM4eIXAJooW1HkocK2xj+EkWkaKk2r5o55ThaZxJ8uUyynFIp+fCkm4RYczT+yJEkF0r0iImbQ4mTBGTsUNx2afdhDrcMeC6miITuFdnpcQUkGttrXI/oJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6HzREuw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6HzREuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744052393; x=1775588393;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=NE0tNXAYqSzmOnnFtNjH0NP/9T7ARhN+xOJeISYddgU=;
  b=R6HzREuw94nIJcUJPH3aqKSbL77Pf+9tQUVaVyMLQm4K66Fon3pm3lWP
   yeQUn5XmwiV3xEJbRt/ngnay6kXOrbrV+kJ/r14cS8aIv4bOOebigCqwU
   +T/N/IjYVXIxd+Bv3LZP60EbbwWXVb5lFbTw7RaGPUjmkH6UswEn7KNjl
   0bIhygZanpKih/3j7pYCkd9oNcgLvOdfRzcQ0lkKMVgEixusPB4ZB136d
   zal7DWD9ghJYv5sqxXvw3sRxvtVOAMACRGMYTzJeSk47trZ3kqS4tdPeW
   VJ1btWIjQSU7G3ahmovh+fdesZtNbsBAaJn8ADY5DGBm/a5P+SYborMpN
   g==;
X-CSE-ConnectionGUID: MAsMEvkrScKchaIEuG8sGA==
X-CSE-MsgGUID: Va622hemSHe9A1IRc+HSwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62999733"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62999733"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:53 -0700
X-CSE-ConnectionGUID: ZQSxcxGASXm6/aF+qPn8zQ==
X-CSE-MsgGUID: QjJ+RrzaQDyzmzBmTiyvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128899334"
Received: from trung68x-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.115.210])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:51 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Mon, 07 Apr 2025 13:59:32 -0500
Subject: [PATCH v3 5/5] virt: tdx-guest: Expose TDX MRs as sysfs attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-tdx-rtmr-v3-5-54f17bc65228@intel.com>
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
Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest-mr for more
information.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 .../sysfs-devices-virtual-misc-tdx_guest-mr        |  48 ++++++
 MAINTAINERS                                        |   1 +
 drivers/virt/coco/tdx-guest/Kconfig                |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c            | 169 ++++++++++++++++++++-
 4 files changed, 217 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest-mr b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest-mr
new file mode 100644
index 000000000000..682b2973737a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest-mr
@@ -0,0 +1,48 @@
+What:		/sys/devices/virtual/misc/tdx_guest/mr/MRNAME[:HASH]
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		Value of a TDX measurement register (MR). MRNAME and HASH above
+		are placeholders. The optional suffix :HASH is used for MRs
+		that have associated hash algorithms. See below for a complete
+		list of TDX MRs exposed via sysfs. Comprehensive information is
+		available at https://intel.com/tdx
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrconfigid
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	cedric.xing@intel.com
+Description:
+		(RO) Value of MRCONFIGID - immutable storage for SW use.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrowner
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	cedric.xing@intel.com
+Description:
+		(RO) Value of MROWNER - immutable storage for SW use.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrownerconfig
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	cedric.xing@intel.com
+Description:
+		(RO) Value of MROWNERCONFIG - immutable storage for SW use.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/mrtd:sha384
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	cedric.xing@intel.com
+Description:
+		(RO) Value of MRTD - the measurement of the initial memory
+		image of the current TD.
+
+What:		/sys/devices/virtual/misc/tdx_guest/mr/rtmr[0123]:sha384
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	cedric.xing@intel.com
+Description:
+		(RW) Read returns the current value of the RTMR. Write extends
+		the written buffer to the RTMR. All writes must start at offset
+		0 and be 48 bytes in size. Partial writes are not supported.
diff --git a/MAINTAINERS b/MAINTAINERS
index b210ac3389a7..c702f456643a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26226,6 +26226,7 @@ L:	x86@kernel.org
 L:	linux-coco@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
+F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest-mr
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
index 224e7dde9cde..1160f861c027 100644
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
@@ -16,7 +18,7 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/tsm.h>
-#include <linux/sizes.h>
+#include <linux/tsm-mr.h>
 
 #include <uapi/linux/tdx-guest.h>
 
@@ -86,8 +88,14 @@ static long tdx_get_report0(struct tdx_report_req __user *req)
 		goto out;
 	}
 
+	if (mutex_lock_interruptible(&quote_lock)) {
+		ret = -EINTR;
+		goto out;
+	}
+
 	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
 	ret = tdx_mcall_get_report0(reportdata, tdreport);
+	mutex_unlock(&quote_lock);
 	if (ret)
 		goto out;
 
@@ -285,10 +293,16 @@ static const struct file_operations tdx_guest_fops = {
 	.unlocked_ioctl = tdx_guest_ioctl,
 };
 
+static const struct attribute_group *tdx_attr_groups[] = {
+	NULL,
+	NULL,
+};
+
 static struct miscdevice tdx_misc_dev = {
 	.name = KBUILD_MODNAME,
 	.minor = MISC_DYNAMIC_MINOR,
 	.fops = &tdx_guest_fops,
+	.groups = tdx_attr_groups,
 };
 
 static const struct x86_cpu_id tdx_guest_ids[] = {
@@ -304,6 +318,144 @@ static const struct tsm_ops tdx_tsm_ops = {
 	.report_bin_attr_visible = tdx_report_bin_attr_visible,
 };
 
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
+static u8 tdx_mr_report[TDX_REPORT_LEN] __aligned(TDX_REPORT_LEN);
+
+#define TDX_MR_(r) .mr_value = tdx_mr_report + TDREPORT_##r, TSM_MR_(r, SHA384)
+static const struct tsm_measurement_register tdx_mrs[] = {
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
+static int tdx_mr_try_refresh(void)
+{
+	u8 *reportdata, *tdreport;
+	int ret;
+
+	reportdata = tdx_mr_report + TDREPORT_reportdata;
+
+	/*
+	 * TDCALL requires a GPA as input. Depending on whether this module is
+	 * built as a built-in (Y) or a module (M), tdx_mr_report may or may
+	 * not be converted to a GPA using virt_to_phys. If not, a directly
+	 * mapped buffer must be allocated using kmalloc and used as an
+	 * intermediary.
+	 */
+	if (IS_BUILTIN(CONFIG_TDX_GUEST_DRIVER))
+		tdreport = tdx_mr_report;
+	else {
+		/* TDREPORT buffer must be naturally aligned */
+		tdreport = kmalloc(__alignof(tdx_mr_report), GFP_KERNEL);
+		if (!tdreport)
+			return -ENOMEM;
+
+		reportdata = memcpy(tdreport + TDREPORT_reportdata, reportdata,
+				    TDX_REPORTDATA_LEN);
+	}
+
+	ret = tdx_mcall_get_report0(reportdata, tdreport);
+	if (ret)
+		pr_err("GetReport call failed\n");
+
+	if (!IS_BUILTIN(CONFIG_TDX_GUEST_DRIVER)) {
+		if (!ret)
+			memcpy(tdx_mr_report, tdreport, sizeof(tdx_mr_report));
+		kfree(tdreport);
+	}
+
+	return ret;
+}
+
+static int tdx_mr_refresh(const struct tsm_measurements *tm,
+			  const struct tsm_measurement_register *mr)
+{
+	int ret = -EINTR;
+
+	if (!mutex_lock_interruptible(&quote_lock)) {
+		ret = tdx_mr_try_refresh();
+		mutex_unlock(&quote_lock);
+
+		WARN_ON(ret);
+	}
+	return ret;
+}
+
+static int tdx_mr_try_extend(ptrdiff_t mr_ind, const u8 *data)
+{
+#if IS_BUILTIN(CONFIG_TDX_GUEST_DRIVER)
+	/*
+	 * TDG.MR.RTMR.EXTEND takes the GPA of a 64-byte aligned buffer on
+	 * input. virt_to_phys() works on static buffers only if the current
+	 * module is built-in.
+	 */
+	static u8 buf[SHA384_DIGEST_SIZE] __aligned(64);
+#else
+	/*
+	 * Otherwise, kmalloc() must be used to allocate the 64-byte aligned
+	 * input buffer.
+	 */
+	u8 *buf __free(kfree) = kmalloc(64, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+#endif
+
+	int ret;
+
+	memcpy(buf, data, SHA384_DIGEST_SIZE);
+
+	ret = tdx_mcall_extend_rtmr((u8)mr_ind, buf);
+	if (ret)
+		pr_err("Extending RTMR%ld failed\n", mr_ind);
+
+	return ret;
+}
+
+static int tdx_mr_extend(const struct tsm_measurements *tm,
+			 const struct tsm_measurement_register *mr,
+			 const u8 *data)
+{
+	int ret = -EINTR;
+
+	if (!mutex_lock_interruptible(&quote_lock)) {
+		ret = tdx_mr_try_extend(mr - tm->mrs, data);
+		mutex_unlock(&quote_lock);
+
+		WARN_ON(ret);
+	}
+	return ret;
+}
+
+static struct tsm_measurements tdx_measurements = {
+	.name = "mr",
+	.mrs = tdx_mrs,
+	.nr_mrs = ARRAY_SIZE(tdx_mrs),
+	.refresh = tdx_mr_refresh,
+	.write = tdx_mr_extend,
+};
+
 static int __init tdx_guest_init(void)
 {
 	int ret;
@@ -311,9 +463,19 @@ static int __init tdx_guest_init(void)
 	if (!x86_match_cpu(tdx_guest_ids))
 		return -ENODEV;
 
+	ret = tdx_mr_try_refresh();
+	if (ret) {
+		pr_err("Failed to read MRs: %d\n", ret);
+		return ret;
+	}
+
+	tdx_attr_groups[0] = tsm_mr_create_attribute_group(&tdx_measurements);
+	if (IS_ERR(tdx_attr_groups[0]))
+		return PTR_ERR(tdx_attr_groups[0]);
+
 	ret = misc_register(&tdx_misc_dev);
 	if (ret)
-		return ret;
+		goto free_tsm_mr;
 
 	quote_data = alloc_quote_buf();
 	if (!quote_data) {
@@ -332,6 +494,8 @@ static int __init tdx_guest_init(void)
 	free_quote_buf(quote_data);
 free_misc:
 	misc_deregister(&tdx_misc_dev);
+free_tsm_mr:
+	tsm_mr_free_attribute_group(tdx_attr_groups[0]);
 
 	return ret;
 }
@@ -342,6 +506,7 @@ static void __exit tdx_guest_exit(void)
 	tsm_unregister(&tdx_tsm_ops);
 	free_quote_buf(quote_data);
 	misc_deregister(&tdx_misc_dev);
+	tsm_mr_free_attribute_group(tdx_attr_groups[0]);
 }
 module_exit(tdx_guest_exit);
 

-- 
2.43.0

