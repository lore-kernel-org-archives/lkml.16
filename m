Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F577189B8C;
	Wed, 16 Apr 2025 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826149; cv=none; b=MJTa63I5bJucwa42yZZ1MyyEdcgl6LayudTpbyptJI6BsShCvuw+XnnZgRjFLts26mXw/a7frTnfPB+KUpfZwGREymNLzdpHeNoKasqFUrQv0vCt9g4h75pBG7hT+S3FGT0ieYc5vm2a7c3AnlsL5GsHWbH18Cxg0HzeTvt+FQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826149; c=relaxed/simple;
	bh=Z3p5BJ8ffSdliypqBwtidIpvnh1ZASg7zeZ65gQPHGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCOfzVVfPNSFKTIflMlInJ0gDVSNTT7bVJ3pdYdp5KH3nG9rd9HuW3WOicYe5v4kjNK3pG55tYSUrSg0sW8gx5ihORTs0dfBpos4w+48bII5AozNXB2QuaUDBt6o5XtTtdbCTfIVK3oD9hbga2bOFmrxg9CrABjyg+/a7mnMb6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJy+dQpR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJy+dQpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744826147; x=1776362147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3p5BJ8ffSdliypqBwtidIpvnh1ZASg7zeZ65gQPHGE=;
  b=cJy+dQpR0OSTdxhuq15D27QEjpUAfZVdnidrpSyEeJVI48f2QVyuNTtJ
   efQmz9bB5yWuE8x7kW4WwLkwhKj3jWgRMshE4AJ91YBSQqIlsOH9OsG+i
   v7NTlm7BktdogaDFY4Q+oKwKR8FPVqFwsorOeYuH66wfXzGK4AQzVYjHb
   Met82nK2C1+C2ta5TEsCBSE/x/AcLKrmGsdzebBAq/Cd8fVwijt1181eP
   aTDwWlbHvh3EzfjSLXeyX/l7AXcLnyEJFwp8+S3rL5+cWy6Nsvnfh3Pzt
   i3rrQIXWEn6FnWmyWNxr+BvBAOssx7+t3fiHis4CjRoSHoVSy7Ie0BpDE
   g==;
X-CSE-ConnectionGUID: f2/CxMHESmK3EGzyW5RpWA==
X-CSE-MsgGUID: x+1bdnNNQsKHpDyq9flzJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46312868"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46312868"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:55:47 -0700
X-CSE-ConnectionGUID: VdmzVaDKSQOlkKrj7sXJlw==
X-CSE-MsgGUID: quaNogggT/SQnWEHiN98YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="161518125"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:55:46 -0700
Date: Wed, 16 Apr 2025 10:55:44 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Moger, Babu" <babu.moger@amd.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, peternewman@google.com,
	corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
	rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
	daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
	alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
	thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
	kai.huang@intel.com, xiaoyao.li@intel.com,
	kan.liang@linux.intel.com, xin3.li@intel.com, ebiggers@google.com,
	xin@zytor.com, sohil.mehta@intel.com, andrew.cooper3@citrix.com,
	mario.limonciello@amd.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
	eranian@google.com
Subject: Re: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign
 MBM events
Message-ID: <Z__vIEObB27Rq7Le@agluck-desk3>
References: <cover.1743725907.git.babu.moger@amd.com>
 <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
 <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
 <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
 <efa7aee8-d1f3-4d15-9a6e-09b19c296e47@intel.com>
 <b8ad6ebd-405e-4ce9-99ed-1658c3b94f73@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8ad6ebd-405e-4ce9-99ed-1658c3b94f73@amd.com>

On Wed, Apr 16, 2025 at 12:09:52PM -0500, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/15/25 11:53, Reinette Chatre wrote:
> > Hi Babu,
> > 
> > On 4/15/25 7:20 AM, Moger, Babu wrote:
> >> Hi Reinette,
> >>
> >> On 4/11/25 16:04, Reinette Chatre wrote:
> >>> Hi Babu,
> >>>
> >>> On 4/3/25 5:18 PM, Babu Moger wrote:
> >>>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
> >>>> can be assigned to an RMID, event pair and monitor the bandwidth as long
> >>>> as it is assigned.
> >>>
> >>> Above makes it sound as though multiple counters can be assigned to
> >>> an RMID, event pair.
> >>>
> >>
> >> Yes. Multiple counter-ids can be assigned to RMID, event pair.
> > 
> > oh, are you referring to the assignments of different counters across multiple
> > domains?
> 
> May be I am confusing you here. This is what I meant.
> 
> Here is one example.
> 
> In a same group,
>   Configure cntr_id 0, to count reads only (This maps to total event).
>   Configure cntr_id 1, to count write only (This maps to local event).
>   Configure cntr_id 2, to count dirty victims.
>   so on..
>   so on..
>   Configure cntr_id 31, to count remote read only.
> 
> We have 32 counter ids in a domain. Basically, we can configure all the
> counters in a domain to just one group if you want to.
> 
> We cannot do that right now because our data structures cannot do that.
> We can only configure 2 events(local and total) right now.

