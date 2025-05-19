Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1A1A38F9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670372; cv=none; b=QL9fCpfb9WOMb/vOylakw/oxSbrWz8IqyQnjq8YKMJTAYsaPU7WeZIv+ITByiPqpAfPQ2FhOruJcy7MaSvYipmMIzGzEtd572f4VE8pvHk0ikXGdCrMdGguRkAcI94XkvxnldPprXmr6UxEzk9X7NwKvmVIdl21zUNjafTSMjlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670372; c=relaxed/simple;
	bh=q3Yw+OBX0QTm6oPq+h1IDg4NKnRFK6FTU0+fyigY/L0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EG0yNJGeZZRXOGN0raaUE0f/GqoO7Nl9otu4H33FLGzfgCffWVPoP0HoY/s7pdSc6FdXJ/VNx/k66dtRS8t3IB5ShJtmMJXBzGs4/1nalxdtWE4A612ZwxmYwmORSRDtxViL+KwijwT5ZkHVfvv6sI5QA3C8yUbfEAzU7/iqHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=moXqK21p; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="moXqK21p"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-601470b6e93so6198284a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747670369; x=1748275169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iq8LHyv9RV/CVDgUxqSajyS8K6FiqWuTrvwgcmvX60=;
        b=moXqK21pjVsLn4NTh1tINtcojbnJavZe2Yq84WWIus8/FpDVkQfRfJnurCk2YOo+Uj
         Pe5d12H1wuEJp1GV3aIyU2nOkn6nFm2J077BvnyETaB/p+Yfb858EITGLRThCvdnOFSV
         KzERB5D5GT4wB8ME54snuVGN3TPcfVZNC0Y6eZTnQLIbJYyMdUGsG4VxlICLeyQn4F4a
         pRjvdIG096/D1SB2nJrMDvyxst0uukxJdqvyVe9uv9Q4NIT2GfYsCcJJV2NztuT5eIex
         B9CTL5c1mFvqWBGFdlrGvmE7z3Bo8aazKxESsa7RPWHdelXmTLm98pZtv6sWRwkjU7kE
         rV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670369; x=1748275169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iq8LHyv9RV/CVDgUxqSajyS8K6FiqWuTrvwgcmvX60=;
        b=MjOEe8g4RTLa//ziyOUZggwbatr8PP9I2HWq7rALmikAxPvhqpgITK/1J5GE54v4Ar
         umpdUdlyaQdiE79FYpZi0YNER+UmhmceJnYPJyQabQiFKwhFgua0Te3DVKMPMhnPkjB7
         1HLi0flaw1h0rhRni/QSmcudvOMsyIEbUF2MNb3V8m0b0bdM5WdgMY0fBuqj5cqACAoB
         MFKhV4KV0vdhq9TereRvmZ/wOK95VQXltttU6xpidf4rOIy6Zk2fvYyMcCmGIZTOtM8J
         BUsrBCX+ZM52CxNyjzm+Zlm4lJE6eBpJAUK8eI6AyaiXnymY2slJ1PT1HxIeA0uRrDTe
         IA8A==
X-Forwarded-Encrypted: i=1; AJvYcCXaZHWZkW9PdhT/Zd4fehbxSnMmyDM6P9pD8h+yJ4kkqt4yjV1r6Rx0hU978LJAhKbuGpNfm++lU6ekFxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xUsvazlAuLsu9N2W9RL8xzfd1iZuaOBN13tHE5IIi1871QH3
	H2SvD22MeN96ZCUjlpy2jmVWg1rOpIcY7tg+Q1uYZ8cc0Y+zK1cjSDjVpWd+DlPGPGehsGg6lhC
	vzekbsnWaYAsZWCL1VMbvnCKC3jwlLaENCjnbD9gE
X-Gm-Gg: ASbGncsxXz+UlN7hXRBH06Opj8vbYFxhlPP4BBGJp4yUVaBFRJmi0jP7DXlA5QKj0dX
	XuDzdiOUi03sTObfHVPAHk6x7GLbzzFJ4YGVuy/grvuBAQrkOYtb3I9XbcLkdv9XBUKuQzUbH9r
	TWoJpFeshbtuWV6u+zED2lR068nBxjhGMbbkUp+ZcTjfbILWWDQMgsFP84IT+VOkY=
X-Google-Smtp-Source: AGHT+IGHx7XYjznCA8NoWXqp8glIQFM7/slQY0nVa3dI7cbvYzCYsaMwznG/WKqMNPIcF9nk92x5mVcesT0TGEvb910=
X-Received: by 2002:a05:6402:1e90:b0:601:f4ff:c637 with SMTP id
 4fb4d7f45d1cf-601f4ffc768mr2532082a12.16.1747670368456; Mon, 19 May 2025
 08:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747349530.git.babu.moger@amd.com>
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 19 May 2025 17:59:17 +0200
X-Gm-Features: AX0GCFtpVLCPJ3bEF9V3Lsx_tKe6Jbl3hAbpo7h2eiLnTQscgwKyjo2KmUM019g
Message-ID: <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, james.morse@arm.com, dave.martin@arm.com, 
	fenghuay@nvidia.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org, 
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org, 
	ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, alexandre.chartre@oracle.com, 
	pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com, 
	perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com, 
	xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com, 
	ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com, 
	andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com, 
	gautham.shenoy@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Fri, May 16, 2025 at 12:52=E2=80=AFAM Babu Moger <babu.moger@amd.com> wr=
