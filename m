Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CA31798F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672013; cv=none; b=MPaGgDGifaXNv9LN4nWmgsN+gyUzQylnDWsoRCvaTcnUmL2uEfE8X2jJLZoV+SfdDSLRj4FMIx1UTZHoUUYMy/lSLMM3mgpGrjA/CP1k0+ulZQEjO5kspyUB7FT3VmTpYk+skdA9Skh76ifu79CmwJpm3Xo5h/jA3VZqIqTN+lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672013; c=relaxed/simple;
	bh=JfNhEh0NxWy5XF7Csi6YPFrOAHZVvo5jWDNPOYaufyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRMRrw3dz1+H6TmfmIJYZsZ3P8K4HjObAfZc7+4PBYuXHt6vPxLaEIiI6ZGtn/DGVA7tZy/r2wETNTZxA56lhUYKbYqbd9dXiaVUQt+1BNJrEuup7YjsLQP5QZbyScADPo/sxRvIjgNosVnH6IKyteHgGHB8RvQnbTE6pS2M794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFaNAsyH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFaNAsyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672012; x=1782208012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JfNhEh0NxWy5XF7Csi6YPFrOAHZVvo5jWDNPOYaufyg=;
  b=HFaNAsyHmi0Wva07ecrq/C4iBv5dLwcbJzcpg7V7+LEtl7OUbHakP5Qk
   NEkhkFyJ8keQ6e1EghnlO/RY23Ez9VdwQGGuYmtUJN7pREA9j6Z0a0D8Y
   HXnvCRIq7ac/J4PT5qX6siZtBvQpN977I4hxxtbWnOwPKjR4BkjXJ1TxL
   /UmqNv4YIKNNn1WOoNgOlLfguGs2qnxnhMpxgEArRwQBFOeAUZIlnhBq7
   vwIcUo8tlYIUzkBlAq35+cv1/6xkBJg0Qhkz71fPN9zjbaPUloJdxCh8W
   G5CXUT7yCtSXfWgSI4W12Bto3hsGzeJYmBpfWDTRS3JJyeZ2AbZ+YiGHy
   Q==;
X-CSE-ConnectionGUID: n6dz35a8RzauZKKwnPrlCQ==
X-CSE-MsgGUID: gpUACBK3SNG/HQ/5vXgNrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="78284362"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="78284362"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:46:51 -0700
X-CSE-ConnectionGUID: 7sMTRrOuR1WBqY08aLB60Q==
X-CSE-MsgGUID: jQ0HnUwNTa2wMsr3NIH5wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155931924"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:46:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTdlF-000000097sQ-3siP;
	Mon, 23 Jun 2025 12:46:45 +0300
Date: Mon, 23 Jun 2025 12:46:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH v1 1/1] x86/defconfigs: Explicitly unset CONFIG_64BIT in
 i386_defconfig
Message-ID: <aFkihZmJXj8Z6pE2@smile.fi.intel.com>
References: <20250623072536.3425344-1-andriy.shevchenko@linux.intel.com>
 <20250623090642.GAaFkZIq__HR0FJE-0@fat_crate.local>
 <aFkcf6it0bW36jdw@smile.fi.intel.com>
 <20250623093156.GBaFkfDAN3bgiyV_IL@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623093156.GBaFkfDAN3bgiyV_IL@fat_crate.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 23, 2025 at 11:31:56AM +0200, Borislav Petkov wrote:
> On Mon, Jun 23, 2025 at 12:21:03PM +0300, Andy Shevchenko wrote:
> > Ah, this is just a cherry-pick (with fixing conflicts, updated Fixes
> > and removed the last paragraph) of 5y.o. 76366050eb1b ("x86/defconfigs:
> > Explicitly unset CONFIG_64BIT in i386_defconfig"),
> 
> What?
> 
> A 5yo patch cherrypicked from somewhere has as a Fixes tag a patch from 10
> days ago?!?!

The base for my patch was the 5.y.o. patch.

> > it should be standalone patch. I borrowed the commit message.  So, whatever
> > you prefer: I can send it again as the original one, one of x86 maintainers
> > can do themselves the cherry-picking / conflict resolution, or I can resend
> > it as mine.
> 
> You should do a proper patch as it is done and not do a mish-mash of old and
> new things, clarify with Daniel who's going to be the author and you should
> write a commit message which explains the situation properly, not borrow one.

It is describes situation properly. Just a test was different in this case.
Okay, let me try again in v2.

-- 
With Best Regards,
Andy Shevchenko


