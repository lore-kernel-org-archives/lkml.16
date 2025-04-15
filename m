Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7B23BD0A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744103; cv=none; b=uq8DMFYS92FJrDlEj2Py0K8OTZK+XqMnrzxBzEuFK8RLD99V1MZa9ZhRKSeOw7T3d2eZkBZLvRRt4STUPgAfWZHV/KQxnX4yz363GvZoNVchoIdkUwgYu1R6gjCtvaUAaNIGvzMVsnzapMlVHwThnM/INmG6uDiTXDRgV00A3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744103; c=relaxed/simple;
	bh=LED8fU7GGAMQIu7jFL6JMgSkKOzdVrDROTASWGlrl9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC1LRtCf5vKWSBWfjbRrsynSUF3HRaxdWxL3karJtkQ2nNWlIwxaoVQXsi1MU8JTmwYclGARK1OEIKlwI94A13aH1oDIaiYrQxF0IpOG6l76TLegNdsgC7pV5BwhIVzKMk9e0IFfr1Sq6VeFk1+TaoAHVVNb+U5U9T+YLG6oL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2k6eRMy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2k6eRMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744744102; x=1776280102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LED8fU7GGAMQIu7jFL6JMgSkKOzdVrDROTASWGlrl9E=;
  b=j2k6eRMyYrAr9GD9Gj+U2axl4gLEh2i+Xy7pquTIbgfrSEWFkF0mgmqa
   IDDQSjbBVbkQTp2WC7Frdsci4n59xD6M9OCxe0PsUY8wc6ogqVD8jEQu+
   aTJECtB6edZKp4tXtH8mnerLwh5Powfw/eItkb54nuZBFNJYcEsQZMaJ1
   eyY0cihbZHkHaSKAOncJ+KEbBOiBhfY8UgG5Zj52I7xqL+ZOlWCX8ZmdP
   cntdcFMYoI8nYbkLkXVptDsV1FWF4wYiFennkENj54AzdW+//oUeTwehf
   sreA8pYojExqRHeLWK1Gxej/6kqp79g4PnU2X40MIxqzrS/lvpbwyLxEP
   A==;
X-CSE-ConnectionGUID: rWPpJbvSQImyHeSEO9T42A==
X-CSE-MsgGUID: s6JZigDTTMa4QGddNGuvkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68764036"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="68764036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 12:08:21 -0700
X-CSE-ConnectionGUID: Bgx3UWZ5RlqGOE5N5LHNxg==
X-CSE-MsgGUID: hm5W/GSsTmuIOjI7ZfIpFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="129983788"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 12:08:20 -0700
Date: Tue, 15 Apr 2025 12:08:18 -0700
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
Subject: Re: [PATCH v8 16/21] x86/resctrl: Always initialise rid field in
 rdt_resources_all[]
Message-ID: <Z_6uoqLNCXuc2COl@agluck-desk3>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-17-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411164229.23413-17-james.morse@arm.com>

On Fri, Apr 11, 2025 at 04:42:24PM +0000, James Morse wrote:
> x86 has an array, rdt_resources_all[], of all possible resources.
> The for-each-resource walkers depend on the rid field of all
> resources being initialised.
> 
> If the array ever grows due to another architecture adding a resource
> type that is not defined on x86, the for-each-resources walkers will
> loop forever.

This feels a bit weird. Having rdt_resources_all[] be a "swiss cheese"
array full of holes where other architectures defined events that aren't
supported by x86.

But it does work, so it can go in like this. But someday I may revisit
some experimental patches I did a while back that:
1) Split the rdt_resource structure into separate "ctrl" and "mon"
pieces.
2) Replaced this array with a pair of lists, one each for enabled
ctrl and mon resources.
3) Changed the resource walkers to use list_for_each*() macros.

> 
> Initialise all the rid values in resctrl_arch_late_init() before
> any for-each-resource walker can be called.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> 
> ---
> Changes since v7:
>  * Split out of a previous patch due to a botched merged conflict.
> ---
>  arch/x86/kernel/cpu/resctrl/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 58d7c6accdf2..ce684da600bc 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -60,7 +60,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
>  	[RDT_RESOURCE_L3] =
>  	{
>  		.r_resctrl = {
> -			.rid			= RDT_RESOURCE_L3,
>  			.name			= "L3",
>  			.ctrl_scope		= RESCTRL_L3_CACHE,
>  			.mon_scope		= RESCTRL_L3_CACHE,
> @@ -74,7 +73,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
>  	[RDT_RESOURCE_L2] =
>  	{
>  		.r_resctrl = {
> -			.rid			= RDT_RESOURCE_L2,
>  			.name			= "L2",
>  			.ctrl_scope		= RESCTRL_L2_CACHE,
>  			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_L2),
> @@ -86,7 +84,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
>  	[RDT_RESOURCE_MBA] =
>  	{
>  		.r_resctrl = {
> -			.rid			= RDT_RESOURCE_MBA,
>  			.name			= "MB",
>  			.ctrl_scope		= RESCTRL_L3_CACHE,
>  			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_MBA),
> @@ -96,7 +93,6 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
>  	[RDT_RESOURCE_SMBA] =
>  	{
>  		.r_resctrl = {
> -			.rid			= RDT_RESOURCE_SMBA,
>  			.name			= "SMBA",
>  			.ctrl_scope		= RESCTRL_L3_CACHE,
>  			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_SMBA),
> @@ -996,7 +992,11 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c)
>  static int __init resctrl_arch_late_init(void)
>  {
>  	struct rdt_resource *r;
> -	int state, ret;
> +	int state, ret, i;
> +
> +	/* Initialise all rid values for_each_rdt_resource() */
> +	for (i = 0; i < RDT_NUM_RESOURCES; i++)
> +		rdt_resources_all[i].r_resctrl.rid = i;
>  
>  	/*
>  	 * Initialize functions(or definitions) that are different
> -- 
> 2.20.1

-Tony
