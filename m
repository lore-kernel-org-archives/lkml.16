Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F221ABD1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572255; cv=none; b=D66WdJzF5HyBay4BgkHGRTqDnh2IV+Bf41N7gDQnPlISzBYGYqrh1Q8dRVRf5DEWhgyLAj8IkuNuJ0sNFbwoOhFkHhn5TNqoe8AvzNMr/sun0uTZUergH2ejVdKgpjINl8nj/4H9dMSRVMlMnEZWHAGc1YAcDWyuzQaF1o13OwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572255; c=relaxed/simple;
	bh=IwWIQBazIM1lVVYM+JtyTc7r6XNUudnS56d45zjfADI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nDhg+Y9OfuKtJKjCoQs1EMjnFTKjkE+xokP/5MQyJMpE1cVIvYT389/ddymjq4Z48OK0BjIybPj+L5V5cPVYx3zWZtfYNIhnNygJ0uWRCbwMIwXK08cO02KFOF/DJVlfr9TkNbDxWEvKBjrshUcQyqZI+m3j9Wx+9eRx30+5hLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7pI5AsJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7pI5AsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746572253; x=1778108253;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=IwWIQBazIM1lVVYM+JtyTc7r6XNUudnS56d45zjfADI=;
  b=L7pI5AsJij0bFwk8TJGplkFa+IpBcKp9fST+T4mu7Cu7uNi0lQv0zJ+7
   CxCCWHXJiqxQJjI06jp3CfRhd5GzXBFHH2ymi0gMdEO1/8XUTtip3wgHT
   FJKP+haRa0uYMht/VHQF5yD1dCnoQzeErOo8sNY6P+gSiUeg0yHsQBDvI
   E5ctTw6HZtRUnyOM1gwSetxZWULsPi6Ka6EEd1X8+lRmh6TrrOe5Z7tg5
   vGXc5Muv0xTHnfv/4nQA30trIuiuRrCXyliTfTs/mlQlu2dXEwlPndtm9
   3lGlMybcW4dO2EnBAVlyn5GNBp5Vyn+S6DEN5FLyWTlDfFagTIcXeKD1w
   g==;
X-CSE-ConnectionGUID: JG0ZAPe6R9eiDr4DIhaE8A==
X-CSE-MsgGUID: qgy8D1StRdiKn58DvRMwhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35898285"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="35898285"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:32 -0700
X-CSE-ConnectionGUID: GBb6dEsCT9Oz5JFALnadWA==
X-CSE-MsgGUID: ttKhs926Ty2H1FOMdJ68xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="135476965"
Received: from sjdobek-mobl3.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.114.48])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 15:57:30 -0700
From: Cedric Xing <cedric.xing@intel.com>
Subject: [PATCH v6 0/7] tsm-mr: Unified Measurement Register ABI for TVMs
Date: Tue, 06 May 2025 17:57:06 -0500
Message-Id: <20250506-tdx-rtmr-v6-0-ac6ff5e9d58a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKTGmgC/13OTWrDMBCG4asErasijWf001XvUbpwPKNG0NhBN
 iYl+O5VQiGql9+g50U3NUvJMqu3w00VWfOcp7EO93JQw6kfv0RnrluBATJgol74qstyLhqI0Ef
 nvEWn6vNLkZSvj9THZ92nPC9T+XmUV3u//kUsPCOr1UZHH4kHjGI7eM/jIt+vw3RW98gKDYSug
 VBhAg50ND2liHvYPSEa38CuQsJk/XFwBBD2EBtosYFYoRdOfeAYvHV7SA2EFlKFmAQCcwrE/76
 6bdsvEo/124QBAAA=
X-Change-ID: 20250209-tdx-rtmr-255479667146
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

---
Changes in v6:
- tsm-mr: Rename MR root directory name to "measurements" for improved
  clarity.
- tsm-mr: Drop @mr from the parameter list of tsm_measurements.refresh().
- tsm-mr-sample: Remove redundant debug messages following the introduction
  of tracepoints.
- tdx-guest: Split and refactor changes into 3 separate commits for easier
  review.
- Add collected "Acked-by" tags to respective commits.
- Link to v5: https://lore.kernel.org/r/20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com

Changes in v5:
- tsm-mr: Fix typo in MAINTAINERS.
- tsm-mr-sample: Fix Kconfig dependencies by adding `select VIRT_DRIVERS`.
- Link to v4: https://lore.kernel.org/r/20250414-tdx-rtmr-v4-0-7edfa8d98716@intel.com

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
Cedric Xing (7):
      tsm-mr: Add TVM Measurement Register support
      tsm-mr: Add tsm-mr sample code
      x86/tdx: Add tdx_mcall_extend_rtmr() interface
      x86/tdx: tdx_mcall_get_report0: Return -EBUSY on TDCALL_OPERAND_BUSY error
      virt: tdx-guest: Expose TDX MRs as sysfs attributes
      virt: tdx-guest: Refactor and streamline TDREPORT generation
      virt: tdx-guest: Transition to scoped_cond_guard for mutex operations

 .../testing/sysfs-devices-virtual-misc-tdx_guest   |  63 ++++++
 Documentation/driver-api/coco/index.rst            |  12 +
 .../driver-api/coco/measurement-registers.rst      |  12 +
 Documentation/driver-api/index.rst                 |   1 +
 MAINTAINERS                                        |   7 +-
 arch/x86/coco/tdx/tdx.c                            |  50 +++-
 arch/x86/include/asm/shared/tdx.h                  |   1 +
 arch/x86/include/asm/tdx.h                         |   2 +
 drivers/virt/coco/Kconfig                          |   5 +
 drivers/virt/coco/Makefile                         |   1 +
 drivers/virt/coco/tdx-guest/Kconfig                |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c            | 251 ++++++++++++++-------
 drivers/virt/coco/tsm-mr.c                         | 248 ++++++++++++++++++++
 include/linux/tsm-mr.h                             |  89 ++++++++
 include/trace/events/tsm_mr.h                      |  80 +++++++
 samples/Kconfig                                    |  11 +
 samples/Makefile                                   |   1 +
 samples/tsm-mr/Makefile                            |   2 +
 samples/tsm-mr/tsm_mr_sample.c                     | 131 +++++++++++
 19 files changed, 881 insertions(+), 87 deletions(-)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250209-tdx-rtmr-255479667146

Best regards,
-- 
Cedric Xing <cedric.xing@intel.com>

