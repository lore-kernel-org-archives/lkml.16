Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD6280A32
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404990; cv=none; b=FIqNKe8BIBjtx5qvh9YJ1Ot3MnnDF4/TMY4ToPCNd1pEhelvJJN3/SNubpgIf/7CcwjFeMKUkeJrF914mv8nFF8Uhw/HGMyzYCLFDvL0fGbKyCJnoKv9cOXMpdppY87PjPXCa2Et7mcPs1ZNosQLLvNi+TRpx039UYBQLANVe/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404990; c=relaxed/simple;
	bh=YKL3T3tyUYGe6tOxM2ayPDo6UK14hlKkWrupDrok7/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8RWlHxBYRAjidTOxtr5W9ZAvVlEsXMpILZBa78GDFAYai/X3L4Wdmv5X3Prwhlieu99L1fe9o4IW0RrECitTErY5VoQPGI/1p2Ppj2VNXGhOTUGyNP6cl9/F9SvpOM1LpBoeVCsi/0X3LsQhNH8jkSz0/TShE3ofQNvbXgGERU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afYVdVo9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afYVdVo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744404989; x=1775940989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YKL3T3tyUYGe6tOxM2ayPDo6UK14hlKkWrupDrok7/0=;
  b=afYVdVo9mr0OOEsiCAtEJirjPE0ftZ2DJSeREYkZbQ2T9KEIibDJmiMf
   xxqUomCCBgLKjKzLxRtjlDUdv2Fmk05oYHYx4gyUwgHp0yiWBkwsu8rl0
   7YD5qVMGjwlsq5me6cK1lIkHDuCncFClAGtnaKNZDf1M1quQNSqPIBPmZ
   63zIqeAsKUeBDO1LIDYWHiz0RfgqFyc9/esM1QuNG1YMPBUA/xdOjYLUx
   zdVeSQY6ZN9HzaQ46/NWjc+gV8r4OEGWS3ZE/TbY7wNcXyYpv4wF/bDFd
   AUWNdaN6cQETRrPybaffLkdNHM9vrXTw3sZyxY9Aeb8WWG2f0QwCb+wU0
   A==;
X-CSE-ConnectionGUID: uKbu/VosS/2FNfTZylnfXw==
X-CSE-MsgGUID: 0P034AnRQmO7yJCR1vv6tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45207227"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45207227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:56:28 -0700
X-CSE-ConnectionGUID: 1lGz+WPZSraSE9gxN+PeoQ==
X-CSE-MsgGUID: K2e8pJVYTzq8G3zgjifpqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="130132509"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:56:28 -0700
Date: Fri, 11 Apr 2025 13:56:26 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: Region aware RDT options for resctrl
Message-ID: <Z_mB-gmQe_LR4FWP@agluck-desk3>
References: <Z_mBcnAcGzMMvfxV@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_mBcnAcGzMMvfxV@agluck-desk3>

On Fri, Apr 11, 2025 at 01:54:12PM -0700, Luck, Tony wrote:

Add Cc: lkml

