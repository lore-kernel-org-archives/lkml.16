Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52CB231A23
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742918; cv=none; b=tLOtZRf/Y3UJffUM6pVSPJMKhmOLCPajR1Flms/4zKaTzxKhNzLWbRtDQMcaV8pV0VEvA5mT/0bJR0VngLEPgkzsXf4r/ggC89BzfE1ty0gW9FgXsfqSTxmDLUQwPDQ24UyBazxLGd4yMQt2QA1PIu9dL2OhNxbwhGBLkJDEy6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742918; c=relaxed/simple;
	bh=GRRaOckWV14C5R56GzSjTz+WY7vTwquDv45YfqjFogo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImFPuFebClxlCuoQRp0+ugATPhGA0EN1DRLwx0003pVTffeE8U34JTfRupMpAroX49I7JbL24gx1tYgoQ9Atn48b063K+qQLLDYXaDiRbcqSCsmdfx1O7dBlbSY7n239yHtZocJWUu/DaegaklKyQGIYO/Qt9a6jVn3XUJg7r84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ck4MKnLr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ck4MKnLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744742916; x=1776278916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GRRaOckWV14C5R56GzSjTz+WY7vTwquDv45YfqjFogo=;
  b=ck4MKnLrg8MJBlrJr2Z6V4GRTxTJL6qvwKB79TfIrI0P/RWJadW3F2u/
   XQUwzoR6M8Yopc3ReX8W6k84Eq1AJqUDJQ8N+YmVcgslUh6ztV8XP+f13
   D/Jh94rCd/rzm9HejNJX9LnUmctwgUwrClbEny3PcYZF6fCsOFwcWqtCL
   hQ0BN5tUTnqiq/PTDPCjORvcyqOkxZ5OQ12KQDfoir1rAq7+q369a+5gu
   Mvl9HpC4iHd4Pp7GjRXpufykDd6bj7/NBGZtfs71TqXZCDfCd+XStEqR5
   p9XuOCaYVN3nFfnwAEFCnZRQCBi/54aZgB0ITa/1c4rmigEql51xoTc6K
   w==;
X-CSE-ConnectionGUID: 4MmkWVQUT3iUHAfyVKc65Q==
X-CSE-MsgGUID: 6+kSUgg5T1yPd6ZZJOqoDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57262561"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57262561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 11:48:35 -0700
X-CSE-ConnectionGUID: 6lTeCAv0TAqn67QZ3t0+Iw==
X-CSE-MsgGUID: nDr2kPCFTZuclBesbf6ywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="135375065"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 11:48:35 -0700
Date: Tue, 15 Apr 2025 11:48:33 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: James Morse <james.morse@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
Subject: Re: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Message-ID: <Z_6qASaZHG0QfpD2@agluck-desk3>
References: <20250411164229.23413-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411164229.23413-1-james.morse@arm.com>

On Fri, Apr 11, 2025 at 04:42:08PM +0000, James Morse wrote:
> Changes since v7:
>  * Switched to Tony's alternative for having a structure behind struct
>    mon_data.
> 
> Changes otherwise noted on each patch.
> 
> N.B, the disk in my machine recently died - so I've re-done the feedback
> changes multiple times. Appologies if I missed something on the second pass!
> ---
> Patch 1 has been posted as a fix that should get picked up independently.
> 
> Patches X-Y should be squashed together when merged - they are posted like

X=17 (the big move). Y=20 (last of the cleanups from the move)?

> this to allow folk to re-generate patch N, then review the differences on
> top. Not squashing them together would expose a ftrace build warning
> during bisect. (but who does that!)
> That would look like this:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v8_final

This "final" branch is missing the patch that move resctrl.rst into
Documentation/filesystems.

> This series is based on rc1, and can be retrieved from:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v8
> 
> This series renames functions and moves code around. With the
> exception of invalid configurations for the configurable-events, there should
> be no changes in behaviour caused by this series. It is now possible for
> throttle_mode to report 'undefined', but no known platform will do this.

As far as I can tell x86/Intel systems are still working as before.

