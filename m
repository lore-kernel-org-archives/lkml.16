Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEDE1A23A0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298382; cv=none; b=Wll5ec1te1lDFHyQlGYNAMAP8sk3mq58ao0B3Ps72WSsaWi6LcCuMtKxQbIzF/mkmhYOgI0w4eqokeo87bbLI7h6WLkNwim3d0O0ePtJ8DHvWJK0Mks8zTew9cbOvRrbffZHt77/1rsUNJGyNKyeh2RcwzQdP3/zKDqnsUjA7BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298382; c=relaxed/simple;
	bh=fsuoFyrEyrIg9K1H9ClrNFl/H1zpx/Ny01zBJqEez6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3qTBm0ZB6PPzmGGGsqMJMX/sVjuSW1UZqWVRnJZv8WEoI/GvwZBpTF/J5evr+V2uLlT/DuevsIpctit52EhI8lGMR8+b8zyXE9VWgjVc7cjzX5V+2J4pU6ocK3RncFWi/cMcFcc24V+CsX1mPMXjHJb1ZskUCi2HWaNHnV6DeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmdy0K6v; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmdy0K6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747298382; x=1778834382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fsuoFyrEyrIg9K1H9ClrNFl/H1zpx/Ny01zBJqEez6M=;
  b=kmdy0K6vmiPgAeT1FOBhC4w8Q2sDlMdww2gKLXOJSbe0IqPito1xBNjn
   7g6+Tk64CWVycSkSOJl+iuoe5fhDHXNJU2d9Ut6vyxjbyh4z5jCoJylXP
   YEoahuXbheAdGGwDIGvq+t2f052OkIh3tThFr9xw1uzpmKA9/763BaPCM
   QtUJF+kbEkjiJ/10s1O1ijbS5bQEC5SGCWyQvcItvHkqqUzQhhgajbQao
   ijBM03zjsEFa9drHvqHXZewyxf9E/eMXmnd+DloryujqN6eQzs12bBu4K
   9MdBBPO+R0whKf2koiqcjucx8W9HnHyNWN1AzBB0LjMWwQZgjw/6WGhlu
   A==;
X-CSE-ConnectionGUID: yQfd4AHQQXq/Fo/POj5yCg==
X-CSE-MsgGUID: 5zBBkE1zTWKWVCnIfyA70g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49383194"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="49383194"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:39:41 -0700
X-CSE-ConnectionGUID: PdRe44tZT1uby4AsNeVZJg==
X-CSE-MsgGUID: IhovUxxXRDifKKG2Lz7wzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="143495637"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO himmelriiki) ([10.245.244.110])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:39:35 -0700
Date: Thu, 15 May 2025 11:39:25 +0300
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Guorui Yu <guorui.yu@linux.alibaba.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dan Middleton <dan.middleton@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v6 0/7] tsm-mr: Unified Measurement Register ABI for TVMs
Message-ID: <aCWoPWMjg9rX2qPl@himmelriiki>
References: <20250506-tdx-rtmr-v6-0-ac6ff5e9d58a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-tdx-rtmr-v6-0-ac6ff5e9d58a@intel.com>

Hi,

On Tue, May 06, 2025 at 05:57:06PM -0500, Cedric Xing wrote:
> NOTE: This patch series introduces the Measurement Register (MR) ABI, and
> is a continuation of the RFC series on the same topic [1].
> 
> Introduce the CONFIG_TSM_MEASUREMENTS helper library (tsm-mr) as a
> cross-vendor transport schema to allow TVM (TEE VM) guest drivers to export
> CC (Confidential Compute) architecture-specific MRs (Measurement Registers)
> as sysfs attributes/files. Enable applications to read, write/extend MRs
> like regular files, supporting various usages such as configuration
> verification (e.g., verify a TVM's configuration against digests stored in
> static/immutable MRs like MRCONFIGID on TDX or HOSTDATA on SEV) and runtime
> measurements (e.g., extend the measurement of a container image to an RTMR
> before running it).
> 
> Patches included in this series:
> 
> - Patch 1 adds the tsm-mr library to help TVM guest drivers exposing MRs as
>   sysfs attributes.
> - Patch 2 provides a sample module demonstrating the usage of the new
>   tsm-mr library.
> - The remaining patches update the TDX guest driver to expose TDX MRs with
>   the help of the tsm-mr library.
> 
> [1]: https://lore.kernel.org/linux-coco/20241210-tsm-rtmr-v3-0-5997d4dbda73@intel.com/

I ran some TDX RTMR extend tests with this series and everything works
as expected, so:

Tested-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>