ote:
>
>
> This series adds the support for Assignable Bandwidth Monitoring Counters
> (ABMC). It is also called QoS RMID Pinning feature
>
> Series is written such that it is easier to support other assignable
> features supported from different vendors.
>
> The feature details are documented in the  APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC). The documentation is available at
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D206537
>
> The patches are based on top of commit
> 92a09c47464d0 (tag: v6.15-rc5, tip/irq/merge) Linux 6.15-rc5
> plus
> https://lore.kernel.org/lkml/20250515165855.31452-1-james.morse@arm.com/
>
> It is very clear these patches will go after James's resctrl FS/ARCH
> restructure. Hoping to avoid one review cycle due to the merge.
>
> # Introduction
>
> Users can create as many monitor groups as RMIDs supported by the hardwar=
e.
> However, bandwidth monitoring feature on AMD system only guarantees that
> RMIDs currently assigned to a processor will be tracked by hardware.
> The counters of any other RMIDs which are no longer being tracked will be
> reset to zero. The MBM event counters return "Unavailable" for the RMIDs
> that are not tracked by hardware. So, there can be only limited number of
> groups that can give guaranteed monitoring numbers. With ever changing
> configurations there is no way to definitely know which of these groups
> are being tracked for certain point of time. Users do not have the option
> to monitor a group or set of groups for certain period of time without
> worrying about counter being reset in between.
>
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is
> assigned.  The assigned RMID will be tracked by the hardware until the us=
er
> unassigns it manually. There is no need to worry about counters being res=
et
> during this period. Additionally, the user can specify a bitmask identify=
ing
> the specific bandwidth types from the given source to track with the coun=
ter.
>
> Without ABMC enabled, monitoring will work in current 'default' mode with=
out
> assignment option.
>
> # History
>
> Earlier implementation of ABMC had dependancy on BMEC (Bandwidth Monitori=
ng
> Event Configuration). Peter had concerns with that implementation because
> it may be not be compatible with ARM's MPAM.
>
> Here are the threads discussing the concerns and new interface to address=
 the concerns.
> https://lore.kernel.org/lkml/CALPaoCg97cLVVAcacnarp+880xjsedEWGJPXhYpy4P7=
=3Dky4MZw@mail.gmail.com/
> https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=3DkVLBzhfNo0SFqt4kQGwGS=
GVUqvr2Dg@mail.gmail.com/
>
> Here are the finalized requirements based on the discussion:
>
> *   Remove BMEC dependency on the ABMC feature.
>
> *   Eliminate global assignment listing. The interface
>     /sys/fs/resctrl/info/L3_MON/mbm_assign_control is no longer required.
>
> *   Create the configuration directories at /sys/fs/resctrl/info/L3_MON/c=
ounter_configs/.
>     The configuration file names should be free-form, allowing users to c=
reate them as needed.
>
> *   Perform assignment listing at the group level by introducing mbm_L3_a=
ssignments
>     in each monitoring group. The listing should provide the following de=
tails:
>
>     Event Configuration: Specifies the event configuration applied. This =
will be crucial
>     when "mkdir" on event configuration is added in the future, leading t=
o the creation
>     of mon_data/mon_l3_*/<event configuration>.
>
>     Domains: Identifies the domains where the configuration is applied, s=
upporting multi-domain setups.
>
>     Assignment Type: Indicates whether the assignment is Exclusive (e or =
d), Shared (s), or Unassigned (_).
>
> *   Provide option to enable or disable auto assignment when new group is=
 created.

So far I was able to reenable MBM on AMD implementations (for some
users) while deferring on the counter assignment interface discussion
by just making shared assignment the default for newly-created groups.
Until they want to upgrade assignments to exclusive or break down
traffic with multiple counters to watch a particular group more
closely, they won't need to change any assignments.

Just pointing out that this turned out to be a useful first step in
deploying ABMC support.

>
> This series tries to address all the requirements listed above.
>
> # Implementation details
>
> Create a generic interface aimed to support user space assignment of scar=
ce
> counters used for monitoring. First usage of interface is by ABMC with op=
tion
> to expand usage to "soft-ABMC" and MPAM counters in future.

I'll try to identify any issues I've encountered with "soft-ABMC".
Hopefully I'll be able to share a sample implementation based on these
patches soon.