> The driving pattern is to make things like struct rdtgroup private to resctrl.
> Features like pseudo-lock aren't going to work on arm64, the ability to disable
> it at compile time is added.
> 
> After this, I can start posting the MPAM driver to make use of resctrl on arm64.
> (What's MPAM? See the cover letter of the first series. [1])
> 
> As ever - bugs welcome,

Couldn't find any bugs for you.

> Thanks,
> 
> James
> 
> [v7] https://lore.kernel.org/all/20250228195913.24895-1-james.morse@arm.com/
> [v6] https://lore.kernel.org/lkml/20250207181823.6378-1-james.morse@arm.com/
> [v5] https://lore.kernel.org/r/20241004180347.19985-1-james.morse@arm.com
> [v4] https://lore.kernel.org/all/20240802172853.22529-1-james.morse@arm.com/
> [v3] https://lore.kernel.org/r/20240614150033.10454-1-james.morse@arm.com
> [v2] https://lore.kernel.org/r/20240426150537.8094-1-Dave.Martin@arm.com
> [v1] https://lore.kernel.org/r/20240321165106.31602-1-james.morse@arm.com
> [1] https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/
> 
> Amit Singh Tomar (1):
>   x86/resctrl: Remove the limit on the number of CLOSID
> 
> Dave Martin (3):
>   x86/resctrl: Squelch whitespace anomalies in resctrl core code
>   x86/resctrl: Prefer alloc(sizeof(*foo)) idiom in rdt_init_fs_context()
>   x86/resctrl: Relax some asm #includes
> 
> James Morse (17):
>   x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::name
>   x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
>   x86/resctrl: resctrl_exit() teardown resctrl but leave the mount point
>   x86/resctrl: Drop __init/__exit on assorted symbols
>   x86/resctrl: Move is_mba_sc() out of core.c
>   x86/resctrl: Add end-marker to the resctrl_event_id enum
>   x86/resctrl: Expand the width of dom_id by replacing mon_data_bits
>   x86/resctrl: Remove a newline to avoid confusing the code move script
>   x86/resctrl: Split trace.h
>   fs/resctrl: Add boiler plate for external resctrl code
>   x86/resctrl: Move the filesystem bits to headers visible to fs/resctrl
>   x86/resctrl: Always initialise rid field in rdt_resources_all[]
>   x86,fs/resctrl: Move the resctrl filesystem code to live in
>     /fs/resctrl
>   x86,fs/resctrl: Remove duplicated trace header files
>   fs/resctrl: Remove unnecessary includes
>   fs/resctrl: Change internal.h's header guard macros
>   x86,fs/resctrl: Move resctrl.rst to live under
>     Documentation/filesystems
> 
>  Documentation/arch/x86/index.rst              |    1 -
>  Documentation/filesystems/index.rst           |    1 +
>  .../{arch/x86 => filesystems}/resctrl.rst     |    0
>  MAINTAINERS                                   |    3 +-
>  arch/Kconfig                                  |    8 +
>  arch/x86/Kconfig                              |   11 +-
>  arch/x86/include/asm/resctrl.h                |    7 +-
>  arch/x86/kernel/cpu/resctrl/Makefile          |    3 +
>  arch/x86/kernel/cpu/resctrl/core.c            |   31 +-
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  635 ---
>  arch/x86/kernel/cpu/resctrl/internal.h        |  397 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c         |  909 +---
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1092 +---
>  .../resctrl/{trace.h => pseudo_lock_trace.h}  |   26 +-
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4426 +----------------
>  arch/x86/kernel/process_32.c                  |    2 +-
>  arch/x86/kernel/process_64.c                  |    2 +-
>  fs/Kconfig                                    |    1 +
>  fs/Makefile                                   |    1 +
>  fs/resctrl/Kconfig                            |   39 +
>  fs/resctrl/Makefile                           |    6 +
>  fs/resctrl/ctrlmondata.c                      |  660 +++
>  fs/resctrl/internal.h                         |  440 ++
>  fs/resctrl/monitor.c                          |  929 ++++
>  fs/resctrl/monitor_trace.h                    |   33 +
>  fs/resctrl/pseudo_lock.c                      | 1105 ++++
>  fs/resctrl/rdtgroup.c                         | 4311 ++++++++++++++++
>  include/linux/resctrl.h                       |   10 +-
>  include/linux/resctrl_types.h                 |    5 +
>  29 files changed, 7731 insertions(+), 7363 deletions(-)
>  rename Documentation/{arch/x86 => filesystems}/resctrl.rst (100%)
>  rename arch/x86/kernel/cpu/resctrl/{trace.h => pseudo_lock_trace.h} (56%)
>  create mode 100644 fs/resctrl/Kconfig
>  create mode 100644 fs/resctrl/Makefile
>  create mode 100644 fs/resctrl/ctrlmondata.c
>  create mode 100644 fs/resctrl/internal.h
>  create mode 100644 fs/resctrl/monitor.c
>  create mode 100644 fs/resctrl/monitor_trace.h
>  create mode 100644 fs/resctrl/pseudo_lock.c
>  create mode 100644 fs/resctrl/rdtgroup.c
> 
> -- 
> 2.20.1
> 
