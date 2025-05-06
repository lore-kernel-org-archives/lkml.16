Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E28421C17D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572257; cv=none; b=jnKQmZcOxMuUHUCKqXhe/k2I4dfth15JmsKoK2eG5lpdSDk/HDvKILMFdHJ5Y3O6ILgxapxo7F3xPGPcd2lCzQlmzS1AyzPyOQis8ljo+Nx4GOt0L14oxcn7wI64JfvyJgH+dBfVIGOabWTqhpiSYEOwoun3u+r6F6a8nXjJwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572257; c=relaxed/simple;
	bh=td+beB2xjdHsYQZUtw8iIZFYuoTZiB3bGboZB0jlxJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OvbNSi0Q+Cr18OdVKizVoewH89C++k2aPgEW/28uv42NfUvL16Rh8wbfXuhgPcKHJYm3uDDCeRzzlHX1NRVspdQFbNt3OH9Q4nN5rxk0h1SJiJPLABuQleFw7ZfvAsjCdjAiYl0g0iQMisw8w47I5bZtGzJ4CSX3TwViazeKgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tyf2jlga; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tyf2jlga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746572256; x=1778108256;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=td+beB2xjdHsYQZUtw8iIZFYuoTZiB3bGboZB0jlxJY=;
  b=Tyf2jlgaiWZqnJwYxHL3kPYOx6lv+/cvycvslQ2m0/wgoIn0FO+rqROk
   yWG2Vetkd+OmGIEg+Fg0M80YmfLzCdkAi54cT7szrHHceyAZvxjSUWZLh
   7Ok+Czg1hkNzZJAXHlUmQM4x8AA17e7MGYKirZxdmCnvhRvEIMbVLfAvn
   Lnv+V/P+qAYQ+KVnvwLygw2f1yW+S+kVKiUDa6hJP3YjeAjin3zszMWOi
   vUY1s3eEnqf17vNNGTmdgl09zqXlGY9E0wqKjZZ9KglTAeuM3Uh53vaPD
   Ys4cPqxsRlzU0aQzQTIHk1G1YnFUTYJ8rkKy+ss7d8aaV1VdgOnu/duLW
   A==;
X-CSE-ConnectionGUID: rtb+wBWNTpOyXdf82ioqVg==
X-CSE-MsgGUID: 8ipgqc5MQ+6hWE68yGqDFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35898314"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="35898314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:35 -0700
X-CSE-ConnectionGUID: nrRgZfk6SPiVC/VI4cPoEw==
X-CSE-MsgGUID: ngS8dQtjSWaFu8B6FYjkRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135476991"
Received: from sjdobek-mobl3.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.114.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:33 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Tue, 06 May 2025 17:57:08 -0500
Subject: [PATCH v6 2/7] tsm-mr: Add tsm-mr sample code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250506-tdx-rtmr-v6-2-ac6ff5e9d58a@intel.com>
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

This sample kernel module demonstrates how to make MRs accessible to user
mode through the tsm-mr library.

Once loaded, this module registers a `miscdevice` that host a set of
emulated measurement registers as shown in the directory tree below.

/sys/class/misc/tsm_mr_sample
└── measurements
    ├── config_mr
    ├── report_digest:sha512
    ├── rtmr0:sha256
    ├── rtmr1:sha384
    ├── rtmr_crypto_agile:sha256
    ├── rtmr_crypto_agile:sha384
    └── static_mr:sha384

Among the MRs in this example:

- `config_mr` demonstrates a hashless MR, like MRCONFIGID in Intel TDX or
  HOSTDATA in AMD SEV.
- `static_mr` demonstrates a static MR. The suffix `:sha384` indicates its
  value is a sha384 digest.
- `rtmr0` is an RTMR with `TSM_MR_F_WRITABLE` **cleared**, preventing
  direct extensions; as a result, the attribute `rtmr0:sha256` is
  read-only.
- `rtmr1` is an RTMR with `TSM_MR_F_WRITABLE` **set**, permitting direct
  extensions; thus, the attribute `rtmr1:sha384` is writable.
- `rtmr_crypto_agile` demonstrates a "single" MR that supports multiple
  hash algorithms. Each supported algorithm has a corresponding digest,
  usually referred to as a "bank" in TCG terminology. In this specific
  sample, the 2 banks are aliased to `rtmr0` and `rtmr1`, respectively.
