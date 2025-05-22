Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FAC225A39;
	Thu, 22 May 2025 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747945739; cv=none; b=EHaDDGmLXF3BraIIpTYQTb0lde4eHCkFG1DoCr2wO1G1WxCbr8HeYgLilaiocuSa+Q08RhDTYZhpbF/3G8ZngVXYReJwtztaZw44eQjDX7/tDlGzIHK+wd4Pmmk9Abb1/sQIAT9wGxQ0QC85wMUDfcrGrp9601BMwVHlH6Ve+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747945739; c=relaxed/simple;
	bh=VLwqccF3GacXPqmCa4fi/o1S7fT0MPgvB9rZGQt0fq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP7MH6wTt1hEwE69ISPVm6eLidxQo/XVLMzqWIuCe2SeQsI6pdNiB67ogk+2vMtGIk0PrHkn9saQ5NUWoLadGQr7Bwz4JfIE+pcEsjzsZ9WjLkzazYddlkvZyCtZQ0HdjSxwlqc/EyJ0L22gMjpPrW40WJEc+stcVuX+3RU2HgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1itoifv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1itoifv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747945738; x=1779481738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLwqccF3GacXPqmCa4fi/o1S7fT0MPgvB9rZGQt0fq8=;
  b=P1itoifvFpBxzVNJNsHJyN9pjcuJ4R1oE977lm3hJ39ZDYf1dQzoLeuN
   LILJaHIVVl5G4YBS78B9P9TGLIKqOIweyysxdmZW7wHHckfsil7/j2egD
   F/Sarm5W0mkXIZGSPzP5rsr73k2tBe/a05P4/kO/BXwqCD+0GTGWq+JRY
   K7lJosoHOeEvvHM+xN7z7ZE/ReFs6HwSqKSAG93sU1mNISw3w+qpYH0Jq
   7HDxMw2WWSGu+pUxDUPgUp5z7KIbiLSOpLFRI6Ccn7u+1yje31e1yBnWH
   YKvOuzrJQu+u7mg6mr5hygDZAQkYzCi22QbJw2SEGDoLPu6cs+fT9QgTY
   w==;
X-CSE-ConnectionGUID: 29mWE1RxSKiK/8cIyZlpWQ==
X-CSE-MsgGUID: cCerQWQVSyOM1reA1AgGSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49889507"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49889507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:28:52 -0700
X-CSE-ConnectionGUID: ZnFhAPCxRcmvr3grGpZ5tg==
X-CSE-MsgGUID: z5P9K3n2QLiWzdpTn/W2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="177903237"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:28:51 -0700
Date: Thu, 22 May 2025 13:28:49 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, Dave.Martin@arm.com,
	james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, akpm@linux-foundation.org, rostedt@goodmis.org,
	paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
	gregkh@linuxfoundation.org, thomas.lendacky@amd.com,
	seanjc@google.com, mario.limonciello@amd.com, perry.yuan@amd.com,
	kai.huang@intel.com, xiaoyao.li@intel.com, nikunj@amd.com,
	kan.liang@linux.intel.com, xin3.li@intel.com,
	andrew.cooper3@citrix.com, ebiggers@google.com, xin@zytor.com,
	sohil.mehta@intel.com, Xiaojian.Du@amd.com, gautham.shenoy@amd.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] x86/resctrl: Add user interface to enable/disable
 io_alloc feature
Message-ID: <aC-JAdEYyhshVIQA@agluck-desk3>
References: <cover.1747943499.git.babu.moger@amd.com>
 <3946e8cfd3ce77028cdcf79a1ff5d5f70a714698.1747943499.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3946e8cfd3ce77028cdcf79a1ff5d5f70a714698.1747943499.git.babu.moger@amd.com>

On Thu, May 22, 2025 at 02:51:36PM -0500, Babu Moger wrote:
>  
> +/*
> + * resctrl_io_alloc_closid_get - io_alloc feature uses max CLOSID to route
> + * the IO traffic. Get the max CLOSID and verify if the CLOSID is available.
> + *
> + * The total number of CLOSIDs is determined in closid_init(),  based on the
> + * minimum supported across all resources. If CDP (Code Data Prioritization)
> + * is enabled, the number of CLOSIDs is halved. The final value is returned
> + * by closids_supported(). Make sure this value aligns with the maximum
> + * CLOSID supported by the respective resource.
> + */
> +static int resctrl_io_alloc_closid_get(struct rdt_resource *r)
> +{
> +	int num_closids = closids_supported();
> +
> +	if (resctrl_arch_get_cdp_enabled(r->rid))
> +		num_closids *= 2;
> +
> +	if (num_closids != resctrl_arch_get_num_closid(r))
> +		return -ENOSPC;
> +
> +	return closids_supported() - 1;
> +}

Is using closids_supported() the right thing here? That's
the minimum value across all resources. So suppose you had
16 CLOS for the L3 resource, but only 8 CLOS in one of L2/MB/SMBA.

I'd assume the your h/w doesn't care that Linux chose to
ignore half of the available L3 CLOSIDs, and is still going
to use CLOSID==15 for SDCIA.

I think you'll take the -ENOSPC error return. But do you
really need to do that? Maybe you can still have SDCIA
enabled and using CLOSID 15?

-Tony
