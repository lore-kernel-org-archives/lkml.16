Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30B30E84D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672113; cv=none; b=brWT+9eDBHeMYKPVzP3yadcc6fWYu1gG8QuO9HFmCX5zq9xF9LEsj5odoy4VBPffQO47P1ki7VA+8zWkI4GwnzRfQGmXIA9l8IrJj8k2tSKqofSYHPadGKI+ccz/q1XNa3BcQZQCvtK6TG68+Frb+nckxhtuxJmqMiSvBITXBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672113; c=relaxed/simple;
	bh=NCgWK0sHOtcx0qWsv6CUNDoABKi+IRiQgEufnW0Svdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVsw75tShOBAg/q6rJXX7+5yEzlnH85UId0N+hXfRs1RnkZbjzPR6AI4ZS0llChfsotnn+N6vYN6sUWSwYLn6uQojlu7N1wf2J+igUG4jlEL8DmQo6wRqIc15riselr5H2m6b24nGClGc+MlSqhnnQw+MGBuALqTWg+cX9zdAYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9HGv3aq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9HGv3aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672112; x=1782208112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NCgWK0sHOtcx0qWsv6CUNDoABKi+IRiQgEufnW0Svdc=;
  b=A9HGv3aq8t7p/8PhN0PzNckysENgaeGiNQALMuMrTTYEKkjZVVG/cnlA
   ZHn+tCJdgvy8nra0WU0RdKZ74kFhzeiWxC/CtGLPscXSkqogzDB0pv9Jh
   5C7Kdipi6g71wtU/n+AKIcRRyFwJTu4ZCZIg2RpFuAJ/9OUrJVotYVWLy
   tpstnadooJcGCOn7MwgtiE0COKz2ctvlGIySOmJ8V7GjPKUPTsZdssUEB
   7v6xskuXFO/ecldrYbF4JSvJ5eqkdjgbGdcXohUgqaotrnczXVQezqz+A
   2dMA+whQ26vnyL/HNL2zmmCRf+Vm3Od84kk4U0phjLV0lOdINbS7RcHTr
   Q==;
X-CSE-ConnectionGUID: Ga/vcxPRTk+gYluw9yhroA==
X-CSE-MsgGUID: MJXEe4LuTFuVtgP6Vhn/MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52588122"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52588122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:48:31 -0700
X-CSE-ConnectionGUID: PQzRGt4/SfS8y2H3smdi+w==
X-CSE-MsgGUID: SoNtNQ2lRhSP5MYVoH2V6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="182597098"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:48:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTdmr-000000097uT-2ON2;
	Mon, 23 Jun 2025 12:48:25 +0300
Date: Mon, 23 Jun 2025 12:48:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH v1 1/1] x86/defconfigs: Explicitly unset CONFIG_64BIT in
 i386_defconfig
Message-ID: <aFki6aGz60hIWvH1@smile.fi.intel.com>
References: <20250623072536.3425344-1-andriy.shevchenko@linux.intel.com>
 <20250623090642.GAaFkZIq__HR0FJE-0@fat_crate.local>
 <aFkcf6it0bW36jdw@smile.fi.intel.com>
 <20250623093156.GBaFkfDAN3bgiyV_IL@fat_crate.local>
 <aFkihZmJXj8Z6pE2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFkihZmJXj8Z6pE2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 23, 2025 at 12:46:45PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 23, 2025 at 11:31:56AM +0200, Borislav Petkov wrote:
> > On Mon, Jun 23, 2025 at 12:21:03PM +0300, Andy Shevchenko wrote:
> > > Ah, this is just a cherry-pick (with fixing conflicts, updated Fixes
> > > and removed the last paragraph) of 5y.o. 76366050eb1b ("x86/defconfigs:
> > > Explicitly unset CONFIG_64BIT in i386_defconfig"),
> > 
>> >  > What?

FWIW< the bug is repetitive (third time already?) that the i386_defconfig was
refreshed with ARCH=x86_64 or so and in the result the CONFIG_64BIT is set to
'y' for 32-bit code.

> > A 5yo patch cherrypicked from somewhere has as a Fixes tag a patch from 10
> > days ago?!?!
> 
> The base for my patch was the 5.y.o. patch.
> 
> > > it should be standalone patch. I borrowed the commit message.  So, whatever
> > > you prefer: I can send it again as the original one, one of x86 maintainers
> > > can do themselves the cherry-picking / conflict resolution, or I can resend
> > > it as mine.
> > 
> > You should do a proper patch as it is done and not do a mish-mash of old and
> > new things, clarify with Daniel who's going to be the author and you should
> > write a commit message which explains the situation properly, not borrow one.
> 
> It is describes situation properly. Just a test was different in this case.
> Okay, let me try again in v2.

-- 
With Best Regards,
Andy Shevchenko


