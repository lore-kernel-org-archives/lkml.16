Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B301CD213
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667690; cv=none; b=V2b9UT5tgBwqEH9PYlCAmvOuPXWwSSeOtjwzz/+t2EWu4t60JjE0gTP+paVjiPX7wzNgmEzOHBp5/cwHjyrld0B6aE6MXZ56NWvVi+GNlnjVbN+XqAkTwZABml81cl0r6WHnFbPkh4Fy2bTzFRo4vMHTc4XFpyHndR2qBOfsvfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667690; c=relaxed/simple;
	bh=8kZNmLwbUueKQpJRcthCABi102QVMOMm6OJn53Ii2FQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=igD1mRQUDobibDEKuzAh0EdGCFQO0SNMZ/mk36rY/YARFeD5Ldw+kyX5vPqF+nOtIkdB+vrBjBo7SFqQYuN9nVVWCQHSyc8To/NKL3m9NKuYQmPUGibEJbAqkIEIGsfTULK+wJENP29MsQWEVrPjK7mzlqcKy/+XO4sIkoG9NkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N10PcMlW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N10PcMlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744667688; x=1776203688;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=8kZNmLwbUueKQpJRcthCABi102QVMOMm6OJn53Ii2FQ=;
  b=N10PcMlWCC6KKxrDvDzPhtLQkzGmCe4z81A8hQgkEev0hNuHj9sNqff/
   luZFmxqR0PTDHh4upGIFSB+PvhLaridaEmsG6vD3ApNc2JNtXlBd7nv9W
   IedZxyjnGLwVcgb7f7m8gyt8GnF9i6oHLVAB37HgjIvufkdjNhcG8Rwmo
   dqZ3hl51wlbsVucr4E/J8dlaXhXrrwVQSRgf7IXhDi8mZqBayw63kjxeU
   drg1NrUbITq+3TK3acg80qgtVePaM24Uh+RMJDu3hLASU33ryl0Je2lgz
   3/txHlhITTzJQWkYyeK20ldu9SaaAZPrrcNXcErN4soMr7ss5Ref95F0n
   w==;
X-CSE-ConnectionGUID: 9rougJjLQOeexE5fmkZHlg==
X-CSE-MsgGUID: gax/SipFTumscXZwJLnfVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="71544333"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="71544333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:54:47 -0700
X-CSE-ConnectionGUID: h4Vs6oUZSs+htE5IkVVwXQ==
X-CSE-MsgGUID: 2huO6Q/8SSyps0VrbgBhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130474150"
Received: from hasmith-mobl1.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.115.71])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 14:54:46 -0700
From: Cedric Xing <cedric.xing@intel.com>
Subject: [PATCH v4 0/5] tsm-mr: Unified Measurement Register ABI for TVMs
Date: Mon, 14 Apr 2025 16:54:18 -0500
Message-Id: <20250414-tdx-rtmr-v4-0-7edfa8d98716@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqE/WcC/13M0QqDIBTG8VcZXs+hR0/mrvYeYxeltoRVwyQa0
 bvPYpDs8juc338howvejeR6Wkhwkx/90Kchzydi2qp/Oupt2gQYIAOmabQzDbELFBCl0kWhuCx
 Ien8H1/h5T90fabd+jEP47OWJb9dfhMMRmThlVCuN1kjtuICb76N7XczQkS0yQQZBZBASbMCWW
 LMKGy3/oTigZCqDIkGUDVe1KRCgzOG6rl+9gSDDEgEAAA==
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

NOTE: This patch series introduces the Measurement Register (MR) ABI, and
is a continuation of the RFC series on the same topic [1].

Introduce the CONFIG_TSM_MEASUREMENTS helper library (tsm-mr) as a
cross-vendor transport schema to allow TVM (TEE VM) guest drivers to export
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
Changes in v4:
- tsm-mr: Add details to ABI doc.
- tsm-mr: Add driver-api doc.
- tsm-mr: Add tracepoints.
- tsm-mr: Use the constant string "mr" as the group/directory name for MR
  sysfs attributes.
- x86/tdx: Revise error codes returned by tdx_mcall_* functions.
- tdx-guest: Merge all TDREPORT code paths into a common function.
- Link to v3: https://lore.kernel.org/r/20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com

Changes in v3:
- tsm-mr: Separate measurement support (tsm-mr) from the original tsm
  source code. Modules depending on tsm-mr should `select TSM_MEASUREMENTS`
  in Kconfig. (Dan Williams)
- tsm-mr: Revise tsm-mr APIs to allow callers to decide where to host the
  MR attributes in sysfs.
- tsm-mr: Drop TSM_MR_F_EXTENSIBLE and route all "write" requests to the CC
  guest driver, which decides how to handle writes (e.g., by extending the
  buffer on input to the specified MR).
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

 .../testing/sysfs-devices-virtual-misc-tdx_guest   |  60 +++++
 Documentation/driver-api/coco/index.rst            |  12 +
 .../driver-api/coco/measurement-registers.rst      |  12 +
 Documentation/driver-api/index.rst                 |   1 +
 MAINTAINERS                                        |   6 +-
 arch/x86/coco/tdx/tdx.c                            |  50 +++-
 arch/x86/include/asm/shared/tdx.h                  |   1 +
 arch/x86/include/asm/tdx.h                         |   2 +
 drivers/virt/coco/Kconfig                          |   5 +
 drivers/virt/coco/Makefile                         |   1 +
 drivers/virt/coco/tdx-guest/Kconfig                |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c            | 291 +++++++++++++--------
 drivers/virt/coco/tsm-mr.c                         | 247 +++++++++++++++++
 include/linux/tsm-mr.h                             |  94 +++++++
 include/trace/events/tsm_mr.h                      |  80 ++++++
 samples/Kconfig                                    |  10 +
 samples/Makefile                                   |   1 +
 samples/tsm-mr/Makefile                            |   2 +
 samples/tsm-mr/tsm_mr_sample.c                     | 137 ++++++++++
 19 files changed, 903 insertions(+), 110 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250209-tdx-rtmr-255479667146

Best regards,
-- 
Cedric Xing <cedric.xing@intel.com>

