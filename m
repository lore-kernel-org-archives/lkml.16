Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675921C9F1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747374803; cv=none; b=XLJ/ZasGctPcAOBTq+11jwxb1aqj8AVNmhVjxZOajz1v+X51nb8PrfNyHh7rHr9LzH0QgDSPQSACwE61OmjF3BE6hFxfS4havgcOF7N3TqNBq5Ixppan9pFd4aJ2+Vjl0Cu06vKGojuR3Obm0X9rB/yZ0LXXapMp3mDhpMxtzPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747374803; c=relaxed/simple;
	bh=BHHZ00gnZS7ihpq7dJV34WMjTuJhnhw98JEfSSkoT04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfhXecB/dGvPtJIAhOkyWaM/1CEenBsD6L91lXl1EezuG8qIh68TqXpG1n7SFy39mvC4nK0eQu0FPDFM5Y/S9MYRdVoyLcpkr5TBW7KkF7mvaqHaHEJpo6I0NeWI+RjViPCaxcHZfSpD5uGeGdMy4MJrFS2zY24c+bFRNRzQRGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eX60zNCe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eX60zNCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747374802; x=1778910802;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BHHZ00gnZS7ihpq7dJV34WMjTuJhnhw98JEfSSkoT04=;
  b=eX60zNCeaKa6JGerIjxhMOwuF/78QJRPZ/ddl96Zk/G7mA9qLz9Wj3Ve
   teGflHkYCSjRXLk0Ik0NZifiShUqqWyOZK7tOTdw9aGbWfTXft2Sm4j+9
   eOXOpQrAXTNTFaQxTT9egQKolu5CFl1Os3if/xoA10o/8eXfr2a01eJJJ
   0lSg3FxadXBGx2CzDEN3ycP8o0x7+a9wpauWTvBXBfF2E3eHe4hpifRbO
   C9oXdFCk/cxr3ATqo4NFnI4hP8jBvMw5PYbEWyp47AeaEnKtVx8JIFzpV
   asf7CwDojrNsgOFw389FeyCW1WaBi53AX8aVoAgR/PHr3G+5n/3NfNZpf
   Q==;
X-CSE-ConnectionGUID: PNMhwso6QRC403SbiSskZg==
X-CSE-MsgGUID: m2Oel/bZQFSbUf2QMUMYbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49472729"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49472729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 22:53:21 -0700
X-CSE-ConnectionGUID: C0pslPxbSbi9d38dti5owA==
X-CSE-MsgGUID: eJ/hEvDASgujbdaG5Pb2lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143826003"
Received: from hongyuni-mobl.ccr.corp.intel.com (HELO [10.124.244.46]) ([10.124.244.46])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 22:53:15 -0700
Message-ID: <2eda498e-e314-4fdd-a647-3748333e5a09@linux.intel.com>
Date: Fri, 16 May 2025 13:53:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250513171547.15194-1-james.morse@arm.com>
Content-Language: en-US
From: "Ning, Hongyu" <hongyu.ning@linux.intel.com>
In-Reply-To: <20250513171547.15194-1-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/14/2025 1:15 AM, James Morse wrote:
> Changes since v10:
>   * Changes the online domains check in patch 7 to walk control and monitor domains
>     separately.
> 
> ---
> 
> Patches 24-29 should be squashed together when merged, taking the commit message
> of patch 25. It probably makes sense to drop the tags at that point as patch 25 is
> generated by a script, and impossible to review. They are posted like this to allow
> folk to re-generate patch 25, then review the differences on top. Not squashing them
> together would expose a ftrace build warning during bisect. (but who does that!)
> 
> The result  should look like this:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v11_final
> 
> I can also post the 'final' version to be picked up if that is less work.
> 
> 
> This series is based on rc5, and can be retrieved from:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v11
> 

Hi James,

sorry for late jumping in.

I've tested this v11 patch series (also v10 from last week) based on 
Intel 5th Gen Xeon server platform, all basic resctrl functions work fine.

Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>