- `report_digest` contains the digest of the internal report structure
  living in this sample module's memory. It is to demonstrate the use of
  the `TSM_MR_F_LIVE` flag. Its value changes each time an RTMR is
  extended.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
---
 MAINTAINERS                    |   1 +
 samples/Kconfig                |  11 ++++
 samples/Makefile               |   1 +
 samples/tsm-mr/Makefile        |   2 +
 samples/tsm-mr/tsm_mr_sample.c | 131 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 146 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d36823d26b28797c1186e7df1eb4d2da612f51c..8bf8a818bce5225bd5e2a18685893efa5a9c5650 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24651,6 +24651,7 @@ F:	Documentation/ABI/testing/configfs-tsm
 F:	Documentation/driver-api/coco/
 F:	drivers/virt/coco/tsm*.c
 F:	include/linux/tsm*.h
+F:	samples/tsm/
 
 TRUSTED SERVICES TEE DRIVER
 M:	Balint Dobszay <balint.dobszay@arm.com>
diff --git a/samples/Kconfig b/samples/Kconfig
index 09011be2391a925bb31b1cf6e6a979599fed30f4..6ade17cb16b441965f0a19d87ddf766c8ee3922c 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -184,6 +184,17 @@ config SAMPLE_TIMER
 	bool "Timer sample"
 	depends on CC_CAN_LINK && HEADERS_INSTALL
 
+config SAMPLE_TSM_MR
+	tristate "TSM measurement sample"
+	select TSM_MEASUREMENTS
+	select VIRT_DRIVERS
+	help
+	  Build a sample module that emulates MRs (Measurement Registers) and
+	  exposes them to user mode applications through the TSM sysfs
+	  interface (/sys/class/misc/tsm_mr_sample/emulated_mr/).
+
+	  The module name will be tsm-mr-sample when built as a module.
+
 config SAMPLE_UHID
 	bool "UHID sample"
 	depends on CC_CAN_LINK && HEADERS_INSTALL
diff --git a/samples/Makefile b/samples/Makefile
index bf6e6fca5410b1b374a287269c24f96de8bb2800..c95bac31851c2cafbbbef3ad8e36bea752e411ea 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -43,3 +43,4 @@ obj-$(CONFIG_SAMPLES_RUST)		+= rust/
 obj-$(CONFIG_SAMPLE_DAMON_WSSE)		+= damon/
 obj-$(CONFIG_SAMPLE_DAMON_PRCL)		+= damon/
 obj-$(CONFIG_SAMPLE_HUNG_TASK)		+= hung_task/