Not just data structures, but also user visible files in
mon_data/mon_L3*/*

You'd need to create a new file for each counter.

My patch for making it easier to add more counters:

https://lore.kernel.org/all/20250407234032.241215-3-tony.luck@intel.com/

may help ... though you have to pick the number of simultaneous counters
at compile time to size the arrays in the domain structures:

	struct mbm_state	*mbm_states[QOS_NUM_MBM_EVENTS];

and if you are dynamically adding/removing events using the
configuration files, need to alloc/free the memory that those
arrays of pointers reference ... as well as adding/removing files
from the appropriate mon_data/mon_L3* directory.

> My understanding it is same with MPAM also.
> 
> > 
> >>
> >>>>
> >>>> Add the functionality to allocate and assign the counters to RMID, event
> >>>> pair in the domain.
> >>>
> >>> "assign *a* counter to an RMID, event pair"?
> >>
> >> Sure.
> >>
> >>>
> >>>>
> >>>> If all the counters are in use, the kernel will log the error message
> >>>> "Unable to allocate counter in domain" in /sys/fs/resctrl/info/
> >>>> last_cmd_status when a new assignment is requested. Exit on the first
> >>>> failure when assigning counters across all the domains.
> >>>>
> >>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
> >>>> ---
> >>>
> >>> ...
> >>>
> >>>> ---
> >>>>  arch/x86/kernel/cpu/resctrl/internal.h |   2 +
> >>>>  arch/x86/kernel/cpu/resctrl/monitor.c  | 124 +++++++++++++++++++++++++
> >>>>  2 files changed, 126 insertions(+)
> >>>>
> >>>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> >>>> index 0b73ec451d2c..1a8ac511241a 100644
> >>>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> >>>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> >>>> @@ -574,6 +574,8 @@ bool closid_allocated(unsigned int closid);
> >>>>  int resctrl_find_cleanest_closid(void);
> >>>>  void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
> >>>>  unsigned int mon_event_config_index_get(u32 evtid);
> >>>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> >>>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
> >>>
> >>> This is internal to resctrl fs. Why is it needed to provide both the event id
> >>> and the event configuration? Event configuration can be determined from event ID?
> >>
> >> Yes. It can be done. Then I have to export the functions like
> >> mbm_get_assign_config() into monitor.c. To avoid that I passed it from
> >> here which I felt much more cleaner.
> > 
> >>From what I can tell, for example by looking at patch #22, callers of
> > resctrl_assign_cntr_event() now need to call mbm_get_assign_config()
> > every time before calling resctrl_assign_cntr_event(). Calling
> > mbm_get_assign_config() from within resctrl_assign_cntr_event() seems
> > simpler to me and that may result in mbm_get_assign_config() moving to 
> > monitor.c as an extra benefit.
> 
> Sure.
> 
> > 
> > ...
> > 
> >>>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> >>>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> >>>> +{
> >>>> +	int cntr_id;
> >>>> +
> >>>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> >>>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> >>>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> >>>> +			return cntr_id;
> >>>> +	}
> >>>> +
> >>>> +	return -ENOENT;
> >>>> +}
> >>>> +
> >>>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
> >>>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> >>>> +{
> >>>> +	int cntr_id;
> >>>> +
> >>>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> >>>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
> >>>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> >>>> +			d->cntr_cfg[cntr_id].evtid = evtid;
> >>>> +			return cntr_id;
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	return -ENOSPC;
> >>>> +}
> >>>> +
> >>>> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
> >>>> +{
> >>>> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
> >>>> +}
> >>>> +
> >>>> +/*
> >>>> + * Allocate a fresh counter and configure the event if not assigned already.
> >>>> + */
> >>>> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> >>>> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
> >>>> +				     u32 evt_cfg)
> >>>
> >>> Same here, why are both evtid and evt_cfg provided as arguments? 
> >>
> >> Yes. It can be done. Then I have to export the functions like
> >> mbm_get_assign_config() into monitor.c. To avoid that I passed it from
> >> here which I felt much more cleaner.
> > 
> > Maybe even resctrl_assign_cntr_event() does not need to call mbm_get_assign_config()
> > but only resctrl_alloc_config_cntr() needs to call mbm_get_assign_config(). Doing so
> > may avoid more burden on callers while reducing parameters needed throughout.
> > 
> 
> ok. Sure. Will do.
> 
> -- 
> Thanks
> Babu Moger

-Tony
