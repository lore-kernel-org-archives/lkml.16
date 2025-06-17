Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1B01E8322
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146632; cv=none; b=I/Os1GmHoZmDmdwl6ypIoAtA5Y5lC9Vyd03J3BfgPjCYuoa6QW3TDwITTHaT2mk+NKvBS4QnYe4lGWMCZ+nvwoyZsgM6q1ybb3n6PDZrbEwq6M8kPDCxkt0lxvEpz57if5y4fCKhAMq8/jgsj+xovnaogHbmqLiUad7M2hRA3rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146632; c=relaxed/simple;
	bh=eHOge1YYESdChEVRQ81e9dvRuvBaFUHjNJipD5/S4I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1PnRiNeuhXxqP3zunvDbnjkNEK/eF/mVq4JeIfovNo6SV7lPqAOZfXqOyzeqg+fRP+wMrHmIJ8WyCKzZ/shbnOlCwV3u5FnCSkfiOQTlxqirdIZIjSKnKWjTbOIrRm3PqIiCEvtG0Wcy+YQcQfN68ZWlrhf1b3rSDu+LTvPyYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEc+pDMh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEc+pDMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750146631; x=1781682631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eHOge1YYESdChEVRQ81e9dvRuvBaFUHjNJipD5/S4I8=;
  b=BEc+pDMhWpslvOlT7uGGgyQMRIuWMV25smzT0GCqAuV6+5bQT95sQnjB
   Rud+6X1sjZp8wz7KmOK8rLFD5nZbJVBmoMflclFCGRgB+Po9sxPZ+YWYh
   TmIYNitouP6Qlk2NgHsisZVsG8/lNhoWnAhVeJBE5q8A1nPVlE2ud2Wbe
   NkUB0qOFyt6XXYG/fYtF3ahAWYb4G6Pniz8nHRhhw5JfBru4CtfHHdp1N
   mpxc5PElzVWcB/drbRUuZuM9IbgP0eMM+6/1lrtuBL6+m0BA/NBmGZPnw
   mWGKQ+0TSA6k9L7Wg8lLRPk+60j9laD/Of5Dk0wDlGbXC+1GQ0t0LfQ+D
   Q==;
