Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B318EFD4;
	Thu, 22 May 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934469; cv=none; b=Or9EjEtBlTM1SJOQMphGau3lJ8DMRktPkwMSkdayiL/JrKOysU4SLf5ZEzCEbB/ux2U/qfeSFyry4AA6xRtlPFnf2+4xrCGNPNX7rwoLdmfgUdFaHAFykiMCVsWjyDXB9BXaiFlx8/F9Tt3rpE+4Jz49OmnPX1A/aMg+aWZoGN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934469; c=relaxed/simple;
	bh=meBhFZpR93iGhBpH25sRiAYWI/AL3rJJZhbmq7MKvFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1BmjSDSTwEgu6Veu5NIcT/sQaIqmL8skqHGvnmJCNwBqg7HPn0ZF+95RK82VHsgubXG+MSLXyq4nScuuffxHOUdqenNEptdgtHCJlrIlGJbpuxWFpP2wVFd3QxMhdSVrVwRlF0Lij2K14WPdHaMgKJdCg0GjxnhFm+wxL3j2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1BBj2FY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1BBj2FY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747934468; x=1779470468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=meBhFZpR93iGhBpH25sRiAYWI/AL3rJJZhbmq7MKvFo=;
  b=B1BBj2FYlIjaS5GIjWKjcg7olYvglRccdnq7hJOmWepR843Kpy4JxqNu
   CttlBuq03GKrSKMce26Vv5LE2KbYQopnF83ZqlBXVRRoGTGDSxSGfiZMI
   HImeTPofjQZcdbNNkuTltO08ib80DmBuAd9W+rJ+0umB0Ex0klRcef716
   5XP9+efAd/Cy7aoBzLU0jXQK+hkmKjLUY/UtuGpNWr1FEiE3QTELMPV8s
   5GabDiQI1wMXbN3aDU/JsC7xw1wxbvJdjqG7NVj30XeiCWeQJUEWN3unW
   tPb0X81DknPwL00YOl6PsFdkTIZFSw9e2fYCXXG+s3tcONhzZYv9rXBPt
   w==;
X-CSE-ConnectionGUID: vze3mEi5S52UfzrrGky6IA==
X-CSE-MsgGUID: 1HRR6CK3QuSvbHRQZ9Li8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75372025"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75372025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 10:21:06 -0700
X-CSE-ConnectionGUID: NSuJojDyQNq5mgYkId4n5g==
X-CSE-MsgGUID: 5JD9Ntu7QxKrD9ag2JWnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145852227"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 10:21:05 -0700
Date: Thu, 22 May 2025 10:21:03 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Peter Newman <peternewman@google.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
	"Moger, Babu" <bmoger@amd.com>,
	"babu.moger@amd.com" <babu.moger@amd.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"dave.martin@arm.com" <dave.martin@arm.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>,
	"alexandre.chartre@oracle.com" <alexandre.chartre@oracle.com>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"perry.yuan@amd.com" <perry.yuan@amd.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
	"Li, Xin3" <xin3.li@intel.com>,
	"ebiggers@google.com" <ebiggers@google.com>,
	"xin@zytor.com" <xin@zytor.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
	"Eranian, Stephane" <eranian@google.com>,
	"Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>,
	"gautham.shenoy@amd.com" <gautham.shenoy@amd.com>
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
Message-ID: <aC9c_29Jz4aEtRWl@agluck-desk3>
References: <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <aC5lL_qY00vd8qp4@agluck-desk3>
 <a131e8ed-88b2-4fed-983b-5deea955a9a5@intel.com>
 <SJ1PR11MB6083B627895846B8663B4805FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CALPaoCjh_NXQLtNBqei=7a6Jsr17fEnPO+kqMaNq4xNu2UPDJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALPaoCjh_NXQLtNBqei=7a6Jsr17fEnPO+kqMaNq4xNu2UPDJA@mail.gmail.com>

> > Maybe assign one of the limited supply of RMIDs for these "unmonitored"
> > tasks. Populate a resctrl group named "unmonitored" that lists all the
> > unmonitored tasks in a (read-only) "tasks" file. And supply all the counts
> > for these tasks in normal looking "mon_data" directory.
> 
> I needed to switch to an rdtgroup struct pointer rather than hardware
> IDs in the task structure to indicate group membership[1], otherwise
> it's not possible to determine which tasks are in a group when it
> doesn't have a unique HW ID value.
> 
> Also this is required for shared assignment so that changing a group's
> IDs in a domain only requires updating running tasks rather than
> needing to search the entire task list, which would lead to the same
> problem we encountered in mongroup rename[2].

Having a pointer to the rdtgroup in the task structure does make
file system operations easier. But the cost appears to be more
complexity (and memory references) in the context switch code.

Your patch[1] seems to do some extra work outside of the static_branch
protected sections. So has a cost to context switch even if resctrl
is not in use.

Chasing pointers "closid = rgrp->mon.parent->closid;" could be
expensive when those miss in the cache.

> 
> -Peter
> 
> [1] https://lore.kernel.org/lkml/20240325172707.73966-5-peternewman@google.com/
> [2] https://lore.kernel.org/lkml/CALPaoCh0SbG1+VbbgcxjubE7Cc2Pb6QqhG3NH6X=WwsNfqNjtA@mail.gmail.com/

-Tony
