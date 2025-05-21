Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5323E229;
	Wed, 21 May 2025 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747871028; cv=none; b=o/jj9Z0NNYOr66238aCa2knmItng3T8UZ4u5/QJi2Lq3fI/tBuJjiNA0X8xEdTNoMQgoDGGSQt1Nw4rLKGXB8yG8svlooRdOgAgEdllf8ZP4J19UBMU18gQtbp1zm1pLzTwCudw/LiGRHVdZ/wyyXWZvlaZnLaYi5QhaxM1G+9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747871028; c=relaxed/simple;
	bh=4B1koA9h0WMC5kCEpLY9cJl3Bkf5HrbfIBnhnfPPLWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2MPDYgUyxLdUa/9LfLcisfJtadc/W28AXky7Oux6kM0A8ILDkZP1xp2ZNyVq+w3dwjzzZxHjZiYbwUJP4T3ea1B++B7dWvsrcyAfRJENL4ImVnt/PZVlvc1ItFtCkOivUiRJUXV56syfCsjYwaIBjcWB5kdcI7CNgDmROwscS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJh2p6Ri; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJh2p6Ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747871026; x=1779407026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4B1koA9h0WMC5kCEpLY9cJl3Bkf5HrbfIBnhnfPPLWE=;
  b=YJh2p6RikchLX8cuaQtOqA6X/Kwyatzhb2kCYEF22bmSPbtESN/nM6SI
   U+xtdAfsjpUslxBGuiD+WzoT/vuNRMNu6kxekrAiLqkbtQ33Xw5nY6JPv
   9EbyPsOspAq2giTFEeFzv2e85F7T7OwpFRALgravH5ufMqjrAr9V1CFbG
   4Ud3fWmeG8gD5EEInZHNRu9Vd4HPJQcnUu/6rkF3cMBRY/JGiLkFoV8Jf
   0/lDBLiwj9zPjukv0vXWEzP7QnIP3z9KkyjijWM2z1ArgDZhG1sHf5cP9
   PhuyJNAXUQ3bZmM/aymcWQSxuM9MlBftq/Q0J4RThiz8DcH5mFbQaOZW7
   A==;
X-CSE-ConnectionGUID: 3M516FdnQ0e4ma0xcrou8w==
X-CSE-MsgGUID: T5Ic7+HRTceIWE3B1jcpAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67430813"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="67430813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:43:46 -0700
X-CSE-ConnectionGUID: WaySK+hXRKSARcQotf3PXw==
X-CSE-MsgGUID: 1ldfND80TjGKMfA+wyQwRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="177468506"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:43:44 -0700
Date: Wed, 21 May 2025 16:43:43 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Peter Newman <peternewman@google.com>, "Moger, Babu" <bmoger@amd.com>,
	babu.moger@amd.com, corbet@lwn.net, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
	x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
	ardb@kernel.org, gregkh@linuxfoundation.org,
	daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
	alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
	thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
	kai.huang@intel.com, xiaoyao.li@intel.com,
	kan.liang@linux.intel.com, xin3.li@intel.com, ebiggers@google.com,
	xin@zytor.com, sohil.mehta@intel.com, andrew.cooper3@citrix.com,
	mario.limonciello@amd.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
	eranian@google.com, Xiaojian.Du@amd.com, gautham.shenoy@amd.com
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
Message-ID: <aC5lL_qY00vd8qp4@agluck-desk3>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>