> With the exception of invalid configurations for the configurable-events, there
> should be no changes in behaviour caused by this series. It is now possible for
> throttle_mode to report 'undefined', but no known platform will do this.
> resctrl_exit() is now something that can be called, but x86 doesn't do this.
> 
> The driving pattern is to make things like struct rdtgroup private to resctrl.
> Features like pseudo-lock aren't going to work on arm64, the ability to disable
> it at compile time is added.
> 
> After this, I can start posting the MPAM driver to make use of resctrl on arm64.
> (What's MPAM? See the cover letter of the first series. [1])
> 
> As ever - bugs welcome,
> Thanks,
> 
> James
> 
> [v10] https://lore.kernel.org/all/20250508171858.9197-1-james.morse@arm.com
> [v9] https://lore.kernel.org/all/20250425173809.5529-1-james.morse@arm.com
> [v8] https://lore.kernel.org/all/20250411164229.23413-1-james.morse@arm.com
> [v7] https://lore.kernel.org/all/20250228195913.24895-1-james.morse@arm.com/
> [v6] https://lore.kernel.org/lkml/20250207181823.6378-1-james.morse@arm.com/
> [v5] https://lore.kernel.org/r/20241004180347.19985-1-james.morse@arm.com
> [v4] https://lore.kernel.org/all/20240802172853.22529-1-james.morse@arm.com/
> [v3] https://lore.kernel.org/r/20240614150033.10454-1-james.morse@arm.com
> [v2] https://lore.kernel.org/r/20240426150537.8094-1-Dave.Martin@arm.com
> [v1] https://lore.kernel.org/r/20240321165106.31602-1-james.morse@arm.com
> [1] https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/
> 
> 
> 
> Amit Singh Tomar (1):
>    x86/resctrl: Remove the limit on the number of CLOSID
> 
> Dave Martin (3):
>    x86/resctrl: Squelch whitespace anomalies in resctrl core code
>    x86/resctrl: Prefer alloc(sizeof(*foo)) idiom in rdt_init_fs_context()
>    x86/resctrl: Relax some asm #includes
> 
> James Morse (22):
>    x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
>    x86/resctrl: Check all domains are offline in resctrl_exit()
>    x86/resctrl: resctrl_exit() teardown resctrl but leave the mount point
>    x86/resctrl: Drop __init/__exit on assorted symbols
>    x86/resctrl: Move is_mba_sc() out of core.c
>    x86/resctrl: Add end-marker to the resctrl_event_id enum
>    x86/resctrl: Expand the width of domid by replacing mon_data_bits
>    x86/resctrl: Split trace.h
>    x86/resctrl: Add 'resctrl' to the title of the resctrl documentation
>    fs/resctrl: Add boiler plate for external resctrl code
>    x86/resctrl: Move the filesystem bits to headers visible to fs/resctrl
>    x86/resctrl: Move enum resctrl_event_id to resctrl.h
>    x86/resctrl: Fix types in resctrl_arch_mon_ctx_{alloc,free}() stubs
>    x86/resctrl: Move pseudo lock prototypes to include/linux/resctrl.h
>    x86/resctrl: Always initialise rid field in rdt_resources_all[]
>    x86/resctrl: Remove a newline to avoid confusing the code move script
>    x86,fs/resctrl: Move the resctrl filesystem code to live in
>      /fs/resctrl
>    x86,fs/resctrl: Remove duplicated trace header files
>    fs/resctrl: Remove unnecessary includes
>    fs/resctrl: Change internal.h's header guard macros
>    x86,fs/resctrl: Move resctrl.rst to live under
>      Documentation/filesystems
>    MAINTAINERS: Add reviewers for fs/resctrl
> 
> Yury Norov [NVIDIA] (4):
>    cpumask: relax cpumask_any_but()
>    find: add find_first_andnot_bit()
>    cpumask: add cpumask_{first,next}_andnot() API
>    x86/resctrl: Optimize cpumask_any_housekeeping()
> 
>   Documentation/arch/x86/index.rst              |    1 -
>   Documentation/filesystems/index.rst           |    1 +
>   .../{arch/x86 => filesystems}/resctrl.rst     |    6 +-
>   MAINTAINERS                                   |    5 +-
>   arch/Kconfig                                  |    8 +
>   arch/x86/Kconfig                              |   11 +-
>   arch/x86/include/asm/resctrl.h                |   19 +-
>   arch/x86/kernel/cpu/resctrl/Makefile          |    2 +
>   arch/x86/kernel/cpu/resctrl/core.c            |   31 +-
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  635 ---
>   arch/x86/kernel/cpu/resctrl/internal.h        |  399 +-
>   arch/x86/kernel/cpu/resctrl/monitor.c         |  918 +---
>   arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1092 +----
>   .../resctrl/{trace.h => pseudo_lock_trace.h}  |   26 +-
>   arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4164 +---------------
>   arch/x86/kernel/process_32.c                  |    2 +-
>   arch/x86/kernel/process_64.c                  |    2 +-
>   fs/Kconfig                                    |    1 +
>   fs/Makefile                                   |    1 +
>   fs/resctrl/Kconfig                            |   39 +
>   fs/resctrl/Makefile                           |    6 +
>   fs/resctrl/ctrlmondata.c                      |  661 +++
>   fs/resctrl/internal.h                         |  426 ++
>   fs/resctrl/monitor.c                          |  929 ++++
>   fs/resctrl/monitor_trace.h                    |   33 +
>   fs/resctrl/pseudo_lock.c                      | 1105 +++++
>   fs/resctrl/rdtgroup.c                         | 4353 +++++++++++++++++
>   include/linux/cpumask.h                       |   75 +-
>   include/linux/find.h                          |   25 +
>   include/linux/resctrl.h                       |   36 +-
>   include/linux/resctrl_types.h                 |   16 +-
>   lib/find_bit.c                                |   11 +
>   32 files changed, 7772 insertions(+), 7267 deletions(-)
>   rename Documentation/{arch/x86 => filesystems}/resctrl.rst (99%)
>   rename arch/x86/kernel/cpu/resctrl/{trace.h => pseudo_lock_trace.h} (56%)
>   create mode 100644 fs/resctrl/Kconfig
>   create mode 100644 fs/resctrl/Makefile
>   create mode 100644 fs/resctrl/ctrlmondata.c
>   create mode 100644 fs/resctrl/internal.h
>   create mode 100644 fs/resctrl/monitor.c
>   create mode 100644 fs/resctrl/monitor_trace.h
>   create mode 100644 fs/resctrl/pseudo_lock.c
>   create mode 100644 fs/resctrl/rdtgroup.c
> 

