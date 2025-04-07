Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C22222D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052388; cv=none; b=JQiaIQ8u7q98hgEuiKfFMy5bNhtduKMaSkBul/YVfUwACHsAm9Yb9L8pgTva9X03djP3zydC2seB9PQYdVkNLu+cijZBNUJLw3J2b0fCNSJkFjDiT4XSgCl/VJLvTISfb9lIV7kawYKO9cEhtJY1iR7yjj2M5pkq9JT+pCayacQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052388; c=relaxed/simple;
	bh=GmzZzyb8/k4Anna3v9Ql8DWhrigUAQLV2n55HY2aLDk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qf8JnBaCtA7Ff2LX79yqJ8jQ0w9uTMfe023pR14CtpT1e1iIOBrb2d1OI/7y+yI94lKhLZ68iLFJdLdkrZ0FSP+rYu6N0c1sF8vXw4KmpsO+kVWT4PfHjnd79GfiUA+JpGxzlUcsKnsQVxTQz1tzlSV5s0pZP9nlZzSe2rG51Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6mNPPtC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6mNPPtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744052387; x=1775588387;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=GmzZzyb8/k4Anna3v9Ql8DWhrigUAQLV2n55HY2aLDk=;
  b=H6mNPPtCgyuETrBN2g6bt2lNXwdacLnoMeBIGaYhg+Ht8mwytSwEGaAq
   QiPWvrLOw70qlYrms8ofRrSS3ASTCMOAKA5FYCkOF7RUc9Yru+lMT9w4p
   wV1W1celGi4nUeSlyR7SGRmDBsUgyITlv2VXJXCpjPiVNY+WMbcsP2aqX
   Hlehp0i/cSv2r77BfjNELu/J5YX6g7biijOC6E7m9iNee0AiRfbo9/Qk+
   9+QorXDbRRRTm0oHHYKi4Kv5L0suej2VrULbQtyyKcBiBTkGPu1nfz/yp
   KuKu0r4OrjqKwmlh5MCezsXikyJaiFaFsDCBxxXdbVrJhx5Jqd141H25y
   g==;
X-CSE-ConnectionGUID: iRdzd+FsTtaemGBZp3kUuQ==
X-CSE-MsgGUID: 9TBn3DDFQfyKF1xSeswFww==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62999678"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62999678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:46 -0700
X-CSE-ConnectionGUID: ebudS2sbQ6mgoO4E+/+7Bw==
X-CSE-MsgGUID: 63jsluQtQ6GaJeEF/UrxMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128899302"
Received: from trung68x-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.115.210])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:44 -0700
From: Cedric Xing <cedric.xing@intel.com>
Subject: [PATCH v3 0/5] tsm-mr: Unified Measurement Register ABI for TVMs
Date: Mon, 07 Apr 2025 13:59:27 -0500
Message-Id: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI8g9GcC/02MQQ6CMBBFr0JmbU07tGBdeQ/jAukgkyiYtmkwh
 LtbiIks389/b4ZAninAuZjBU+LA45ChPBTQ9s3wIMEuM6BEI1FaEd0kfHx5gcbo2lZVrXQF+f7
 21PG0pa63zD2HOPrPVk5qXX8Rhf9IUkIKW1vjWm1JlXjhIdLz2I4vWCMJdyKWOxGz2KE7mbtsT
 Gf1XlyW5QsEkoGE2QAAAA==
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

NOTE: This patch series introduces the Measurement Register (MR) ABI, and
is a continuation of the RFC series on the same topic [1].

Introduce the CONFIG_TSM_MEASUREMENTS helper library (tsm-mr) as a
cross-vendor transport schema to allow TVM (TEE VM) guest drives to export
CC (Confidential Compute) architecture-specific MRs (Measurement Registers)
as sysfs attributes/files. Enable applications to read, write/extend MRs
like regular files, supporting various usages such as configuration
verification (e.g., verify a TVM's configuration against digests stored in
static/immutable MRs like MRCONFIGID on TDX or HOSTDATA on SEV) and runtime
measurements (e.g., extend the measurement of a container image to an RTMR
before running it).