There's now more interest in Google for allowing explicit control of
where RMIDs are assigned on Intel platforms. Even though the number of
RMIDs implemented by hardware tends to be roughly the number of
containers they want to support, they often still need to create
containers when all RMIDs have already been allocated, which is not
currently allowed. Once the container has been created and starts
running, it's no longer possible to move its threads into a monitoring
group whenever RMIDs should become available again, so it's important
for resctrl to maintain an accurate task list for a container even
when RMIDs are not available.

>
> Feature adds following interface files:
>
> /sys/fs/resctrl/info/L3_MON/mbm_assign_mode: Reports the list of assignab=
le
> monitoring features supported. The enclosed brackets indicate which
> feature is enabled.
>
> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitori=
ng
> counters available for assignment.

Earlier I discussed with Reinette[1] what num_mbm_cntrs should
represent in a "soft-ABMC" implementation where assignment is
implemented by assigning an RMID, which would result in all events
being assigned at once.

My main concern is how many "counters" you can assign by assigning
RMIDs. I recall Reinette proposed reporting the number of groups which
can be assigned separately from counters which can be assigned.

>
> /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs: Reports the number of mo=
nitoring
> counters free in each domain.
>
> /sys/fs/resctrl/info/L3_MON/counter_configs : Directory to hold the count=
er configuration.
>
> /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter =
: Default configuration
> for MBM total events.
>
> /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter =
: Default configuration
> for MBM local events.

IIUC, this needs to be implemented now so you can drop BMEC with this serie=
s?

>
> /sys/fs/resctrl/mbm_L3_assignments: Interface to list or modify assignmen=
t states on each group.
>
> # Examples
>
> a. Check if ABMC support is available
>         #mount -t resctrl resctrl /sys/fs/resctrl/
>
>         # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>         [mbm_cntr_assign]
>         default
>
>         ABMC feature is detected and it is enabled.
>
> b. Check how many ABMC counters are available.
>
>         # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>         32
>
> c. Check how many ABMC counters are available in each domain.
>
>         # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>         0=3D30;1=3D30
>
> d. Check default counter configuration.
>
>         # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes=
/event_filter
>         local_reads, remote_reads, local_non_temporal_writes, remote_non_=
temporal_writes,
>         local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_w=
rites_all
>
>         # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes=
/event_filter
>         local_reads, local_non_temporal_writes, local_reads_slow_memory
>
> e. Series adds a new interface file "mbm_L3_assignments" in each monitori=
ng group
>    to list and modify any group's monitoring states.

To confirm, would we have "mbm_<resource_name>_assignments" for each
resource where MBM-ish events could be assigned?

>
>         The list is displayed in the following format:
>
>         <Event configuration>:<Domain id>=3D<Assignment type>

For soft-ABMC assignment, is there just a single event configuration
representing all the events tracked by the RMID?

>
>         Event configuration: A valid event configuration listed in the
>         /sys/fs/resctrl/info/L3_MON/counter_configs directory.
>
>         Domain ID: A valid domain ID number.
>
>         Assignment types:
>
>         _ : No event configuration assigned
>
>         e : Event configuration assigned in exclusive mode
>
>         To list the default group states:
>         # cat /sys/fs/resctrl/mbm_L3_assignments
>         mbm_total_bytes:0=3De;1=3De
>         mbm_local_bytes:0=3De;1=3De
>
>         To unassign the configuration of mbm_total_bytes on domain 0:
>         #echo "mbm_total_bytes:0=3D_" > mbm_L3_assignments
>         #cat mbm_L3_assignments
>         mbm_total_bytes:0=3D_;1=3De
>         mbm_local_bytes:0=3De;1=3De
>
>         To unassign the mbm_total_bytes configuration on all domains:
>         $echo "mbm_total_bytes:*=3D_" > mbm_L3_assignments
>         $cat mbm_L3_assignments
>         mbm_total_bytes:0=3D_;1=3D_
>         mbm_local_bytes:0=3De;1=3De
>
>         To assign the mbm_total_bytes configuration on all domains in exc=
lusive mode:
>         $echo "mbm_total_bytes:*=3De" > mbm_L3_assignments
>         $cat mbm_L3_assignments
>         mbm_total_bytes:0=3De;1=3De
>         mbm_local_bytes:0=3De;1=3De
>
> g. Read the events mbm_total_bytes and mbm_local_bytes of the default gro=
up.
>    There is no change in reading the events with ABMC. If the event is un=
assigned
>    when reading, then the read will come back as "Unassigned".
>
>         # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
>         779247936
>         # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
>         765207488
>
> h. Check the default event configurations.
>
>         #cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/=
event_filter
>         local_reads, remote_reads, local_non_temporal_writes, remote_non_=
temporal_writes,
>         local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_w=
rites_all
>
>         #cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/=
event_filter
>         local_reads, local_non_temporal_writes, local_reads_slow_memory

These look like the BMEC event names converted from camel case. Will
event filter programming be portable?

Thanks,
-Peter


[1] https://lore.kernel.org/lkml/b3babdac-da08-4dfd-9544-47db31d574f5@intel=
.com/