X-CSE-ConnectionGUID: OxZWaMjuSCG94hALvszE/g==
X-CSE-MsgGUID: YXZlkXO+QrOEHKBocTkQfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63342661"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63342661"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 00:50:30 -0700
X-CSE-ConnectionGUID: L/at28KoR12ZCMNj+ACqGg==
X-CSE-MsgGUID: AkoeyM+rTAmEV/BZPsoFcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148690791"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 00:50:26 -0700
Message-ID: <2f4b817b-63d9-4a85-af73-26036f2c7c24@linux.intel.com>
Date: Tue, 17 Jun 2025 15:50:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
To: kan.liang@linux.intel.com, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org
Cc: ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250613134943.3186517-1-kan.liang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/13/2025 9:49 PM, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
>
> Starting from the Intel Ice Lake, the XMM registers can be collected in
> a PEBS record. More registers, e.g., YMM, ZMM, OPMASK, SPP and APX, will
> be added in the upcoming Architecture PEBS as well. But it requires the
> hardware support.
>
> The patch set provides a software solution to mitigate the hardware
> requirement. It utilizes the XSAVES command to retrieve the requested
> registers in the overflow handler. The feature isn't limited to the PEBS
> event or specific platforms anymore.
> The hardware solution (if available) is still preferred, since it has
> low overhead (especially with the large PEBS) and is more accurate.
>
> In theory, the solution should work for all X86 platforms. But I only
> have newer Inter platforms to test. The patch set only enable the
> feature for Intel Ice Lake and later platforms.
>
> Open:
> The new registers include YMM, ZMM, OPMASK, SSP, and APX.
> The sample_regs_user/intr has run out. A new field in the
> struct perf_event_attr is required for the registers.
> There could be several options as below for the new field.
>
> - Follow a similar format to XSAVES. Introduce the below fields to store
>   the bitmap of the registers.
>   struct perf_event_attr {
>         ...
>         __u64   sample_ext_regs_intr[2];
>         __u64   sample_ext_regs_user[2];
>         ...
>   }
>   Includes YMMH (16 bits), APX (16 bits), OPMASK (8 bits),
>            ZMMH0-15 (16 bits), H16ZMM (16 bits), SSP
>   For example, if a user wants YMM8, the perf tool needs to set the
>   corresponding bits of XMM8 and YMMH8, and reconstruct the result.
>   The method is similar to the existing method for
>   sample_regs_user/intr, and match the XSAVES format.
>   The kernel doesn't need to do extra configuration and reconstruction.
>   It's implemented in the patch set.
>
> - Similar to the above method. But the fields are the bitmap of the
>   complete registers, E.g., YMM (16 bits), APX (16 bits),
>   OPMASK (8 bits), ZMM (32 bits), SSP.
>   The kernel needs to do extra configuration and reconstruction,
>   which may brings extra overhead.
>
> - Combine the XMM, YMM, and ZMM. So all the registers can be put into
>   one u64 field.
>         ...
>         union {
>                 __u64 sample_ext_regs_intr;   //sample_ext_regs_user is simiar
>                 struct {
>                         __u32 vector_bitmap;
>                         __u32 vector_type   : 3, //0b001 XMM 0b010 YMM 0b100 ZMM
>                               apx_bitmap    : 16,
>                               opmask_bitmap : 8,
>                               ssp_bitmap    : 1,
>                               reserved      : 4,
>
>                 };
>         ...
>   For example, if the YMM8-15 is required,
>   vector_bitmap: 0x0000ff00
>   vector_type: 0x2
>   This method can save two __u64 in the struct perf_event_attr.
>   But it's not straightforward since it mixes the type and bitmap.
>   The kernel also needs to do extra configuration and reconstruction.
>
> Please let me know if there are more ideas.

+1 for method 1 or 2, and the method 2 is more preferred. 

Method 1 doesn't need to reconstruct YMM/ZMM regs in kernel space, but it
offloads the reconstructions into user space, all user space perf related
tools have to reconstruct them by themselves. Not 100% sure, but I suppose
this needs a big change for perf tools to reconstruct and show the YMM/ZMM
regs.

The cons of method 2 is that it could need to extra memory space and memory
copy if users intent to sample these overlapped regs simultaneously, like
XMM0/YMM0/ZMM0, but suppose we can add extra check in perf tools and tell
users that these regs are overlapped and just force to sample the regs with
largest bit-width. 


>
> Thanks,
> Kan
>
>
>
> Kan Liang (12):
>   perf/x86: Use x86_perf_regs in the x86 nmi handler
>   perf/x86: Setup the regs data
>   x86/fpu/xstate: Add xsaves_nmi
>   perf: Move has_extended_regs() to header file
>   perf/x86: Support XMM register for non-PEBS and REGS_USER
>   perf: Support extension of sample_regs
>   perf/x86: Add YMMH in extended regs
>   perf/x86: Add APX in extended regs
>   perf/x86: Add OPMASK in extended regs
>   perf/x86: Add ZMM in extended regs
>   perf/x86: Add SSP in extended regs
>   perf/x86/intel: Support extended registers
>
>  arch/arm/kernel/perf_regs.c           |   9 +-
>  arch/arm64/kernel/perf_regs.c         |   9 +-
>  arch/csky/kernel/perf_regs.c          |   9 +-
>  arch/loongarch/kernel/perf_regs.c     |   8 +-
>  arch/mips/kernel/perf_regs.c          |   9 +-
>  arch/powerpc/perf/perf_regs.c         |   9 +-
>  arch/riscv/kernel/perf_regs.c         |   8 +-
>  arch/s390/kernel/perf_regs.c          |   9 +-
>  arch/x86/events/core.c                | 226 ++++++++++++++++++++++++--
>  arch/x86/events/intel/core.c          |  49 ++++++
>  arch/x86/events/intel/ds.c            |  12 +-
>  arch/x86/events/perf_event.h          |  58 +++++++
>  arch/x86/include/asm/fpu/xstate.h     |   1 +
>  arch/x86/include/asm/perf_event.h     |   6 +
>  arch/x86/include/uapi/asm/perf_regs.h | 101 ++++++++++++
>  arch/x86/kernel/fpu/xstate.c          |  22 +++
>  arch/x86/kernel/perf_regs.c           |  85 +++++++++-
>  include/linux/perf_event.h            |  23 +++
>  include/linux/perf_regs.h             |  29 +++-
>  include/uapi/linux/perf_event.h       |   8 +
>  kernel/events/core.c                  |  63 +++++--
>  21 files changed, 699 insertions(+), 54 deletions(-)
>