On Wed, May 21, 2025 at 04:03:37PM -0700, Reinette Chatre wrote:
> Hi Peter and Babu,
> 
> On 5/21/25 2:18 AM, Peter Newman wrote:
> > Hi Babu/Reinette,
> > 
> > On Wed, May 21, 2025 at 1:44 AM Reinette Chatre
> > <reinette.chatre@intel.com> wrote:
> >>
> >> Hi Babu,
> >>
> >> On 5/20/25 4:25 PM, Moger, Babu wrote:
> >>> Hi Reinette,
> >>>
> >>> On 5/20/2025 1:23 PM, Reinette Chatre wrote:
> >>>> Hi Babu,
> >>>>
> >>>> On 5/20/25 10:51 AM, Moger, Babu wrote:
> >>>>> Hi Reinette,
> >>>>>
> >>>>> On 5/20/25 11:06, Reinette Chatre wrote:
> >>>>>> Hi Babu,
> >>>>>>
> >>>>>> On 5/20/25 8:28 AM, Moger, Babu wrote:
> >>>>>>> On 5/19/25 10:59, Peter Newman wrote:
> >>>>>>>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
> >>>>>>
> >>>>>> ...
> >>>>>>
> >>>>>>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
> >>>>>>>>> counters available for assignment.
> >>>>>>>>
> >>>>>>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
> >>>>>>>> represent in a "soft-ABMC" implementation where assignment is
> >>>>>>>> implemented by assigning an RMID, which would result in all events
> >>>>>>>> being assigned at once.
> >>>>>>>>
> >>>>>>>> My main concern is how many "counters" you can assign by assigning
> >>>>>>>> RMIDs. I recall Reinette proposed reporting the number of groups which
> >>>>>>>> can be assigned separately from counters which can be assigned.
> >>>>>>>
> >>>>>>> More context may be needed here. Currently, num_mbm_cntrs indicates the
> >>>>>>> number of counters available per domain, which is 32.
> >>>>>>>
> >>>>>>> At the moment, we can assign 2 counters to each group, meaning each RMID
> >>>>>>> can be associated with 2 hardware counters. In theory, it's possible to
> >>>>>>> assign all 32 hardware counters to a group—allowing one RMID to be linked
> >>>>>>> with up to 32 counters. However, we currently lack the interface to
> >>>>>>> support that level of assignment.
> >>>>>>>
> >>>>>>> For now, the plan is to support basic assignment and expand functionality
> >>>>>>> later once we have the necessary data structure and requirements.
> >>>>>>
> >>>>>> Looks like some requirements did not make it into this implementation.
> >>>>>> Do you recall the discussion that resulted in you writing [2]? Looks like
> >>>>>> there is a question to Peter in there on how to determine how many "counters"
> >>>>>> are available in soft-ABMC. I interpreted [3] at that time to mean that this
> >>>>>> information would be available in a future AMD publication.
> >>>>>
> >>>>> We already have a method to determine the number of counters in soft-ABMC
> >>>>> mode, which Peter has addressed [4].
> >>>>>
> >>>>> [4]
> >>>>> https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@google.com/
> >>>>>
> >>>>> This appears to be more of a workaround, and I doubt it will be included
> >>>>> in any official AMD documentation. Additionally, the long-term direction
> >>>>> is moving towards ABMC.
> >>>>>
> >>>>> I don’t believe this workaround needs to be part of the current series. It
> >>>>> can be added later when soft-ABMC is implemented.
> >>>>
> >>>> Agreed. What about the plans described in [2]? (Thanks to Peter for
> >>>> catching this!).
> >>>>
> >>>> It is important to keep track of requirements while working on a feature to
> >>>> ensure that the implementation supports the planned use cases. Re-reading that
> >>>> thread it is not clear to me how soft-ABMC's per-group assignment would look.
> >>>> Could you please share how you see it progress from this implementation?
> >>>> This includes the single event vs. multiple event assignment. I would like to
> >>>> highlight that this is not a request for this to be supported in this implementation
> >>>> but there needs to be a plan for how this can be supported on top of interfaces
> >>>> established by this work.
> >>>>
> >>>
> >>> Here’s my current understanding of soft-ABMC. Peter may have a more in-depth perspective on this.
> >>>
> >>> Soft-ABMC:
> >>> a. num_mbm_cntrs: This is a software-defined limit based on the number of active RMIDs that can be supported. The value can be obtained using the code referenced in [4].
> > 
> > I would call it a hardware-defined limit that can be probed by software.
> > 
> > The main question is whether this file returns the exact number of
> > RMIDs hardware can track or double that number (mbm_total_bytes +
> > mbm_local_bytes) so that the value is always measured in events.
> 
> tl;dr: I continue [3] to find it most intuitive for num_mbm_cntrs to be the exact
> number of "active" RMIDs that the system can support *and* changing the name of
> the modes to help user interpret num_mbm_cntrs: "mbm_cntr_event_assign" for ABMC,
> "mbm_cntr_group_assign" for soft-ABMC.
> 
> details
> -------
> 
> We are now back to the previous discussion about what user can expect from
> the interface. Let me try and re-cap that discussion so that we can all hopefully
> get back on the same page. Please add corrections/updates where needed.
> 
> soft-ABMC
> ---------
>   soft-ABMC manages "active" (term TBD) RMID assignment to monitor groups. When an
>   "active" RMID is assigned to a monitor group then *all* MBM events (not LLC occupancy)
>   in that monitor group are counted. "Active" RMID assignment can be done per domain.
> 
>   Requirement: resctrl should accurately reflect which events are counted. That is,
>   we do not want resctrl to pretend to allow user to assign an "active" RMID to
>   only one event in a monitor group while all events are actually counted.
> 
>   Caveat: To support rapid re-assignment of RMIDs to monitor groups, llc_occupancy
>   event is disabled when soft-ABMC is enabled.
> 
> ABMC
> ----
>   ABMC manages (hardware) counter assignment to monitor group (RMID), event pairs.
>   When a hardware counter is assigned to an RMID, event pair then only that
>   RMID, event is counted. Hardware counter assignment can be done per domain.
> 
> 
> shared assignment
> -----------------
> A shared assignment applies to both soft-ABMC and ABMC. A user can designate a
> "counter" (could be hardware counter or "active" RMID) as shared and that means
> the counter within that domain is shared between different monitor groups and actual
> assignment is scheduled by resctrl.  
> 
> 
> user interface
> --------------
> 
> Next, consider the interface while keeping above definitions and requirements in mind.
> 
> This series introduces (using implementation, not cover-letter):
> 
> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
> "num_mbm_cntrs":                                                               
> 	The maximum number of monitoring counters (total of available and assigned
> 	counters) in each domain when the system supports mbm_cntr_assign mode. 
> 
> /sys/fs/resctrl/mbm_L3_assignments
> "mbm_L3_assignments":                                                          
> 	This interface file is created when the mbm_cntr_assign mode is supported
> 	and shows the assignment status for each group.              
> 
> Consider "mbm_L3_assignments" first. The interface is documented for ABMC support
> where it is possible to manage individual event assignment within monitor group.
> 
> For ABMC it is possible to assign just one event at a time and doing so consumes
> one counter in that domain:
> 
> a) Starting state on system with 32 counters per domain, two events in default
>    resource group consumes two counters in that domain:
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=30;1=32
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=_
> mbm_local_bytes:0=e;1=_
> 
> b) Assign counter to mbm_local_bytes in domain 1:
> # echo "mbm_local_bytes:1=e" > /sys/fs/resctrl/mbm_L3_assignments
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=_
> mbm_local_bytes:0=e;1=e
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=30;1=31
> 
> The question is how this should look on soft-ABMC system. Let's say hypothetically
> that on a soft-ABMC system it is possible to have 32 "active" RMIDs.
> 
> a) Starting state on system with 32 "active RMIDs" per domain, two events in default
>    resource group consumes one RMID in that domain:
> 
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=_
> mbm_local_bytes:0=e;1=_
> 
> What should num_mbm_cntrs display?
> 
> Option A (counters are RMIDs):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=31;1=32
> 
> Option B (pretend RMIDs are events):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=62;1=64
> 
> b) Assign counter to mbm_local_bytes in domain 1:
> # echo "mbm_local_bytes:1=e" > /sys/fs/resctrl/mbm_L3_assignments
> # cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=e
> mbm_local_bytes:0=e;1=e
> 
> Note that even though user requested only mbm_local_bytes to be assigned, it
> actually results in both mbm_total_bytes and mbm_local_bytes to be assigned. This
> ensures accurate state representation to user space but this also creates an
> inconsistent user interface between soft-ABMC and ABMC since user space intends
> to use the same interface but "sometimes" assigning one event results in assign
> of one event while "sometimes" it results in assign of multiple events.
> 
> wrt "num_mbm_cntrs"
> 
> Option A (counters are RMIDs):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=31;1=31
> 
> Option B (pretend RMIDs are events):
> # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> 0=62;1=62 
> 
> Neither option seems ideal to me since the interface cannot be consistent
> between ABMC and soft-ABMC.
> As I mentioned in [2] it is not possible to hide ABMC and soft-ABMC behind
> the same interface. When user space wants to monitor a particular monitor group
> then it should be clear how that can be accomplished. Not knowing if
> an assignment/unassignment to/from an event would impact one or all events
> and whether it will consume one or multiple counters does not sound like a good
> interface to me. 
> 
> As I understand current interface, user is required to know how ABMC and soft-ABMC
> is implemented to be able to configure the system. For example, if user has file like:
> 	# cat /sys/fs/resctrl/mbm_L3_assignments
> 	mbm_total_bytes:0=e;1=e
> 	mbm_local_bytes:0=e;1=e
> user must know underlying implementation to be able to manage monitoring of
> events and assigning counters otherwise it will be a surprise to lose monitoring
> of all events when unassigning one event.
> 
> This is why I proposed in [3] that the name of the mode reflects how user can interact
> with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
> that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
> make it clear what the system is capable of wrt counter assignments.
> 
> Considering this the interface should be clear:
> num_mbm_cntrs: reflects the number of counters in each domain that can be assigned. In
> "mbm_cntr_event_assign" this will be the number of counters that can be assigned to 
> each event within a monitoring group, in "mbm_cntr_group_assign" this will be the number
> of counters that can be assigned to entire monitoring groups impacting all MBM events.
> 
> mbm_L3_assignments: manages the counter assignment in each group. When user knows the mode
> is "mbm_cntr_event_assign"/"mbm_cntr_group_assign" then it should be clear to user space how the
> interface behaves wrt assignment, no surprises of multiple events impacted when
> assigning/unassigning single event.
> 
> For soft-ABMC I thus find it most intuitive for num_mbm_cntrs to be the exact number
> of "active" RMIDs that the system can support *and* changing the name of the modes
> to help user interpret num_mbm_cntrs.
> 
> > 
> > There's also the mongroup-RMID overcommit use case I described
> > above[1]. On Intel we can safely assume that there are counters to
> > back all RMIDs, so num_mbm_cntrs would be calculated directly from
> > num_rmids.
> 
> This is about the:
> 	There's now more interest in Google for allowing explicit control of
> 	where RMIDs are assigned on Intel platforms. Even though the number of
> 	RMIDs implemented by hardware tends to be roughly the number of
> 	containers they want to support, they often still need to create
> 	containers when all RMIDs have already been allocated, which is not
> 	currently allowed. Once the container has been created and starts
> 	running, it's no longer possible to move its threads into a monitoring
> 	group whenever RMIDs should become available again, so it's important
> 	for resctrl to maintain an accurate task list for a container even
> 	when RMIDs are not available.
> 
> I see a monitor group as a collection of tasks that need to be monitored together.
> The "task list" is the group of tasks that share a monitoring ID that
> is required to be a valid ID since when any of the tasks are scheduled that ID is
> written to the hardware. I intentionally tried to not use RMID since I believe
> this is required for all archs.
> I thus do not understand how a task can start running when it does not have
> a valid monitoring ID. The idea of "deferred assignment" is not clear to me,
> there can never be "unmonitored tasks", no? I think I am missing something here.