> 
> ---
> Changes in v6:
> - tsm-mr: Rename MR root directory name to "measurements" for improved
>   clarity.
> - tsm-mr: Drop @mr from the parameter list of tsm_measurements.refresh().
> - tsm-mr-sample: Remove redundant debug messages following the introduction
>   of tracepoints.
> - tdx-guest: Split and refactor changes into 3 separate commits for easier
>   review.
> - Add collected "Acked-by" tags to respective commits.
> - Link to v5: https://lore.kernel.org/r/20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com
> 
> Changes in v5:
> - tsm-mr: Fix typo in MAINTAINERS.
> - tsm-mr-sample: Fix Kconfig dependencies by adding `select VIRT_DRIVERS`.
> - Link to v4: https://lore.kernel.org/r/20250414-tdx-rtmr-v4-0-7edfa8d98716@intel.com
> 
> Changes in v4:
> - tsm-mr: Add details to ABI doc.
> - tsm-mr: Add driver-api doc.
> - tsm-mr: Add tracepoints.
> - tsm-mr: Use the constant string "mr" as the group/directory name for MR
>   sysfs attributes.
> - x86/tdx: Revise error codes returned by tdx_mcall_* functions.
> - tdx-guest: Merge all TDREPORT code paths into a common function.
> - Link to v3: https://lore.kernel.org/r/20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com
> 
> Changes in v3:
> - tsm-mr: Separate measurement support (tsm-mr) from the original tsm
>   source code. Modules depending on tsm-mr should `select TSM_MEASUREMENTS`
>   in Kconfig. (Dan Williams)
> - tsm-mr: Revise tsm-mr APIs to allow callers to decide where to host the
>   MR attributes in sysfs.
> - tsm-mr: Drop TSM_MR_F_EXTENSIBLE and route all "write" requests to the CC
>   guest driver, which decides how to handle writes (e.g., by extending the
>   buffer on input to the specified MR).
> - tsm-mr: Update the naming pattern for MR attributes from
>   MRNAME/HASH/digest to MRNAME:HASH.
> - tsm-mr: Drop TSM_MR_MAXBANKS kernel config.
> - x86/tdx: Return -EBUSY from tdx_mcall_get_report0 on TDCALL_OPERAND_BUSY
>   error.
> - tdx-guest: Move MR attributes from /sys/kernel/tsm/tdx/ to
>   /sys/class/misc/tdx_guest/ because MR names are architecture-specific, so
>   their attributes should reside in an architecture-specific location.
> - tdx-guest: Remove hash from `mrconfigid`, `mrowner`, `mrownerconfig`.
> - tdx-guest: Remove `servtd_hash`, `report0`, and `reportdata`.
> - Link to v2: https://lore.kernel.org/r/20250223-tdx-rtmr-v2-0-f2d85b0a5f94@intel.com
> 
> Changes in v2:
> - Added TSM_MR_MAXBANKS Kconfig option
> - Updated Kconfig dependency for TSM_REPORTS
> - Updated comments in include/linux/tsm.h
> - Updated drivers/virt/coco/tdx-guest/tdx-guest.c to use `IS_BUILTIN()` for
>   determining if static buffer addresses can be converted to GPAs by
>   `virt_to_phys()`
> - Renamed function `tdx_mcall_rtmr_extend()` -> `tdx_mcall_extend_rtmr()`
> - Link to v1: https://lore.kernel.org/r/20250212-tdx-rtmr-v1-0-9795dc49e132@intel.com
> 
> ---
> Cedric Xing (7):
>       tsm-mr: Add TVM Measurement Register support
>       tsm-mr: Add tsm-mr sample code
>       x86/tdx: Add tdx_mcall_extend_rtmr() interface
>       x86/tdx: tdx_mcall_get_report0: Return -EBUSY on TDCALL_OPERAND_BUSY error
>       virt: tdx-guest: Expose TDX MRs as sysfs attributes
>       virt: tdx-guest: Refactor and streamline TDREPORT generation
>       virt: tdx-guest: Transition to scoped_cond_guard for mutex operations
> 
>  .../testing/sysfs-devices-virtual-misc-tdx_guest   |  63 ++++++
>  Documentation/driver-api/coco/index.rst            |  12 +
>  .../driver-api/coco/measurement-registers.rst      |  12 +
>  Documentation/driver-api/index.rst                 |   1 +
>  MAINTAINERS                                        |   7 +-
>  arch/x86/coco/tdx/tdx.c                            |  50 +++-
>  arch/x86/include/asm/shared/tdx.h                  |   1 +
>  arch/x86/include/asm/tdx.h                         |   2 +
>  drivers/virt/coco/Kconfig                          |   5 +
>  drivers/virt/coco/Makefile                         |   1 +
>  drivers/virt/coco/tdx-guest/Kconfig                |   1 +
>  drivers/virt/coco/tdx-guest/tdx-guest.c            | 251 ++++++++++++++-------
>  drivers/virt/coco/tsm-mr.c                         | 248 ++++++++++++++++++++
>  include/linux/tsm-mr.h                             |  89 ++++++++
>  include/trace/events/tsm_mr.h                      |  80 +++++++
>  samples/Kconfig                                    |  11 +
>  samples/Makefile                                   |   1 +
>  samples/tsm-mr/Makefile                            |   2 +
>  samples/tsm-mr/tsm_mr_sample.c                     | 131 +++++++++++
>  19 files changed, 881 insertions(+), 87 deletions(-)
> ---
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> change-id: 20250209-tdx-rtmr-255479667146
> 
> Best regards,
> -- 
> Cedric Xing <cedric.xing@intel.com>
>

-- Regards, Mikko
