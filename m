Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBF622F767
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386909; cv=none; b=kDi2GpiHFL0CjUTCn+NWIYdij0iepmPTfnZiTkk+NdTwI6r8M4y6sdy0i7AEkltTqEuwhOuoYZed1AmRutqXs4pXQ9IVOJnstV48JZwj1ekQA6JhvEEt8mh6vm0jq810gBgf0BEygAUPt/ONZrO4MA41jQlEN7d4cMvkbxT3XnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386909; c=relaxed/simple;
	bh=dvoRulqO5sSKW2URNc81lBRhLgtG8JIRZqlFBSNK9AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shEzLUNkR+dq/zOKTBJhrF35ho0HS6AGg//7BkmmdIZpBAEwDrB0uREWoJ3VRTiRsTiPYuVTzZZJa0ww5HDNw4OOSR+VpYXTbCqzBnZqFp0DkiFe/pBdOI97hhEiCdVee/WxSK6kDQzrIyv8j9aIba3wDGT7NbeRIDo2gC1FLAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: V0FdqX5zQrOadGW6I9ft2w==
X-CSE-MsgGUID: 54Z/RwDUTnG24MANAnCl0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49490611"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49490611"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:15:08 -0700
X-CSE-ConnectionGUID: Gw0/6v7yTMGN9LHvVZeP0Q==
X-CSE-MsgGUID: NWywiDFrSY2Gz/+Vv2oRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139120727"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:15:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1uFr9h-000000025u1-210K;
	Fri, 16 May 2025 12:15:01 +0300
Date: Fri, 16 May 2025 12:15:01 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 07/29] x86/boot/e820: Print out sizes of E820 memory
 ranges
Message-ID: <aCcCFZtk9LWFQpf5@smile.fi.intel.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-8-mingo@kernel.org>
 <aAc5Wlwj4gaBApIy@surfacebook.localdomain>
 <aCXFdvWiNW94F24R@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXFdvWiNW94F24R@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 15, 2025 at 12:44:06PM +0200, Ingo Molnar wrote:
> * Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > Mon, Apr 21, 2025 at 08:51:47PM +0200, Ingo Molnar kirjoitti:

...

> > > +	if (size & (SZ_1T-1))
> > > +		pr_cont(" %4llu.%01llu TB", size/SZ_1T, 10*(size & (SZ_1T-1))/SZ_1T);
> > > +	else
> > > +		pr_cont(" %4llu   TB", size/SZ_1T);
> > > +}
> > 
> > Don't you want to use string_helpers.h provided API? 
> > string_get_size().
> 
> I don't think string_get_size() knows the fine distinction between:
> 
>     BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256   KB device reserved
> 
> and:
> 
>     BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256.0 KB device reserved
> 
> "256 KB" is exactly 256 KB, while "256.0 KB" denotes a value that is a 
> bit larger than 256 KB but rounds down to 256 KB at 1 KB granularity.
> 
> When reading platform boot logs it's useful to know when such values 
> are exact, at a glance.

We can patch string_size() to print precise integers without fractional part.

-- 
With Best Regards,
Andy Shevchenko