+obj-$(CONFIG_SAMPLE_TSM_MR)		+= tsm-mr/
diff --git a/samples/tsm-mr/Makefile b/samples/tsm-mr/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..587c3947b3a750f124e1fbb4bcffbd30108609b2
--- /dev/null
+++ b/samples/tsm-mr/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SAMPLE_TSM_MR) += tsm_mr_sample.o
diff --git a/samples/tsm-mr/tsm_mr_sample.c b/samples/tsm-mr/tsm_mr_sample.c
new file mode 100644
index 0000000000000000000000000000000000000000..f3e16301de402389a259f376e77acb96c9560506
--- /dev/null
+++ b/samples/tsm-mr/tsm_mr_sample.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024-2005 Intel Corporation. All rights reserved. */
+
+#define pr_fmt(x) KBUILD_MODNAME ": " x
+
+#include <linux/module.h>
+#include <linux/tsm-mr.h>
+#include <linux/miscdevice.h>
+#include <crypto/hash.h>
+
+struct {
+	u8 static_mr[SHA384_DIGEST_SIZE];
+	u8 config_mr[SHA512_DIGEST_SIZE];
+	u8 rtmr0[SHA256_DIGEST_SIZE];
+	u8 rtmr1[SHA384_DIGEST_SIZE];
+	u8 report_digest[SHA512_DIGEST_SIZE];
+} sample_report = {
+	.static_mr = "static_mr",
+	.config_mr = "config_mr",
+	.rtmr0 = "rtmr0",
+	.rtmr1 = "rtmr1",
+};
+
+static int sample_report_refresh(const struct tsm_measurements *tm)
+{
+	struct crypto_shash *tfm;
+	int rc;
+
+	tfm = crypto_alloc_shash(hash_algo_name[HASH_ALGO_SHA512], 0, 0);
+	if (IS_ERR(tfm)) {
+		pr_err("crypto_alloc_shash failed: %ld\n", PTR_ERR(tfm));
+		return PTR_ERR(tfm);
+	}
+
+	rc = crypto_shash_tfm_digest(tfm, (u8 *)&sample_report,
+				     offsetof(typeof(sample_report),
+					      report_digest),
+				     sample_report.report_digest);
+	crypto_free_shash(tfm);
+	if (rc)
+		pr_err("crypto_shash_tfm_digest failed: %d\n", rc);
+	return rc;
+}
+
+static int sample_report_extend_mr(const struct tsm_measurements *tm,
+				   const struct tsm_measurement_register *mr,
+				   const u8 *data)
+{
+	SHASH_DESC_ON_STACK(desc, 0);
+	int rc;
+
+	desc->tfm = crypto_alloc_shash(hash_algo_name[mr->mr_hash], 0, 0);
+	if (IS_ERR(desc->tfm)) {
+		pr_err("crypto_alloc_shash failed: %ld\n", PTR_ERR(desc->tfm));
+		return PTR_ERR(desc->tfm);
+	}
+
+	rc = crypto_shash_init(desc);
+	if (!rc)
+		rc = crypto_shash_update(desc, mr->mr_value, mr->mr_size);
+	if (!rc)
+		rc = crypto_shash_finup(desc, data, mr->mr_size, mr->mr_value);
+	crypto_free_shash(desc->tfm);
+	if (rc)
+		pr_err("SHA calculation failed: %d\n", rc);
+	return rc;
+}
+
+#define MR_(mr, hash) .mr_value = &sample_report.mr, TSM_MR_(mr, hash)
+static const struct tsm_measurement_register sample_mrs[] = {
+	/* static MR, read-only */
+	{ MR_(static_mr, SHA384) },
+	/* config MR, read-only */
+	{ MR_(config_mr, SHA512) | TSM_MR_F_NOHASH },
+	/* RTMR, direct extension prohibited */
+	{ MR_(rtmr0, SHA256) | TSM_MR_F_LIVE },
+	/* RTMR, direct extension allowed */
+	{ MR_(rtmr1, SHA384) | TSM_MR_F_RTMR },
+	/* RTMR, crypto agile, alaised to rtmr0 and rtmr1, respectively */
+	{ .mr_value = &sample_report.rtmr0,
+	  TSM_MR_(rtmr_crypto_agile, SHA256) | TSM_MR_F_RTMR },
+	{ .mr_value = &sample_report.rtmr1,
+	  TSM_MR_(rtmr_crypto_agile, SHA384) | TSM_MR_F_RTMR },
+	/* sha512 digest of the whole structure */
+	{ MR_(report_digest, SHA512) | TSM_MR_F_LIVE },
+};
+#undef MR_
+
+static struct tsm_measurements sample_tm = {
+	.mrs = sample_mrs,
+	.nr_mrs = ARRAY_SIZE(sample_mrs),
+	.refresh = sample_report_refresh,
+	.write = sample_report_extend_mr,
+};
+
+static const struct attribute_group *sample_groups[] = {
+	NULL,
+	NULL,
+};
+
+static struct miscdevice sample_misc_dev = {
+	.name = KBUILD_MODNAME,
+	.minor = MISC_DYNAMIC_MINOR,
+	.groups = sample_groups,
+};
+
+static int __init tsm_mr_sample_init(void)
+{
+	int rc;
+
+	sample_groups[0] = tsm_mr_create_attribute_group(&sample_tm);
+	if (IS_ERR(sample_groups[0]))
+		return PTR_ERR(sample_groups[0]);
+
+	rc = misc_register(&sample_misc_dev);
+	if (rc)
+		tsm_mr_free_attribute_group(sample_groups[0]);
+	return rc;
+}
+
+static void __exit tsm_mr_sample_exit(void)
+{
+	misc_deregister(&sample_misc_dev);
+	tsm_mr_free_attribute_group(sample_groups[0]);
+}
+
+module_init(tsm_mr_sample_init);
+module_exit(tsm_mr_sample_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Sample module using tsm-mr to expose emulated MRs");

-- 
2.43.0