> A future CPU from Intel will implement "region aware" memory bandwidth
> monitoring and bandwidth allocation. This will provide for more granular
> monitoring and control for heterogeneous memory configurations. BIOS
> will populate an ACPI table that describes which system physical address
> ranges belong to each region. E.g. for a two socket system with both
> DDR and CXL memory regions could be assigned like this:
> 
> Region 0: Local DDR
> Region 1: Remote DDR
> Region 2: Local CXL
> Region 3: Remote CXL
> 
> Details of the ACPI tables and MMIO registers in the "Intel(R)
> Resource Director Technology Architecture Specification" here:
> https://cdrdv2.intel.com/v1/dl/getContent/789566
> 
> The existing Linux resctrl user interface will need some extensions
> to handle these new hardware monitors and controls. Here are some
> options for discussion with the goal of aligning on some user interface
> that meets now and near future needs of all architectures.
> 
> Memory bandwidth monitoring
> ---------------------------
> 
> The existing interface provides two files in each of the per-domain
> directories under "mon_data":
> 
> 	mbm_local_bytes: Count of bytes transferred to/from "local" memory
> 	mbm_total_bytes: Count of bytes transferred to/from all memory
> 
> Proposal is to provide a new file to report traffic for each region
> for however many regions are implemented on a system:
> 
> 	mbm_region_0_bytes
> 	...
> 	mbm_region_N_bytes
> 
> Potentially a compatability file:
> 
> 	mbm_total_bytes
> 
> could be included which provides data for the sum across all regions.
> 
> Providing a similar mbm_local_bytes file would be challenging as the
> BIOS controls the region numbering and it may be difficult/impossible
> for Linux to determine which regions report "local" memory traffic.
> A future implementation may allow the OS to define the region mapping
> which makes things even more complex as the mappings could be changed
> at run time.
> 
> Memory bandwidth allocation
> ---------------------------
> 
> This is more complex as there are some additional capability improvements
> in addition to providing separate controls for each region. Resctrl
> already has support to control bandwidth to "slow" memory on AMD systems
> providing separate controls for "regular" and "slow" memory in the schemata file:
> 
> 	$ cat schemata
> 	MB:  0=100;1=100
> 	SMBA:0=100;1=100
> 
> It would be tricky for resctrl to build on this for regions for the same
> reason the mbm_local_bytes would be difficult. No way for Linux to determine
> which regions are CXL vs. DDR. This approach would also lose ability to
> control local vs. remote bandwidth. Also not extensible for future memory
> configuration options.
> 
> Option 1: Per-memory regions might be described individually like this:
> 
> 	$ cat schemata
> 	RMB0:0=100;1=100
> 	RMB1:0=75;1=75
> 	RMB2:0=25;1=25
> 
> Option 2: Add to schemata per-line syntax to keep one line, but specify each region
> in some comma separated list:
> 
> 	$ cat schemata
> 	RMB:0=100,75,50,25;1=100,50,25
> 
> But there are additional capabilities that would be useful to expose that
> may influence decisions.
> 
> 1) Better than 1% throttle granularity
> 
> Existing Intel implementations provide throttle controls in 10% steps. The
> architectural enumeration allows for at best 1% steps. But this may still be
> inadequate to provide distinct controls when very high levels of throttling
> are needed for low priority workloads. The RDT architecture specification
> allows for bandwidth limits to be specified from 1 (maximum throttle) to 511
> (no throttle) though implementations may provide other ranges, e.g. 1..255.
> 
> Option 1: Specify bandwidth in schemata with floating point values
> 
> 	$ cat info/MB/min_bandwidth
> 	0.1957
> 	$ info/MB/bandwidth_gran
> 	0.1957
> 	$ cat schemata
> 	RMB0:0=100;1=100
> 	RMB1:0=0.75;1=1.25
> 
> Option 2: Change from "percentage" to some enumerated range
> 
> 	$ cat schemata
> 	RMB0:0=511;1=511
> 
> 2) Min/max ranges for bandwidth
> 
> When a single fixed value for bandwidth limits is provided, users are
> forced to be overly conservative when assigning limits in the schemata
> file in order to keep memory controllers within capacity limits. This
> can result in jobs being throttled unnecessarily at times when there is
> plenty of bandwidth capacity available.
> 
> The latest RDT architecture specification allows for setting a minimum
> and maximum bandwidth in addition to the normal limit. Example usage
> would be to set a higher maximum value for low priority jobs to allow
> them to run faster when the system has available memory bandwidth capacity.
> High priority jobs can have a minimum bandwidth setting so that when
> the system is running close to capacity limits, those jobs are not
> throttled as much (or at all) while lower priority jobs are throttled.
> 
> Syntax option:
> 
> 	$ cat schemata
> 	RMB0:0=25<50<100;1=25<50<100
> 
> Combining some of these options for new capabilities we could have:
> 
> 	$ cat schemata
> 	RMB0:0=25<50<100;1=25<50<100
> 	RMB1:0=2.5<30<40;1=2.5<30<40
> 	RMB2:0=80<90<100;1=80<90<100
> 
> -Tony
