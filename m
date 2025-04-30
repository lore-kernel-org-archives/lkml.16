Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562325B670
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746021273; cv=none; b=IS9nucD7qbUddbu41QNd6Qk6ltYj4zY6botVhP+t5WDPavOF9y+kKSszhAJUL5XSBpFap940n/P7bopqlrWemR0y01Ilq+URcR97XK8tEuFQ63jEXzeoJ8rZ+vlf15JSTRyzuD3ZyEUNYqE0qyGfsag0vSgs/NTnfoJg48eQqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746021273; c=relaxed/simple;
	bh=+GJ+mcytht5RHFH5sFNK2hh3cx3cNAAJFcvtzh/Ue+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htj6ElLekUNL18bCqjVoApihnIh8R61XBb8RJ8txAN6EibsRAsOyBw0s+gSZMSWC7mpqgjBue9UxGeXAhmE9jpJQLcUXKx+svTmz4TeZQD/0pjQeAPcobrrpglJcAfL1Ekx/hLUczTEp+yYByJwV0HH+ChGxf0BqXJFNswMs9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7IGLlDy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7IGLlDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746021272; x=1777557272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+GJ+mcytht5RHFH5sFNK2hh3cx3cNAAJFcvtzh/Ue+c=;
  b=A7IGLlDyy7SwFxG+wTqr0yndrcsGwp3peYpvmKeEfrnsRsuXJLK3JW5s
   MIUAGJ5bxBxG6ba8ylWkDn/+EIiRBbtE7UWA9DDQ0iroh8bhopSPcvV5Z
   RTYhYaE4JiULAVIGGOqPH7DdIKlv5Ll4GGLzWi+Pws+tYbMrAc1Q+Zee8
   3SrJeDqTGkfOL6rgKB/S/34bel0OSJN4mqedEdfZNyzQ/sUNhyiSdTlsT
   EZrQV2UzOb5ePexWuWJuot7GHBkvu5Wf3Y3UXyHBUTnvAZdyEhuO+9fB0
   I7hBaWIfNDVgaDOlERjswtOuGMQL/aRsn1SZBGdmlNkaxAsxt42Uehndh
   w==;
X-CSE-ConnectionGUID: dAjUob9JQnWagefplPEBuQ==
X-CSE-MsgGUID: 522AZxeFRC6xMAYYnIgpZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="46797780"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="46797780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 06:54:31 -0700
X-CSE-ConnectionGUID: ShR5iyuYRPaeh23kF7+0FQ==
X-CSE-MsgGUID: dhgYcC0PRJKaHJGlgc06jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134073500"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 06:54:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id D43B69F; Wed, 30 Apr 2025 16:54:26 +0300 (EEST)
Date: Wed, 30 Apr 2025 16:54:26 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Miao, Jun" <jun.miao@intel.com>
Cc: "Li, Zhiquan1" <zhiquan1.li@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "Du, Fan" <fan.du@intel.com>
Subject: Re: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
Message-ID: <fpu3a5x5zhvm7n6sus5533bnub6ynf6lwvsibxhxoozeoeitxu@5vd7k75x4pzw>
References: <20250429143114.1724280-1-jun.miao@intel.com>
 <20250429143114.1724280-2-jun.miao@intel.com>
 <b138cb84-3a34-40b3-a23d-6ff3708dae6b@intel.com>
 <a0676c7b-9e6d-4af4-87d5-f822ab247730@intel.com>
 <sdczrx3z55vbf4jxbedjpccpdmz7h7ukhhiwrwblpozwyrqssv@ljszzrxvgoxr>
 <PH7PR11MB8455BCD71320C0C081C29AEB9A832@PH7PR11MB8455.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB8455BCD71320C0C081C29AEB9A832@PH7PR11MB8455.namprd11.prod.outlook.com>

On Wed, Apr 30, 2025 at 11:10:32AM +0000, Miao, Jun wrote:
> >
> >On Wed, Apr 30, 2025 at 10:15:05AM +0800, Zhiquan Li wrote:
> >>
> >> On 2025/4/29 22:50, Dave Hansen wrote:
> >> > On 4/29/25 07:31, Jun Miao wrote:
> >> >> REDUCE_VE can only be enabled if x2APIC_ID has been properly
> >> >> configured with unique values for each VCPU.  Check if VMM has
> >> >> provided an activated topology configuration first as it is the
> >> >> prerequisite of REDUCE_VE and ENUM_TOPOLOGY, so move it to
> >> >> reduce_unnecessary_ve().  The function
> >> >> enable_cpu_topology_enumeration() was very little and can be
> >> >> integrated into reduce_unnecessary_ve().
> >> >
> >> > Isn't this just working around VMM bugs? Shouldn't we just panic as
> >> > quickly as possible so the VMM config gets fixed rather than adding kludges?
> >>
> >>
> >> Now failed to virtualize these two cases will cause TD VM regression
> >> vs legacy VM.  Do you mean the panic will just for the #VE caused by
> >> CPUID leaf 0x2? Or both (+ VMM not configure topology) will panic?
> >>
> >> Currently the most customer's complaints come from the CPUID leaf 0x2
> >> not virtualization, and most of access come from user space.  Is it
> >> appropriate for such behavior directly cause a guest kernel panic?
> >
> >The appropriate behavior would be to fix VMM to configure APIC IDs correctly and
> >use TDX module that supports REDUCE_VE.
> >
> 
> Yes, I completely agree with your point to fix VMM APIC IDs.
> The idea here is only to avoid this panic by using the guest component even when the host is incomplete.
> And thereby improving the robustness of the kernel code. Moreover, even if the VMM becomes complete later, the adjusted logic will continue to adapt still. (^v^) 

VIRT_CPUID2 was introduced as stop gap until REDUCE_VE is landed. I don't
see a point in getting it enabled at this stage. REDUCE_VE covers much
more broken corner cases. CPUID 0x2 is just the most prominent one because
of glibc bug.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
