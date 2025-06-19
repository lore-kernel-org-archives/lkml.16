Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844B423B637;
	Thu, 19 Jun 2025 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334413; cv=none; b=XBAYnp/EDcUn6Sc0EROWvay7p3NuRzva73UPMH0VmhdspjFaBKUF4pcbUsnuBMnpGGXa+isCDcuPgafF/c9s4yAAqJi3E72FU1SFvH7Xf/0AlLpc1jjuIm0urRBetSHZ0a/iCZGh2XoGpxyfipHA8PG/a2w39QrHdv8e0Ux58es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334413; c=relaxed/simple;
	bh=shAGsPRVCD9WLCfkB8/hfTQiugyQs3/hQXd6YMMUOBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHighPf2j6mtdrTSz1+pGllwxv9eG/k9izV799PlWw3+GitmSePBm8cY/16ttw/6/Tn03mWZ0XKxTyE3ntEdsyTY87gsUa+97jcrV5OLWvcTsRmZJv3HFnsXubGJLzY6g8umYPtLujo/Ov9h7DljlJpQ2WYyBr6T8UeCL4L6wN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoQlxYpc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoQlxYpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334411; x=1781870411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=shAGsPRVCD9WLCfkB8/hfTQiugyQs3/hQXd6YMMUOBs=;
  b=SoQlxYpccl1LLGzUadzHJ+edvj68wuUPn3StXNPtxLSsdcR8Tzvq7+3f
   yb024MshV8/1tdbMH0urZAxFm5w6GAzrlsugabfpcr/GeMRwTeIUzKBkd
   u7yfM0Dl/B/wiMlDWcaDIk6oHTyhxo+ZvoSpSex7GTtajlNxv/YBOu/tD
   gMteq36XaxyvVikWVqT57bONHpFmIHjspQnuI6ov8uIlPqZJy84w8aLH9
   3/7+3CYf4o4nifveZDOWHg+nuXq2Mh/yD5Q6iM0NNeboopjgEWNPb4pBS
   0R3tYmaNxBcCF7HzGerH6pVIlhZ952mDKELhQtwz+Sph/N/TQTaY0A2en
   w==;
X-CSE-ConnectionGUID: mJXsfn6rRf2E9prVYTkSlg==
X-CSE-MsgGUID: t3m32DXAT3Sis6v9dd1gng==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="70022710"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="70022710"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:00:11 -0700
X-CSE-ConnectionGUID: xPDoivaZQwqnfGAstWAu6g==
X-CSE-MsgGUID: d6i6qvTBTe2v473jPcCmuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="174245909"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 05:00:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 35F06F0; Thu, 19 Jun 2025 15:00:03 +0300 (EEST)
Date: Thu, 19 Jun 2025 15:00:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFP7wwKD_yeRRuI_@black.fi.intel.com>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFL7frrstgpzzgan@smile.fi.intel.com>
 <0d437b3e-37b5-4e98-90bc-afa6c8150e77@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d437b3e-37b5-4e98-90bc-afa6c8150e77@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 19, 2025 at 03:05:10PM +0530, Anshuman Khandual wrote:
> On 18/06/25 11:16 PM, Andy Shevchenko wrote:
> > On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
> >> Add a new format for printing page table entries.
> > 
> >> Cc: Petr Mladek <pmladek@suse.com>
> >> Cc: Steven Rostedt <rostedt@goodmis.org>
> >> Cc: Jonathan Corbet <corbet@lwn.net>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: linux-doc@vger.kernel.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-mm@kvack.org
> > 
> > Please. move these to be after the '---' cutter line below. Just leave SoB tag
> > alone. This will have the same effect w/o polluting commit message.
> > 
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> > 
> > (somewhere here is a good place for all your Cc: tags)
> 
> Is not it better to also capture the Cc: list in the commit message.

No it's worse. One may easily get the same from lore. Can you give a good
justification for the polluting message with 8 lines over a single line of the
useful information, please?

> Seems like such has been the practice for various patches on the MM
> list. But not sure if that is an expected standard for all patches.

It's not an MM subsystem.

...

> >> +Print standard page table entry pte_t.
> >> +
> >> +Passed by reference.
> >> +
> >> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
> > 
> > What does this mean?
> 
> 64 bit address containing value the 0xc0ffee

Please, make it 64-bit address. The example as is is quite confusing.

> >> +        %ppte   0x00c0ffee
> > 
> > Can it be ever 64-bit?
> I am sorry - did not get that. pte_t contained value can be 64
> bits if that's what you meant.

Yes, see above why I have such a question.

...

> >> +			spec.field_width = 10;
> >> +			spec.precision = 8;
> >> +			spec.base = 16;
> >> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
> > 
> > Do not duplicate code we have already in the file.
> I am sorry - did not get that. Is the above flag combination some
> how wrong ?

It's dup. Please, take your time to find the very similar piece of code in one
of the helper functions we have.

I recommend you to look at the history of the changes in this file for when the
new specifier was added and how it is implemented.

...

> Could you please kindly elaborate on the code duplication problem
> you have mentioned earlier. I might not understand your concern
> here correctly.

Just find the same or similar pieces of code elsewhere in the same file.
Use them.

-- 
With Best Regards,
Andy Shevchenko


