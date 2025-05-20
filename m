Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B925EF98
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778965; cv=none; b=bOTc7VVts400sY52DDTcMZVcxETvxI8za9xFpQ8MOTvz+AEV5pdtUBlsyCzuY0Iw9cXqxURKOfhjyNifGTFQxTtJ11DFhk4xpLwAQbaxKk1d8ZZRARACsvYTGqgEnJ5VRLbuP4w650gBOXW61moEEpGUVV3zG+lURNegrJ/8+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778965; c=relaxed/simple;
	bh=5LjWvjQNtMdkAUmp6O5fS2MlE1GG0CffyzbkOB+Xrvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiM5YlxPiCitA19T1I5FVDd07qqWXUMTF/6908WYBc8kP9IEfPUitN7KhQuAfy3l22Dm0okpNjvmhbhKBjlHXwfSP6V//qRY63wiZY/CDVlUfHRLw2jB/9xxeyvKjPTLJKHGG1Glyl2EMsCRZlvDdPfnhJI48LqytgbwVbLfZOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLmX5cRE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLmX5cRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747778963; x=1779314963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5LjWvjQNtMdkAUmp6O5fS2MlE1GG0CffyzbkOB+Xrvw=;
  b=kLmX5cRE0L4VOW8LL+1sZ/kOUcKWCQaZbF5XRRtY6C/RED4XKKme91BB
   ZiQQjkkTbZ5mw+tGNGJUeBTjiRlMp5t/HDeZzzOXMqoRapMualHDNWhzn
   6qNAWwuB6jofwUCuhp2Bod94k55rKI/rAkqI7uOv+1pW7Uk7HE+VBE2T1
   Ufe40UEIuowH2/oC1wLrDeLCU3qEzVtAdtwSUTsAcBgoCDinWteVuakQ0
   AuZi2nEMNwH7hafYEj7BDp9kM5ThMmk5y8oI8srOF9H815j5pWpgCr9D5
   TsAtuxcz6eJ+tytkX/tn81XBrwktmyOVzcK1g1BLg4OKi93325ZtCpaDy
   w==;
X-CSE-ConnectionGUID: vznC4A0eQCahN77+JTub/g==
X-CSE-MsgGUID: OAAhmpHcSvWLpgkf0znoZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48851032"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48851032"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:09:22 -0700
X-CSE-ConnectionGUID: Spp9ai0hStWnwDQBynSd5A==
X-CSE-MsgGUID: KhKj1ZKIR1qvDQsCpxeMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176964381"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:09:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2EAC711F746;
	Wed, 21 May 2025 01:09:18 +0300 (EEST)
Date: Tue, 20 May 2025 22:09:18 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <aCz9jlMcXDooqx0s@kekkonen.localdomain>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
 <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
 <2025052000-widen-lip-350b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025052000-widen-lip-350b@gregkh>

Hi Greg,

On Tue, May 20, 2025 at 04:30:19PM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 20, 2025 at 05:16:45PM +0300, Andy Shevchenko wrote:
> > On Tue, May 20, 2025 at 01:34:37PM +0300, Sakari Ailus wrote:
> > > There is a warning in the kerneldoc documentation of container_of() that
> > > constness of its ptr argument is lost. While this is a faible suggestion
> > > container_of_const() should be used instead, the vast majority of new code
> > > still uses container_of():
> > > 
> > > $ git diff v6.13 v6.14|grep container_of\(|wc -l
> > > 646
> > > $ git diff v6.13 v6.14|grep container_of_const|wc -l
> > > 9
> > > 
> > > Make an explicit recommendation to use container_of_const().
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > Hi Greg, Andy,
> > > 
> > > I guess we generally agree the additional constness check in
> > > container_of_const() is useful, but adding the same check to
> > > container_of() generates warnings -- there are some errors, too -- such as
> > > this one currently:
> > > 
> > > In file included from /home/sailus/src/linux/include/linux/bcma/bcma.h:14,
> > >                  from /home/sailus/src/linux/arch/x86/kernel/early-quirks.c:17:
> > > /home/sailus/src/linux/include/linux/ssb/ssb.h: In function ‘dev_to_ssb_dev’:
> > > /home/sailus/src/linux/include/linux/ssb/ssb.h:291:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
> > >   291 |         wrap = container_of(dev, struct __ssb_dev_wrapper, dev);
> > >       |              ^
> > > 
> > > As noted above, 646 new missing constness checks were introduced through
> > > container_of() macro use during the 6.14 cycle alone. Most of these are
> > > likely harmless, but with so many new users some are bound to be ignoring
> > > constness.
> > > 
> > > Once the warnings from bad container_of() use are worked out in a way or
> > > another, the constness check could be added to the container_of() macro
> > > and the current container_of_const() be dropped altogether.
> > > 
> > > If this patch is accepted, I'll see how to add a warning on container_of()
> > > to checkpatch.pl.
> > 
> > Hmm... Wouldn't be better to fix non-const cases and add the const check, etc
> > to the container_of() instead of doing these comments?
> 
> Yes, fixing up the existing places where it is broken would be best, how
> many of them are there now?

Adding constness check for container_of(), with my partial build on x86-64
I'm getting 893 such warnings. A fair number are probably duplicates or
repeat of the same pattern, but also the compilation didn't succeed --
there were multiple compilation failures.

-- 
Regards,

Sakari Ailus