In the AMD/RMID implemenentation this might be achieved with something
extra in the task structure to denote whether a task is in a monitored
group or not. E.g. We add "task->rmid_valid" as well as "task->rmid".
Tasks in an unmonitored group retain their "task->rmid" (that's what
identifies them as a member of a group) but have task->rmid_valid set
to false.  Context switch code would be updated to load "0" into the
IA32_PQR_ASSOC.RMID field for tasks without a valid RMID. So they
would still be monitored, but activity would be bundled with all
tasks in the default resctrl group.

Presumably something analogous could be done for ARM/MPAM.

> > I realized this use case is more difficult to implement on MPAM,
> > because a PARTID is effectively a CLOSID+RMID, so deferring assigning
> > a unique PARTID to a group also results in it being in a different
> > allocation group. It will work if the unmonitored groups could find a
> > way to share PARTIDs, but this has consequences on allocation - but
> > hopefully no worse than sharing CLOSIDs on x86.
> > 
> > There's a lot of interest in monitoring ID overcommit in Google, so I
> > think it's worth it for me to investigate the additional structural
> > changes needed in resctrl (i.e., breaking the FS-level association
> > between mongroups and HW monitoring IDs). Such a framework could be a
> > better fit for soft-ABMC. For example, if overcommit is allowed, we
> > would just report the number of simultaneous RMIDs we were able to
> > probe as num_rmids. I would want the same shared assignment scheduler
> > to be able to work with RMIDs and counters, though.
> > 
> > Thanks,
> > -Peter
> > 
> > [1] https://lore.kernel.org/lkml/CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com/
> 
> Reinette
> 
> [2] https://lore.kernel.org/lkml/b9e48e8f-3035-4a7e-a983-ce829bd9215a@intel.com/
> [3] https://lore.kernel.org/lkml/b3babdac-da08-4dfd-9544-47db31d574f5@intel.com/

-Tony
