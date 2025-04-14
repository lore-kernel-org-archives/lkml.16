Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31A274640
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653391; cv=none; b=aGpadAGwti5vHmvpOv/hRzhZm+IQPVLJYFlzeI2hIQfrvmE4n8XItN9o0CSpTHWXH2PQ+iKLhPjJ4/BxesVcPppwZKQQB5GDiUidn6EgVp8dQx5+pLIrQb2P1Hd/vizsD+xmqw8wkoaPbY+xTzFZRecM79sAK+syZuBI1vnGsIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653391; c=relaxed/simple;
	bh=AZK12C0Fqchmlto8qBrceDdsuvAShASuIB+dDuARDr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCZDh7FHpUpAqQ6Bp483allp6ESpeTDf2gthN/4rCkPPCjeMvHj4qVcdKG065LNBcBxZ0Ho4wWMgkekwm2/Rs4HfdTCaDQLjBpyjrZXCdE/a/e90/dCSHkz0Yc5QQrnH9C3ws+jEs/SN5ixlzvgaSwraIH0jL5p5ue3qPi2cztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mI0sWe26; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mI0sWe26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744653390; x=1776189390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AZK12C0Fqchmlto8qBrceDdsuvAShASuIB+dDuARDr0=;
  b=mI0sWe26wEEGl25sjW/NttLZksshanXrO4lrPrCulwl1XYHm3dozFlgq
   M4mGT8k0nyBP1oD+N6ItOA1zOODFNyEecNOXZHfkSgHYSxa4MoP55J7xl
   37+V1q+eAR/aG9YHYd56HG7ZwJX6g2Dk/wxn7cwPBjsen3W1ZLGBCEH/I
   M+yGeRaHSvwvJFPPF5VqDp3LeFpXpydBoqtjA86sczhlJ5UHnz1jWQQwZ
   meB+KCbclQhijZPn6qAR7UgtiurV4k3cPMjdpGsk/AhOBNloi3DhSPAdx
   JOY8ujPxUhYuM5MzxLIduEFzIp+VX2QALfEEW1TSAh1+Ngr1K7XWnMiqD
   w==;
X-CSE-ConnectionGUID: H+0PK9Q3QU6ZekXPWzdz6w==
X-CSE-MsgGUID: HoeMGylDQUCpd+FtcWbNFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56779930"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56779930"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:56:29 -0700
X-CSE-ConnectionGUID: dPwM8Y+UT8qyeKBve9u41A==
X-CSE-MsgGUID: ltLoji/CTuKkNCN7WKpCmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134941100"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:56:30 -0700
Date: Mon, 14 Apr 2025 10:56:27 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: Region aware RDT options for resctrl
Message-ID: <Z_1MS8ocgi1_LkAp@agluck-desk3>
References: <Z_mBcnAcGzMMvfxV@agluck-desk3>
 <Z_mB-gmQe_LR4FWP@agluck-desk3>
 <4bec8924-6125-45ef-a212-f123ab2e4f5b@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bec8924-6125-45ef-a212-f123ab2e4f5b@intel.com>

On Mon, Apr 14, 2025 at 10:30:18AM -0700, Reinette Chatre wrote:
> Hi Tony,
> 
> Could you please help clarify how memory regions should be viewed?
> 
> On 4/11/25 1:56 PM, Luck, Tony wrote:
> > On Fri, Apr 11, 2025 at 01:54:12PM -0700, Luck, Tony wrote:
> > 
> > Add Cc: lkml
> > 
> >> A future CPU from Intel will implement "region aware" memory bandwidth
> >> monitoring and bandwidth allocation. This will provide for more granular
> >> monitoring and control for heterogeneous memory configurations. BIOS
> >> will populate an ACPI table that describes which system physical address
> >> ranges belong to each region. E.g. for a two socket system with both
> >> DDR and CXL memory regions could be assigned like this:
> >>
> >> Region 0: Local DDR
> >> Region 1: Remote DDR
> >> Region 2: Local CXL
> >> Region 3: Remote CXL
> 
> If considering an assignment like above ...
> 
> ...
> 
> >> Option 1: Per-memory regions might be described individually like this:
> >>
> >> 	$ cat schemata
> >> 	RMB0:0=100;1=100
> >> 	RMB1:0=75;1=75
> >> 	RMB2:0=25;1=25
> >>
> 
> ... I assume "RMB0" represents "Region 0" and so forth. In this case, what do
> the "domain IDs" used in above option represent?

Measurement and control is still done at the scope of each L3 cache. So
the domain ids in the schemata file and in the names of the directories
under "mon_data" are the Linux L3 cache ids.

Here's a different example of a schemata file (with different throttle
values in all positions to make the explanation below easier):

	$ cat schemata
	RMB0:0=100;1=75
	RMB1:0=50;1=25

This is a two socket system with just two regions (DDR local and remote)

0=100	CPUs in the domain of L3 instance 0 are not throttled for
	accesses to their local DDR
1=75	CPUs in the domain of L3 instance 1 are throttled to 75% for
	accesses to their local DDR
0=50	CPUS in the domain of L3 instance 0 are throttled to 50% for
	accesses to remote DDR
1=25	CPUs in the domain of L3 instance 1 are throttled to 25% for
	accesses to remote DDR

The ACPI MRRM table describes the memory ranges in each region. Each
range has two region number associated with it. One for local access,
the other for remote access. A dump of one entry looks like this:

[0002]                       Memory Range : 0000
[0002]                             Length : 0020
[0004]                           Reserved : 00000000
[0008]                System Address Base : 0000000000000000
[0008]              System Address Length : 00000000E0000000
[0002]                 Region Valid Flags : 0003
[0001]             Static Local Region ID : 00
[0001]            Static Remote Region ID : 01
[0004]                           Reserved : 00000000

It shows that the range from 0 GB to 3.5 GB will be counted/controlled
in region 0 when accessed by a CPU where this is local memory, but as
region 1 when accessed by a CPU where this range is remote.

> 
> Thank you.
> 
> Reinette

-Tony
