Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D97482;
	Fri, 23 May 2025 21:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748034488; cv=none; b=UyhroImnkeQdCaNguq8cu0hfRQf9gzhOksTBzOCwBRhEERrzf+tUHycub/T6KqTRgNX+pOiUcFhpQUddRFXq3fs21CGWcuqrlF1E6i5HdbBaH5QRGbZRCmmFRUTqgAzeq56IaVv7nkwU4vbTM67Tl5zorQ5bW5+6+/0z10g5zNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748034488; c=relaxed/simple;
	bh=KksZrHEYvyaWSZU9uURQGptlo2FYY37CSSHT0roAn68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iy7WDUHg87McBiUi7waeFteVbG64IHBTUYXQdM0KdO8X4RiznsxEU/212sweYJRpXppcD5BvjlxadXqoXV7gV2i2zuU/Ei3txRbzVfb4LQBz0IhKsnMEvuxVGkKBJqiwie9oGaTsnNFWn8Qu3svxodkFlNn43ZBNqkCphp0pWwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzWY/B42; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzWY/B42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748034486; x=1779570486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KksZrHEYvyaWSZU9uURQGptlo2FYY37CSSHT0roAn68=;
  b=FzWY/B42RWe/RSuUut5FamHOue8mO+5jzbkMEjOxqH/s/8CA64NGXTgZ
   5kv7cmRMoRrpkDtT5ODrTMFFB7ypayL41zLDi1tfhTXPy6dOFFun0N4sz
   WH9OguNsigrJCMMTm+zG31Eky5gyS9CNaP32DDwt7boEnUmTn4pZU2xWa
   VwzfkMT588Z7bGR8lIm4gUJBiNf7sfEBNbmFLDKQIomt+8PhxutafqZi+
   ktLjhMVWRdKyYXqY2/BWXBCgb8thx2nT2USgpl97Je6X4bNAkU/EVstwx
   V7pjBUkb/t7rYnDTflCcNFWRxDI/WQeu/axzFU3Kyhc88jrt+BmdKym/u
   Q==;
X-CSE-ConnectionGUID: OzBrbmThR22h336x16WVWA==
X-CSE-MsgGUID: CH3633ePRQW/9ugh1g0/Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67659679"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="67659679"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 14:08:05 -0700
X-CSE-ConnectionGUID: uqjJ+UCwQ3iogb5NKvMMTg==
X-CSE-MsgGUID: w3Z8+MBhSNiJpU5c014p3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="172260236"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 14:08:05 -0700
Date: Fri, 23 May 2025 14:08:03 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
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
	"peternewman@google.com" <peternewman@google.com>,
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
	"Eranian, Stephane" <eranian@google.com>,
	"Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>,
	"gautham.shenoy@amd.com" <gautham.shenoy@amd.com>
Subject: Re: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Message-ID: <aDDjs4PZxeouNJr0@agluck-desk3>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
 <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Thu, May 22, 2025 at 10:16:16PM +0000, Luck, Tony wrote:
> > It looks to me as though there are a couple of changes in the telemetry work
> > that would benefit this work. https://lore.kernel.org/lkml/20250521225049.132551-2-tony.luck@intel.com/
> > switches the monitor events to be maintained in an array indexed by event ID, eliminating the
> > need for searching the evt_list that this work does in a couple of places. Also note the handy
> > new for_each_mbm_event() helper (https://lore.kernel.org/lkml/20250521225049.132551-5-tony.luck@intel.com/).
> 
> Yesterday I ran through the exercise of rebasing my AET patches on top of these
> ABMC patches in order to check whether the ABMC patches painted resctrl
> into some corner that would be hard to get back out of.
> 
> Good news: they don't.
> 
> There was a bunch of manual patching to make the first four patches fit on top
> of the ABMC code, but I also noticed a few places where things were simpler
> after combining the two series.
> 
> Maybe a good path forward would be to take those first four patches from
> my AET series and then build ABMC on top of those.

As an encouragement to try this direction, I took my four patches
on top of tip x86/cache and then applied Babu's ABMC series.

Changes to Babu's code:
1) Adapt where needed for removal of evt_list. Use event array instead.
2) Use for_each_mbm_event() [Maybe didn't get all places?]
3) Bring the s/evt_val/evt_cfg/ fix into patch 20 from 21
4) Fix fir tree declaration for resctrl_process_assign()

I don't have an AMD system to check if the ABMC parts still work. But
it does pass the resctrl self tests, so legacy isn't broken.

Patches in the "my_mbm_plus_babu_abmc" branch of my kernel.org
repo: git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git

-Tony
