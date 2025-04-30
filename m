Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E22206B1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005701; cv=none; b=Dx1iu82MX7FRCu/jecWLFGrqT+vMTnrTmhRYSRAahTiR1ftOS0gIfzq28MpjCWeRLaRa+1ntWxfZvfOmpPQUZLiVGKOFzi6Y7juHdd3oH054DRwI1TzQJmi3olsFnRfp9kf/Cmd8Z80hI3t2kzipNYqAnHZQnRTOnSLiKvMf/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005701; c=relaxed/simple;
	bh=QTk+dEkk5tfuDKRZq0hjzj6icF2qed3BoFp2wQnQ3fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpimEIXd2TpiaXkhC1Y+xNdyBvWZStH8FCf3UFajuIttFwyQJvze9R2cG1THEZ8PGkzyXVn7kRzmQd6eY24YTHqk/MLHgdGt96kyfN5q+Xp2E31G2qdWlLNE22L/lR+WxnNYYs5HcIvew5gVOLiLpWd0nSqlGXliYTSeTPeQDqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Do2VF3FT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Do2VF3FT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746005700; x=1777541700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QTk+dEkk5tfuDKRZq0hjzj6icF2qed3BoFp2wQnQ3fo=;
  b=Do2VF3FTwQvpWSgM0Xl8IDCRQoCS7Hkq05OXQ4HdGq/P7syOiNMvLnLR
   2ntvomoKojGgVs97rqaG4f3qXhl1MgZDE1CKfuQ+zFyO3ynh3QCpNAmZi
   JHRKim02V3BV2xJgtv4UypWkbk1xYTC6/sRJVjDwwl+6dij0FL1IH2fWf
   ikjCZsUD+63NOL88xmUmmud/PjGP/nUriZPU0WjomvNJqLK5Y51aej1+G
   jqc76oP72R0clelhsoGysbZFjOeWDdDplYtUHFXdOb6Sg/2Qze7lpU8md
   hAbf3uYyuxUVaKT5MYS1GRSGMjxXifTzuG9K2Vt/e5054eDE+x/kDpKIZ
   w==;
X-CSE-ConnectionGUID: /eeqDaxvRDm7YpvJ2jtLog==
X-CSE-MsgGUID: HKO7izciTMyoOqDS2Oh49w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47671405"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47671405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 02:35:00 -0700
X-CSE-ConnectionGUID: 2fOGnqzFRBeYd4S27rM5dg==
X-CSE-MsgGUID: 0GBGlxhMRau2fVeJ0xKExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="157290500"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 30 Apr 2025 02:33:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id B0266213; Wed, 30 Apr 2025 12:33:55 +0300 (EEST)
Date: Wed, 30 Apr 2025 12:33:55 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Zhiquan Li <zhiquan1.li@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Jun Miao <jun.miao@intel.com>, 
	dave.hansen@linux.intel.com, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	"Du, Fan" <fan.du@intel.com>
Subject: Re: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
Message-ID: <sdczrx3z55vbf4jxbedjpccpdmz7h7ukhhiwrwblpozwyrqssv@ljszzrxvgoxr>
References: <20250429143114.1724280-1-jun.miao@intel.com>
 <20250429143114.1724280-2-jun.miao@intel.com>
 <b138cb84-3a34-40b3-a23d-6ff3708dae6b@intel.com>
 <a0676c7b-9e6d-4af4-87d5-f822ab247730@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0676c7b-9e6d-4af4-87d5-f822ab247730@intel.com>

On Wed, Apr 30, 2025 at 10:15:05AM +0800, Zhiquan Li wrote:
> 
> On 2025/4/29 22:50, Dave Hansen wrote:
> > On 4/29/25 07:31, Jun Miao wrote:
> >> REDUCE_VE can only be enabled if x2APIC_ID has been properly configured
> >> with unique values for each VCPU.  Check if VMM has provided an activated
> >> topology configuration first as it is the prerequisite of REDUCE_VE and
> >> ENUM_TOPOLOGY, so move it to reduce_unnecessary_ve().  The function
> >> enable_cpu_topology_enumeration() was very little and can be
> >> integrated into reduce_unnecessary_ve().
> > 
> > Isn't this just working around VMM bugs? Shouldn't we just panic as
> > quickly as possible so the VMM config gets fixed rather than adding kludges?
> 
> 
> Now failed to virtualize these two cases will cause TD VM regression vs
> legacy VM.  Do you mean the panic will just for the #VE caused by CPUID
> leaf 0x2? Or both (+ VMM not configure topology) will panic?
> 
> Currently the most customer's complaints come from the CPUID leaf 0x2
> not virtualization, and most of access come from user space.  Is it
> appropriate for such behavior directly cause a guest kernel panic?

The appropriate behavior would be to fix VMM to configure APIC IDs
correctly and use TDX module that supports REDUCE_VE.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