Patches included in this series:

- Patch 1 adds the tsm-mr library to help TVM guest drivers exposing MRs as
  sysfs attributes.
- Patch 2 provides a sample module demonstrating the usage of the new
  tsm-mr library.
- The remaining patches update the TDX guest driver to expose TDX MRs with
  the help of the tsm-mr library.

[1]: https://lore.kernel.org/linux-coco/20241210-tsm-rtmr-v3-0-5997d4dbda73@intel.com/

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
Changes in v3:
- tsm-mr: Separate measurement support (tsm-mr) from the original tsm
  source code. Modules depending on tsm-mr should `select TSM_MEASUREMENTS`
  in Kconfig.
- tsm-mr: Revise tsm-mr APIs to allow callers to decide where to host the
  MR attributes in sysfs.
- tsm-mr: Drop TSM_MR_F_EXTENSIBLE and route all "write" requests to the CC
  guest driver, which would decide how to handle writes (e.g., as extension
  to the specified MR).
- tsm-mr: Update the naming pattern for MR attributes from
  MRNAME/HASH/digest to MRNAME:HASH.
- tsm-mr: Drop TSM_MR_MAXBANKS kernel config.
- x86/tdx: Return -EBUSY from tdx_mcall_get_report0 on TDCALL_OPERAND_BUSY
  error.
- tdx-guest: Move MR attributes from /sys/kernel/tsm/tdx/ to
  /sys/class/misc/tdx_guest/ because MR names are architecture-specific, so
  their attributes should reside in an architecture-specific location.
- tdx-guest: Remove hash from `mrconfigid`, `mrowner`, `mrownerconfig`.
- tdx-guest: Remove `servtd_hash`, `report0`, and `reportdata`.
- Link to v2: https://lore.kernel.org/r/20250223-tdx-rtmr-v2-0-f2d85b0a5f94@intel.com

Changes in v2:
- Added TSM_MR_MAXBANKS Kconfig option
- Updated Kconfig dependency for TSM_REPORTS
- Updated comments in include/linux/tsm.h
- Updated drivers/virt/coco/tdx-guest/tdx-guest.c to use `IS_BUILTIN()` for
  determining if static buffer addresses can be converted to GPAs by
  `virt_to_phys()`
- Renamed function `tdx_mcall_rtmr_extend()` -> `tdx_mcall_extend_rtmr()`
- Link to v1: https://lore.kernel.org/r/20250212-tdx-rtmr-v1-0-9795dc49e132@intel.com

---
Cedric Xing (5):
      tsm-mr: Add TVM Measurement Register support
      tsm-mr: Add tsm-mr sample code
      x86/tdx: Add tdx_mcall_extend_rtmr() interface
      x86/tdx: tdx_mcall_get_report0: Return -EBUSY on TDCALL_OPERAND_BUSY error
      virt: tdx-guest: Expose TDX MRs as sysfs attributes

 .../sysfs-devices-virtual-misc-tdx_guest-mr        |  48 +++++
 MAINTAINERS                                        |   6 +-
 arch/x86/coco/tdx/tdx.c                            |  42 ++++-
 arch/x86/include/asm/shared/tdx.h                  |   1 +
 arch/x86/include/asm/tdx.h                         |   2 +
 drivers/virt/coco/Kconfig                          |   5 +
 drivers/virt/coco/Makefile                         |   1 +
 drivers/virt/coco/tdx-guest/Kconfig                |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c            | 169 ++++++++++++++++-
 drivers/virt/coco/tsm-mr.c                         | 209 +++++++++++++++++++++
 include/linux/tsm-mr.h                             |  93 +++++++++
 samples/Kconfig                                    |  10 +
 samples/Makefile                                   |   1 +
 samples/tsm-mr/Makefile                            |   2 +
 samples/tsm-mr/tsm_mr_sample.c                     | 138 ++++++++++++++
 15 files changed, 722 insertions(+), 6 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250209-tdx-rtmr-255479667146

Best regards,
-- 
Cedric Xing <cedric.xing@intel.com>

