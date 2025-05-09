Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602162900A2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789714; cv=none; b=howk1EG307wlnUWncN5TFgQzujThFrHhpgBqLNAu49sFIuJeQl1CfmgjbKI/txPr1EU31iGwAutWxnzM2vU2BeuK8J3jqVDmEkUIhCWu7ebvHGEafhCndICujnzKfxY++Hm+P/a6gK9bdNSVl/0r1ou/IfffV+YDBRCZI+rEV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789714; c=relaxed/simple;
	bh=EbQ5yeRzZgQ7jY24RZbakhEEEwoGGgvfogKc4nReYuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxnu6GrAv1MzLAanq7w6T45fBR0e+iIeCuwfA36za05gIfSCkQRcQJCUztwsQL1D+7xF0JTlXY9IRGCrMNK6F5ySszHv0iZkG14IRnwGPtz5ZQJnVnR8Ymt21DZGbLJkm2NioYV/5pOC0pIRL+VNAK5OxEl5MI7utyjejfdvRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D89C4CEEB;
	Fri,  9 May 2025 11:21:49 +0000 (UTC)
Date: Fri, 9 May 2025 12:21:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
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
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH v10 07/30] x86/resctrl: Check all domains are offline in
 resctrl_exit()
Message-ID: <aB3lS8K7I0wEkGw_@arm.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-8-james.morse@arm.com>
 <dafc0ab3-aaf7-4055-bf56-ffd5414f8895@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dafc0ab3-aaf7-4055-bf56-ffd5414f8895@intel.com>

Hi Reinette,

Thanks for the reviews.

On Thu, May 08, 2025 at 10:51:23AM -0700, Reinette Chatre wrote:
> On 5/8/25 10:18 AM, James Morse wrote:
> > diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> > index 88197afbbb8a..f617ac97758b 100644
> > --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> > +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> > @@ -4420,8 +4420,32 @@ int __init resctrl_init(void)
> >  	return ret;
> >  }
> >  
> > +static bool __exit resctrl_online_domains_exist(void)
> > +{
> > +	struct rdt_resource *r;
> > +
> > +	for_each_rdt_resource(r) {
> > +		if (!list_empty(&r->ctrl_domains) || !list_empty(&r->mon_domains))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> 
> This looks the same as before. Did you notice my comment in [1] about this list_empty() usage?

James may have missed that comment (and he's off today). Copying your
comment here:

> A list needs to be initialized for list_empty() to behave as intended. A list within
> an uninitialized or "kzalloc()'ed" struct will not be considered empty.
> resctrl_arch_get_resource() as used by for_each_rdt_resource() already establishes
> that if an architecture does not support a particular resource then it can (should?)
> return a "dummy/not-capable" resource. I do not think resctrl should require
> anything additionally like initializing the lists of a dummy/not-capable resource
> to support things like this loop.

I agree the description of the resctrl_arch_get_resource() semantics
doesn't specifically mention that the list_heads should be initialised
in dummy resources. IIUC, x86 should be safe for now since the
rdt_resources_all[] array elements have the ctrl_domains and mon_domains
list_heads initialised.

> Considering this, could this be made more specific? For example,
> 
> 	for_each_alloc_capable_rdt_resource(r) {
> 		if (!list_empty(&r->ctrl_domains))
> 			return true;
> 	}
> 
> 	for_each_mon_capable_rdt_resource(r) {
> 		if (!list_empty(&r->mon_domains))
> 			return true;
> 	}

If not-capable resources can be only partially initialised, your
proposal makes (alternatively, keep a single loop but only check
list_empty() if {mon,alloc}_capable; maybe the compiler is smart enough
to squash the two loops).

That said, if Boris plans to take this series, I don't think it's worth
a respin (assuming my understanding is correct and there are no other
issues with the series). The fix can be added subsequently on top before
other architectures gain support for resctrl (well, most likely Mon/Tue
when James is back).

Thanks.

-- 
Catalin
