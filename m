Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6319ADBF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936953; cv=none; b=CPNpFjub7BmN6QXiKlF3C40owlkZTvkPG7FCQPbXir3Hke+Gs2ewGQ4gRf9+wBtSUffAHkIFaWbi+S8oi4RVXr6Crr2bA3pBn7s2/cwH0qeqOT0OAPbX0TMKsyTiv9z5oo1Kcgk6HXKt5ZZMXsmoOoMpKizBqAQAOZYIMGqyu5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936953; c=relaxed/simple;
	bh=FtTssC8i/yaPBgn7kwcosA292EC7udhBOzS1vQS2/C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmzCtQQ603kVIMxqFQhf2oX96zYc2WiwbK/qt35TN4eznlIfNhebJuOtuP3aG0fuvSQBGc0kO8L+HMTv2O7VGkiFcamo5Rsg1vQxH+vuDl03kpO6CU7aNBzG8JsHjpRPHWeZALNrJvVh/6E3RbUXmMzRhKDfQNgV3WB9atwY1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/5JZMx2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/5JZMx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747936951; x=1779472951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FtTssC8i/yaPBgn7kwcosA292EC7udhBOzS1vQS2/C4=;
  b=I/5JZMx2mnCuCXr3SUk0RJxdW1rcrzGOs9thVxyezzSLwvFm4SJRGz53
   +vst0PStpAfzfwvfDU4fx3dZFzkZOmgAYgSMneHB54hpEyT5HHLUNtKQc
   Yen3yKm+EkAE1PAx5zX1DIv94yBcpd8KwZrwbUCModa7HjJTOy6VFa/hH
   phtplmjzHtVMT6juruuReyU2FLmAyqAD/qbAWBROLGTtWKAr6oRUBQ9AA
   WkTbAd5gfc5nxRftTDKoFVuw78djKXtxLZpej5cttiHTUx7/GncChGQ5k
   f75ZBm/QiFolSVPrvD7cFtyyWGHaq3HEKL6IEmULXzKeyJ6nMU07bY4kw
   Q==;
X-CSE-ConnectionGUID: +JBYerk7TGqycWWMyCFX9A==
X-CSE-MsgGUID: bSDdhDiiTWu+MCMz/mwCpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37606166"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="37606166"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 11:02:30 -0700
X-CSE-ConnectionGUID: L2Q9JkShRpidd3nFlALb9g==
X-CSE-MsgGUID: 0cexIM52SMmdUmPA8w74HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145422261"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 11:02:30 -0700
Date: Thu, 22 May 2025 11:02:24 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 2/7] x86/retbleed: Simplify the =stuff checks
Message-ID: <20250522180224.ux4uyexsolnxz47l@desk>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-2-70e2598e932c@linux.intel.com>
 <20250522114258.GGaC8NwmKyhKfJmyga@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522114258.GGaC8NwmKyhKfJmyga@fat_crate.local>

On Thu, May 22, 2025 at 01:42:58PM +0200, Borislav Petkov wrote:
> On Wed, May 21, 2025 at 07:44:37PM -0700, Pawan Gupta wrote:
> > +	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
> > +	    spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
> > +		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
> > +		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
> 
> What would be the next-best thing fallback for this, short of disabling the
> mitigation?
> 
> UNRET, IBPB?

Next best is IBRS/eIBRS, which also depends on spectre-v2 mitigation. So
NONE is fine here because the next code block will take care of selecting
the right mitigation.

> I would prefer if we look at STUFFing only when SPECTRE_V2_RETPOLINE - i.e.,
> is it even possible.

retbleed_update_mitigation() is the earliest we know that stuffing is
possible (when spectre-v2 has selected the mitigation).

> If not, we fallback to another mitigation which is probably more expensive but
> it is better than NONE...

Covered above.
